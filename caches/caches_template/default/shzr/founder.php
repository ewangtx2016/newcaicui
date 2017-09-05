<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $founder['title'];?></title>
<meta name="Keywords" content="<?php echo $founder['keywords'];?>" />
<meta name="Description" content="<?php echo $founder['jianjie'];?>" />
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
<div class="jt_main jt_csrjy">
  <div class="center">
    <div class="jt_csrjy_box">
      <div class="l_top"> <span class="img"><img src="<?php echo cutimg($founder['pic'],1200,436,5);?>" alt=""></span> </div>
      <div class="l_bottom">
        <?php echo $founder['content'];?>
      </div>
    </div>
  </div>
</div>
<?php include template("content","footer"); ?>
</body>
</html>
