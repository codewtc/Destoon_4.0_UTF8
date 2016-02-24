<?php 
defined('IN_DESTOON') or exit('Access Denied');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
$chatid = (isset($chatid) && preg_match("/^[a-z0-9]{32}$/", $chatid)) ? $chatid : '';
$chatuser = $_username ? $_username : $DT_IP;
switch($action) {
	case 'send':
		$chatid or exit('0');
		$word or exit('0');
		if($MOD['chat_maxlen'] && strlen($word) > $MOD['chat_maxlen']*3) exit('0');
		$word = convert($word, 'UTF-8', DT_CHARSET);
		$chat = $db->get_one("SELECT * FROM {$DT_PRE}chat WHERE chatid='$chatid'");
		if($chat) {
			(($chat['touser'] == $_username || $chat['fromuser'] == $chatuser) && $chat['status'] == 3) or exit('0');
		} else {
			exit('0');
		}
		$filename = DT_ROOT.'/file/chat/'.timetodate($DT_TIME, 'Ym/dH').'/'.$chatid.'.php';
		is_file($filename) or file_put($filename, '<?php exit;?>');
		$word = stripslashes(trim($word));
		$word = strip_tags($word);
		$word = nl2br($word);
		$word = strip_nr($word);
		$word = str_replace('|', ' ', $word);
		$font_s = $font_s ? intval($font_s) : 0;
		$font_c = $font_c ? intval($font_c) : 0;
		$font_b = $font_b ? 1 : 0;
		$font_i = $font_i ? 1 : 0;
		$font_u = $font_u ? 1 : 0;
		$css = '';
		if($font_s) $css .= ' s'.$font_s;
		if($font_c) $css .= ' c'.$font_c;
		if($font_b) $css .= ' fb';
		if($font_i) $css .= ' fi';
		if($font_u) $css .= ' fu';
		if($css) $word = '<span class="'.trim($css).'">'.$word.'</span>';
		if($word && $fp = fopen($filename, 'a')) {
			fwrite($fp, $DT_TIME.'|'.($_username ? $_username : $DT_IP).'|'.$word."\n");
			fclose($fp);
			exit('1');
		}
		exit('0');
	break;
	case 'load':
		$chatid or exit;
		$filename = DT_ROOT.'/file/chat/'.timetodate($DT_TIME, 'Ym/dH').'/'.$chatid.'.php';
		$chat = $db->get_one("SELECT * FROM {$DT_PRE}chat WHERE chatid='$chatid'");
		if($chat) {
			($chat['touser'] == $_username || $chat['fromuser'] == $chatuser) or exit('0');
			if($chat['unload'] && $chat['status'] == 3) {
				if($chat['unloader'] == $chatuser) {
					$db->query("UPDATE {$DT_PRE}chat SET unload=0,unloader='',unloadtime=0 WHERE chatid='$chatid'");
				} else {
					if($DT_TIME - $chat['unloadtime'] > 15) {
						$db->query("DELETE FROM {$DT_PRE}chat WHERE chatid='$chatid'");
						$chat['status'] = 0;
					}
				}
			}
		} else {
			$chat['status'] = 5;
		}
		if($chatlast > 1 && $chat['status'] == 3 && $MOD['chat_timeout'] && $DT_TIME - $chatlast > $MOD['chat_timeout']) {
			$db->query("UPDATE {$DT_PRE}chat SET status=4 WHERE chatid='$chatid'");
			$chat['status'] = 4;
		}
		$chatlast = $_chatlast = intval($chatlast);
		$i = $j = 0;
		echo '{chat_status:"'.$chat['status'].'",chat_msg:[';
		if($chatlast < @filemtime($filename)) {
			$data = file_get($filename);
			if($data) {
				$data = trim(substr($data, 13));
				if($data) {
					$data = explode("\n", $data);
					foreach($data as $d) {
						list($time, $name, $word) = explode("|", $d);
						if($time > $chatlast && $word) {
							$chatlast = $time;
							$time = timetodate($time, 'H:i:s');
							if($MOD['chat_url'] || $MOD['chat_img']) {
								if(preg_match_all("/([http|https]+)\:\/\/([a-z0-9\/\-\_\.\,\?\&\#\=\%\+\;]{4,})/i", $word, $m)) {
									foreach($m[0] as $u) {
										if($MOD['chat_img'] && preg_match("/^(jpg|jpeg|gif|png|bmp)$/i", file_ext($u)) && !preg_match("/([\?\&\=]{1,})/i", $u)) {
											$word = str_replace($u, '<img src="'.$u.'" onload="if(this.width>320)this.width=320;" onclick="window.open(this.src);"/>', $word);
										} else if($MOD['chat_url']) {
											$word = str_replace($u, '<a href="'.$u.'" target="_blank">'.$u.'</a>', $word);
										}
									}
								}
							}
							if(preg_match_all("/\:([0-9]{3,})\)/i", $word, $m)) {
								foreach($m[0] as $u) {
									$f = 'face/'.substr($u, 1, -1).'.gif';
									if(is_file(DT_ROOT.'/'.$MOD['moduledir'].'/'.$f)) $word = str_replace($u, '<img src="'.$f.'"/>', $word);
								}
							}
							$word = str_replace('"', '\"', $word);
							$self = $chatuser == $name ? 1 : 0;
							if($self) {
								$name = '我';
							} else {
								check_name($name) or $name = '游客';
								$j++;
							}
							echo ($i ? ',' : '').'{time:"'.$time.'",name:"'.$name.'",word:"'.$word.'",self:"'.$self.'"}';
							$i = 1;
						}
					}
					if($_chatlast == 0) $j = 0;
				}
			}
		}
		echo '],chat_new:"'.$j.'",chat_last:"'.$chatlast.'"}';
		exit;
	break;
	case 'unload':
		$chatid or exit;
		$db->query("UPDATE {$DT_PRE}chat SET unload=1,unloader='$chatuser',unloadtime=$DT_TIME WHERE chatid='$chatid' AND status=3");
		exit;
	break;
	case 'del':
		$chatid or exit;
		$chat = $db->get_one("SELECT * FROM {$DT_PRE}chat WHERE chatid='$chatid'");
		if($chat && ($chat['touser'] == $_username || ($chat['fromuser'] == $chatuser && $chat['status'] != 1))) {
			$db->query("DELETE FROM {$DT_PRE}chat WHERE chatid='$chatid'");
		}
		dmsg('删除成功', 'chat.php?tab='.(isset($tab) ? $tab : 1));
	break;
	case 'off':
		$chatid or exit;
		$chat = $db->get_one("SELECT * FROM {$DT_PRE}chat WHERE chatid='$chatid'");
		if($chat && ($chat['touser'] == $_username || $chat['fromuser'] == $chatuser) && $chat['status'] == 3) $db->query("UPDATE {$DT_PRE}chat SET status=0 WHERE chatid='$chatid'");
		dmsg('断开成功', 'chat.php?tab='.(isset($tab) ? $tab : 1));
	break;
	case 'deny':
		$chatid or exit;
		$chat = $db->get_one("SELECT * FROM {$DT_PRE}chat WHERE chatid='$chatid'");
		if($chat && $chat['touser'] == $_username && $chat['status'] == 2) $db->query("UPDATE {$DT_PRE}chat SET status=1 WHERE chatid='$chatid'");
		dmsg('拒绝成功', 'chat.php?tab='.(isset($tab) ? $tab : 1));
	break;
	case 'down':
		if($data) {
			$data = stripslashes($data);
			$css = file_get('image/chat.css');
			$css = str_replace('#chat{width:auto;height:280px;overflow:auto;', '#chat{width:700px;margin:auto;', $css);
			$data = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html;charset='.DT_CHARSET.'"/><title>聊天记录</title><style type="text/css">'.$css.'</style><base href="'.$MOD['linkurl'].'"/></head><body><div id="chat">'.$data.'</div></body></html>';
			file_down('', 'chat_'.timetodate($DT_TIME, 'Y-m-d-H-i').'.html', $data);
		}
		exit;
	break;
	default:
		$chat_browerid = get_cookie('chat_browerid');
		if(!preg_match("/^[a-z0-9]{6}$/i", $chat_browerid)) {
			$chat_browerid = random(6);
			set_cookie('chat_browerid', $chat_browerid, $DT_TIME + 365*86400);
		}
		$GROUP = cache_read('group.php');
		if(isset($touser) && check_name($touser)) {
			if($touser == $_username) dalert('不能与自己对话', 'chat.php');
			if(!$MG['chat']) {
				login();
				dalert('您所在的会员组没有权限发起对话', 'grade.php');
			}
			$user = userinfo($touser);
			$user or dalert('会员不存在', 'chat.php');
			$online = online($user['userid']);
			$user['type'] = 'member';
			if($online == 1) {
				$type = 1;
				$chat_fromuser = $_username ? $_username : $DT_IP;
				$chat_touser = $touser;
				$chat_id = $chatid = md5($chat_fromuser.$chat_touser.$chat_browerid.$DT_IP.DT_KEY);
				$head_title = '与【'.$user['company'].'】对话中';
				$chat = $db->get_one("SELECT * FROM {$DT_PRE}chat WHERE chatid='$chatid'");
				if($chat) {
					if($chat['status'] == 4) {//超时后重新连接
						$chat['status'] = 2;
						$db->query("UPDATE {$DT_PRE}chat SET status=2 WHERE chatid='$chatid'");
					}
					$chat_status = $chat['status'];				
				} else {
					$chat_status = 2;
					$forward = dsafe($forward);
					if(strpos($forward, $MOD['linkurl']) !== false) $forward = '';
					$db->query("REPLACE INTO {$DT_PRE}chat (chatid,browerid,fromuser,touser,addtime,status,forward) VALUES ('$chat_id','$chat_browerid','$chat_fromuser','$chat_touser','$DT_TIME','2','$forward')");
					$db->query("UPDATE {$DT_PRE}member SET chat=chat+1 WHERE username='$chat_touser'");
				}
			} else {
				$type = 4;
				$chat = array();
				$chat['forward'] = dsafe($forward);
				$head_title = '给【'.$user['company'].'】留言';
			}
		} else if(isset($chatid) && preg_match("/^[a-z0-9]{32}$/", $chatid)) {
			$chat = $db->get_one("SELECT * FROM {$DT_PRE}chat WHERE chatid='$chatid'");
			if($chat && $chat['touser'] == $_username) {
				$chat_id = $chatid;
				$chat_status = $chat['status'];
				if(check_name($chat['fromuser'])) {
					$user = userinfo($chat['fromuser']);
					$user or dalert('会员不存在', 'chat.php');
					$user['type'] = 'member';
				} else {
					$user = array();
					$user['type'] = 'guest';
					$user['ip'] = $chat['fromuser'];
					$user['area'] = ip2area($chat['fromuser']);
				}
				if($chat_status == 2) {//接受聊天请求
					$db->query("UPDATE {$DT_PRE}chat SET status=3 WHERE chatid='$chatid'");
					$db->query("UPDATE {$DT_PRE}member SET chat=chat-1 WHERE username='$_username'");
					$db->query("DELETE FROM {$DT_PRE}chat WHERE addtime<$DT_TIME-86400");
					$chat_status = 3;
					$_chat = $_chat > 0 ? $_chat - 1 : 0;
					$filename = DT_ROOT.'/file/chat/'.timetodate($DT_TIME, 'Ym/dH').'/'.$chatid.'.php';
					is_file($filename) or file_put($filename, '<?php exit;?>');
					if($fp = fopen($filename, 'a')) {
						fwrite($fp, "\n");
						fclose($fp);
					}
				}
				$head_title = '与'.($user['type'] == 'guest' ? '【游客】' : $chat['fromuser']).'对话中';
			} else {
				dheader('chat.php');
			}
			$type = 2;
		} else {
			$F = $T = array();
			$tab = isset($tab) ? intval($tab) : -1;
			$S = array('<span style="color:#666666">对方已经挂断</span>', '<span style="color:#FF0000">拒绝对话请求</span>', '<span style="color:#0000FF">等待接受对话</span>', '<span style="color:#008040">正在对话中...</span>', '<span style="color:#666666">超时自动断开</span>');
			if($_username) {
				$chats = 0;
				$result = $db->query("SELECT * FROM {$DT_PRE}chat WHERE touser='$_username' ORDER BY addtime DESC");
				while($r = $db->fetch_array($result)) {
					if($DT_TIME - $r['addtime'] > 3600 && in_array($r['status'], array(0, 1, 2, 4))) {
						$db->query("DELETE FROM {$DT_PRE}chat WHERE chatid='$r[chatid]'");
					}
					if(check_name($r['fromuser'])) {
						$m = memberinfo($r['fromuser'], '', 'company,truename');
						$r['linkurl'] = userurl($r['fromuser']);
						$r['from'] = $m['company'];
						$r['truename'] = $m['truename'];
					} else {
						$r['linkurl'] = '';
						$r['from'] = ip2area($r['fromuser']);
						$r['truename'] = '游客';
					}
					$r['addtime'] = timetodate($r['addtime'], 5);
					if($r['status'] == 2) $chats++;
					$T[] = $r;
				}
				if($chats != $_chat) {
					$_chat = $chats;
					$db->query("UPDATE {$DT_PRE}member SET chat=$chats WHERE userid=$_userid");
				}
			}
			$result = $db->query("SELECT * FROM {$DT_PRE}chat WHERE fromuser='$chatuser' ORDER BY addtime DESC");
			while($r = $db->fetch_array($result)) {
				$r['addtime'] = timetodate($r['addtime'], 5);
				$m = memberinfo($r['touser'], '', 'company,truename');
				$r['linkurl'] = userurl($r['touser']);
				$r['from'] = $m['company'];
				$r['truename'] = $m['truename'];
				$F[] = $r;
			}
			$head_title = '在线对话';
			$type = 3;
		}
		if($type < 3) {
			$faces = array();
			$face = glob('face/*.gif');
			if($face) {
				foreach($face as $k=>$v) {
					$faces[$k] = basename($v, '.gif');
				}
			}
			$chat_poll = intval($MOD['chat_poll']);
			$chat_poll = $chat_poll > 0 ? $chat_poll*1000 : 3000;
		}
	break;
}
include template('chat', $module);
?>