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
	$("#title").formValidator({onshow:"必填",onfocus:"请输入新闻标题"}).inputValidator({min:1,onerror:"不能为空"});
	$("#keywords").formValidator({onshow:"必填,英文逗号分隔",onfocus:"请输入关键字"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jianjie").formValidator({onshow:"必填",onfocus:"请输入简介"}).inputValidator({min:1,onerror:"不能为空"});
});
//-->
</script>
<form name="myform" id="myform" action="index.php?m=shzr&c=xwzx_gy&a=edit" method="post" enctype="multipart/form-data">
<fieldset>
	<legend>编辑社会公益</legend>
<table class="table_form" width=100%>
    <tr>
        <td><span style="color:#f00;">*</span> 新闻标题</td>
        <td><input type="text" style="width:600px;" name="info[title]" id="title" value="<?php echo $res['title']?>" class="measure-input "/></td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 图片</td>
        <td><img src="<?php echo cutimg($res['pic'],110,100,3) ?>"><input type="hidden" name="pic_hidden" value="<?php echo $res['pic']?>"><input type="file" name="pic" id="pic" />380px * 158px，支持jpg，gif，png格式。</td>
    </tr>
    <tr>
        <td><span style="color:#f00;">*</span> 推荐图片</td>
        <td><img src="<?php echo cutimg($res['pic2'],110,100,3) ?>"><input type="hidden" name="pic2_hidden" value="<?php echo $res['pic2']?>"><input type="file" name="pic2" id="pic2" />792px * 513px，支持jpg，gif，png格式。</td>
    </tr> 
    <tr>
    	<td> 是否推荐</td>
        <td>
        <label><input type="radio" name="info[tui]" value="1" <?php echo $res['tui']=="1"?"checked='checked'":""?>>是</label>&nbsp;&nbsp;&nbsp;
        <label><input type="radio" name="info[tui]" value="0" <?php echo $res['tui']=="0"?"checked='checked'":""?>>否</label>
        </td>
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
    <!--<tr>
        <td><span style="color:#f00;">*</span> 阅读次数</td>
        <td><input type="text" style="width:600px;" name="info[hits]" id="hits" value="<?php echo $res['hits']?>" /></td>
    </tr>-->
    <tr>
    	<td> 摘要</td>
        <td>
        	<textarea name="info[summer]" id="summer" style="width:600px;height:100px;" onkeyup="strlen_verify(this, 'summer_len', 600)"><?php echo $res['summer']?></textarea>还可输入<B><span id="summer_len">600</span></B> 个字符
        </td>
    </tr>
    <tr>
    	<td colspan="2">
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
<script>	
function strlen_verify(obj, checklen, maxlen) {
	var v = obj.value, charlen = 0, maxlen = !maxlen ? 200 : maxlen, curlen = maxlen, len = strlen(v);
	for(var i = 0; i < v.length; i++) {
		if(v.charCodeAt(i) < 0 || v.charCodeAt(i) > 255) {
			curlen -= charset == 'utf-8' ? 2 : 1;
		}
	}
	if(curlen >= len) {
		$('#'+checklen).html(curlen - len);
	} else {
		obj.value = mb_cutstr(v, maxlen, true);
	}
}
function mb_cutstr(str, maxlen, dot) {
	var len = 0;
	var ret = '';
	var dot = !dot ? '...' : '';
	maxlen = maxlen - dot.length;
	for(var i = 0; i < str.length; i++) {
		len += str.charCodeAt(i) < 0 || str.charCodeAt(i) > 255 ? (charset == 'utf-8' ? 3 : 2) : 1;
		if(len > maxlen) {
			ret += dot;
			break;
		}
		ret += str.substr(i, 1);
	}
	return ret;
}
function strlen(str) {
	return ($.browser.msie && str.indexOf('\n') != -1) ? str.replace(/\r?\n/g, '_').length : str.length;
}
</script>
</body>
</html>
