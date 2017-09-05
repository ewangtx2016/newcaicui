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
<div class="jt_main jt_gyhd">
  <div class="center">
    <ul class="jt_gyhd_top cl hov"><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=b656512122958b3689dcd8ab3f1e5e65&sql=SELECT+%2A+FROM+%60zb_xwzx%60+WHERE+lei%3D%27%E7%A4%BE%E4%BC%9A%E5%85%AC%E7%9B%8A%27+and+status_del%3D0+and+tui%3D1+ORDER+BY+addtime+DESC&num=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_xwzx` WHERE lei='社会公益' and status_del=0 and tui=1 ORDER BY addtime DESC LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?><?php $n=1;if(is_array($data)) foreach($data AS $arr) { ?>
      <li class="l_fl sp">
        <div class="l_box"> <a  href="index.php?m=shzr&c=qt_shzr&a=welfares&id=<?php echo $arr['id'];?>" class="img"><img src="<?php echo cutimg($arr['pic2'],792,513,5);?>" alt=""/></a>
          <div class="l_txtBox">
            <h3 class="l_tit"><a href="index.php?m=shzr&c=qt_shzr&a=welfares&id=<?php echo $arr['id'];?>"><?php echo intercept($arr['title'],0,22);?></a></h3>
            <div class="l_intro"><?php echo intercept($arr['summer'],0,110);?></div>
            <a href="index.php?m=shzr&c=qt_shzr&a=welfares&id=<?php echo $arr['id'];?>" class="jtin_btn">查看详情>></a> </div>
        </div>
      </li><?php $n++;}unset($n); ?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
      <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=2480ac2fedbbe3de13d626914b46d8c7&sql=SELECT+%2A+FROM+%60zb_xwzx%60+WHERE+lei%3D%27%E7%A4%BE%E4%BC%9A%E5%85%AC%E7%9B%8A%27+and+status_del%3D0+ORDER+BY+addtime+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_xwzx` WHERE lei='社会公益' and status_del=0 ORDER BY addtime DESC LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
      <?php $n=1;if(is_array($data)) foreach($data AS $arr) { ?>
      <li class="l_fl <?php if($i==0) { ?>sp_li<?php } ?> li">
        <div class="l_box"> <a  href="index.php?m=shzr&c=qt_shzr&a=welfares&id=<?php echo $arr['id'];?>" class="img"><img src="<?php echo cutimg($arr['pic'],380,158,5);?>" alt=""/></a>
          <div class="l_txt">
            <h4 class="l_tit_con"><a href="index.php?m=shzr&c=qt_shzr&a=welfares&id=<?php echo $arr['id'];?>"><?php echo intercept($arr['title'],0,30);?></a></h4>
            <div class="l_intro_con"><?php echo intercept($arr['summer'],0,38);?></div>
            <div class="btn_box"> <a href="index.php?m=shzr&c=qt_shzr&a=welfares&id=<?php echo $arr['id'];?>" class="red_border_btn">查看详情>></a> </div>
          </div>
        </div>
      </li>
      <?php $i++; ?>
      <?php $n++;}unset($n); ?>
      <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </ul>
  </div>
</div>
<?php include template("content","footer"); ?>
</body>
</html>
<script>
	$("#pages a").eq(0).css("display","none");
</script>