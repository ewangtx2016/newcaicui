<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $scholarship['title'];?></title>
<meta name="Keywords" content="<?php echo $scholarship['keywords'];?>" />
<meta name="Description" content="<?php echo $scholarship['jianjie'];?>" />
<link rel="stylesheet" href="<?php echo CSS_PATH;?>zb/idangerous.swiper2.7.6.css">
<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>zb/css.css" />
<link rel="stylesheet" href="<?php echo CSS_PATH;?>zb/jt_liyulan.css.css"/>
<script src="<?php echo JS_PATH;?>zb/jquery-1.10.1.min.js"></script>
<script src="<?php echo JS_PATH;?>zb/idangerous.swiper2.7.6.min.js"> </script><!----学员---->
<script type="text/javascript" src="<?php echo JS_PATH;?>zb/jt_head.js"></script>
<script>
$(function(){
	var mySwiper_ckxm = new Swiper('#swiper-container_ckxm_11',{
		slidesPerView:3,
		loop:true,
		mode:'vertical',
		calculateHeight:true
    });

	$('.yein_zbxy .arrow-left').on('click', function(e){
		e.preventDefault()
		mySwiper_ckxm.swipePrev()
	})
	$('.yein_zbxy .arrow-right').on('click', function(e){
		e.preventDefault()
		mySwiper_ckxm.swipeNext()
	})
});
</script>
</head>

<body>
<?php include template("content","header"); ?>
<div class="l_head_87" style="background-image:url(<?php echo $create['pic'];?>);">
  <div class="jtz_txt">
    <h2><?php echo $create['one'];?></h2>
    <span><?php echo $create['english'];?></span> <i></i> </div>
