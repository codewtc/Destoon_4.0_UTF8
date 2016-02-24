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
$CP = $MOD['cat_property'] && $CAT['property'];
if($MOD['cat_property'] && $CAT['property']) {
	require DT_ROOT.'/include/property.func.php';
	$PPT = property_condition($catid);
}
unset($CAT['moduleid']);
extract($CAT);
$maincat = get_maincat($child ? $catid : $parentid, $moduleid);

$condition = 'status=3';
$condition .= ($CAT['child']) ? " AND catid IN (".$CAT['arrchildid'].")" : " AND catid=$catid";
if($cityid) {
	$areaid = $cityid;
	$ARE = $AREA[$cityid];
	$condition .= $ARE['child'] ? " AND areaid IN (".$ARE['arrchildid'].")" : " AND areaid=$areaid";
	$items = $db->count($table, $condition, $CFG['db_expires']);
} else {
	if($page == 1) {
		$items = $db->count($table, $condition, $CFG['db_expires']);
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
$tags = array();
if($items) {
	$result = $db->query("SELECT ".$MOD['fields']." FROM {$table} WHERE {$condition} ORDER BY ".$MOD['order']." LIMIT {$offset},{$pagesize}", ($CFG['db_expires'] && $page == 1) ? 'CACHE' : '', $CFG['db_expires']);
	while($r = $db->fetch_array($result)) {
		$r['adddate'] = timetodate($r['addtime'], 5);
		$r['editdate'] = timetodate($r['edittime'], 5);
		$r['alt'] = $r['title'];
		$r['title'] = set_style($r['title'], $r['style']);
		if(strpos($r['linkurl'], '://') === false) $r['linkurl'] = $MOD['linkurl'].$r['linkurl'];
		$tags[] = $r;
	}
	$db->free_result($result);
}
$showpage = 1;
$datetype = 5;
$cols = 5;

$seo_file = 'list';
include DT_ROOT.'/include/seo.inc.php';

$template = $CAT['template'] ? $CAT['template'] : ($MOD['template_list'] ? $MOD['template_list'] : 'list');
include template($template, $module);
?>