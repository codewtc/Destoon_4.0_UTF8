/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
var index_timeout, index_l = '';
function index_timer(l) {
	index_timeout = setTimeout(
	function() {
		if(index_l) Dd('index_'+index_l).className = 'catalog_letter_li';
		index_l = l;
		Dd('index_'+l).className = 'catalog_letter_on';
		Ds('catalog_index');
		Dd('catalog_index').className = 'catalog_index';
		makeRequest('moduleid=5&action=letter&cols=5&letter='+l, AJPath, 'index_show');
	} ,200);
}
function index_out() {clearTimeout(index_timeout);}
function index_show() {if(xmlHttp.readyState==4 && xmlHttp.status==200) {Dd('catalog_index').innerHTML = xmlHttp.responseText+'<div onclick="index_hide()" title="'+L['close_letter']+'">&nbsp;</div>';}}
function index_hide() {
	if(index_l) Dd('index_'+index_l).className = 'catalog_letter_li';
	Dd('catalog_index').innerHTML = ''; Dh('catalog_index'); index_out();
}
function index_leave(o, e) {
	if(e.currentTarget) {
		if(typeof(HTMLElement) != "undefined") {
			HTMLElement.prototype.contains = function(obj) {
				if(obj==this) return true; 
				while(obj=obj.parentNode) {if(obj==this) return true;}
				return false; 
			}
		}
		if(o.contains(e.relatedTarget)) return;
	} else {
		if(o.contains(e.toElement)) return;
	}
	setTimeout(index_hide, 200);
}
var _p = 0;
function AutoTab() {
	var c;
	Dd('trades').onmouseover = function() {_p = 1;} 
	Dd('trades').onmouseout = function() {_p = 0;}
	if(_p) return;
	for(var i = 1; i < 4; i++) { if(Dd('trade_t_'+i).className == 'tab_2') {c = i;} }
	c++; 
	if(c>3) c = 1;
	Tb(c, 3, 'trade', 'tab');
}
if(Dd('trades') != null) window.setInterval('AutoTab()',5000);