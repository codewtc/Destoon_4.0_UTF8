<?php
defined('IN_DESTOON') or exit('Access Denied');
include DT_ROOT.'/api/map/51ditu/config.inc.php';
preg_match("/^[0-9\.\,]{13,17}$/", $map) or $map = $map_mid;
?>
<tr>
<td class="tl">公司地图标注</td>
<td class="tr">
<input type="text" name="setting[map]" id="map" value="<?php echo $map;?>" readonly size="50" onclick="MapMark();"/>&nbsp;&nbsp;
<a href="###" onclick="MapMark();" class="t">标注</a>&nbsp;|&nbsp;<a href="###" onclick="Dd('map').value=''" class="t">清空</a>
<script type="text/javascript">
function MapMark() {
	window.open(DTPath+'api/map/51ditu/mark.php?map='+Dd('map').value);
}
</script>
</td>
</tr>