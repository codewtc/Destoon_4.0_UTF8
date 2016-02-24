<?php
/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
defined('IN_DESTOON') or exit('Access Denied');
$menus = array (
    array('系统体检', '?file='.$file),
    array('PHP信息', '?file=index&action=phpinfo', ' target="_blank"'),
);
include tpl('doctor');
?>