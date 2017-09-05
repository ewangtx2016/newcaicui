<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="format-detection" content="telephone=no, email=no" />
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="shortcut icon" href="/favicon.ico" />
<title><?php echo $lxwmm['title'];?></title>
<meta name="Keywords" content="<?php echo $lxwmm['keywords'];?>" />
<meta name="Description" content="<?php echo $lxwmm['jianjie'];?>" />
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/css.css" />
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jt_head.js"></script>
<script src="<?php echo JS_PATH;?>zb/ui-select.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/z_css.css" />
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/ui-select.css">
<script>
$(function(){   
    $('.ui-select').chosen();
});
$(function(){
	$('#citycontactus').change(function(){
  		$('#form').submit();
	})
})
</script>
</head>

<body style="background: #f2f5fa;">
<?php include template("content","header"); ?>
<div class="l_head_87" style="background-image:url(<?php echo $create['pic'];?>);">
  <div class="jtz_txt">
    <h2><?php echo $create['one'];?></h2>
    <span><?php echo $create['english'];?></span> <i></i> </div>
</div>
<div class="wrap">
  <div class="jtz_lxwm">
    <div class="part1">
      <div class="con cf">
        <div class="l"><img src="<?php echo IMG_PATH;?>zb/jtz_img7.jpg"/></div>
        <div class="r"> <?php echo $lxwmm['content'];?> </div>
      </div>
      <div class="map"><img src="<?php echo cutimg($lxwmm['pic'],1160,334,5);?>"/></div>
    </div>
    <div class="part2">
      <div class="txt cf">
        <div class="l">
          <h2>分部地址</h2>
          <span>中博诚通有遍及全国的49家分部，桃李满天下</span></div>
        <div class="r">
         <form action="/contactus.html" id="form">
          <select name="citycontactus" id="citycontactus" class="ui-select">
            <option value="选择城市">选择城市</option>
            <?php echo citylist($citycontactus);?>
          </select>
			</form>
        </div>
      </div>
      <ul class="ul cf">
       <?php $n=1;if(is_array($joblist)) foreach($joblist AS $arr) { ?>
        <li>
          <dl>
            <dt><?php echo $arr['title'];?></dt>
            <dd> <span class="p1"><?php echo $arr['tel'];?></span> <span class="p2"><?php echo $arr['fax'];?></span> <span class="p3"><?php echo $arr['email'];?></span> <span class="p4"><?php echo $arr['address'];?></span> </dd>
          </dl>
        </li><?php $n++;}unset($n); ?>
      </ul>
      <!--<div class="jtz_page">
        <ul>
          <li class="li"><a href="#">上一页</a></li>
          <li><a href="#" class="one">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">...</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
          <li class="li"><a href="#">上一页</a></li>
        </ul>
      </div>-->
		<div id="pages"><?php echo $pages;?></div>
    </div>
  </div>
</div>
<?php include template("content","footer"); ?>
</body>
</html>
