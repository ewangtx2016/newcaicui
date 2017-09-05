<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo website('title');?></title>
<meta name="Keywords" content="<?php echo website('keywords');?>" />
<meta name="Description" content="<?php echo website('jianjie');?>" />
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/css.css" />
<link rel="stylesheet" href="<?php echo CSS_PATH;?>zb/owl.carousel.min.css">
<script src="<?php echo JS_PATH;?>zb/jquery-1.10.1.min.js"></script>
<script src="<?php echo JS_PATH;?>zb/owl.carousel.min.js"> </script>
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jt_head.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jquery.SuperSlide.2.1.1.js"></script>
<script><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=9cba8f5476d94c348fc5fb5dde506294&sql=SELECT+COUNT%28%2A%29+as+nus+FROM+%60zb_create%60+WHERE+lei%3D%27%E9%A6%96%E9%A1%B5%27+and+status_del%3D0+ORDER+BY+paixu+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT COUNT(*) as nus FROM `zb_create` WHERE lei='首页' and status_del=0 ORDER BY paixu DESC LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
$(function(){
	$('#owl-carousel').owlCarousel({
		items:1,
		smartSpeed:900,//切换过渡时间
		loop:<?php if($data[0][nus]==1) { ?>false<?php } else { ?>true<?php } ?>, //无限循环切换
		autoplay:true, //是否自动轮播
		autoplayTimeout:5000, //自动轮播时间
		dots:true, //是否显示原点导航
		nav:true,   //是否左右切换
		mouseDrag:false //关闭pc端拖动
	});
})
</script>
<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
<!----新闻轮播---->
    <script>
        $(function(){
            $('#owl-carousel2').owlCarousel({

                loop:true, //无限循环切换
                dots:false, //是否显示原点导航
                dotsEach:true, //每个区块一个圆点
                nav:true,   //是否左右切换
                mouseDrag:false, //关闭pc端拖动
                responsive:{
                    0:{items:1,margin:0},
                    1002:{items:2,margin:30},
                    1200:{items:3,margin:30}
                }
            });
        })
    </script>

<!----荣誉轮播---->
<link rel="stylesheet" href="<?php echo CSS_PATH;?>zb/idangerous.swiper.css">
<link rel="stylesheet" href="<?php echo CSS_PATH;?>zb/idangerous.swiper.3dflow.css">
<script src="<?php echo JS_PATH;?>zb/idangerous.swiper.min.js"></script>
<script src="<?php echo JS_PATH;?>zb/idangerous.swiper.3dflow.js"> </script>
<script>
$(function(){
     var mySwiper = new Swiper('.swiper-container',{
    slidesPerView:3,
    loop:true,
    tdFlow: {
      rotate : 0,
      stretch :326,
      depth: 400,
      modifier : 1,
      shadows:true,
      pagination: '.pagination',
      grabCursor: true,
      paginationClickable: true
    },
    prevButton:'.swiper-button-prev',
    nextButton:'.swiper-button-next',
  })
     $('.arrow-left').on('click', function(e){
       e.preventDefault()
       mySwiper.swipePrev()
     })
     $('.arrow-right').on('click', function(e){
       e.preventDefault()
       mySwiper.swipeNext()
     })
});
$(function(){
	$('#owl-carousel3').owlCarousel({
		loop:true, //无限循环切换
		dots:false, //是否显示原点导航
		dotsEach:true, //每个区块一个圆点
		nav:true,   //是否左右切换
		mouseDrag:false, //关闭pc端拖动
		responsive:{
			0:{items:1,margin:0},
			1002:{items:2,margin:30},
			1200:{items:5,margin:24}
		}
	});
})
</script>
</head>

<body>
<div class="jtin_top">
  <div class="jt_head_box">
    <div class="logo"> <a class="logo1" href="/"><img src="<?php echo IMG_PATH;?>zb/ywin_logo.png"/></a> <span class="logo2"><img src="<?php echo IMG_PATH;?>zb/jt_dy.png"/></span> </div>
    <div class="right">
      <div class="nav">
        <ul>
          <li><a href="/" class="one">首页</a></li>
          <li> <a href="/partners.html">关于中博</a>
            <ol>
              <li><a href="/partners.html">合作伙伴</a></li>
              <li><a href="/education.html">创新教育</a></li>
              <li><a href="/development.html">发展历程</a></li>
              <li><a href="/enterprise.html">企业荣誉</a></li>
              <li><a href="/job.html">加入中博</a></li>
              <li><a href="/teacher.html">师资团队</a></li>
              <li><a href="/contactus.html">联系我们</a></li>
            </ol>
          </li>
          <li> <a href="/business.html">业务体系</a></li>
          <li> <a href="/qydt.html">新闻中心</a>
            <ol>
              <li><a href="/qydt.html">企业动态</a></li>
              <li><a href="/mtbd.html">媒体报道</a></li>
              <li><a href="/zyhd.html">重要活动</a></li>
            </ol>
          </li>
          <li> <a href="/founder.html">社会责任</a>
            <ol>
              <li><a href="/founder.html">创始人寄语</a></li>
              <li><a href="/welfare.html">社会公益</a></li>
              <li><a href="/scholarship.html">奖学金</a></li>
            </ol>
          </li>
        </ul>
      </div>
      <div class="right_r"> <a  href="javascript:;">找课程</a> <span><?php echo website('tel');?></span> </div>
    </div>
  </div>
