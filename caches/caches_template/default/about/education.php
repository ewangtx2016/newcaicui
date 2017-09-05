<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $create['title'];?></title>
<meta name="Keywords" content="<?php echo $create['keywords'];?>" />
<meta name="Description" content="<?php echo $create['jianjie'];?>" />
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
<div class="jt_main jt_gybo_cxjy">
  <div class="center">
    <ul class="jt_gybo_cxjy_b1 cl"><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=519f1b065049d74f00a5d7f0cdcf39f4&sql=SELECT+%2A+FROM+%60zb_gyzb_cxjy%60+WHERE+status_del%3D0+ORDER+BY+paixu+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_gyzb_cxjy` WHERE status_del=0 ORDER BY paixu DESC LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $edu) { ?>
      <li class="l_fl">
        <div class="l_box">
          <div class="icon"><img src="<?php echo $edu['pic'];?>" alt="" /></div>
          <div class="l_txt">
            <h3 class="l_tit"><?php echo $edu['title'];?></h3>
            <div class="l_cont"><?php echo $edu['content'];?></div>
          </div>
        </div>
      </li>
         <?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </ul>
  </div>
</div>
<?php include template("content","footer"); ?>
</body>
</html>
