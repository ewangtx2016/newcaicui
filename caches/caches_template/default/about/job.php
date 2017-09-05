<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $job['title'];?></title>
<meta name="Keywords" content="<?php echo $job['keywords'];?>" />
<meta name="Description" content="<?php echo $job['jianjie'];?>" />
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/css.css" />
<link rel="stylesheet" href="<?php echo CSS_PATH;?>zb/jt_liyulan.css.css"/>
<script src="<?php echo JS_PATH;?>zb/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jt_head.js"></script>
</head>

<body>
<?php include template("content","header"); ?>
<div class="l_head_87" style="background-image:url(<?php echo $create['pic'];?>);">
  <div class="jtz_txt">
    <h2><?php echo $create['one'];?></h2>
    <span><?php echo $create['english'];?></span> <i></i> </div>
</div>
<div class="jt_main jt_gyzb_jrzb">
  <div class="center">
    <div class="jtz_txt">
      <h2><?php echo $job['one'];?></h2>
      <span><?php echo $job['english'];?></span> <i></i> <?php echo $job['content'];?> </div>
    <ul class="jt_gyzb_jrzb_ul cl" style="margin-bottom:20px;">
     <?php $n=1;if(is_array($joblist)) foreach($joblist AS $arr) { ?>
      <li class="l_fl">
        <div  class="l_box"> <a href="/jobs-<?php echo $arr['id'];?>.html" class="l_tit"><?php echo intercept($arr['position'],0,14);?></a>
          <div class="intro"> <i class="i_red"><?php echo $arr['money'];?></i><i class="l_xian"><?php echo parentlinkagename($arr[city]);?></i><i><?php echo $arr['education'];?></i> </div>
          <div class="border-intro"> <?php echo welfare($arr['welfare'],3);?> </div>
          <div class="fen_xian"></div>
          <div class="l_gshi"><?php echo $arr['company'];?></div>
          <div class="l_time">发布日期：<?php echo date('Y-m-d',$arr['moditime']);?></div>
          <?php if($arr[hot]==1) { ?><em class="l_jiaji"></em><?php } ?> </div>
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
<?php include template("content","footer"); ?>
</body>
</html>