</div>

<script>
   $(function(){
        //        修改banner高度
       function jHeight(){
           var bheight, wWidth = $(window).height(),wSliWidth = $('.owl-carousel .item').height();
           bheight = wWidth > wSliWidth ? wSliWidth : wWidth
           $('.bn_box').height(bheight);
       }
       jHeight();
       $(window).on('resize',jHeight);
   })
</script>

<div class="bn_box">

<div class="jtin_ban">
  <div class="owl-carousel" id="owl-carousel"><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=c1aae9c57c054145ce20185f18149856&sql=SELECT+%2A+FROM+%60zb_create%60+WHERE+lei%3D%27%E9%A6%96%E9%A1%B5%27+and+status_del%3D0+ORDER+BY+paixu+DESC&num=5\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_create` WHERE lei='首页' and status_del=0 ORDER BY paixu DESC LIMIT 5");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $sylbt) { ?>
    <div class="item" style="background-image: url(<?php echo $sylbt['pic'];?>); ">
      <div class="nr"> <span class="txt"><img src="<?php echo $sylbt['pic2'];?>" /></span> <span class="btn"><a href="<?php echo $sylbt['url'];?>">查看更多</a></span> </div>
    </div><?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
          
  </div>
</div>
<div class="jtin_tz">
  <div class="box">
    <div class="left">通知公告:</div>
    <div class="btn"><a href="/tzgg.html">查看详情</a></div>
    <div id="myscroll" class="cls_container">
        <div class="scroll_box">
            <ul><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=a6160a19ff43744024b1051fad4a9908&sql=SELECT+id%2Ctitle+FROM+%60zb_xwzx%60+WHERE+lei%3D%27%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8A%27+and+status_del%3D0+and+tui%3D1+ORDER+BY+addtime+DESC&num=5\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT id,title FROM `zb_xwzx` WHERE lei='通知公告' and status_del=0 and tui=1 ORDER BY addtime DESC LIMIT 5");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                    <?php $n=1;if(is_array($data)) foreach($data AS $tzgg) { ?>
                        <li><a href="/tzggs-<?php echo $tzgg['id'];?>.html" target="_blank"><?php echo $tzgg['title'];?></a></li>
                    <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </ul>
        </div>
    </div>
  </div>
  <!----公告---->

    <script>

        jQuery("#myscroll").slide({mainCell:".scroll_box ul",autoPage:true,effect:"topLoop",easing:"easeOutBounce",autoPlay:true,vis:1,delayTime:1100,interTime:5000});
    </script>
</div>


</div>



<div class="jtin_zbll" id="box1">
  <div class="jtin_bt"> <span class="ch">中博力量</span> <span class="en">Power</span> </div>
  <div class="con">
    <ul><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=c137c87c3a23fb369ac2a698b0d4e2d1&sql=SELECT+%2A+FROM+%60zb_zbll%60+ORDER+BY+id+ASC&num=5\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_zbll` ORDER BY id ASC LIMIT 5");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
      <li> <a href="<?php echo $data['0']['url'];?>" class="li_box"> <span class="bg"></span> <span class="span1"> <span class="sz"><i><?php echo $data['0']['num'];?></i></span> <span class="tit"><?php echo intercept($data[0]['title'],0,12);?></span> </span> <span class="zy"><?php echo intercept($data[0]['jianjie'],0,50);?></span> </a> </li>
      <li> <a href="<?php echo $data['1']['url'];?>" class="li_box"> <span class="bg"></span> <span class="span1"> <span class="sz"><i><?php echo $data['1']['num'];?></i></span> <span class="tit"><?php echo intercept($data[1]['title'],0,12);?></span> </span> <span class="zy"><?php echo intercept($data[1]['jianjie'],0,50);?></span> </a> </li>
      <li> <a href="<?php echo $data['2']['url'];?>" class="li_box"> <span class="bg"></span> <span class="span1"> <span class="sz"><i><?php echo $data['2']['num'];?></i></span> <span class="tit"><?php echo intercept($data[2]['title'],0,12);?></span> </span> <span class="zy"><?php echo intercept($data[2]['jianjie'],0,50);?></span> </a> </li>
      <li> <a href="<?php echo $data['3']['url'];?>" class="li_box"> <span class="bg"></span> <span class="span1"> <span class="sz"><i><?php echo $data['3']['num'];?></i></span> <span class="tit"><?php echo intercept($data[3]['title'],0,12);?></span> </span> <span class="zy"><?php echo intercept($data[3]['jianjie'],0,50);?></span> </a> </li>
      <li> <a href="<?php echo $data['4']['url'];?>" class="li_box"> <span class="bg"></span> <span class="span1"> <span class="sz"><i><?php echo $data['4']['num'];?></i></span> <span class="tit"><?php echo intercept($data[4]['title'],0,12);?></span> </span> <span class="zy"><?php echo intercept($data[4]['jianjie'],0,50);?></span> </a> </li><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </ul>
  </div>
