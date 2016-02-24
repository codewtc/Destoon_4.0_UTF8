<?php
defined('IN_DESTOON') or exit('Access Denied');
include tpl('header');
show_menu($menus);
?>
<div class="tt"><span class="f_r c_p"><span onclick="checkall(Dd('dform'),2);">全选</span> / <span onclick="checkall(Dd('dform'),1);">反选</span>&nbsp;&nbsp;</span><?php echo $MOD['name'];?>[<?php echo $item['title'];?>]图片列表</div>
<form method="post" action="?" id="dform">
<input type="hidden" name="moduleid" value="<?php echo $moduleid;?>"/>
<input type="hidden" name="action" value="<?php echo $action;?>"/>
<input type="hidden" name="itemid" value="<?php echo $itemid;?>"/>
<input type="hidden" name="forward" value="<?php echo $forward;?>"/>
<input type="hidden" name="update" value="1"/>
<input type="hidden" name="swf_upload" id="swf_upload"/>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td>
<?php foreach($lists as $k=>$v) { ?>
<div style="width:130px;float:left;">
	<input type="hidden" name="post[<?php echo $v['itemid'];?>][thumb]" id="thumb<?php echo $v['itemid'];?>" value="<?php echo $v['thumb'];?>"/>
	<table width="120">
	<tr align="center" height="110" class="c_p">
	<td width="120"><img src="<?php echo $v['thumb'];?>" id="showthumb<?php echo $v['itemid'];?>" title="预览图片" alt="" onclick="if(this.src.indexOf('waitpic.gif') == -1){_preview(this.src, 1);}else{Dphoto(<?php echo $v['itemid'];?>,<?php echo $moduleid;?>,100,100, Dd('thumb<?php echo $v['itemid'];?>').value, true);}"/></td>
	</tr>
	<tr align="center">
	<td height="20">
	<input type="checkbox" name="post[<?php echo $v['itemid'];?>][delete]" value="1" title="选中项将被删除" style="margin:0;"/>
	<a href="?moduleid=<?php echo $moduleid;?>&action=item_delete&itemid=<?php echo $v['itemid'];?>" onclick="return _delete();"><img src="<?php echo $MODULE[2]['linkurl'];?>image/img_delete.gif" width="12" height="12" title="删除"/></a>&nbsp;
	<span onclick="Dphoto(<?php echo $v['itemid'];?>,<?php echo $moduleid;?>,100,100, Dd('thumb<?php echo $v['itemid'];?>').value, true);" class="jt"><img src="<?php echo $MODULE[2]['linkurl'];?>image/img_upload.gif" width="12" height="12" title="上传"/></span>
	</td>
	</tr>
	<tr align="center" title="<?php echo $v['introduce'];?>">
	<td><textarea name="post[<?php echo $v['itemid'];?>][introduce]" style="width:90px;height:40px;" onfocus="if(this.value=='简介：')this.value='';"><?php echo $v['introduce'];?></textarea></td>
	</tr>
	<tr align="center" title="排序">
	<td><input type="text" size="3" name="post[<?php echo $v['itemid'];?>][listorder]" value="<?php echo $v['listorder'];?>"/></td>
	</tr>
	</table>
</div>
<?php } ?>
<?php if($items < $MOD['maxitem']) { ?>
<div style="width:130px;float:left;">
	<input type="hidden" name="post[0][thumb]" id="thumb0"/>
	<table width="120">
	<tr align="center" height="110" class="c_p">
	<td width="120"><img src="<?php echo DT_SKIN?>image/waitpic.gif" id="showthumb0" title="预览图片" alt="" onclick="if(this.src.indexOf('waitpic.gif') == -1){_preview(this.src, 1);}else{Dphoto(0,<?php echo $moduleid;?>,100,100, Dd('thumb0').value, true);}"/></td>
	</tr>
	<tr align="center">
	<td height="20">
	<span onclick="Dphoto(0,<?php echo $moduleid;?>,100,100, Dd('thumb0').value, true);" class="jt"><img src="<?php echo $MODULE[2]['linkurl'];?>image/img_upload.gif" width="12" height="12" title="上传"/></span>
	</td>
	</tr>
	<tr align="center" title="简介">
	<td><textarea name="post[0][introduce]" style="width:90px;height:40px;" onfocus="if(this.value=='简介：')this.value='';">简介：</textarea></td>
	</tr>
	<tr align="center" title="排序">
	<td><input type="text" size="3" name="post[0][listorder]" value="0"/></td>
	</tr>
	</table>
</div>
<?php } ?>
</td>
</tr>
</table>
<div class="sbt"><input type="submit" value=" 更 新 " class="btn"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value=" 预 览 " class="btn" onclick="window.open('<?php echo $MOD['linkurl'].$item['linkurl'];?>');"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value=" 图 集 " class="btn" onclick="window.location='?moduleid=<?php echo $moduleid;?>&action=edit&itemid=<?php echo $itemid;?>&forward=<?php echo urlencode($DT_URL);?>';"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value=" 返 回 " class="btn" onclick="window.location='?moduleid=<?php echo $moduleid;?>';"/>&nbsp;&nbsp;&nbsp;&nbsp;<span class="f_gray">提示：选中图片在点击更新按钮之后将被删除</span></div>
</form>
<div class="pages"><?php echo $pages;?></div>
<?php load('clear.js'); ?>
<div class="tt">方法二、批量上传图片</div>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td class="tl">批量上传</td> 
<td>
<link href="<?php echo DT_PATH;?>file/swfupload/style.css" rel="stylesheet" type="text/css"/>
<form>
	<div class="swfuploadbtn">
		<span id="spanButtonPlaceholder"></span>
	</div>
