<?php
/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
defined('IN_DESTOON') or exit('Access Denied');
class dcache {
	var $pre;

    function dcache() {
		//
    }

    function get($key) {
		$key = $this->pre.$key;
        return eaccelerator_get($key);
    }

    function set($key, $val, $ttl = 600) {
		$key = $this->pre.$key;
        eaccelerator_lock($key);
        return eaccelerator_put($key, $val, $ttl);
    }

    function rm($key) {
		$key = $this->pre.$key;
        return eaccelerator_rm($key);
    }

    function clear() {
        return eaccelerator_gc();
    }

	function expire() {
		//
	}
}
?>