</div>

<div class="jtin_zbyw" id="box2">
  <div class="jtin_bt"> <span class="ch">中博业务</span> <span class="en">Businsss</span> </div>
  <div class="con">
    <ul><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=8e26b8dc3e4ec99d84885e523362f762&sql=SELECT+%2A+FROM+%60zb_create%60+WHERE+lei%3D%27%E4%B8%AD%E5%8D%9A%E4%B8%9A%E5%8A%A1%27+and+status_del%3D0+ORDER+BY+paixu+ASC&num=6\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_create` WHERE lei='中博业务' and status_del=0 ORDER BY paixu ASC LIMIT 6");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $zbyw) { ?>
              <li>
                  <a href="<?php echo $zbyw['url'];?>">
                      <span class="img"><img src="<?php echo cutimg($zbyw['pic'],633,367,5);?>" /></span>
                      <span class="bg"></span>
                      <span class="tb"></span>
                      <div class="tb_boxli">
                          <span class="tit"><?php echo $zbyw['one'];?><i><?php echo $zbyw['english'];?></i></span>
                          <span class="txt"><?php echo $zbyw['jianjie'];?></span>
                      </div>
                  </a>
              </li>
        <?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </ul>
  </div>
  <div class="btn"><a href="/qydt.html" class="jtin_btn">了解更多</a></div>
</div>
<div class="jtin_zbxw" id="box3">
  <div class="jtin_bt"> <span class="ch">中博新闻</span> <span class="en">News</span> </div>
  <div class="con">
    <div class="owl-carousel2" id="owl-carousel2">
     <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=551e00d2fdd013b8b4b615a57e3e9263&sql=SELECT+%2A+FROM+%60zb_xwzx%60+WHERE+%28lei%3D%27%E4%BC%81%E4%B8%9A%E5%8A%A8%E6%80%81%27+or+lei%3D%27%E5%AA%92%E4%BD%93%E6%8A%A5%E9%81%93%27+or+lei%3D%27%E9%87%8D%E8%A6%81%E6%B4%BB%E5%8A%A8%27%29+and+status_del%3D0+ORDER+BY+addtime+DESC&num=10\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_xwzx` WHERE (lei='企业动态' or lei='媒体报道' or lei='重要活动') and status_del=0 ORDER BY addtime DESC LIMIT 10");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $xwzx) { ?>
      <div class="item" > <a href="/<?php if($xwzx[lei]=='企业动态') { ?>qydts<?php } ?><?php if($xwzx[lei]=='媒体报道') { ?>mtbds<?php } ?><?php if($xwzx[lei]=='重要活动') { ?>zyhds<?php } ?>-<?php echo $xwzx['id'];?>.html" target="_blank"><img src="<?php echo cutimg($xwzx['pic'],380,245,5);?>" /></a>
        <div class="nr"> <a href="/<?php if($xwzx[lei]=='企业动态') { ?>qydts<?php } ?><?php if($xwzx[lei]=='媒体报道') { ?>mtbds<?php } ?><?php if($xwzx[lei]=='重要活动') { ?>zyhds<?php } ?>-<?php echo $xwzx['id'];?>.html" target="_blank" class="bt"><?php echo intercept($xwzx['title'],0,23);?></a>
          <div class="bz"><span class="time">2017-05-31</span><span class="read">（999） 次</span></div>
          <div class="zy"><?php echo intercept($xwzx['summer'],0,45);?></div>
          <div class="btn"><a href="/<?php if($xwzx[lei]=='企业动态') { ?>qydts<?php } ?><?php if($xwzx[lei]=='媒体报道') { ?>mtbds<?php } ?><?php if($xwzx[lei]=='重要活动') { ?>zyhds<?php } ?>-<?php echo $xwzx['id'];?>.html" target="_blank" class="jtin_btn">查看详情 >></a></div>
        </div>
      </div>
      <?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </div>
  </div>
