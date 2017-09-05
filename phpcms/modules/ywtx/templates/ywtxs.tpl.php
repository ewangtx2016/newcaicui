s<?php
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
	$("#title").formValidator({onshow:"必填",onfocus:"请输入网页标题"}).inputValidator({min:1,onerror:"不能为空"});
	$("#keywords").formValidator({onshow:"必填",onfocus:"请输入关键字"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jianjie").formValidator({onshow:"必填",onfocus:"请输入简介"}).inputValidator({min:1,onerror:"不能为空"});
	$("#one").formValidator({onshow:"必填",onfocus:"请输入名称"}).inputValidator({min:1,onerror:"不能为空"});
	$("#english").formValidator({onshow:"必填",onfocus:"请输入英文"}).inputValidator({min:1,onerror:"不能为空"});
});
//-->
</script>
<form name="myform" id="myform" action="index.php?m=ywtx&c=ywtx&a=ywtx" method="post" enctype="multipart/form-data">
<fieldset>
	<legend>招聘信息</legend>
<table class="table_form" width=100%>
    <tr>
        <td><span style="color:#f00;">*</span> 网页标题</td>
        <td><input type="text" style="width:600px;" name="info[title]" id="title" value="<?php echo $res['title']?>" class="measure-input "/></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> SEO关键字</td>
        <td><input type="text" style="width:600px;" name="info[keywords]" id="keywords" value="<?php echo $res['keywords']?>" /></td>
    </tr>
    <tr>
    	<td><span style="color:#f00;">*</span> SEO简介</td>
        <td>
        	<textarea name="info[jianjie]" id="jianjie" style="width:600px;height:100px;"><?php echo $res['jianjie']?></textarea>
        </td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 名称</td>
        <td><input type="text" style="width:600px;" name="info[one]" id="one" value="<?php echo $res['one']?>" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 英文</td>
        <td><input type="text" style="width:600px;" name="info[english]" id="english" value="<?php echo $res['english']?>" /></td>
    </tr>    
    <tr>
    	<td colspan="2">
			<?PHP pc_base::load_sys_class('form','',0);?>
            <textarea name="info[content]" id="content"><?php echo $res['content']?></textarea>
            <?php echo form::editor('content','full','info','','',1);?>
        </td>
	</tr>
	<tr>
        <td><span style="color:#f00;">*</span> 全图</td>
        <td><img src="<?php echo cutimg($res['pic'],100,100,5) ?>"><input type="hidden" name="pic_hidden" value="<?php echo $res['pic']?>"><input type="file" name="pic" id="pic" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 角度1</td>
        <td><img src="<?php echo cutimg($res['pic2'],100,100,5) ?>"><input type="hidden" name="pic2_hidden" value="<?php echo $res['pic2']?>"><input type="file" name="pic2" id="pic2" /></td>
    </tr> 
    <tr>
        <td><span style="color:#f00;">*</span> 角度2</td>
        <td><img src="<?php echo cutimg($res['pic3'],100,100,5) ?>"><input type="hidden" name="pic3_hidden" value="<?php echo $res['pic3']?>"><input type="file" name="pic3" id="pic3" /></td>
    </tr> 
    <tr>
        <td><span style="color:#f00;">*</span> 角度3</td>
        <td><img src="<?php echo cutimg($res['pic4'],100,100,5) ?>"><input type="hidden" name="pic4_hidden" value="<?php echo $res['pic4']?>"><input type="file" name="pic4" id="pic4" /></td>
    </tr> 
    <tr>
        <td><span style="color:#f00;">*</span> 角度4</td>
        <td><img src="<?php echo cutimg($res['pic5'],100,100,5) ?>"><input type="hidden" name="pic5_hidden" value="<?php echo $res['pic5']?>"><input type="file" name="pic5" id="pic5" /></td>
    </tr> 
    <tr>
        <td><span style="color:#f00;">*</span> 角度5</td>
        <td><img src="<?php echo cutimg($res['pic6'],100,100,5) ?>"><input type="hidden" name="pic6_hidden" value="<?php echo $res['pic6']?>"><input type="file" name="pic6" id="pic6" /></td>
    </tr> 
    <tr>
        <td><span style="color:#f00;">*</span> 角度6</td>
        <td><img src="<?php echo cutimg($res['pic7'],100,100,5) ?>"><input type="hidden" name="pic7_hidden" value="<?php echo $res['pic7']?>"><input type="file" name="pic7" id="pic7" /></td>
    </tr> 
    <tr>
        <td><span style="color:#f00;">*</span> 角度7</td>
        <td><img src="<?php echo cutimg($res['pic8'],100,100,5) ?>"><input type="hidden" name="pic8_hidden" value="<?php echo $res['pic8']?>"><input type="file" name="pic8" id="pic8" /></td>
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
