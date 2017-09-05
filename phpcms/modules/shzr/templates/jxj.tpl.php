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
	$("#title").formValidator({onshow:"必填",onfocus:"请输入标题"}).inputValidator({min:1,onerror:"不能为空"});
	$("#keywords").formValidator({onshow:"必填",onfocus:"请输入关键字"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jianjie").formValidator({onshow:"必填",onfocus:"请输入简介"}).inputValidator({min:1,onerror:"不能为空"});
	$("#one").formValidator({onshow:"必填",onfocus:"请输入内容标题"}).inputValidator({min:1,onerror:"不能为空"});
	$("#content").formValidator({onshow:"必填",onfocus:"请输入内容"}).inputValidator({min:1,onerror:"不能为空"});
	$("#first").formValidator({onshow:"必填",onfocus:"请输入下左"}).inputValidator({min:1,onerror:"不能为空"});
	$("#second").formValidator({onshow:"必填",onfocus:"请输入下右"}).inputValidator({min:1,onerror:"不能为空"});
});
//-->
</script>
<form name="myform" id="myform" action="index.php?m=shzr&c=xwzx_gy&a=jxj" method="post" enctype="multipart/form-data">
<fieldset>
	<legend>奖学金</legend>
<table class="table_form" width=100%>
    <tr>
        <td><span style="color:#f00;">*</span> 标题</td>
        <td><input type="text" style="width:600px;" name="info[title]" id="title" value="<?php echo $res['title']?>" class="measure-input "/></td>
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
        <td><span style="color:#f00;">*</span> 内容标题</td>
        <td><input type="text" style="width:600px;" name="info[one]" id="one" value="<?php echo $res['one']?>" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 内容</td>
    	<td>
			<?PHP pc_base::load_sys_class('form','',0);?>
            <textarea name="info[content]" id="content"><?php echo $res['content']?></textarea>
            <?php echo form::editor('content','full','info','','',1);?>
        </td>
	</tr>
	<tr>
   	    <td><span style="color:#f00;">*</span> 下左</td>
    	<td>
			<?PHP pc_base::load_sys_class('form','',0);?>
            <textarea name="info[first]" id="first"><?php echo $res['first']?></textarea>
            <?php echo form::editor('first','full','info','','',1);?>
        </td>
	</tr>
	<tr>
   	    <td><span style="color:#f00;">*</span> 下右</td>
    	<td>
			<?PHP pc_base::load_sys_class('form','',0);?>
            <textarea name="info[second]" id="second"><?php echo $res['second']?></textarea>
            <?php echo form::editor('second','full','info','','',1);?>
        </td>
	</tr>
</table>
</fieldset>
    <div class="bk15"></div>
	<center>
    <input type="submit" name="dosubmit" value="保存" class="button" style="width:100px; height:35px; cursor:pointer;">
    </center>
</form>
</div>
</div>
</body>
</html>