</div>
<div class="jtin_zbzgs" id="box4" style="background: url(<?php echo IMG_PATH;?>zb/jtin_zbzgs.jpg) no-repeat center; background-size:cover;">
  <div class="jtin_bt"> <span class="ch">中博旗下子公司</span> <span class="en">SUBSIDIARYS</span> </div>
  <div class="con">
    <ul><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=1fecf6a2de19f50dd54150064ebfbe04&sql=SELECT+%2A+FROM+%60zb_create%60+WHERE+lei%3D%27%E4%B8%AD%E5%8D%9A%E6%97%97%E4%B8%8B%E5%AD%90%E5%85%AC%E5%8F%B8%27+and+status_del%3D0+ORDER+BY+paixu+ASC&num=6\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_create` WHERE lei='中博旗下子公司' and status_del=0 ORDER BY paixu ASC LIMIT 6");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $zbqxzgs) { ?>
      <li> <a href="<?php echo $zbqxzgs['url'];?>" class="li_box"> <span class="sj"></span> <span class="logo"><img src="<?php echo $zbqxzgs['pic'];?>"  style="width: auto;height: 37px;" /></span> <span class="tet"><?php echo intercept($zbqxzgs['jianjie'],0,60);?></span> </a> </li>
      <?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </ul>
  </div>
</div>
<div class="jtin_zbry" id="box5">
  <div class="jtin_bt"> <span class="ch">资质荣誉</span> <span class="en">Qualification honor</span> </div>
  <div class="glory_cont">
    <div class="a_box"> <a class="arrow-left" href="#"></a> <a class="arrow-right" href="#"></a> </div>
    <div class="center">
      <div class="boxWrap">
        <div class="box">
          <div class="swiper-container" id="swiper-container2">
            <ul class="swiper-wrapper"><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=fad8a755433ded9185081377b1ab434b&sql=SELECT+%2A+FROM+%60zb_gyzb_qyry%60+WHERE+status_del%3D0+ORDER+BY+paixu+DESC&num=6\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_gyzb_qyry` WHERE status_del=0 ORDER BY paixu DESC LIMIT 6");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $qyry) { ?>
              <li class="swiper-slide" >
                <div class="pic1"><img src="<?php echo cutimg($qyry['pic'],655,462,5);?>" /></div>
                <div class="txt"><?php echo intercept($qyry['title'],0,25);?></div>
              </li><?php $n++;}unset($n); ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="jtin_zbfb" id="box6"><?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=10ed6dab31e1e0b4a91ccf3a919ae14c&sql=SELECT+%2A+FROM+%60zb_ywtx%60+WHERE+id%3D2&return=fb\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_ywtx` WHERE id=2 LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$fb = $a;unset($a);?>
  <div class="jtin_bt"> <span class="ch"><?php echo $fb['0']['one'];?></span> <span class="en"><?php echo $fb['0']['english'];?></span> </div>
  <div class="box">
    <div class="left">
      <ul>
        <li><span class="span1"><?php echo $fb['0']['title'];?></span><span>全国分公司</span></li>
        <li><span class="span1"><?php echo $fb['0']['keywords'];?></span><span>全国教学点</span></li>
        <li><span class="span1"><?php echo $fb['0']['jianjie'];?></span><span>全国教师团队</span></li>
        <li><span class="span1"><?php echo $fb['0']['pic4'];?></span><span>累计培养学员</span></li>
      </ul>
    </div>
    <div class="right">
      <div class="bt"><?php echo $fb['0']['pic2'];?><span><?php echo $fb['0']['pic3'];?></span></div>
      <ul>
         <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=644b00424d93b739d05510adb9d480f8&sql=SELECT+%2A+FROM+%60zb_ywtx_city%60+WHERE+status_del%3D0+ORDER+BY+paixu+DESC&num=1000\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_ywtx_city` WHERE status_del=0 ORDER BY paixu DESC LIMIT 1000");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
         <?php $n=1;if(is_array($data)) foreach($data AS $city) { ?>
              <li><a href="<?php echo $city['url'];?>" target="_blank"><?php echo $city['title'];?></a></li><?php $n++;}unset($n); ?>
         <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
      </ul>
    </div>
    <div class="map"><img src="<?php echo $fb['0']['pic'];?>"/></div>
    <div class="clear"></div>
  </div><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
