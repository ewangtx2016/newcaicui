<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><div class="jtin_top">
  <div class="jt_head_box">
    <div class="logo"> <a class="logo1" href="/"><img src="<?php echo IMG_PATH;?>zb/ywin_logo.png"/></a> <span class="logo2"><img src="<?php echo IMG_PATH;?>zb/jt_dy.png"/></span> </div>
    <div class="right">
      <div class="nav">
        <ul>
          <li><a href="/">首页</a></li>
          <li> <a href="/partners.html"<?php echo ban_now($_SERVER['REQUEST_URI'],',partners,education,development,enterprise,job,jobs,teacher,teachers,contactus');?>>关于中博</a>
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
          <li> <a href="/business.html"<?php echo ban_now($_SERVER['REQUEST_URI'],',business');?>>业务体系</a></li>
          <li> <a href="/qydt.html"<?php echo ban_now($_SERVER['REQUEST_URI'],',qydt,qydts,mtbd,mtbds,zyhd,zyhds');?>>新闻中心</a>
            <ol>
              <li><a href="/qydt.html">企业动态</a></li>
              <li><a href="/mtbd.html">媒体报道</a></li>
              <li><a href="/zyhd.html">重要活动</a></li>
            </ol>
          </li>
          <li> <a href="/founder.html"<?php echo ban_now($_SERVER['REQUEST_URI'],',founder,welfare,welfares,scholarship');?>>社会责任</a>
            <ol>
              <li><a href="/founder.html">创始人寄语</a></li>
              <li><a href="/welfare.html">社会公益</a></li>
              <li><a href="/scholarship.html">奖学金</a></li>
            </ol>
          </li>
        </ul>
	  </div>
      <div class="right_r"> <a>找课程</a> <span><?php echo website('tel');?></span> </div>
    </div>
  </div>
</div>