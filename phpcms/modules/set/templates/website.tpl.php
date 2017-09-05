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
	$("#title").formValidator({onshow:"必填",onfocus:"请输入名称"}).inputValidator({min:1,onerror:"不能为空"});
	$("#keywords").formValidator({onshow:"必填",onfocus:"请输入关键字"}).inputValidator({min:1,onerror:"不能为空"});
	$("#tel").formValidator({onshow:"必填",onfocus:"请输入导航栏电话"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jianjie").formValidator({onshow:"必填",onfocus:"请输入简介"}).inputValidator({min:1,onerror:"不能为空"});
	$("#address").formValidator({onshow:"必填",onfocus:"请输入站底地址"}).inputValidator({min:1,onerror:"不能为空"});
	$("#email").formValidator({onshow:"必填",onfocus:"请输入站底邮箱"}).inputValidator({min:1,onerror:"不能为空"});
	$("#tel2").formValidator({onshow:"必填",onfocus:"请输入站底电话"}).inputValidator({min:1,onerror:"不能为空"});
	$("#gywm").formValidator({onshow:"必填",onfocus:"请输入站底关于我们"}).inputValidator({min:1,onerror:"不能为空"});
	$("#bottomleft").formValidator({onshow:"必填",onfocus:"请输入站底左侧"}).inputValidator({min:1,onerror:"不能为空"});
	$("#bottomright").formValidator({onshow:"必填",onfocus:"请输入站底右侧"}).inputValidator({min:1,onerror:"不能为空"});
});
//-->
</script>
<form name="myform" id="myform" action="index.php?m=set&c=set&a=website" method="post" enctype="multipart/form-data">
<fieldset>
	<legend>设置</legend>
<table class="table_form" width=100%>
    <tr>
        <td><span style="color:#f00;">*</span> 标题名称</td>
        <td><input type="text" style="width:600px;" name="info[title]" id="title" value="<?php echo $res['title']?>" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 关键字</td>
        <td><input type="text" style="width:600px;" name="info[keywords]" id="keywords" value="<?php echo $res['keywords']?>" /></td>
    </tr>
    <tr>
    	<td><span style="color:#f00;">*</span> 简介</td>
        <td>
        	<textarea name="info[jianjie]" id="jianjie" style="width:600px;height:100px;"><?php echo $res['jianjie']?></textarea>
        </td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 导航栏电话</td>
        <td><input type="text" style="width:600px;" name="info[tel]" id="tel" value="<?php echo $res['tel']?>" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 站底地址</td>
        <td><input type="text" style="width:600px;" name="info[address]" id="address" value="<?php echo $res['address']?>" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 站底邮箱</td>
        <td><input type="text" style="width:600px;" name="info[email]" id="email" value="<?php echo $res['email']?>" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 站底电话</td>
        <td><input type="text" style="width:600px;" name="info[tel2]" id="tel2" value="<?php echo $res['tel2']?>" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 站底关于我们</td>
        <td><textarea name="info[gywm]" id="gywm" style="width:600px;height:100px;"><?php echo $res['gywm']?></textarea></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 站底左侧</td>
        <td><input type="text" style="width:600px;" name="info[bottomleft]" id="bottomleft" value="<?php echo $res['bottomleft']?>" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 站底右侧</td>
        <td><input type="text" style="width:600px;" name="info[bottomright]" id="bottomright" value="<?php echo $res['bottomright']?>" /></td>
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
