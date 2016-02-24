<?php
/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
defined('IN_DESTOON') or exit('Access Denied');
if($DT['authadmin'] == 'session') {
	session_destroy();
} else {
	set_cookie($secretkey, '');
}
set_cookie('auth', '');
msg('已经安全退出网站后台管理', '?');
?>