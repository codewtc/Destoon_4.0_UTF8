<?php
/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
define('DT_NONUSER', true);
require 'common.inc.php';
require DT_ROOT.'/include/post.func.php';
switch($action) {
	case 'new':
		if($_userid) {
			$r = $db->get_one("SELECT chat,message,sound FROM {$DT_PRE}member WHERE userid=$_userid");
			if($r) {
				echo $r['chat'].'|'.$r['message'].'|'.$r['sound'];
			} else {
				echo '0|0|0';
			}
		} else {
			echo '0|0|0';
		}
	break;
	case 'area':
		$area_title = convert($area_title, 'UTF-8', DT_CHARSET);
		$area_extend = isset($area_extend) ? stripslashes($area_extend) : '';
		$areaid = isset($areaid) ? intval($areaid) : 0;
		$area_deep = isset($area_deep) ? intval($area_deep) : 0;
		$area_id= isset($area_id) ? intval($area_id) : 1;
		echo get_area_select($area_title, $areaid, $area_extend, $area_deep, $area_id);
	break;
	case 'category':
		$category_title = convert($category_title, 'UTF-8', DT_CHARSET);
		$category_extend = isset($category_extend) ? stripslashes($category_extend) : '';
		$category_moduleid = isset($category_moduleid) ? intval($category_moduleid) : 1;
		if(!$category_moduleid) exit;
		$category_deep = isset($category_deep) ? intval($category_deep) : 0;
		$cat_id = isset($cat_id) ? intval($cat_id) : 1;
		$_child = array();
		if($_groupid == 1 && $_admin == 2) {
			$R = cache_read('right-'.$_userid.'.php');
			if(isset($R[$category_moduleid]['index']['catid'])) {
				$_catids = $R[$category_moduleid]['index']['catid'];
				if($_catids && is_array($_catids)) {
					$_childs = '';
					$result = $db->query("SELECT arrchildid FROM {$DT_PRE}category WHERE catid IN (".implode(',', $_catids).")");
					while($r = $db->fetch_array($result)) {
						$_childs .= ','.$r['arrchildid'];
					}
					if($_childs) {
						$_childs = substr($_childs, 1);
						$_child = explode(',', $_childs);
					}
				}
			}
		}
		echo get_category_select($category_title, $catid, $category_moduleid, $category_extend, $category_deep, $cat_id);
	break;
	case 'property':
		$CAT or exit;
		$CAT['property'] or exit;
		include DT_ROOT.'/include/property.func.php';
		$admin = (isset($admin) && $admin) ? 1 : 0;
		$moduleid = $CAT['moduleid'];
		$options = property_option($catid);
		$values = $itemid ? property_value($moduleid, $itemid) : array();
		$select = '<select id="property_required" style="display:none;">';
		$table = '';
		foreach($options as $k=>$v) {
			isset($values[$v['oid']]) or $values[$v['oid']] = '';
			if($v['required']) {
				$star = '<span class="f_red">*</span> ';
			} else {
				$star = $admin ? '<span class="f_hid">*</span> ' : '';
			}
			$table .=  '<tr><td class="tl">'.$star.$v['name'].'</td><td class="tr">'.property_html($values[$v['oid']], $v['oid'], $v['type'], $v['value'], $v['extend']).' <span class="f_red" id="dproduct-'.$v['oid'].'"></span></td></tr>';
			$select .= $v['required'] ? '<option value="'.$v['oid'].'">'.$v['name'].'</option>' : '';
		}
		$select .= '</select>';
		echo $table.$select;
	break;
	case 'clear':
		@ignore_user_abort(true);
		$session = new dsession();
		if($_SESSION['uploads']) {
			foreach($_SESSION['uploads'] as $file) {
				delete_upload($file, $_userid);
			}
			$_SESSION['uploads'] = array();
		}
	break;
	case 'ipage':
		isset($job) or exit;
		if($job == 'sell') {
			$moduleid = 5;
		} else if($job == 'buy') {
			$moduleid = 6;
		} else {
			exit;
		}	tag("moduleid=$moduleid&condition=status=3&areaid=$city_id&pagesize=".$DT['page_trade']."&page=$page&datetype=2&order=addtime desc&time=addtime&template=list-trade");
	break;
	case 'keyword':
		$mid = isset($mid) ? intval($mid) : 0;
		$mid or exit;
		isset($MODULE[$mid]) or exit;
		tag("moduleid=$mid&table=keyword&condition=moduleid=$mid and status=3&pagesize=10&order=total_search desc&template=list-search_kw");
	break;
	case 'tipword':
		if(!$DT['search_tips']) exit;
		$mid = isset($mid) ? intval($mid) : 0;
		$mid or exit;
		isset($MODULE[$mid]) or exit;
		if(!$word || strlen($word) < 2 || strlen($word) > 30) exit;
		$word = convert($word, 'UTF-8', DT_CHARSET);	
		$word = str_replace(array(' ','*', "\'"), array('%', '%', ''), $word);
		if(preg_match("/^[a-z0-9A-Z]+$/", $word)) {			
			tag("moduleid=$mid&table=keyword&condition=moduleid=$mid and letter like '%$word%'&pagesize=10&order=total_search desc&template=list-search_tip", -2);
		} else {
			tag("moduleid=$mid&table=keyword&condition=moduleid=$mid and keyword like '%$word%'&pagesize=10&order=total_search desc&template=list-search_tip", -2);
		}
	break;
	case 'letter':
		preg_match("/[a-z]{1}/", $letter) or exit;
		$cols = isset($cols) ? intval($cols) : 5;
		$precent = ceil(100/$cols);
		$CATEGORY = cache_read('category-'.$moduleid.'.php');
		$CATALOG = array();
		foreach($CATEGORY as $k=>$v) {
			if($v['letter'] == $letter) $CATALOG[] = $v;
		}
		include template('letter', 'chip');
	break;
	case 'catalog':
		$mid = isset($mid) ? intval($mid) : 0;
		$mid or exit;
		isset($MODULE[$mid]) or exit;
		include template('catalog', 'chip');
	break;
	case 'city':
		$lists = array();
		$result = $db->query("SELECT areaid,name,style,domain,letter FROM {$DT_PRE}city ORDER BY letter,listorder");
		while($r = $db->fetch_array($result)) {
			$r['linkurl'] = $r['domain'] ? $r['domain'] : DT_PATH.'api/'.rewrite('city.php?areaid='.$r['areaid']);
			$lists[strtoupper($r['letter'])][] = $r;
		}
		include template('city', 'chip');
	break;	
	case 'schcate':
		isset($name) or $name == '';
		if($name) $name = convert($name, 'UTF-8', DT_CHARSET);
		$limit = $DT['schcate_limit'] ? intval($DT['schcate_limit']) : 10;
		$html = '';
		$result = $db->query("SELECT catid,arrparentid FROM {$DT_PRE}category WHERE moduleid=$moduleid AND catname LIKE '%$name%' ORDER BY item DESC,catid DESC LIMIT $limit");
		while($r = $db->fetch_array($result)) {
			$html .= '<input type="radio" name="dtcate" value="'.$r['catid'].'" onclick="load_category('.$r['catid'].', 1);" id="dtcate_'.$r['catid'].'"/> <label for="dtcate_'.$r['catid'].'">'.strip_tags(cat_pos($r)).'</label><br/>';
		}
		echo $html;
	break;
	case 'reccate':
		isset($name) or $name == '';
		if($name) $name = convert($name, 'UTF-8', DT_CHARSET);
		$limit = $DT['schcate_limit'] ? intval($DT['schcate_limit']) : 10;
		$table = get_table($moduleid);
		$key = in_array($moduleid, array(5, 6)) ? 'tag' : 'keyword';
		$html = '';
		$result = $db->query("SELECT DISTINCT catid FROM {$table} WHERE `{$key}` LIKE '%$name%' ORDER BY addtime DESC LIMIT $limit");
		while($r = $db->fetch_array($result)) {
			$html .= '<input type="radio" name="dtcate" value="'.$r['catid'].'" onclick="load_category('.$r['catid'].', 1);" id="dtcate_'.$r['catid'].'"/> <label for="dtcate_'.$r['catid'].'">'.strip_tags(cat_pos(get_cat($r['catid']))).'</label><br/>';
		}
		echo $html;
	break;
	case 'ckpath':
		if($_groupid != 1) exit;
		if($moduleid < 5) exit;
		if(strlen($path) < 5) exit;
		$path = convert($path, 'UTF-8', DT_CHARSET);
		$table = get_table($moduleid);
		if($table) {
			$sql = "filepath='$path'";
			if($itemid) $sql .= " AND itemid!=$itemid";
			if($db->get_one("SELECT itemid FROM {$table} WHERE $sql")) {
				exit(lang('message->ajax_filepath_exists'));
			} else {
				exit(lang('message->ajax_filepath_not_exists'));
			}
		}
	break;
	case 'member':
		isset($job) or $job = '';
		require DT_ROOT.'/module/'.$module.'/common.inc.php';
		isset($value) or $value == '';
		$value = convert($value, 'UTF-8', DT_CHARSET);
		require MD_ROOT.'/member.class.php';
		$do = new member;
		if(isset($userid) && $userid) $do->userid = $userid;
		switch($job) {
			case 'username':
				if(!$value) exit($L['member_username_match']);
				if(!$do->is_username($value)) exit($do->errmsg);
			break;
			case 'passport':
				if(!$value) exit;
				if(!$do->is_passport($value)) exit($do->errmsg);
			break;
			case 'password':
				if(!$do->is_password($value, $value)) exit($do->errmsg);
			break;
			case 'payword':
				if(!$do->is_payword($value, $value)) exit($do->errmsg);
			break;
			case 'email':
				$value = trim($value);
				if(!$do->is_email($value)) exit($do->errmsg);
				if($do->email_exists($value)) exit($L['member_email_reg']);
				$session = new dsession();
				$_SESSION['regemail'] = md5(md5($value.DT_KEY.$DT_IP));
			break;
			case 'emailcode':
				$session = new dsession();
				$value = trim($value);
				if(!preg_match("/[0-9]{6}/", $value) || $_SESSION['email_code'] != md5($_SESSION['email'].'|'.$value)) exit('&nbsp;');
			break;
			case 'company':
				if(!$value) exit($L['member_company_null']);
				if(!$do->is_company($value)) exit($L['member_company_reg']);
				if($do->company_exists($value)) exit($L['member_company_reg']);
			break;
			case 'get_company':
				$user = $do->get_one($value);
				if($user) {
					echo '<a href="'.$user['linkurl'].'" target="_blank" class="t">'.$user['company'].'</a>'.( $user['vip'] ? ' <img src="'.DT_SKIN.'image/vip.gif" align="absmiddle"/> <img src="'.DT_SKIN.'image/vip_'.$user['vip'].'.gif" align="absmiddle"/>' : '');
				} else {
					echo '1';
				}
				exit;
			break;
		}
	break;
	case 'get_data':
		if(!$_userid) exit;
		$mid = isset($mid) ? intval($mid) : 0;
		$mid or exit;
		isset($MODULE[$mid]) or exit;
		$file = DT_ROOT.'/file/user/'.dalloc($_userid).'/'.$_userid.'/editor.data.'.$mid.'.php';
		$content = file_get($file);
		if($content) {
			echo substr($content, 13);
		} else {
			echo '';
		}
	break;
	case 'save_data':
		if(!$_userid) exit;
		$mid = isset($mid) ? intval($mid) : 0;
		$mid or exit;
		isset($MODULE[$mid]) or exit;
		if(!$content) exit;
		$content = stripslashes($content);
		$content = convert($content, 'UTF-8', DT_CHARSET);
		$content = '<?php exit;?>'.timetodate($DT_TIME).$content;
		file_put(DT_ROOT.'/file/user/'.dalloc($_userid).'/'.$_userid.'/editor.data.'.$mid.'.php', $content);
	break;
	case 'captcha':
		if(strlen($captcha) < 4) exit('1');
		$session = new dsession();
		if(!isset($_SESSION['captchastr'])) exit('2');
		$captcha = convert($captcha, 'UTF-8', DT_CHARSET);
		if($_SESSION['captchastr'] != md5(md5(strtoupper($captcha).DT_KEY.$DT_IP))) exit('3');
		exit('0');
	break;
	case 'question':
		if(strlen($answer) < 1) exit('1');
		$answer = stripslashes($answer);
		$answer = convert($answer, 'UTF-8', DT_CHARSET);
		$session = new dsession();
		if(!isset($_SESSION['answerstr'])) exit('2');
		if($_SESSION['answerstr'] != md5(md5($answer.DT_KEY.$DT_IP))) exit('3');
		exit('0');
	break;
}
?>