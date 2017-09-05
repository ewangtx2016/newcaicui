<?php
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header','admin');?>
<script type="text/javascript">
var charset = '<?php echo CHARSET;?>';
</script>
<style>
/*上传图片*/
.btn{-webkit-border-radius:3px;-moz-border-radius:3px;-ms-border-radius:3px;-o-border-radius:3px;border-radius:3px;background-color: #098ac4;color: #fff;display: inline-block;height: 28px;line-height: 28px;text-align: center;width: 72px;transition: background-color 0.2s linear 0s;border:none;cursor:pointer;margin:0 0 20px;}
.ul_pics li{ float:left;width:160px;height:160px;border:1px solid #ddd;padding:2px;text-align: center;margin:0 5px 5px 0;}
.ul_pics li .img{width: 160px;height: 140px;display: table-cell;vertical-align: middle;}
.ul_pics li img{max-width: 160px;max-height: 140px;vertical-align: middle;}
.ul_pics li div{text-align:center;}
.delImg{cursor:pointer;}
.progress{position:relative;padding: 1px; border-radius:3px; margin:60px 0 0 0;} 
.bar {background-color: green; display:block; width:0%; height:20px; border-radius:3px; } 
.percent{position:absolute; height:20px; display:inline-block;top:3px; left:2%; color:#fff}
/*上传图片 end*/
</style>
<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>formvalidator.js" charset="UTF-8"></script>
<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>formvalidatorregex.js" charset="UTF-8"></script>
<script type="text/javascript">
<!--
$(function(){
	$.formValidator.initConfig({autotip:true,formid:"myform",onerror:function(msg){}});
	$("#company").formValidator({onshow:"必填",onfocus:"请输入所属企业"}).inputValidator({min:1,onerror:"不能为空"});
	$("#position").formValidator({onshow:"必填",onfocus:"请输入职位名称"}).inputValidator({min:1,onerror:"不能为空"});
	$("#money").formValidator({onshow:"必填",onfocus:"请输入薪资"}).inputValidator({min:1,onerror:"不能为空"});
	$("#education").formValidator({onshow:"必填",onfocus:"请输入学历要求"}).inputValidator({min:1,onerror:"不能为空"});
	$("#num").formValidator({onshow:"必填",onfocus:"请输入招聘人数"}).inputValidator({min:1,onerror:"不能为空"});
	$("#worktime").formValidator({onshow:"必填",onfocus:"请输入工作时间"}).inputValidator({min:1,onerror:"不能为空"});
	$("#introduce").formValidator({onshow:"必填",onfocus:"请输入岗位介绍"}).inputValidator({min:1,onerror:"不能为空"});
	$("#requirement").formValidator({onshow:"必填",onfocus:"请输入任职要求"}).inputValidator({min:1,onerror:"不能为空"});
	$("#duty").formValidator({onshow:"必填",onfocus:"请输入岗位职责"}).inputValidator({min:1,onerror:"不能为空"});
	$("#welfare").formValidator({onshow:"必填",onfocus:"请输入职位福利"}).inputValidator({min:1,onerror:"不能为空"});
	$("#address").formValidator({onshow:"必填",onfocus:"请输入工作地点"}).inputValidator({min:1,onerror:"不能为空"});
});
//-->
</script>
<form name="myform" id="myform" action="index.php?m=gyzb&c=gyzb_job&a=edit" method="post" enctype="multipart/form-data">
<fieldset>
	<legend>编辑招聘信息</legend>
<table class="table_form" width=100%>
    <tr>
    	<td width="10%"><span style="color:#f00;">*</span>&nbsp;&nbsp;所属企业</td>
        <td><input type="text" name="info[company]" id='company' value="<?php echo $res['company']?>" size="30"></td>
    </tr>
    <!--<tr>
    	<td><span style="color:#f00;">*</span> 标签</td>
        <td>
            <?php echo menu_linkage(3360,'tag',$res['tag'])?>
        </td>
    </tr>-->
    <tr>
    	<td width="10%"><span style="color:#f00;">*</span>&nbsp;&nbsp;职位名称</td>
        <td><input type="text" name="info[position]" id='position' value="<?php echo $res['position'] ?>" size="30"></td>
    </tr>
    <tr>
    	<td><span style="color:#f00;">*</span>&nbsp;&nbsp;属性</td>
        <td>
        <label><input type="radio" name="info[attribute]" value="0" <?php if($res['attribute']==0){?>checked="checked"<?php }?>>实习</label>&nbsp;&nbsp;&nbsp;
        <label><input type="radio" name="info[attribute]" value="1" <?php if($res['attribute']==1){?>checked="checked"<?php }?>>全职</label>&nbsp;&nbsp;&nbsp;
        <label><input type="radio" name="info[attribute]" value="2" <?php if($res['attribute']==2){?>checked="checked"<?php }?>>兼职</label>
        </td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">*</span>&nbsp;&nbsp;薪资</td>
        <td><input type="text" name="info[money]" id='money' value="<?php echo $res['money'] ?>" size="30"></td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">*</span>&nbsp;&nbsp;学历要求</td>
        <td><input type="text" name="info[education]" id='education' value="<?php echo $res['education'] ?>" size="30"></td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">*</span>&nbsp;&nbsp;招收人数</td>
        <td><input type="text" name="info[num]" id='num' value="<?php echo $res['num'] ?>" size="30"></td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">*</span>&nbsp;&nbsp;工作时间</td>
        <td><input type="text" name="info[worktime]" id='worktime' value="<?php echo $res['worktime'] ?>" size="30"></td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">*</span>&nbsp;&nbsp;工作地点</td>
        <td><?php echo menu_linkage(1,'city',$res['city']);?><input type="text" name="info[address]" id='address' value="<?php echo $res['address'] ?>" size="30"></td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">*</span>&nbsp;&nbsp;招聘有效期</td>
        <td><?php echo form::date('endtime',date('Y-m-d',$res['endtime']))?></td>
    </tr>
    <tr>
    	<td><span style="color:#f00;">*</span>&nbsp;&nbsp;是否留用</td>
        <td>
        <label><input type="radio" name="info[retention]" value="1" <?php if($res['retention']==1){?>checked="checked"<?php }?>>是</label>&nbsp;&nbsp;&nbsp;
        <label><input type="radio" name="info[retention]" value="0" <?php if($res['retention']==0){?>checked="checked"<?php }?>>否</label>
        </td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">&nbsp;</span>&nbsp;&nbsp;岗位介绍</td>
        <td><textarea style="width:600px;height:200px;" name="info[introduce]" id="introduce"><?php echo $res['introduce'] ?></textarea></td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">&nbsp;</span>&nbsp;&nbsp;任职要求</td>
        <td><textarea style="width:600px;height:200px;" name="info[requirement]" id="requirement"><?php echo $res['requirement'] ?></textarea></td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">&nbsp;</span>&nbsp;&nbsp;岗位职责</td>
        <td><textarea style="width:600px;height:200px;" name="info[duty]" id="duty"><?php echo $res['duty'] ?></textarea></td>
    </tr>
    <tr>
    	<td width="10%"><span style="color:#f00;">&nbsp;</span>&nbsp;&nbsp;职位福利</td>
        <td><textarea style="width:600px;height:200px;" name="info[welfare]" id="welfare"><?php echo $res['welfare'] ?></textarea>福利之间用英文逗号分隔;</td>
    </tr>
    <tr>
    	<td><span style="color:#f00;">*</span>&nbsp;&nbsp;是否加急</td>
        <td>
        <label><input type="radio" name="info[hot]" value="1" <?php if($res['hot']==1){?>checked="checked"<?php }?>>是</label>&nbsp;&nbsp;&nbsp;
        <label><input type="radio" name="info[hot]" value="0" <?php if($res['hot']==0){?>checked="checked"<?php }?>>否</label>
        </td>
    </tr>
</table>
</fieldset>
    <div class="bk15"></div>
	<input type="hidden" name="hidden_id" id="hidden_id" value="<?php echo $res['id']?>">
	<center>
    <input type="submit" name="dosubmit" value="保存" class="button" style="width:100px; height:35px; cursor:pointer;">
    <button class="button" onclick="javascript:history.go(-1);return false;" style="width:100px; height:35px;cursor:pointer;">返回</button>
    </center>
</form>
</div>
</div>
</body>
</html>
