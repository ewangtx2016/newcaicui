<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="format-detection" content="telephone=no, email=no" />
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="shortcut icon" href="/favicon.ico" />
<title><?php echo $ywtx['title'];?></title>
<meta name="Keywords" content="<?php echo $ywtx['keywords'];?>" />
<meta name="Description" content="<?php echo $ywtx['jianjie'];?>" />
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/css.css" />
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jt_head.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/z_css.css" />
<script>
$(function(){
	$("#back .map").mouseenter(function(){
		var cla = $(this).attr("data-class");
		$(".back").attr("class","back "+cla)
	})
	$("#back .map").mouseleave(function(){
		$(".back").attr("class","back")
	})
})	
</script>
<style>
  .backno{
    width:0;
    height:0;
  }
.jtz_part1 .back{ width: 768px; height:768px; background-image: url(<?php echo $ywtx['pic'];?>); background-repeat: no-repeat; background-position:0 0; margin:0px auto;}
.jtz_part1 .back1{
  background-position: 0 calc(-769px);
}
.jtz_part1 .back2{
  background-position: 0 calc(-769px*2);
}
.jtz_part1 .back3{
  background-position: 0 calc(-769px*3);
}
.jtz_part1 .back4{
  background-position: 0 calc(-769px*4);
}
.jtz_part1 .back5{
  background-position: 0 calc(-769px*5);
}
.jtz_part1 .back6{
  background-position: 0 calc(-769px*6);
}
.jtz_part1 .back7{
  background-position: 0 calc(-769px*7);
}
</style>
</head>

<body>
<?php include template("content","header"); ?>
<div class="l_head_87" style="background-image:url(<?php echo $create['pic'];?>);">
  <div class="jtz_txt">
    <h2><?php echo $create['one'];?></h2>
    <span><?php echo $create['english'];?></span> <i></i> </div>
</div>
<div class="jtz_part1">
  <div class="wrap">
    <div class="jtz_txt">
      <h2><?php echo $ywtx['one'];?></h2>
      <span><?php echo $ywtx['english'];?></span> <b>
      <?php echo $ywtx['content'];?>
      </b> </div>
    <div class="backno back1 back2 back3 back4 back5 back6 back7"></div>
    <div class="back" id="back"> <img src="<?php echo IMG_PATH;?>zb/jtz_img2.png" usemap="#Map"/>
      <map name="Map">
        <area shape="poly" coords="112,114,252,22,424,4,389,311,335,331" href="#" class="map" data-class="back1">
        <area shape="poly" coords="426,4,585,53,710,175,442,343,392,312" href="#" class="map" data-class="back2">
        <area shape="poly" coords="443,345,709,181,757,304,746,504,450,404" href="#" class="map" data-class="back3">
        <area shape="poly" coords="453,406,744,506,650,663,517,741,410,449,404,452" href="#" class="map" data-class="back4">
        <area shape="poly" coords="406,452,508,744,355,763,184,711,348,445" href="#" class="map" data-class="back5">
        <area shape="poly" coords="340,441,178,706,60,585,5,431,307,395" href="#" class="map" data-class="back6">
        <area shape="poly" coords="308,388,5,423,26,244,113,120,327,332" href="#" class="map" data-class="back7">
      </map>
    </div>
  </div>
</div>
<div class="jtz_part2">
  <div class="jtin_zbfb in_anm">
    <div class="jtin_bt"> <span class="ch"><?php echo $allfb['one'];?></span> <span class="en"><?php echo $allfb['english'];?></span> <?php echo $allfb['content'];?> </div>
    <div class="box">
      <div class="left">
        <ul>
          <li><span class="span1"><?php echo $allfb['title'];?></span><span>全国分公司</span></li>
          <li><span class="span1"><?php echo $allfb['keywords'];?></span><span>全国教学点</span></li>
          <li><span class="span1"><?php echo $allfb['jianjie'];?></span><span>全国教师团队</span></li>
          <li><span class="span1"><?php echo $allfb['pic4'];?></span><span>累计培养学员</span></li>
        </ul>
      </div>
      <div class="right">
        <div class="bt"><?php echo $allfb['pic2'];?><span><?php echo $allfb['pic3'];?></span></div>
        <ul><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=008d15dfe72b4c1a51ccad4d2f777e62&sql=SELECT+%2A+FROM+%60zb_ywtx_city%60+WHERE+status_del%3D0+ORDER+BY+paixu+DESC&num=1000\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_ywtx_city` WHERE status_del=0 ORDER BY paixu DESC LIMIT 1000");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $city) { ?>
          <li><a href="<?php echo $city['url'];?>" target="_blank"><?php echo $city['title'];?></a></li><?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </ul>
      </div>
      <div class="map"><img src="<?php echo $allfb['pic'];?>"/></div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<?php include template("content","footer"); ?>
</body>
</html>
