<?php
/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
defined('IN_DESTOON') or exit('Access Denied');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
if(strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') === false) dalert($L['shortcut_error_1'], 'goback');
$data = "[InternetShortcut]\r\n";
$data .= "URL=".DT_PATH."?from=desktop\r\n";
$data .= "IconFile=".DT_PATH."favicon.ico\r\n";
$data .= "IconIndex=1";
$file = file_vname($DT['sitename'].'.url');
$file = convert($file, DT_CHARSET, 'GBK');
file_down('', $file, $data);
?>