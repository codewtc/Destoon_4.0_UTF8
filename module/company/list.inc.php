<?php 
defined('IN_DESTOON') or exit('Access Denied');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
if(!$CAT || $CAT['moduleid'] != $moduleid) {
	$head_title = lang('message->cate_not_exists');
	@header("HTTP/1.1 404 Not Found");
	exit(include template('list-notfound', 'message'));
}
if($MOD['list_html']) {
	$html_file = listurl($CAT, $page);
	if(is_file(DT_ROOT.'/'.$MOD['moduledir'].'/'.$html_file)) {
		@header("HTTP/1.1 301 Moved Permanently");
		dheader($MOD['linkurl'].$html_file);
	}
}
if(!check_group($_groupid, $MOD['group_list']) || !check_group($_groupid, $CAT['group_list'])) {
	$head_title = lang('message->without_permission');
	exit(include template('noright', 'message'));
}
unset($CAT['moduleid']);
extract($CAT);
$maincat = get_maincat($child ? $catid : $parentid, $moduleid);

$condition = 'groupid>5';
$condition .= ($CAT['child']) ? " AND catid IN (".$CAT['arrchildid'].")" : " AND catid=$catid";
if($cityid) {
	$areaid = $cityid;
	$ARE = $AREA[$cityid];
	$condition .= $ARE['child'] ? " AND areaid IN (".$ARE['arrchildid'].")" : " AND areaid=$areaid";
	$items = $db->count($table.'_catid', $condition, $CFG['db_expires']);
} else {
	if($page == 1) {
		$items = $db->count($table.'_catid', $condition, $CFG['db_expires']);
		if($items != $CAT['item']) {
			$CAT['item'] = $items;
			$db->query("UPDATE {$DT_PRE}category SET item=$items WHERE catid=$catid");
		}
	} else {
		$items = $CAT['item'];
	}
}
$pagesize = $MOD['pagesize'];
$offset = ($page-1)*$pagesize;
$pages = listpages($CAT, $items, $page, $pagesize);
$tags = $_tags = $ids = array();
if($items) {
	$result = $db->query("SELECT userid FROM {$table}_catid WHERE {$condition} ORDER BY ".$MOD['order']." LIMIT {$offset},{$pagesize}");
	while($r = $db->fetch_array($result)) {
		$ids[$r['userid']] = $r['userid'];
	}
	if($ids) {
		$condition = "userid IN (".implode(',', $ids).")";
		$result = $db->query("SELECT ".$MOD['fields']." FROM {$table} WHERE {$condition}");
		while($r = $db->fetch_array($result)) {
			$_tags[$r['userid']] = $r;
		}
		$db->free_result($result);
		foreach($ids as $id) {
			if(isset($_tags[$id])) $tags[] = $_tags[$id];
		}
	}
}
$showpage = 1;

$seo_file = 'list';
include DT_ROOT.'/include/seo.inc.php';

$template = $CAT['template'] ? $CAT['template'] : 'list';
include template($template, $module);
?>