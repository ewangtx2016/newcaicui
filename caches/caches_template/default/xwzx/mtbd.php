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
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/z_css.css" />
<script>
$(function(){
	var mySwiper = new Swiper('#news',{
		calculateHeight:true,
        loop:true
	 }); 	
	  $('.arrow-left').on('click', function(e){
		e.preventDefault()
		mySwiper.swipePrev()
	  })
	  $('.arrow-right').on('click', function(e){
		e.preventDefault()
		mySwiper.swipeNext()
	  })	
});
</script>
</head>

<body style="background: #f2f5fa;">
<?php include template("content","header"); ?>
<div class="l_head_87" style="background-image:url(<?php echo $create['pic'];?>);">
  <div class="jtz_txt">
    <h2><?php echo $create['one'];?></h2>
    <span><?php echo $create['english'];?></span> <i></i> </div>
</div>
<div class="jtz_news">
  <div class="wrap">
    <div class="part1" id="news">
      <ul class="swiper-wrapper"><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=d9713a77746099277f671007f19c8eab&sql=SELECT+%2A+FROM+%60zb_xwzx%60+WHERE+lei%3D%27%E5%AA%92%E4%BD%93%E6%8A%A5%E9%81%93%27+and+tui%3D1+and+status_del%3D0+ORDER+BY+addtime+DESC&num=5\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_xwzx` WHERE lei='媒体报道' and tui=1 and status_del=0 ORDER BY addtime DESC LIMIT 5");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $mtbd) { ?>
        <li class="swiper-slide">
          <div class="con"> <img src="<?php echo IMG_PATH;?>zb/jtz_img4.jpg" style="background-size:cover;"/>
            <div class="box">
              <div class="cen"> <a href="/mtbds-<?php echo $mtbd['id'];?>.html" class="txt"><?php echo intercept($mtbd['title'],0,18);?></a> <span><i class="i1"><?php echo date('Y-m-d',$mtbd['addtime']);?></i><i class="i2"><?php echo $mtbd['hits'];?></i></span> <b><?php echo intercept($mtbd['summer'],0,60);?></b> <a href="/mtbds-<?php echo $mtbd['id'];?>.html" class="a">查看详情<i>>></i></a> </div>
            </div>
          </div>
          <div class="pic"><img src="<?php echo cutimg($mtbd['pic'],600,385,5);?>"/></div>
        </li><?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
      </ul>
      <div class="arrow"><i class="arrow-left"></i><i class="arrow-right"></i></div>
    </div>
    <div class="part2">
      <ul class="ul cf">
        <?php $n=1;if(is_array($qydt)) foreach($qydt AS $arr) { ?>
        <li>
          <dl>
            <dt><a href="/mtbds-<?php echo $arr['id'];?>.html"><img src="<?php echo cutimg($arr['pic'],380,245,5);?>"/></a></dt>
            <dd> <a href="/mtbds-<?php echo $arr['id'];?>.html" class="txt"><?php echo $arr['title'];?></a> <span><i class="i1"><?php echo date('Y-m-d',$arr['addtime']);?></i><i class="i2"><?php echo $arr['hits'];?></i></span> <a href="/mtbds-<?php echo $arr['id'];?>.html" class="a">查看详情<i>>></i></a> </dd>
          </dl>
        </li>
       <?php $n++;}unset($n); ?>
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
<script>
	$("#pages a").eq(0).css("display","none");
</script>
