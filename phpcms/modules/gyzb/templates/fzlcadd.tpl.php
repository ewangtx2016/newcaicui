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
	$("#title").formValidator({onshow: "必填",onfocus: "请输入名称"}).inputValidator({min:1,max:88,onerror:"不能超过88个字"}).ajaxValidator({
		type : "get",
		url : "",
		data :"m=gyzb&c=gyzb_fzlc&a=get_title&hiddenid="+$('#hidden_id').val(),
		datatype : "html",
		async:'false',
		success : function(data){
			if(data == '1') {
				
				return true;
			} 
			else {
				
				return false;
			}
		},
		buttons: $("#dosubmit"),
		onerror : "名称已经存在",
		onwait : "请等待"
	});
	$("#paixu").formValidator({onshow:"必填",onfocus:"请输入排序"}).regexValidator({regexp:"num",datatype:"enum",onerror:"请正确输入排序"});
});
//-->
</script>
<div class="pad-10">
<div class="common-form">
<form name="myform" id="myform" action="index.php?m=gyzb&c=gyzb_fzlc&a=add" method="post" enctype="multipart/form-data">
<fieldset>
	<legend>添加发展历程</legend>
<table class="table_form" width=100%>

    <tr>
        <td><span style="color:#f00;">*</span> 名称</td>
        <td><input type="text" style="width:600px;" name="info[title]" id="title" value="" class="measure-input "/></td>
    </tr>
   
    
    <tr>
        <td><span style="color:#f00;">*</span> 排序</td>
        <td><input type="text" style="width:600px;" name="info[paixu]" id="paixu" value="0" /></td>
    </tr>
    
    <tr>
        <td colspan="2">
			<?PHP pc_base::load_sys_class('form','',0);?>
            <textarea name="info[content]" id="content"></textarea>
            <?php echo form::editor('content','full','info','','',1);?>
        </td>
	</tr>
</table>
</fieldset>
    <div class="bk15"></div>
	<input type="hidden" name="hidden_id" id="hidden_id" value="0">
	<center>
    	<input type="submit" name="dosubmit" value="保存" class="button" style="width:100px; height:35px;cursor:pointer;">
    </center>
</form>
</div>
</div>
</body>
</html>
