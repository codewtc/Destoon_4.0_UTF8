/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
function Print(i) {if(isIE) {window.print();} else {var i = i ? i : 'content'; var w = window.open('','',''); w.opener = null; w.document.write('<div style="width:630px;">'+Dd(i).innerHTML+'</div>'); w.window.print();}}
function addFav(t) {document.write('<a href="'+window.location.href+'" title="'+document.title+'" rel="sidebar" onclick="window.external.addFavorite(this.href, this.title);return false;">'+t+'</a>');}
function Album(id, s) {
	for(var i=0; i<3; i++) {Dd('t_'+i).className = i==id ? 'ab_on' : 'ab_im';}
	Dd('abm').innerHTML = '<img src="'+s+'" onload="if(this.width>240){this.width=240;}" onclick="PAlbum(this);" onmouseover="SAlbum(this.src);" onmouseout="HAlbum();" id="DIMG"/>';
}
function SAlbum(s) {
	if(s.indexOf('nopic240.gif') != -1) return;
	if(s.indexOf('.middle.') != -1) s = s.substring(0, s.length-8-ext(s).length);
	Dd('imgshow').innerHTML = '<img src="'+s+'" onload="if(this.width<240){HAlbum();}else if(this.width>630){this.width=630;}"/>';
	Ds('imgshow');
}
function PAlbum(o) {if(o.src.indexOf('nopic240.gif')==-1) View(o.src);}
function HAlbum() {Dh('imgshow');}
function Dsearch() {
	if(Dd('destoon_kw').value.length < 1 || Dd('destoon_kw').value == L['keyword_message']) {
		Dd('destoon_kw').value = '';
		window.setTimeout(function(){Dd('destoon_kw').value = L['keyword_message'];}, 500);
		return false;
	}
	return true;
}
function Dsearch_adv() {Go(DTPath+'search.php?moduleid='+Dd('destoon_moduleid').value);}
function Dsearch_top() {if(Dsearch()){Dd('destoon_spread').value=1;Dd('destoon_search').submit();}}
function View(s) {window.open(EXPath+'view.php?img='+s);}
function PushNew() {makeRequest('action=new', AJPath, '_PushNew');}
function _PushNew() {
	if(xmlHttp.readyState==4 && xmlHttp.status==200) {
		if(xmlHttp.responseText) {
			var t = xmlHttp.responseText.split('|');
			var s = '';
			t[3] = substr_count(get_cookie('cart'), ',');
			Dd('destoon_cart').innerHTML = t[3] > 0 ? '<strong class="f_red">'+t[3]+'</strong>' : '0';
			Dd('destoon_chat').innerHTML = t[0] > 0 ? '<strong class="f_red">'+t[0]+'</strong>' : '0';
			Dd('destoon_message').innerHTML = t[1] > 0 ? '<strong class="f_red">'+t[1]+'</strong>' : '0';
			if(t[0] && destoon_chat < t[0]) s += sound('chat_new');
			if(t[1] && t[2] && destoon_message < t[1]) s += sound('message_'+t[2]);
			if(s) Dd('tb_c').innerHTML = s;
			destoon_chat = t[0];
			destoon_message = t[1];
		}
	}
}
function setModule(i, o) {
	Dd('destoon_moduleid').value = i;
	searchid = i;
	var lis = Dd('search_module').getElementsByTagName('li');
	for(var i=0;i<lis.length;i++) {
		lis[i].className = lis[i] == o ? 'head_search_on' : '';
	}
}
function setTip(w) {Dh('search_tips'); Dd('destoon_kw').value = w; Dd('destoon_search').submit();}
var tip_word = '';
function STip(w) {
	if(w.length < 2) {Dd('search_tips').innerHTML = ''; Dh('search_tips'); return;}
	if(w == tip_word) {return;} else {tip_word = w;}
	makeRequest('action=tipword&mid='+searchid+'&word='+w, AJPath, '_STip');
}
function _STip() {
	if(xmlHttp.readyState==4 && xmlHttp.status==200) {
		if(xmlHttp.responseText) {
			Ds('search_tips'); Dd('search_tips').innerHTML = xmlHttp.responseText + '<label onclick="Dh(\'search_tips\');">'+L['search_tips_close']+'&nbsp;&nbsp;</label>';
		} else {
			Dd('search_tips').innerHTML = ''; Dh('search_tips');
		}
	}
}
function SCTip(k) {
	var o = Dd('search_tips');
	if(o.style.display == 'none') {
		if(o.innerHTML != '') Ds('search_tips');
	} else {
		if(k == 13) {Dd('destoon_search').submit(); return;}
		Dd('destoon_kw').blur();
		var d = o.getElementsByTagName('div'); var l = d.length; var n, p; var c = w = -2;
		for(var i=0; i<l; i++) {if(d[i].className == 'search_t_div_2') c = i;}
		if(c == -2) {
			n = 0; p = l-1;
		} else if(c == 0) {
			n = 1; p = -1;
		} else if(c == l-1) {
			n = -1; p = l-2; 
		} else {
			n = c+1; p = c-1;
		}
		w = k == 38 ? p : n;
		if(c >= 0) d[c].className = 'search_t_div_1';
		if(w >= 0) d[w].className = 'search_t_div_2';
		if(w >= 0) {var r = d[w].innerHTML.split('>'); Dd('destoon_kw').value = r[2];} else {Dd('destoon_kw').value = tip_word;}
	}
}
function setFModule(id) {
	var name = Dd('foot_search_m_'+id).innerHTML;
	Dd('foot_moduleid').value = id;
	var ss = Dd('foot_search_m').getElementsByTagName('span');
	for(var i=0;i<ss.length;i++) {if(ss[i].id == 'foot_search_m_'+id) {ss[i].className = 'f_b';} else {ss[i].className = '';}}
}
function Fsearch() {
	if(Dd('foot_kw').value.length < 1 || Dd('foot_kw').value == L['keyword_message']) {
		Dd('foot_kw').value = ''; window.setTimeout(function(){Dd('foot_kw').value = L['keyword_message'];}, 500); return false;
	}
}
function user_login() {
	if(Dd('user_name').value.length < 2) {Dd('user_name').focus(); return false;}
	if(Dd('user_pass').value == 'password' || Dd('user_pass').value.length < 6) {Dd('user_pass').focus(); return false;}
}
function show_comment(u, m, i) {document.write('<iframe src="'+u+'comment.php?mid='+m+'&itemid='+i+'" name="destoon_comment" id="des'+'toon_comment" style="width:99%;height:0px;" scrolling="no" frameborder="0"></iframe>');}
function show_answer(u, i) {document.write('<iframe src="'+u+'answer.php?itemid='+i+'" name="destoon_answer" id="des'+'toon_answer" style="width:100%;height:0px;" scrolling="no" frameborder="0"></iframe>');}
function show_message(u, i) {document.write('<iframe src="'+u+'message.php?itemid='+i+'" name="destoon_msg" id="des'+'toon_msg" style="width:99%;height:0px;" scrolling="no" frameborder="0"></iframe>');}
function show_task(s) {document.write('<script type="text/javascript" src="'+DTPath+'api/task.js.php?'+s+'&refresh='+Math.random()+'.js"></sc'+'ript>');}
var sell_n = 0;
function sell_tip(o, i) {
	if(o.checked) {sell_n++; Dd('item_'+i).style.backgroundColor='#F1F6FC';} else {Dd('item_'+i).style.backgroundColor='#FFFFFF'; sell_n--;}
	if(sell_n < 0) sell_n = 0;
	if(sell_n > 1) {
		var aTag = o; var leftpos = toppos = 0;
		do {aTag = aTag.offsetParent; leftpos	+= aTag.offsetLeft; toppos += aTag.offsetTop;
		} while(aTag.offsetParent != null);
		var X = o.offsetLeft + leftpos - 10;
		var Y = o.offsetTop + toppos - 70;
		Dd('sell_tip').style.left = X + 'px';
		Dd('sell_tip').style.top = Y + 'px';
		o.checked ? Ds('sell_tip') : Dh('sell_tip');
	} else {
		Dh('sell_tip');
	}
}
function img_tip(o, i) {
	if(i) {
		if(i.indexOf('nopic.gif') == -1) {
			if(i.indexOf('.thumb.') != -1) {var t = i.split('.thumb.');var s = t[0];} else {var s = i;}
			var aTag = o; var leftpos = toppos = 0;
			do {aTag = aTag.offsetParent; leftpos	+= aTag.offsetLeft; toppos += aTag.offsetTop;
			} while(aTag.offsetParent != null);
			var X = o.offsetLeft + leftpos + 90;
			var Y = o.offsetTop + toppos - 20;
			Dd('img_tip').style.left = X + 'px';
			Dd('img_tip').style.top = Y + 'px';
			Ds('img_tip');
			Inner('img_tip', '<img src="'+s+'" onload="if(this.width<200) {Dh(\'img_tip\');}else if(this.width>300){this.width=300;}Dd(\'img_tip\').style.width=this.width+\'px\';"/>')
		}
	} else {
		Dh('img_tip');
	}
}