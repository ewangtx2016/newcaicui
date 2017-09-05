<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $jobs['title'];?></title>
<meta name="Keywords" content="<?php echo $jobs['keywords'];?>" />
<meta name="Description" content="<?php echo $jobs['jianjie'];?>" />
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
<div class="jt_main jt_gyzb_sztd_xq">
  <div class="center">
    <div class="jt_gyzb_sztd_xqul cl">
      <div class="cont_box">
        <div class="l_top"><img src="<?php echo cutimg($jobs['pic2'],1134,436,5);?>" alt=""/></div>
      </div>
      <div class="l_fl">
        <div class="img"><img src="<?php echo cutimg($jobs['pic'],380,353,5);?>" alt=""/></div>
        <div class="jt_szxq_tit"> <span class="tit_26"><?php echo $jobs['ren'];?></span> <i class="tit_intro"><?php echo $jobs['english'];?></i> </div>
        <div class="jt_gyzb_sztd_xqlist">
          <div class="list"> <i>教师资历：</i>
            <div class="l_p"><?php echo $jobs['jszl'];?></div>
          </div>
          <div class="list"> <i>从业时间：</i>
            <div class="l_p"><?php echo $jobs['cysj'];?></div>
          </div>
          <div class="list"> <i>主讲科目：</i>
            <div class="l_p"><?php echo zjkm($jobs[zjkm],0);?></div>
          </div>
          <div class="list"> <i>讲师格言：</i>
            <div class="l_p"><?php echo $jobs['jsgy'];?></div>
          </div>
        </div>
      </div>
      <div class="l_fr">
        <div class="jt_szxq_titcon"> <span class="tit_span">教师简介</span> </div>
        <div class="l_txt"> <?php echo $jobs['jsjj'];?> </div>
        <div class="jt_szxq_titcon"> <span class="tit_span">教育背景</span> </div>
        <div class="l_txt"> <?php echo $jobs['jybj'];?> </div>
        <div class="jt_szxq_titcon"> <span class="tit_span">工作经历</span> </div>
        <div class="l_txt">
          <?php echo $jobs['gzjl'];?>
        </div>
        <div class="jt_szxq_titcon"> <span class="tit_span">教学理念和风格</span> </div>
        <div class="l_txt"> <?php echo $jobs['content'];?> </div>
      </div>
    </div>
  </div>
</div>
<?php include template("content","footer"); ?>
</body>
</html>
