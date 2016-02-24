<?php
/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
defined('IN_DESTOON') or exit('Access Denied');
class dcache {
	var $pre;
	var $memcache;

    function dcache() {
		$this->memcache = &new Memcache;
		include DT_ROOT.'/file/config/memcache.inc.php';
		$num = count($MemServer);
		if($num == 1) {
			$key = 0;
		} else {
			$key = get_cookie('memcache');
			if($key == -1) {
				$key = 0;
			} else if(!isset($MemServer[$key])) {
				$key = array_rand($MemServer);
				set_cookie('memcache', $key ? $key : -1);
			}
		}
		$this->memcache->connect($MemServer[$key]['host'], $MemServer[$key]['port'], 2);
    }

	function get($key) {
		$key = $this->pre.$key;
        return $this->memcache->get($key);
    }

    function set($key, $val, $ttl = 600) {
		$key = $this->pre.$key;
         return $this->memcache->set($key, $val, 0, $ttl);
    }

    function rm($key) {
		$key = $this->pre.$key;
        return $this->memcache->delete($key);
    }

    function clear() {
        return $this->memcache->flush();
    }

	function expire() {
		//
	}
}
?>