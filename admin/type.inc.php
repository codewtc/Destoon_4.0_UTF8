<?php
/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
defined('IN_DESTOON') or exit('Access Denied');
isset($item) or msg();
require DT_ROOT.'/include/type.class.php';
$forward = '?file='.$file.'&item='.$item;
$do = new dtype;
$do->item = $item;
$do->cache = 1;
$menuon = 1;
if(strpos($item, 'special-') === false) {
	switch($item) {
		case 'ask':
			$menus = array (
				array('客服中心', '?moduleid=2&file='.$item),
				array('分类管理', $forward),
			);
		break;
		case 'mail':
			$menus = array (
				array('邮件订阅', '?moduleid=2&file='.$item),
				array('订阅分类', $forward),
			);
		break;
		case 'announce':
			$menus = array (
				array('公告管理', '?moduleid=3&file='.$item),
				array('公告分类', $forward),
			);
		break;
		case 'link':
			$menus = array (
				array('友情链接', '?moduleid=3&file='.$item),
				array('链接分类', $forward),
			);
		break;
		case 'vote':
			$menus = array (
				array('投票管理', '?moduleid=3&file='.$item),
				array('投票分类', $forward),
			);
		break;
		case 'poll':
			$menus = array (
				array('票选管理', '?moduleid=3&file='.$item),
				array('票选分类', $forward),
			);
		break;
		case 'gift':
			$menus = array (
				array('积分换礼', '?moduleid=3&file='.$item),
				array('礼品分类', $forward),
			);
		break;
		case 'survey':
			$menus = array (
				array('问卷管理', '?moduleid=3&file='.$item),
				array('问卷分类', $forward),
			);
		break;
		default:
			$menus = array (
				array('分类管理', $forward),
			);
			$menuon = 0;
		break;
	}
} else {
	$menus = array (
		array('专题管理', '?moduleid=11&file=item&specialid='.str_replace('special-', '', $item)),
		array('信息分类', $forward),
	);
	$do->cache = 0;
}
if($submit) {
	$do->update($post);
	dmsg('更新成功', $forward);
} else {
	$lists = $do->get_list();
	include tpl('type');
}
?>