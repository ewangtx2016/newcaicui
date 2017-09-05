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
	$("#keywords").formValidator({onshow:"必填,英文逗号分隔",onfocus:"请输入关键字"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jianjie").formValidator({onshow:"必填",onfocus:"请输入简介"}).inputValidator({min:1,onerror:"不能为空"});
	$("#ren").formValidator({onshow:"必填",onfocus:"请输入中文名"}).inputValidator({min:1,onerror:"不能为空"});
	$("#english").formValidator({onshow:"必填",onfocus:"请输入英文名"}).inputValidator({min:1,onerror:"不能为空"});
	$("#summer").formValidator({onshow:"必填",onfocus:"请输入摘要"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jszl").formValidator({onshow:"必填",onfocus:"请输入教师资历"}).inputValidator({min:1,onerror:"不能为空"});
	$("#zjkm").formValidator({onshow:"必填",onfocus:"请输入主讲科目"}).inputValidator({min:1,onerror:"不能为空"});
	$("#cysj").formValidator({onshow:"必填",onfocus:"请输入从业时间"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jsgy").formValidator({onshow:"必填",onfocus:"请输入讲师格言"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jsjj").formValidator({onshow:"必填",onfocus:"请输入教师简介"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jybj").formValidator({onshow:"必填",onfocus:"请输入教育背景"}).inputValidator({min:1,onerror:"不能为空"});
	$("#gzjl").formValidator({onshow:"必填",onfocus:"请输入工作经历"}).inputValidator({min:1,onerror:"不能为空"});
	$("#content").formValidator({onshow:"必填",onfocus:"请输入教学理念和风格"}).inputValidator({min:1,onerror:"不能为空"});
	$("#paixu").formValidator({onshow:"必填",onfocus:"请输入排序"}).regexValidator({regexp:"num",datatype:"enum",onerror:"请正确输入排序"});
});
//-->
</script>
<form name="myform" id="myform" action="index.php?m=gyzb&c=gyzb_sztd&a=edit" method="post" enctype="multipart/form-data">
<fieldset>
	<legend>编辑师资团队</legend>
<table class="table_form" width=100%>
<tr>
        <td><span style="color:#f00;">*</span> 标题</td>
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
        <td><span style="color:#f00;">*</span> 图片1</td>
        <td><img src="<?php echo cutimg($res['pic'],100,100,5) ?>"><input type="hidden" name="pic_hidden" value="<?php echo $res['pic']?>"><input type="file" name="pic" id="pic" />380px * 353px</td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 图片2</td>
        <td><img src="<?php echo cutimg($res['pic2'],100,100,5) ?>"><input type="hidden" name="pic2_hidden" value="<?php echo $res['pic2']?>"><input type="file" name="pic2" id="pic2" />1134px * 436px</td>
    </tr> 
    <tr>
        <td><span style="color:#f00;">*</span> 排序</td>
        <td><input type="text" style="width:600px;" name="info[paixu]" id="paixu" value="<?php echo $res['paixu']?>" /></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 中文名</td>
        <td><input type="text" style="width:600px;" name="info[ren]" id="ren" value="<?php echo $res['ren']?>" /></td>
	</tr>
   <tr>
        <td><span style="color:#f00;">*</span> 英文名</td>
        <td><input type="text" style="width:600px;" name="info[english]" id="english" value="<?php echo $res['english']?>" /></td>
	</tr>
   <tr>
        <td><span style="color:#f00;">*</span> 摘要</td>
        <td><textarea name="info[summer]" id="summer" style="width:600px;height:100px;"><?php echo $res['summer']?></textarea></td>
	</tr>
   <tr>
        <td><span style="color:#f00;">*</span> 教师资历</td>
        <td><input type="text" style="width:600px;" name="info[jszl]" id="jszl" value="<?php echo $res['jszl']?>" /></td>
	</tr>
   <tr>
        <td><span style="color:#f00;">*</span> 主讲科目</td>
        <td><input type="text" style="width:600px;" name="info[zjkm]" id="zjkm" value="<?php echo $res['zjkm']?>" /></td>
	</tr>
   <tr>
        <td><span style="color:#f00;">*</span> 从业时间</td>
        <td><input type="text" style="width:600px;" name="info[cysj]" id="cysj" value="<?php echo $res['cysj']?>" /></td>
	</tr>
   <tr>
        <td><span style="color:#f00;">*</span> 讲师格言</td>
        <td><input type="text" style="width:600px;" name="info[jsgy]" id="jsgy" value="<?php echo $res['jsgy']?>" /></td>
	</tr>
	<tr>
       <td><span style="color:#f00;">*</span> 教师简介</td>
        <td>
			<?PHP pc_base::load_sys_class('form','',0);?>
            <textarea name="info[jsjj]" id="jsjj"><?php echo $res['jsjj']?></textarea>
            <?php echo form::editor('jsjj','full','info','','',1);?>
        </td>
	</tr>
	<tr>
       <td><span style="color:#f00;">*</span> 教育背景</td>
        <td>
			<?PHP pc_base::load_sys_class('form','',0);?>
            <textarea name="info[jybj]" id="jybj"><?php echo $res['jybj']?></textarea>
            <?php echo form::editor('jybj','full','info','','',1);?>
        </td>
	</tr>
	<tr>
       <td><span style="color:#f00;">*</span> 工作经历</td>
        <td>
			<?PHP pc_base::load_sys_class('form','',0);?>
            <textarea name="info[gzjl]" id="gzjl"><?php echo $res['gzjl']?></textarea>
            <?php echo form::editor('gzjl','full','info','','',1);?>
        </td>
	</tr>
	<tr>
       <td><span style="color:#f00;">*</span> 教学理念和风格</td>
        <td>
			<?PHP pc_base::load_sys_class('form','',0);?>
            <textarea name="info[content]" id="content"><?php echo $res['content']?></textarea>
            <?php echo form::editor('content','full','info','','',1);?>
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