</div>
<div class="jt_main jt_jxj">
  <div class="yein_zbxy in_anm jt_jxj_xy">
    <div class="jtz_txt">
      <h2><?php echo $scholarship['one'];?></h2>
      <div class="l_intro"><?php echo $scholarship['content'];?></div>
    </div>

    <!--播放器-->
	<audio id="play_box"   src=""></audio>
	<script>
	  $(function(){
		  $('.music_button').bind('click',function(event){
			  var e = event ? event : window.event;
			  e.preventDefault();
			  var thisSrc = $(this).attr('href') || '/statics/images//zb/mp3/music.mp3';
			  $('#play_box').attr('src',thisSrc);
			  if($(this).hasClass('hover')){
				  //暂停
				  $('#play_box')[0].pause();
				  $('.music_button').removeClass('hover').find('img').attr('src','/statics/images/zb/stop.gif');
			  }else{
				  //播放
				  $('#play_box')[0].play();
				  $('.music_button').removeClass('hover').find('img').attr('src','/statics/images/zb/stop.gif');
				  $(this).addClass('hover').find('img').attr('src','/statics/images/zb/play.gif');
			  }


		  })

		  $('#play_box')[0].onended = function(){
			  $('.music_button').find('img').attr('src','/statics/images/zb/stop.gif');
		  }

	  })
	</script>
	<!--播放器-->

    <div class="box hov">
      <div class="swiper-container" id="swiper-container_ckxm_11">

        <div class="swiper-wrapper">
         <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=e85ee5c2c993d5e064cdea3277dab9aa&sql=SELECT+%2A+FROM+%60zb_xwzx%60+WHERE+lei%3D%27%E4%B8%AD%E5%8D%9A%E5%8A%9B%E9%87%8F%27+and+status_del%3D0+ORDER+BY+paixu+DESC&num=10\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM `zb_xwzx` WHERE lei='中博力量' and status_del=0 ORDER BY paixu DESC LIMIT 10");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
          <div class="swiper-slide">
            <ul>
              <li>
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[0]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden" /></span> <span class="span2"><?php echo $data['0']['title'];?></span> <span class="span3"><?php echo $data['0']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[0]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[0]['jianjie'],0,32);?><i class="i2"></i></span> <a href="/statics/images//zb/mp3/biglv.mp3"  class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li>
              <?php if($data[1]['title']!='') { ?>
              <li class="li2 li3">
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[1]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden"/></span> <span class="span2"><?php echo $data['1']['title'];?></span> <span class="span3"><?php echo $data['1']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[1]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[1]['jianjie'],0,32);?><i class="i2"></i></span> <a href="<?php echo $data['1']['files'];?>" class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li><?php } ?><?php if($data[2]['title']!='') { ?>
              <li>
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[2]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden"/></span> <span class="span2"><?php echo $data['2']['title'];?></span> <span class="span3"><?php echo $data['2']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[2]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[2]['jianjie'],0,32);?><i class="i2"></i></span> <a href="<?php echo $data['2']['files'];?>" class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li><?php } ?><?php if($data[3]['title']!='') { ?>
              <li class="li2">
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[3]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden"/></span> <span class="span2"><?php echo $data['3']['title'];?></span> <span class="span3"><?php echo $data['3']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[3]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[3]['jianjie'],0,32);?><i class="i2"></i></span> <a href="<?php echo $data['3']['files'];?>" class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li><?php } ?><?php if($data[4]['title']!='') { ?>
              <li>
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[4]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden"/></span> <span class="span2"><?php echo $data['4']['title'];?></span> <span class="span3"><?php echo $data['4']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[4]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[4]['jianjie'],0,32);?><i class="i2"></i></span> <a href="<?php echo $data['4']['files'];?>" class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li><?php } ?>
            </ul>
          </div><?php if($data[5]['title']!='') { ?>
          <div class="swiper-slide">
            <ul>
              <li>
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[5]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden"/></span> <span class="span2"><?php echo $data['5']['title'];?></span> <span class="span3"><?php echo $data['5']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[5]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[5]['jianjie'],0,32);?><i class="i2"></i></span> <a href="<?php echo $data['5']['files'];?>" class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li><?php if($data[6]['title']!='') { ?>
              <li class="li2 li3">
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[6]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden"/></span> <span class="span2"><?php echo $data['6']['title'];?></span> <span class="span3"><?php echo $data['6']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[6]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[6]['jianjie'],0,32);?><i class="i2"></i></span> <a href="<?php echo $data['6']['files'];?>" class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li><?php } ?><?php if($data[7]['title']!='') { ?>
              <li>
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[7]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden"/></span> <span class="span2"><?php echo $data['7']['title'];?></span> <span class="span3"><?php echo $data['7']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[7]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[7]['jianjie'],0,32);?><i class="i2"></i></span> <a href="<?php echo $data['7']['files'];?>" class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li><?php } ?><?php if($data[8]['title']!='') { ?>
              <li class="li2">
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[8]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden"/></span> <span class="span2"><?php echo $data['8']['title'];?></span> <span class="span3"><?php echo $data['8']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[8]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[8]['jianjie'],0,32);?><i class="i2"></i></span> <a href="<?php echo $data['8']['files'];?>" class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li><?php } ?><?php if($data[9]['title']!='') { ?>
              <li>
                <div class="li_box">
                  <div class="left"> <span class="span1"><img src="<?php echo cutimg($data[9]['pic'],84,84,5);?>" style="border-radius: 50%; overflow: hidden"/></span> <span class="span2"><?php echo $data['9']['title'];?></span> <span class="span3"><?php echo $data['9']['summer'];?></span> </div>
                  <div class="right"> <span class="span1"><?php echo intercept($data[9]['keywords'],0,32);?></span> <span class="span2"><i></i>寄语：<?php echo intercept($data[9]['jianjie'],0,32);?><i class="i2"></i></span> <a href="<?php echo $data['9']['files'];?>" class="more1 music_button"><img src="<?php echo IMG_PATH;?>zb/stop.gif"></a> </div>
                  <div class="clear"></div>
                </div>
              </li><?php } ?>
            </ul>
          </div><?php } ?>
          <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </div>
        <div class="pagination"></div>
      </div>
      <a href="#" class="arrow-left"></a> <a href="#" class="arrow-right"></a> </div>
  </div>
  <!--end ckxm_b11-->
  <div class="jt_jxj_titMiddle">中博教育坚持奖励认真学习的人</div>
  <div class="center">
    <ul class="jt_jxj_jxj cl">
      <li class="l_fl">
        <div class="l_box">
          <?php echo $scholarship['first'];?>
        </div>
      </li>
      <li class="l_fl">
        <div class="l_box">
          <?php echo $scholarship['second'];?>
        </div>
      </li>
    </ul>
  </div>
</div>

<?php include template("content","footer"); ?>
</body>
</html>