</div>
<div class="jtin_zbhb" id="box7">
  <div class="jtin_bt"> <span class="ch">合作伙伴</span> <span class="en">Cooperative partner</span> </div>
  <div class="con">
    <div id="warp_kh_ul" class="li_hong">
      <div class="owl-carousel2" id="owl-carousel3"> <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=720cd939105d01fac7c99fac60a9f1c1&sql=SELECT+%2A+FROM+%60zb_gyzb_hzhb%60+WHERE+status_del%3D0+ORDER+BY+paixu+DESC&num=10\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_gyzb_hzhb` WHERE status_del=0 ORDER BY paixu DESC LIMIT 10");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
               	<?php if($data[0][title]!='') { ?><div class="pic2 item">
                	<a href="<?php echo $data['0']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[0][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['0']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[0][pic2],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['0']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a><?php if($data[5][title]!='') { ?>
                    <a href="<?php echo $data['5']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[5][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['5']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[5][pic2],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['5']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a>
                </div><?php } ?><?php } ?>
                <?php if($data[1][title]!='') { ?><div class="pic2 item">
                	<a href="<?php echo $data['1']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[1][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['1']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[1][pic2],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['1']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a><?php if($data[6][title]!='') { ?>
                    <a href="<?php echo $data['6']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[6][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['6']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[6][pic2],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['6']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a>
                </div><?php } ?><?php } ?>
                <?php if($data[2][title]!='') { ?><div class="pic2 item">
                	<a href="<?php echo $data['2']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[2][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['2']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[2][pics],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['2']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a><?php if($data[7][title]!='') { ?>
                    <a href="<?php echo $data['7']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[7][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['7']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[7][pic2],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['7']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a>
                </div><?php } ?><?php } ?>
                <?php if($data[3][title]!='') { ?><div class="pic2 item">
                	<a href="<?php echo $data['3']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[3][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['3']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[3][pic2],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['3']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a><?php if($data[8][title]!='') { ?>
                    <a href="<?php echo $data['8']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[8][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['8']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[8][pic2],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['8']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a>
                </div><?php } ?><?php } ?>
                <?php if($data[4][title]!='') { ?><div class="pic2 item">
                	<a href="<?php echo $data['4']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[4][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['4']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[4][pic2],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['4']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a><?php if($data[9][title]!='') { ?>
                    <a href="<?php echo $data['9']['url'];?>" class="a_box">
                        <div class="a">
                            <div class="bai">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[9][pic],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['9']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                            <div class="hong">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td>
                                    <span class="span1"><img src="<?php echo cutimg($data[9][pic2],76,76,5);?>" ></span>
                                    <span class="span2"><?php echo $data['9']['title'];?></span>
                                    </td></tr>
                                </table>
                            </div>
                        </div>
                    </a>
                </div><?php } ?><?php } ?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
     </div>
    </div>
  </div>
</div>
<?php include template("content","footer"); ?>

<!----效果----> 
<script>
	(function(){
		var win = $(window);
		var winTop = 0;
		var winhei = win.height()*0.7;
		var winhei2 = win.height()*0.4;
		var box1 = $("#box1");
		var box2 = $("#box2");
		var box3 = $("#box3");
		var box4 = $("#box4");
		var box5 = $("#box5");
		var box6 = $("#box6");
		var box7 = $("#box7");
		win.resize(function(e) {
			winhei = win.height()*0.7;
			winhei2 = win.height()*0.4;
		});
		win.scroll(function(){
			winTop = win.scrollTop();
			scroll_fun(winTop)
		});
		
		function scroll_fun(t){
			if(t >= box1.offset().top - winhei){
				box1.addClass("in_anm");
			}
			if(t >= box2.offset().top - winhei){
				box2.addClass("in_anm");
			}
			if(t >= box3.offset().top - winhei){
				box3.addClass("in_anm");

				        $('.jtin_zbxw.in_anm .con .owl-item.active').each(function(index,element){
                            $(this).addClass('hover'+index);
                        })

			}
			if(t >= box4.offset().top - winhei){
				box4.addClass("in_anm");
			}
			if(t >= box5.offset().top - winhei){
				box5.addClass("in_anm");
			}
			if(t >= box6.offset().top - winhei){
				box6.addClass("in_anm");
			}
			if(t >= box7.offset().top - winhei){
				box7.addClass("in_anm");
			}
		}
		//scroll_fun($(window).height());
	})();
</script>
</body>
</html>