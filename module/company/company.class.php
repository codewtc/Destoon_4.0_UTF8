<?php 
defined('IN_DESTOON') or exit('Access Denied');
class company {
	var $userid;
	var $username;
	var $db;
	var $table_member;
	var $table_company;
	var $table_company_catid;
	var $table_company_data;
	var $errmsg = errmsg;

    function company($username = '') {
		global $db;
		$this->table_member = $db->pre.'member';
		$this->table_company = $db->pre.'company';
		$this->table_company_catid = $db->pre.'company_catid';
		$this->table_company_data = $db->pre.'company_data';
		$this->db = &$db;
    }

	function get_one($username = '') {
		$sql = $username ? "m.username='$username'" : "m.userid='$this->userid'";
        return $this->db->get_one("SELECT * FROM {$this->table_member} m,{$this->table_company} c WHERE m.userid=c.userid AND $sql");
	}

	function get_list($condition, $order = 'userid DESC', $cache = '') {
		global $pages, $page, $pagesize, $offset, $items;
		$r = $this->db->get_one("SELECT COUNT(*) AS num FROM {$this->table_company} WHERE $condition", $cache);
		$items = $r['num'];
		$pages = defined('CATID') ? listpages(1, CATID, $items, $page, $pagesize, 10, $MOD['linkurl']) : pages($items, $page, $pagesize);		
		$members = array();
		$result = $this->db->query("SELECT * FROM {$this->table_company} WHERE $condition ORDER BY $order LIMIT $offset,$pagesize", $cache);
		while($r = $this->db->fetch_array($result)) {
			$members[] = $r;
		}
		return $members;
	}

	function update($userid) {
		global $DT, $MOD, $CATEGORY;
		$CATEGORY or $CATEGORY = cache_read('category-4.php');
		$this->userid = $userid;
		$r = $this->get_one();
		if(!$r) return false;
		$linkurl = userurl($r['username'], '', $r['domain']);
		$keyword = addslashes($r['company'].strip_tags(area_pos($r['areaid'], '')).$r['business'].$r['sell'].$r['buy'].$r['mode']);
		$catids = '';
		if($r['catid']) {
			$catids = explode(',', substr($r['catid'], 1, -1));
			$cids = '';
			foreach($catids as $catid) {
				if(isset($CATEGORY[$catid])) {
					$catid = $CATEGORY[$catid]['parentid'] ? $CATEGORY[$catid]['arrparentid'].','.$catid : $catid;
					$cids .= $catid.',';
				}
			}
			$cids = array_unique(explode(',', substr(str_replace(',0,', ',', ','.$cids), 1, -1)));
			$catids = ','.implode(',', $cids).',';
			$r['catids'] = $catids;
		}
		if($r['vip']) {
			$vipt = $this->get_vipt($r['username']);
			$vip = $this->get_vip($vipt, $r['vipr']);
			$r['vip'] = $vip;
			$this->db->query("UPDATE {$this->table_company} SET linkurl='$linkurl',keyword='$keyword',catids='$catids',vip='$vip',vipt='$vipt' WHERE userid=$userid");
		} else {
			$this->db->query("UPDATE {$this->table_company} SET linkurl='$linkurl',keyword='$keyword',catids='$catids' WHERE userid=$userid");
		}
		$this->update_catid($r);
		return true;
	}

	function get_vipt($username) {
		global $MOD, $GROUP, $DT_TIME;
		$GROUP or $GROUP = cache_read('group.php');
		$r = $this->get_one($username);
		$_groupvip = $GROUP[$r['groupid']]['vip'] > $MOD['vip_maxgroupvip'] ? $MOD['vip_maxgroupvip'] : $GROUP[$r['groupid']]['vip'];
		$_cominfo = $r['validated'] ? intval($MOD['vip_cominfo']) : 0;
		$_year = $r['fromtime'] ? (date('Y', $DT_TIME) - date('Y', $r['fromtime']))*$MOD['vip_year'] : 0;
		$_year = $_year > $MOD['vip_maxyear'] ? $MOD['vip_maxyear'] : $_year;
		$m = $this->db->get_one("SELECT COUNT(*) AS num FROM {$this->db->pre}honor WHERE username='$username' AND status=3");
		$_honor = $m['num'] > 4 ? $MOD['vip_honor'] : 0;
		$total = intval($_groupvip + $_cominfo + $_year + $_honor);
		if($total > 10) $total = 10;
		if($total < 1) $total = 1;
		return $total;
	}

