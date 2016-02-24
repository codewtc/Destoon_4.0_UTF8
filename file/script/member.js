/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
function m(i) { try { Dd(i).className = 'tab_on'; } catch(e) {} }
function s(i) { try { Dd(i).className = 'side_b'; } catch(e) {} }
function v(i) { if(Dd(i).className == 'side_a') Dd(i).className = 'side_c'; }
function t(i) { if(Dd(i).className == 'side_c') Dd(i).className = 'side_a'; }
function c(i, s) {
	var s = s ? '_'+s : '';
	if(Dd('I_'+i).src.indexOf('arrow_c') == -1) {
		Dd('I_'+i).src = 'image/arrow_c'+s+'.gif'; Ds('D_'+i);
	} else {
		Dd('I_'+i).src = 'image/arrow_o'+s+'.gif'; Dh('D_'+i);
	}
	for(var j = 0; j < 4; j++) {
		if(j != i) {
			try {Dd('I_'+j).src = 'image/arrow_o'+s+'.gif'; Dh('D_'+j);} catch(e) {}
		}
	}
}
var n = 1
function o() {
	for(var j = 0; j < 4; j++) {
		if(n == 1) {
			try {Dd('I_'+j).src = 'image/arrow_c.gif'; Ds('D_'+j);} catch(e) {} 
		} else {
			try {Dd('I_'+j).src = 'image/arrow_o.gif'; Dh('D_'+j);} catch(e) {}
		}
	}
	if(n ==1) { n = 0; } else { n = 1; }
}
function oh(o) {
	if(o.className == 'side_h') {
		Dh('side');o.className = 'side_s';
		set_cookie('m_side', 11);
	} else {
		Ds('side');o.className = 'side_h';
		set_cookie('m_side', 0);
	}
}
function sh(c) {
	if(Dd('head_kw').value == L['keyword_value'] || Dd('head_kw').value.length < 1) {
		alert(L['keyword_message']);
		Dd('head_kw').focus();
		return false;
	}
	if(c) Dd('head_sh').submit();
}