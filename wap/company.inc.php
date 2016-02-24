<?php
/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
defined('IN_DESTOON') or exit('Access Denied');
$table = $DT_PRE.'company';
$userid = isset($userid) ? intval($userid) : 0;
$username = isset($username) ? trim($username) : '';
check_name($username) or $username = '';
if($userid || $username) {
	$sql = $userid ? "m.userid=$userid" : "m.username='$username'";
	$item = $db->get_one("SELECT * FROM {$DT_PRE}member m,{$DT_PRE}company c WHERE m.userid=c.userid AND $sql");
	$item or wap_msg($L['msg_not_corp']);
	$item['groupid'] > 5 or wap_msg($L['msg_not_corp']);
	unset($item['keyword']);
	extract($item);	
	$could_contact = check_group($_groupid, $MOD['group_contact']);
	if($username == $_username) $could_contact = true;
	if($action == 'introduce') {
		$content_table = content_table(4, $userid, is_file(DT_CACHE.'/4.part'), $DT_PRE.'company_data');
		$content = $db->get_one("SELECT content FROM {$content_table} WHERE userid=$userid");
		$content = $content['content'];
		$content = strip_tags($content);
		$content = preg_replace("/\&([^;]+);/i", '', $content);
		$contentlength = strlen($content);
		if($contentlength > $maxlength) {
			$start = ($page-1)*$maxlength;
			$content = dsubstr($content, $maxlength, '', $start);
			$pages = wap_pages($contentlength, $page, $maxlength);
		}
		$content = nl2br($content);
		$head_title = '公司介绍'.$DT['seo_delimiter'].$company.$DT['seo_delimiter'].$MOD['name'].$DT['seo_delimiter'].$head_title;
	} else if($action == 'news') {
		$table = $DT_PRE.'news';
		$table_data = $DT_PRE.'news_data';
		if($itemid) {
			$item = $db->get_one("SELECT * FROM {$table} m, {$table_data} d WHERE m.itemid=d.itemid AND m.itemid=$itemid AND m.status>2 AND m.username='$username'");
			$item or wap_msg($L['msg_not_exist']);
			extract($item);
			$db->query("UPDATE {$table} SET hits=hits+1 WHERE itemid=$itemid");
			$head_title = $title.$DT['seo_delimiter'].'新闻中心'.$DT['seo_delimiter'].$company.$DT['seo_delimiter'].$MOD['name'].$DT['seo_delimiter'].$head_title;;
			//$content = $content['content'];
			$adddate = timetodate($addtime, 3);
			$content = strip_tags($content);
			$content = preg_replace("/\&([^;]+);/i", '', $content);
			$contentlength = strlen($content);
			if($contentlength > $maxlength) {
				$start = ($page-1)*$maxlength;
				$content = dsubstr($content, $maxlength, '', $start);
				$pages = wap_pages($contentlength, $page, $maxlength);
			}
			$content = nl2br($content);
		} else {
			$typeid = isset($typeid) ? intval($typeid) : 0;
			$MTYPE = get_type('news-'.$userid);
			$condition = "username='$username' AND status=3";
			if($kw) $condition .= " AND title LIKE '%$keyword%'";		
			if($typeid) $condition .= " AND typeid='$typeid'";
			$r = $db->get_one("SELECT COUNT(*) AS num FROM {$table} WHERE $condition", 'CACHE');
			$pages = wap_pages($r['num'], $page, $pagesize);
			$lists = array();
			$result = $db->query("SELECT * FROM {$table} WHERE $condition ORDER BY addtime DESC LIMIT $offset,$pagesize");
			while($r = $db->fetch_array($result)) {
				$r['title'] = dsubstr($r['title'], $len);
				$lists[] = $r;
			}
			$head_title = '新闻中心'.$DT['seo_delimiter'].$company.$DT['seo_delimiter'].$MOD['name'].$DT['seo_delimiter'].$head_title;
		}
	} else if($action == 'sell') {
		$table = $DT_PRE.'sell';
		$table_data = $DT_PRE.'sell_data';
		if($itemid) {
			//
		} else {
			$typeid = isset($typeid) ? intval($typeid) : 0;
			$MTYPE = get_type('product-'.$userid);
			$condition = "username='$username' AND status=3";
			if($keyword) $condition .= " AND keyword LIKE '%$keyword%'";		
			if($typeid) $condition .= " AND mycatid='$typeid'";
			$r = $db->get_one("SELECT COUNT(*) AS num FROM {$table} WHERE $condition", 'CACHE');
			$pages = wap_pages($r['num'], $page, $pagesize);
			$lists = array();
			$result = $db->query("SELECT * FROM {$table} WHERE $condition ORDER BY edittime DESC LIMIT $offset,$pagesize");
			while($r = $db->fetch_array($result)) {
				$r['title'] = dsubstr($r['title'], $len);
				$lists[] = $r;
			}
			$head_title = '产品展示'.$DT['seo_delimiter'].$company.$DT['seo_delimiter'].$MOD['name'].$DT['seo_delimiter'].$head_title;
		}
	} else {
		if($page == 1) $db->query("UPDATE {$table} SET hits=hits+1 WHERE userid=$userid");
		$head_title = $company.$DT['seo_delimiter'].$MOD['name'].$DT['seo_delimiter'].$head_title;
	}
} else {
	if($kw) {
		check_group($_groupid, $MOD['group_search']) or wap_msg($L['msg_no_search']);
	} else if($catid) {
		$CAT or wap_msg($L['msg_not_cate']);
		if(!check_group($_groupid, $MOD['group_list']) || !check_group($_groupid, $CAT['group_list'])) {
			wap_msg($L['msg_no_right']);
		}
	} else {
		check_group($_groupid, $MOD['group_index']) or wap_msg($L['msg_no_right']);
	}
	$head_title = $MOD['name'].$DT['seo_delimiter'].$head_title;
	if($kw) $head_title = $kw.$DT['seo_delimiter'].$head_title;
	$condition = "groupid>5";
	if($keyword) $condition .= " AND keyword LIKE '%$keyword%'";
	if($catid) $condition .= " AND catids LIKE '%,".$catid.",%'";
	if($areaid) $condition .= $ARE['child'] ? " AND areaid IN (".$ARE['arrchildid'].")" : " AND areaid=$areaid";
	$r = $db->get_one("SELECT COUNT(userid) AS num FROM {$table} WHERE $condition");
	$pages = wap_pages($r['num'], $page, $pagesize);
	$lists = array();
	$order = $MOD['order'];
	$result = $db->query("SELECT userid,catid,company,areaid,vip FROM {$table} WHERE $condition ORDER BY $order LIMIT $offset,$pagesize");
	while($r = $db->fetch_array($result)) {
		$lists[] = $r;
	}
	$db->free_result($result);
}
include template('company', 'wap');
?>