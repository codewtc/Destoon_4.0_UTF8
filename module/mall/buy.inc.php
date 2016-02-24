<?php 
defined('IN_DESTOON') or exit('Access Denied');
login();
require DT_ROOT.'/module/'.$module.'/common.inc.php';
require DT_ROOT.'/include/post.func.php';
include load('misc.lang');
include load('member.lang');
if($submit) {
	$cart = get_cookie('cart');
	if($post) {
		$add = array_map('trim', $add);
		$add['address'] = area_pos($add['areaid'], '').$add['address'];
		$add = array_map('htmlspecialchars', $add);
		$buyer_address = $add['address'];
		if(strlen($buyer_address) < 10) message($L['msg_type_address']);
		$buyer_postcode = $add['postcode'];
		if(strlen($buyer_postcode) < 6) message($L['msg_type_postcode']);
		$buyer_name = $add['truename'];
		if(strlen($buyer_name) < 2) message($L['msg_type_truename']);
		$buyer_mobile = $add['mobile'];
		if(strlen($buyer_mobile) < 11) message($L['msg_type_mobile']);
		$buyer_phone = $add['telephone'];
		$buyer_receive = $add['receive'];
		if(strlen($buyer_receive) < 2) message($L['msg_type_express']);
		foreach($post as $k=>$v) {
			$t = $db->get_one("SELECT * FROM {$table} WHERE itemid=$k");
			if($t && $t['status'] == 3 && $t['username'] != $_username) {
				$number = intval($v['number']);				
				if($number < 1) $number = 1;
				if($t['amount'] && $number > $t['amount']) $number = $t['amount'];
				$amount = $number*$t['price'];
				$note = htmlspecialchars($v['note']);
				$title = addslashes($t['title']);
				$linkurl = $MOD['linkurl'].$t['linkurl'];
				$db->query("INSERT INTO {$DT_PRE}mall_order (mallid,buyer,seller,title,linkurl,thumb,price,number,amount,addtime,updatetime,note, buyer_postcode,buyer_address,buyer_name,buyer_phone,buyer_mobile,buyer_receive) VALUES ('$k','$_username','$t[username]','$title','$linkurl','$t[thumb]','$t[price]','$number','$amount','$DT_TIME','$DT_TIME','$note','$buyer_postcode','$buyer_address','$buyer_name','$buyer_phone','$buyer_mobile','$buyer_receive')");
				$itemid = $db->insert_id();
				$db->query("REPLACE INTO {$DT_PRE}mall_comment (itemid,mallid,buyer,seller) VALUES ($itemid,$k,'$_username','$t[username]')");
				$tmp = $db->get_one("SELECT mallid FROM {$DT_PRE}mall_stat WHERE mallid=$k");
				if(!$tmp) $db->query("REPLACE INTO {$DT_PRE}mall_stat (mallid,buyer,seller) VALUES ($k,'$_username','$t[username]')");
				//send message
				$touser = $t['username'];
				$_title = $title;
				$title = lang($L['trade_message_t6'], array($itemid));
				$url = $MODULE[2]['linkurl'].'trade.php?itemid='.$itemid;
				$goods = '<a href="'.$linkurl.'" target="_blank" class="t"><strong>'.$_title.'</strong></a>';
				$content = lang($L['trade_message_c6'], array(userurl($_username), $_username, timetodate($DT_TIME, 3), $goods, $itemid, $amount, $url));
				$content = ob_template('messager', 'mail');
				send_message($touser, $title, $content);

				$cart = str_replace(','.$k.',', ',', $cart.',');
				if(substr($cart, -1) == ',') $cart = substr($cart, 0, -1);
			}
		}
	}	
	set_cookie('cart', $cart, $DT_TIME + 365*24*3600);
	message($L['msg_buy_success'], $MODULE[2]['linkurl'].'trade.php?action=order');
} else {
	$itemids = is_array($itemid) ? implode(',', $itemid) : $itemid;
	$tags = $_tags = $address = array();
	if($itemids) {
		$total = $total_amount = $good_amount = $good_discount = 0;
		$amounts = (isset($amounts) && is_array($amounts)) ? $amounts : array();
		$result = $db->query("SELECT * FROM {$table} WHERE itemid IN ($itemids) ORDER BY addtime DESC");
		while($r = $db->fetch_array($result)) {
			if($r['username'] == $_username) dalert($L['buy_self'], 'goback');
			if($r['status'] != 3) continue;
			$r['alt'] = strip_tags($r['title']);
			$r['title'] = set_style(dsubstr($r['title'], 40, '..'), $r['style']);
			$r['linkurl'] = $MOD['linkurl'].$r['linkurl'];
			$r['number'] = (isset($amounts[$r['itemid']]) && $amounts[$r['itemid']] > 1) ?  $amounts[$r['itemid']] : 1;
			$good_amount += $r['price'];
			$total++;	
			$r['price'] = sprintf('%.2f', $r['price']);
			$_tags[$r['itemid']] = $r;
		}
		$total_amount = $good_amount - $good_discount;
		$good_amount = sprintf('%.2f', $good_amount);
		$good_discount = sprintf('%.2f', $good_discount);
		foreach(explode(',', $itemids) as $v) {
			if(isset($_tags[$v])) $tags[] = $_tags[$v];
		}
		$result = $db->query("SELECT * FROM {$DT_PRE}address WHERE username='$_username' ORDER BY  listorder ASC,itemid ASC LIMIT 30");
		while($r = $db->fetch_array($result)) {	
			$address[] = $r;
		}
		$user = userinfo($_username);
	}
	$_MOD = cache_read('module-2.php');
	$send_types = explode('|', trim($_MOD['send_types']));
	$head_title = $L['buy_title'];
	include template('buy', $module);
}
?>