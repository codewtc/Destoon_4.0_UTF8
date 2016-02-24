<?php
defined('IN_DESTOON') or exit('Access Denied');
include tpl('header');
show_menu($menus);
?>
<form action="?">
<div class="tt">对话搜索</div>
<input type="hidden" name="moduleid" value="<?php echo $moduleid;?>"/>
<input type="hidden" name="file" value="<?php echo $file;?>"/>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td>&nbsp;
<?php echo $fields_select;?>&nbsp;
<input type="text" size="30" name="kw" value="<?php echo $kw;?>" title="关键词"/>&nbsp;
<select name="status">
<option value="-1"<?php if($status==-1) echo ' selected';?>>状态</option>
<option value="0"<?php if($status==0) echo ' selected';?>>对方已经挂断</option>
<option value="1"<?php if($status==1) echo ' selected';?>>拒绝对话请求</option>
<option value="2"<?php if($status==2) echo ' selected';?>>等待接受对话</option>
<option value="3"<?php if($status==3) echo ' selected';?>>正在对话中</option>
<option value="4"<?php if($status==4) echo ' selected';?>>超时自动断开</option>
</select>&nbsp;
<?php echo $order_select;?>
&nbsp;
<input type="text" name="psize" value="<?php echo $pagesize;?>" size="2" class="t_c" title="条/页"/>
<input type="submit" value="搜 索" class="btn"/>&nbsp;
<input type="button" value="重 置" class="btn" onclick="window.location='?moduleid=<?php echo $moduleid;?>&file=<?php echo $file;?>';"/>
</td>
</tr>
</table>
</form>
<div class="tt">在线对话</div>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<th>发起人</th>
<th>接收人</th>
<th>状态</th>
<th>开始时间</th>
<th width="40">来源</th>
<th width="40">操作</th>
</tr>
<?php foreach($lists as $k=>$v) {?>
<tr onmouseover="this.className='on';" onmouseout="this.className='';" align="center">
<td>
<?php if(check_name($v['fromuser'])) { ?>
<a href="javascript:_user('<?php echo $v['fromuser'];?>')"><?php echo $v['fromuser'];?></a>
<?php } else { ?>
<a href="javascript:_ip('<?php echo $v['fromuser'];?>')" title="IP:<?php echo $v['fromuser'];?> - <?php echo ip2area($v['fromuser']);?>"><span class="f_gray">游客</span></a>
<?php } ?>
</td>
<td><a href="javascript:_user('<?php echo $v['touser'];?>')"><?php echo $v['touser'];?></a></td>
<td><?php echo $S[$v['status']];?></td>
<td><?php echo $v['addtime'];?></td>
<td>
<?php if($v['forward']) { ?>
<a href="<?php echo $v['forward'];?>" target="_blank"><img src="admin/image/view.png" width="16" height="16" title="点击查看" alt=""/></a>
<?php } else { ?>
&nbsp;
<?php } ?>
</td>
<td>
<a href="?moduleid=<?php echo $moduleid;?>&file=<?php echo $file;?>&action=delete&chatid=<?php echo $v['chatid'];?>" onclick="return _delete();"><img src="admin/image/delete.png" width="16" height="16" title="删除" alt=""/></a>
</td>
</tr>
<?php }?>
</table>
<div class="pages"><?php echo $pages;?></div>
<br/>
<script type="text/javascript">Menuon(0);</script>
<?php include tpl('footer');?>