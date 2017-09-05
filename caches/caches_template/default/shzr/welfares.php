<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta name="format-detection" content="telephone=no, email=no" />
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="shortcut icon" href="/favicon.ico" />
<title><?php echo $qydt['title'];?></title>
<meta name="Keywords" content="<?php echo $qydt['keywords'];?>" />
<meta name="Description" content="<?php echo $qydt['jianjie'];?>" />
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/css.css" />
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jt_head.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/z_css.css" />
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</head>

<body style="background: #f2f5fa;">
<?php include template("content","header"); ?>
<div class="l_head_87" style="background-image:url(<?php echo $create['pic'];?>);">
  <div class="jtz_txt">
    <h2><?php echo $create['one'];?></h2>
    <span><?php echo $create['english'];?></span> <i></i> </div>
</div>
<div class="jtz_news_cen">
  <div class="wrap">
    <div class="box_l">
      <div class="box">
        <div class="txt">
          <h2><?php echo $qydt['title'];?></h2>
          <div class="tit cf"> <span>发布时间：<?php echo date('Y-m-d',$qydt['addtime']);?></span> <span>点击次数：<?php echo $qydt['hits'];?>次</span> </div>
          <div class="bdsharebuttonbox"> <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a> <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a> <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a> <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a> <a href="#" class="bds_more" data-cmd="more"></a> </div>
        </div>
        <div class="tet">
          <?php echo $qydt['content'];?>
        </div>
        <div class="page1 cf"> <a href="/welfare.html" class="fh">返回列表</a>
          <ul>
            <?php if($upspage['id']!='') { ?><li><b>上一条：</b><a href="/welfares-<?php echo $upspage['id'];?>.html"><?php echo $upspage['title'];?></a></li><?php } ?>
            <?php if($downspage['id']!='') { ?><li><b>下一条：</b><a href="/welfares-<?php echo $downspage['id'];?>.html"><?php echo $downspage['title'];?></a></li><?php } ?>
          </ul>
        </div>
      </div>
    </div>
    <div class="box_r">
      <div class="box">
        <div class="t_txt"><span>企业动态</span></div>
        <ul class="ul1">
          <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=3e1ce73d38d1778c5ec4db637fcde2fb&sql=SELECT+%2A+FROM+%60zb_xwzx%60+WHERE+lei%3D%27%E4%BC%81%E4%B8%9A%E5%8A%A8%E6%80%81%27+and+status_del%3D0+ORDER+BY+addtime+DESC&num=5\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_xwzx` WHERE lei='企业动态' and status_del=0 ORDER BY addtime DESC LIMIT 5");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $mtbd) { ?>
          <li> <a href="/qydts-<?php echo $mtbd['id'];?>.html" class="pic"><img src="<?php echo cutimg($mtbd['pic'],94,62,5);?>"/></a> <span class="con"> <a href="/qydts-<?php echo $mtbd['id'];?>.html" class="txt"><?php echo intercept($mtbd['title'],0,28);?></a> <span class="titm">发布日期：<?php echo date('Y-m-d',$mtbd['addtime']);?></span> </span> </li>
          <?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </ul>
        <div class="t_txt"><span>重要活动</span></div>
        <ul>
          <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=9970474ea1ff8e09f136e56f963575d0&sql=SELECT+%2A+FROM+%60zb_xwzx%60+WHERE+lei%3D%27%E9%87%8D%E8%A6%81%E6%B4%BB%E5%8A%A8%27+and+status_del%3D0+ORDER+BY+addtime+DESC&num=5\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_xwzx` WHERE lei='重要活动' and status_del=0 ORDER BY addtime DESC LIMIT 5");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $zyhd) { ?>
          <li> <a href="/zyhds-<?php echo $zyhd['id'];?>.html" class="txt"><?php echo intercept($zyhd['title'],0,28);?></a> <span class="titm">发布日期：<?php echo date('Y-m-d',$zyhd['addtime']);?></span> </li>
          <?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </ul>
      </div>
    </div>
  </div>
</div>
<?php include template("content","footer"); ?>
</body>
</html>