</form>
<div id="divFileProgressContainer"></div>
<div id="thumbnails"></div>
<script type="text/javascript" src="<?php echo DT_PATH;?>file/swfupload/swfupload.js"></script>
<script type="text/javascript">var swfu_max = 0;</script>
<script type="text/javascript" src="<?php echo DT_PATH;?>file/swfupload/handlers_photo.js"></script>
<script type="text/javascript">
	var swfu;
	//window.onload = function () {
		swfu = new SWFUpload({
			// Backend Settings
			upload_url: "<?php echo DT_PATH;?>upload.php",
			post_params: {"from": "photo", "width": "100", "height": "100", "swf_userid": "<?php echo $_userid;?>", "swf_username": "<?php echo $_username;?>", "swf_groupid": "<?php echo $_groupid;?>", "swf_auth": "<?php echo md5($_userid.$_username.$_groupid.DT_KEY.$DT_IP);?>", "swfupload": "1"},

			// File Upload Settings
			file_size_limit : "32 MB",	// 32MB
			file_types : "*.jpg;*.gif;*.png",
			file_types_description : "Images",
			file_upload_limit : swfu_max,

			// Event Handler Settings - these functions as defined in Handlers.js
			//  The handlers are not part of SWFUpload but are part of my website and control how
			//  my website reacts to the SWFUpload events.
			file_queue_error_handler : fileQueueError,
			file_dialog_complete_handler : fileDialogComplete,
			upload_progress_handler : uploadProgress,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccess,
			upload_complete_handler : uploadComplete,

			// Button Settings
			button_image_url : "<?php echo DT_PATH;?>file/swfupload/ico.png",
			button_placeholder_id : "spanButtonPlaceholder",
			button_width: 180,
			button_height: 18,
			button_text : '<span class="button">点击批量上传图片</span>',
			button_text_style : '.button { font-family: Helvetica, Arial, sans-serif; font-size: 12pt; } .buttonSmall { font-size: 10pt; }',
			button_text_top_padding: 0,
			button_text_left_padding: 18,
			button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
			button_cursor: SWFUpload.CURSOR.HAND,
			
			// Flash Settings
			flash_url : "<?php echo DT_PATH;?>file/swfupload/swfupload.swf",

			custom_settings : {
				upload_target : "divFileProgressContainer"
			},
			
			// Debug Settings
			debug: false
		});
	//};
</script>
</td>
</tr>
<tr>
<td class="tl">提示信息</td>
<td class="f_gray">&nbsp;点击批量上传图片按钮，按Ctrl键或拖动鼠标框选多个图片</td>
</tr>
</table>
<div class="tt">方法三、上传zip压缩文件</div>
<form method="post" action="?" enctype="multipart/form-data">
<input type="hidden" name="moduleid" value="<?php echo $moduleid;?>"/>
<input type="hidden" name="action" value="zip"/>
<input type="hidden" name="itemid" value="<?php echo $itemid;?>"/>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td class="tl">选择文件</td>
<td>
&nbsp;<input name="uploadfile" type="file" size="25"/>&nbsp;&nbsp;
<input type="submit" value=" 上 传 " class="btn"/>
</td>
</tr>
<tr>
<td class="tl">提示信息</td>
<td class="f_gray">&nbsp;如果同时上传多张图片，可以将图片压缩为zip格式上传，目录结构不限</td>
</tr>
</table>
</form>
<div class="tt">方法四、FTP上传目录或者zip压缩包</div>
<form method="post" action="?">
<input type="hidden" name="moduleid" value="<?php echo $moduleid;?>"/>
<input type="hidden" name="action" value="dir"/>
<input type="hidden" name="itemid" value="<?php echo $itemid;?>"/>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td class="tl">请选择</td>
<td>
&nbsp;<select name="name">
<option>请选择目录或者zip文件</option>
<?php
foreach(glob(DT_ROOT.'/file/temp/*') as $v) {
	if(is_dir($v)) {
		$v = basename($v);
		echo '<option value="'.$v.'">/'.$v.'/</option>';
	} else if(file_ext($v) == 'zip') {
		$v = basename($v);		
		echo '<option value="'.$v.'">/'.$v.'</option>';
	}
}
?>
</select>
&nbsp;
<input type="button" value=" 刷 新 " class="btn" onclick="window.location.reload();"/>&nbsp;&nbsp;
<input type="submit" value=" 读 取 " class="btn"/>
</td>
</tr>
<tr>
<td class="tl">提示信息</td>
<td class="f_gray">&nbsp;可以创建目录存放图片，并FTP上传目录至 file/temp/ 目录，或者直接打包为zip格式上传至 file/temp/ 目录</td>
</tr>
</table>
</form>
<script type="text/javascript">Menuon(<?php echo $menuid;?>);</script>
<?php include tpl('footer');?>