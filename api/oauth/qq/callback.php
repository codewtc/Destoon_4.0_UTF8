<?php
require '../../../common.inc.php';
require 'init.inc.php';
$_REQUEST['code'] or dalert('Error Request.', $MODULE[2]['linkurl'].$DT['file_login'].'?step=callback&site='.$site);
$_REQUEST['state'] == $_SESSION['state'] or dalert('Error Request.', $MODULE[2]['linkurl'].$DT['file_login'].'?step=callback&site='.$site);
$par = 'grant_type=authorization_code'
	 . '&client_id='.QQ_ID
	 . '&client_secret='.QQ_SECRET
	 . '&code='.$_REQUEST['code']
	 . '&redirect_uri='.urlencode(QQ_CALLBACK);
$cur = curl_init(QQ_TOKEN_URL);
curl_setopt($cur, CURLOPT_POST, 1);
curl_setopt($cur, CURLOPT_POSTFIELDS, $par);
curl_setopt($cur, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($cur, CURLOPT_HEADER, 0);
curl_setopt($cur, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($cur, CURLOPT_RETURNTRANSFER, 1);
$rec = curl_exec($cur);
curl_close($cur);
if(strpos($rec, 'access_token') !== false) {
	parse_str($rec, $arr);
	$_SESSION['qq_access_token'] = $arr['access_token'];
	dheader('./');
} else {
	dalert('Error Token.', $MODULE[2]['linkurl'].$DT['file_login'].'?step=token&site='.$site);
}
?>
?>