	function get_vip($vipt, $vipr) {
		$vip = intval($vipt + ($vipr));
		if($vip > 10) $vip = 10;
		if($vip < 1) $vip = 1;
		return $vip;
	}

	function vip_edit($vip) {
		global $_username, $DT_TIME;
		if(!is_array($vip)) return false;
		if(!$vip['username']) return $this->_(lang('message->pass_company_username'));
		$r = $this->get_one($vip['username']);
		if(!$r) return $this->_(lang('message->pass_company_notuser'));
		$userid = $r['userid'];
		if($r['groupid'] < 5) return $this->_(lang('message->pass_company_badgroup'));
		if(!$vip['groupid']) return $this->_(lang('message->pass_company_group'));
		if(!$vip['fromtime'] || !is_date($vip['fromtime'])) return $this->_(lang('message->pass_company_fromdate'));
		if(!$vip['totime'] || !is_date($vip['totime'])) return $this->_(lang('message->pass_company_todate'));
		if(strtotime($vip['fromtime'].' 00:00:00') > strtotime($vip['totime'].' 23:59:59')) return $this->_(lang('message->pass_company_baddate'));
		$vip['fromtime'] = strtotime($vip['fromtime'].' 00:00:00');
		$vip['totime'] = strtotime($vip['totime'].' 23:59:59');
		$vip['validated'] = $vip['validated'] ? 1 : 0;
		$vip['validtime'] = strtotime($vip['validtime']);
		$vip['vipr'] = isset($vip['vipr']) ? $vip['vipr'] : 0;
		$this->db->query("UPDATE {$this->table_company} SET groupid='$vip[groupid]',validated='$vip[validated]',validator='$vip[validator]',validtime='$vip[validtime]',vipr='$vip[vipr]',fromtime='$vip[fromtime]',totime='$vip[totime]' WHERE userid=$userid");
		$vip['vipt'] = $this->get_vipt($vip['username']);
		$vip['vip'] = $this->get_vip($vip['vipt'], $vip['vipr']);
		$this->db->query("UPDATE {$this->table_company} SET vip='$vip[vip]',vipt='$vip[vipt]' WHERE userid=$userid");
		$this->db->query("UPDATE {$this->table_company_catid} SET vip='$vip[vip]' WHERE userid=$userid");
		$this->db->query("UPDATE {$this->table_member} SET groupid='$vip[groupid]' WHERE userid=$userid");
		return true;
	}

	function vip_delete($userid) {
		if(!isset($userid) || !$userid) return false;
		$userids = is_array($userid) ? implode(',', $userid) : intval($userid);
		$result = $this->db->query("SELECT * FROM {$this->table_member} WHERE userid IN ($userids)");
		while($r = $this->db->fetch_array($result)) {
			$regid = $r['regid'] ? $r['regid'] : 6;
			$this->db->query("UPDATE {$this->table_company} SET groupid=$regid,vip=0,vipr=0,vipt=0 WHERE userid=$r[userid]");
			$this->db->query("UPDATE {$this->table_company}_catid SET groupid=$regid,vip=0 WHERE userid=$r[userid]");
			$this->db->query("UPDATE {$this->table_member} SET groupid=$regid,regid=$regid WHERE userid=$r[userid]");
		}
		return true;
	}

	function level($userid, $level) {
		$userids = is_array($userid) ? implode(',', $userid) : $userid;
		$this->db->query("UPDATE {$this->table_company} SET level=$level WHERE userid IN ($userids)");
	}
	
	function update_catid($member = array()) {
		if($member) {
			$userid = $member['userid'];
			$groupid = intval($member['groupid']);
			$vip = intval($member['vip']);
			$areaid = intval($member['areaid']);
			$catids = $member['catid'];
			$this->db->query("DELETE FROM {$this->table_company_catid} WHERE userid=$userid");
			if($catids) {
				foreach(explode(',', $catids) as $catid) {
					$catid = intval($catid);
					if(!$catid) continue;
					$this->db->query("INSERT INTO {$this->table_company_catid} (userid,catid,areaid,groupid,vip) VALUES ($userid,$catid,$areaid,$groupid,$vip)");
				}
			}
		}
	}

	function _($e) {
		$this->errmsg = $e;
		return false;
	}
}
?>