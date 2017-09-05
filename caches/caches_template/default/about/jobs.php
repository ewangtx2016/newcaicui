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
<div class="jt_main jt_gyzb_jrzb_xq">
  <div class="center cl">
    <ul class="jt_gyzb_jrzb_ul left_800">
      <li class="">
        <div  class="l_box"> <a class="l_tit"><?php echo $jobs['position'];?></a>
          <div class="intro"> <i class="i_red"><?php echo $jobs['money'];?></i><i class="l_xian"><?php echo parentlinkagename($jobs[city]);?></i><i><?php echo $jobs['education'];?></i> <em class="l_time_t">发布日期：<?php echo date('Y-m-d',$jobs['addtime']);?></em> </div>
          <div class="border-intro"> <?php echo welfare($jobs['welfare'],0);?> </div>

          <div class="fen_xian"></div>
          <div class="l_gshi"><?php echo $jobs['company'];?></div>
          <div class="l_time">发布日期：<?php echo date('Y-m-d',$jobs['addtime']);?></div>
          <em class="l_jiaji"></em>
          <div class="l_cont">

            <div class="li_li">
              <div class="title">职位描述：</div>
              <div class="conent"><?php echo $jobs['introduce'];?></div>
            </div>

            <div class="li_li">
              <div class="title">任职要求：</div>
              <div class="conent"><?php echo $jobs['requirement'];?></div>
            </div>

            <div class="li_li">
              <div class="title">岗位职责：</div>
              <div class="conent"><?php echo $jobs['duty'];?></div>
            </div>


            <div class="li_li">
              <div class="title">工作地点：</div>
              <div class="conent"><?php echo $jobs['address'];?></div>
            </div>

          </div>
          <div class="l_xq_fenyq"> 上一条：<a href="/jobs-<?php echo $upspage['id'];?>.html"><?php echo $upspage['title'];?></a> 下一条：<a href="/jobs-<?php echo $downspage['id'];?>.html"><?php echo $downspage['title'];?></a> <a href="/job.html" class="red_border_btn">返回列表</a> </div>
        </div>
      </li>
    </ul>
    <ul class="jt_gyzb_jrzb_ul l_fr right_400">
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=e1db32d34bf7432dbbf836ca4c9f75de&sql=SELECT+%2A+FROM+%60zb_gyzb_job%60+WHERE+status_del%3D0+ORDER+BY+addtime+DESC&num=4\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_gyzb_job` WHERE status_del=0 ORDER BY addtime DESC LIMIT 4");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $mtbd) { ?>
      <li>
        <div  class="l_box"> <a href="/jobs-<?php echo $arr['id'];?>.html" class="l_tit"><?php echo intercept($arr['position'],0,14);?></a>
          <div class="intro"> <i class="i_red"><?php echo $jobs['money'];?></i><i class="l_xian">北京</i><i><?php echo $jobs['education'];?></i> </div>
          <div class="border-intro"> <?php echo welfare($arr['welfare'],3);?>  </div>
          <div class="fen_xian"></div>
          <div class="l_gshi"><?php echo $jobs['company'];?></div>
          <div class="l_time">发布日期：<?php echo date('Y-m-d',$jobs['addtime']);?></div>
          <?php if($arr[hot]==1) { ?><em class="l_jiaji"></em><?php } ?> </div>
      </li><?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </ul>
  </div>
</div>
<?php include template("content","footer"); ?>
</body>
</html>
