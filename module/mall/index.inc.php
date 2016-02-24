<?php
defined('IN_DESTOON') or exit('Access Denied');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
if(!check_group($_groupid, $MOD['group_index'])) {
	$head_title = lang('message->without_permission');
	include template('noright', 'message');
	exit;
}
$maincat = get_maincat(0, $moduleid);
$seo_file = 'index';
include DT_ROOT.'/include/seo.inc.php';
$destoon_task = "moduleid=$moduleid&html=index";
include template('index', $module);
?>