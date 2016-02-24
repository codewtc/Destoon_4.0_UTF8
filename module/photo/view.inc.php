<?php 
defined('IN_DESTOON') or exit('Access Denied');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
$itemid or dheader($MOD['linkurl']);
$item = $db->get_one("SELECT * FROM {$table} WHERE itemid=$itemid AND status=3");
if($item) {
	extract($item);
} else {
	$head_title = lang('message->item_not_exists');
	@header("HTTP/1.1 404 Not Found");
	exit(include template('show-notfound', 'message'));
}
$CAT = get_cat($catid);
if(!check_group($_groupid, $MOD['group_show']) || !check_group($_groupid, $CAT['group_show'])) {
	$head_title = lang('message->without_permission');
	exit(include template('noright', 'message'));
}
if($open < 3) {
	$_key = $open == 2 ? $password : $answer;
	$str = get_cookie('photo_'.$itemid);
	$pass = $str == md5(md5($DT_IP.$open.$_key.DT_KEY));	
	if($_username && $_username == $username) $pass = true;
} else {
	$pass = true;
}
$pass or dheader($MOD['linkurl'].'private.php?itemid='.$itemid);

if(get_fee($item['fee'], $MOD['fee_view'])) {
	if($MG['fee_mode'] && $MOD['fee_mode']) {
		$user_status = 3;
	} else if($_userid && check_pay($moduleid, $itemid)) {
		$user_status = 3;
	} else {
		$user_status = 0;
	}
} else {
	$user_status = 3;
}
$user_status == 3 or dheader($linkurl);

$adddate = timetodate($addtime, 3);
$editdate = timetodate($edittime, 3);
$linkurl = linkurl($MOD['linkurl'].$linkurl, 1);
$pagesize = 30;
$offset = ($page-1)*$pagesize;
$pages = pages($items, $page, $pagesize);
$T = array();
$i = 1;
$result = $db->query("SELECT itemid,thumb,introduce FROM {$table_item} WHERE item=$itemid ORDER BY listorder ASC,itemid ASC LIMIT $offset,$pagesize");
while($r = $db->fetch_array($result)) {
	$r['number'] = $offset + $i++;
	$r['linkurl'] = $MOD['linkurl'].itemurl($item, $r['number']).'#p';
	$r['thumb'] = str_replace('.thumb.', '.middle.', $r['thumb']);
	$r['title'] = $r['introduce'] ? dsubstr($r['introduce'], 46, '..') : '&nbsp;';
	$T[] = $r;
}

$update = '';
include DT_ROOT.'/include/update.inc.php';
$seo_file = 'show';
include DT_ROOT.'/include/seo.inc.php';
include template('view', $module);
?>