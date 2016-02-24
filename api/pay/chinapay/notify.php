<?php
$_DPOST = $_POST;
require '../../.../common.inc.php';
$_POST = $_DPOST;
if(!$_POST) exit('fail');
$bank = 'chinapay';
$PAY = cache_read('pay.php');
if(!$PAY[$bank]['enable']) exit('fail');
if(!$PAY[$bank]['partnerid']) exit('fail');
//if(!$PAY[$bank]['keycode']) exit('fail');
require DT_ROOT.'/include/module.func.php';
$receive_url = '';
function log_result($word) {
	log_write($word, 'nchinapay');
}
require DT_ROOT."/api/pay/chinapay/netpayclient_config.php";
//加载 netpayclient 组件
require DT_ROOT."/api/pay/chinapay/netpayclient.php";
//导入公钥文件
$flag = buildKey(PUB_KEY);
$flag or exit('导入公钥文件失败！');

//获取交易应答的各项值
$merid = $_POST["merid"];
$orderno = $_POST["orderno"];
$transdate = $_POST["transdate"];
$amount = $_POST["amount"];
$currencycode = $_POST["currencycode"];
$transtype = $_POST["transtype"];
$status = $_POST["status"];
$checkvalue = $_POST["checkvalue"];
$gateId = $_POST["GateId"];
$priv1 = $_POST["Priv1"];
$flag = verifyTransResponse($merid, $orderno, $amount, $currencycode, $transdate, $transtype, $status, $checkvalue);
if($flag) {
	if($status == '1001') {
		//您的处理逻辑请写在这里，如更新数据库等。
		//注意：如果您在提交时同时填写了页面返回地址和后台返回地址，且地址相同，请在这里先做一次数据库查询判断订单状态，以防止重复处理该笔订单
		$r = $db->get_one("SELECT * FROM {$DT_PRE}finance_charge WHERE itemid='$priv1'");
		if($r) {
			if($r['status'] == 0) {
				$charge_orderid = $r['itemid'];
				$charge_money = $r['amount'] + $r['fee'];
				$charge_amount = $r['amount'];
				$editor = 'N'.$bank;
				if($amount == padstr($charge_money*100, 12)) {
					$db->query("UPDATE {$DT_PRE}finance_charge SET status=3,money=$charge_money,receivetime='$DT_TIME',editor='$editor' WHERE itemid=$charge_orderid");
					money_add($r['username'], $r['amount']);
					money_record($r['username'], $r['amount'], $PAY[$bank]['name'], 'system', '在线充值', '订单ID:'.$charge_orderid);
					exit('success');
				} else {
					$note = '充值金额不匹配S:'.$charge_money.'R:'.$amount;
					$db->query("UPDATE {$DT_PRE}finance_charge SET status=1,receivetime='$DT_TIME',editor='$editor',note='$note' WHERE itemid=$charge_orderid");//支付失败
					log_result($note);
					exit('fail');
				}
			} else if($r['status'] == 1) {
				exit('fail');
			} else if($r['status'] == 2) {
				exit('fail');
			} else {
				exit('success');
			}
		} else {
			log_result('通知订单号不存在R:'.$priv1);
			exit('fail');
		}
	}
}
exit('fail');
?>