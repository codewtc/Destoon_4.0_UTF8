/*
	[Destoon B2B System] Copyright (c) 2008-2011 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
var _sbt = false; var _frm = _frm ? _frm : 'dform';
try {if(document.attachEvent) Dd(_frm).attachEvent("onsubmit", sbt); else Dd(_frm).addEventListener("submit", sbt, false);} catch(e) {}
function sbt() {_sbt = true;}
if(isGecko) {
	window.onbeforeunload = function() {if(!_sbt) makeRequest('action=clear', AJPath);}	
} else {
	window.onunload = function() {if(!_sbt) makeRequest('action=clear', AJPath);}
	if(window.opera) {makeRequest('action=clear', AJPath);}
}