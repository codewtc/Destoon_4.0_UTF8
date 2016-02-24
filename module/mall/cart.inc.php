<?php 
defined('IN_DESTOON') or exit('Access Denied');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
include load('misc.lang');
$max_cart = $MOD['max_cart'];
$cart = get_cookie('cart');
if($action == 'ajax') {
	$itemid or exit('-1');
	if(strpos($cart.',', ','.$itemid.',') !== false) exit('-2');
	$item = $db->get_one("SELECT itemid,status,username FROM {$table} WHERE itemid=$itemid");
	if($item && $item['status'] == 3) {
		if($item['username'] != $_username) {
			set_cookie('cart', ','.$itemid.$cart, $DT_TIME + 365*24*3600);
			exit('1');
		} else {
			exit('-4');
		}
	} else {
		exit('-3');
	}
} else if($action == 'clear') {
	if($itemid) {
		$cart = str_replace(','.$itemid.',', ',', $cart.',');
		if(substr($cart, -1) == ',') $cart = substr($cart, 0, -1);
		set_cookie('cart', $cart, $DT_TIME + 365*24*3600);
		if(isset($ajax)) exit('1');
		message('', 'cart.php?tm='.$DT_TIME);
	} else {
		set_cookie('cart', '', $DT_TIME + 365*24*3600);
		message('', 'cart.php?tm='.$DT_TIME);
	}
} else {
	$reset = false;
	if($itemid) {
		if(is_array($itemid)) {
			foreach($itemid as $id) {
				if(strpos($cart.',', ','.$id.',') === false) {
					$reset = true;
					$cart = ','.$id.$cart;
				}
			}
		} else {
			if(strpos($cart.',', ','.$itemid.',') === false) {
				$reset = true;
				$cart = ','.$itemid.$cart;
			}
		}
	}
	while(substr_count($cart, ',') > $max_cart) {
		$reset = true;
		$cart = substr($cart, 0, -strlen(strrchr($cart, ',')));
	}
	if($reset) set_cookie('cart', $cart, $DT_TIME + 365*24*3600);
	$itemids = $cart ? substr($cart, 1) : '';
	$_itemids = '';
	$tags = $_tags = array();
	$total = $price = 0;
	if($itemids) {
		$result = $db->query("SELECT * FROM {$table} WHERE itemid IN ($itemids)");
		while($r = $db->fetch_array($result)) {
			if($r['username'] == $_username || $r['status'] != 3) continue;
			$r['alt'] = strip_tags($r['title']);
			$r['title'] = set_style(dsubstr($r['title'], 40, '..'), $r['style']);
			$r['linkurl'] = $MOD['linkurl'].$r['linkurl'];
			$price += $r['price'];
			$total++;			
			$_tags[$r['itemid']] = $r;
		}
		foreach(explode(',', $itemids) as $v) {
			if(isset($_tags[$v])) {
				$tags[] = $_tags[$v];
				$_itemids .= ','.$v;
			}
		}
		if($_itemids != $cart) {
			$cart = $_itemids;
			$itemids = $cart ? substr($cart, 1) : '';
			set_cookie('cart', $cart, $DT_TIME + 365*24*3600);
		}
	}
	$head_title = $L['cart_title'].$DT['seo_delimiter'].$MOD['name'];
	include template('cart', $module);
}
?>