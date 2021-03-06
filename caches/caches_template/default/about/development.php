<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="format-detection" content="telephone=no, email=no" />
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="shortcut icon" href="/favicon.ico" />
<title><?php echo $create['title'];?></title>
<meta name="Keywords" content="<?php echo $create['keywords'];?>" />
<meta name="Description" content="<?php echo $create['jianjie'];?>" />
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/css.css" />
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jt_head.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/idangerous.swiper.min.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/idangerous.swiper.css" />
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/fonts.css" />
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/z_css.css" />
<script>
$(function(){
	var mySwiper = new Swiper('.jtz_fz',{
		slidesPerView:6,
		slidesPerGroup:6,
		onSlideChangeEnd:function(){
			oText()
		}
	});
	  $('.arrow-left').on('click', function(e){
		e.preventDefault()
		mySwiper.swipePrev()
	  })
	  $('.arrow-right').on('click', function(e){
		e.preventDefault()
		mySwiper.swipeNext()
	  })
	  function oText(){
		  var oText1= $('.swiper-slide-visible').eq(0).find(".txt").text()
		  var oText2= $('.swiper-slide-visible').eq($('.swiper-slide-visible').length-1).find(".txt").text()
		  $(".jtz_fz .t_txt").text(oText1 +' - '+ oText2);
	  }
	oText();
});
</script>
</head>
<body>
<?php include template("content","header"); ?>
<div class="l_head_87" style="background-image:url(<?php echo $create['pic'];?>);">
  <div class="jtz_txt">
    <h2><?php echo $create['one'];?></h2>
    <span><?php echo $create['english'];?></span> <i></i> </div>
</div>
<div class="jtz_fz">
  <div class="t_txt">2016 - 2004</div>
  <ul class="swiper-wrapper"><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=55a4a04472d21a4d2d6d851500bdbedf&sql=SELECT+%2A+FROM+%60zb_gyzb_fzlc%60+WHERE+status_del%3D0+ORDER+BY+paixu+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_gyzb_fzlc` WHERE status_del=0 ORDER BY paixu DESC LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $edu) { ?>
    <li class="swiper-slide">
      <div class="li">
        <div class="tet"><?php echo $edu['content'];?></div>
        <div class="txt"><?php echo $edu['title'];?></div>
      </div>
    </li><?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
  </ul>
  <div class="arrow"><i class="arrow-left"></i><i class="arrow-right"></i></div>
</div>
<?php include template("content","footer"); ?>
</body>
</html>
