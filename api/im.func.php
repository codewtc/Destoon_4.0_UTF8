<?php
defined('IN_DESTOON') or exit('Access Denied');
function im_web($id, $style = 0) {
	global $MODULE;
	return $id ? '<a href="'.$MODULE[2]['linkurl'].'chat.php?touser='.$id.'" target="_blank" rel="nofollow"><img src="'.DT_PATH.'file/image/web.gif" width="16" height="16" title="点击在线交谈" align="absmiddle"/></a>' : '';
}

function im_qq($id, $style = 0) {
	return $id ? '<a href="http://wpa.qq.com/msgrd?v=3&uin='.$id.'&site=qq&menu=yes" target="_blank" rel="nofollow"><img src="http://wpa.qq.com/pa?p=1:'.$id.':4" title="点击QQ交谈/留言" align="absmiddle" onerror="this.src=DTPath+\'file/image/qq-off.gif\'"/></a>' : '';
}

function im_ali($id, $style = 0) {
	return $id ? '<a href="http://amos.im.alisoft.com/msg.aw?v=2&uid='.$id.'&site=cnalichn&s=6" target="_blank" rel="nofollow"><img src="http://amos.im.alisoft.com/online.aw?v=2&uid='.$id.'&site=cnalichn&s=6" title="点击旺旺交谈/留言" align="absmiddle" onerror="this.src=DTPath+\'file/image/ali-off.gif\'" onload="if(this.width>20)this.src=SKPath+\'image/ali-off.gif\'"/></a>' : '';
}

function im_msn($id, $style = 0) {
	return $id ? '<a href="msnim:chat?contact='.$id.'" rel="nofollow"><img src="'.DT_PATH.'file/image/msn.gif" width="16" height="16" title="点击MSN交谈/留言" align="absmiddle"/></a>' : '';
}

function im_skype($id, $style = 0) {
	return $id ? '<a href="skype:'.$id.'" rel="nofollow"><img src="http://mystatus.skype.com/smallicon/'.$id.'" title="点击Skype通话" align="absmiddle" onerror="this.src=DTPath+\'file/image/skype-off.gif\'"/></a>' : '';
}
?>