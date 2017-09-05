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
	$("#keywords").formValidator({onshow:"必填,英文逗号分隔",onfocus:"请输入关键字"}).inputValidator({min:1,onerror:"不能为空"});
	$("#jianjie").formValidator({onshow:"必填",onfocus:"请输入简介"}).inputValidator({min:1,onerror:"不能为空"});
});
//-->
</script>
<form name="myform" id="myform" action="index.php?m=gyzb&c=gyzb_fb&a=contactus" method="post" enctype="multipart/form-data">
<fieldset>
	<legend>联系我们</legend>
<table class="table_form" width=100%>

    <tr>
        <td><span style="color:#f00;">*</span> 名称</td>
        <td><input type="text" style="width:600px;" name="info[title]" id="title" value="<?php echo $res['title']?>" class="measure-input "/></td>
    </tr>
    
    <tr>
    	<td>图片</td>
        <td>
        	<a class="btn" id="btn">上传图片</a> 1160px * 334px,最大800kb，支持jpg，gif，png格式。
			<ul id="ul_pics" class="ul_pics clearfix">
            	<?php if(!empty($res['pic'])){?>
            	<li class="photo">
                <img src="<?php echo $res['pic']?>">
                <div>
                <a class="delImg" imgurl="<?php echo $res['pic']?>">删除</a>
                </div>
                <input name="info[pic]" value="<?php echo $res['pic']?>" type="hidden">
                </li>
                <?php }?>
        	</ul>
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
	<center>
    <input type="submit" name="dosubmit" value="保存" class="button" style="width:100px; height:35px; cursor:pointer;">
    </center>
</form>
</div>
</div>
<script type="text/javascript" src="<?php echo JS_PATH?>plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH?>plupload/i18n/zh_CN.js"></script>
<script type="text/javascript">
	var uploader = new plupload.Uploader({//创建实例的构造方法
		runtimes: 'html5,flash,silverlight,html4', //上传插件初始化选用那种方式的优先级顺序
		browse_button: 'btn', // 上传按钮
		url: "index.php?m=uploads&c=uploads&a=index", //远程上传地址
		flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
		silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
		filters: {
			max_file_size: '800kb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
			mime_types: [//允许文件上传类型
				{title: "files", extensions: "jpg,png,gif"}
			]
		},
		multi_selection: false, //true:ctrl多文件上传, false 单文件上传
		init: {
			FilesAdded: function(up, files) { //文件上传前
				if ($("#ul_pics").children("li").length >1) {
					alert("您上传的图片太多了！");
					uploader.destroy();
				} else {
					var li = '';
					plupload.each(files, function(file) { //遍历文件
						li += "<li class='photo' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></li>";
					});
					$("#ul_pics").html(li);
					uploader.start();
				}
			},
			UploadProgress: function(up, file) { //上传中，显示进度条
				$("#" + file.id).find('.bar').css({"width": file.percent + "%"}).find(".percent").text(file.percent + "%");
			},
			FileUploaded: function(up, file, info) { //文件上传成功的时候触发
				var data = JSON.parse(info.response);
				$("#" + file.id).html("<img src='" + data.pic + "'/><div><a class='delImg' imgurl='"+data.pic+"'>删除</a></div><input type='hidden' name='info[pic]' value='"+data.pic+"'>");
			},
			Error: function(up, err) { //上传出错的时候触发
				alert(err.message);
			}
		}
	});
	uploader.init();
	//删除图片
	var delUrl = "index.php?m=uploads&c=uploads&a=delimg";
    $('#ul_pics').on("click",'.delImg',function(){
        var delImgUrl = $(this).attr('imgurl');
        var delDiv = $(this);
        $.post(delUrl,{'imgUrl':delImgUrl},function(data){      //ajax后台
           if(data==1){
			  delDiv.parents('.photo').fadeOut().remove();
		   }
        });        
    });
</script>
</body>
</html>
