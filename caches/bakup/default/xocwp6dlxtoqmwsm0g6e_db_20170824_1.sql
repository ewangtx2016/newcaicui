# phpcms bakfile
# version:PHPCMS V9
# time:2017-08-24 11:54:49
# type:phpcms
# phpcms:http://www.phpcms.cn
# --------------------------------------------------------


DROP TABLE IF EXISTS `zb_admin`;
CREATE TABLE `zb_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `zb_admin` VALUES('1','admin','5e45ce36dff975a0200ad7bbfe4b0184','1','j1Nzvw','43.246.229.178','1503546859','admin@admin.com','','','');
INSERT INTO `zb_admin` VALUES('2','zhangli','d2fbf30b0863df4ae718599ed622ecc1','1','qGtEdQ','124.205.176.178','1503538573','yoyo.zhang@zbglobal.cn','张莉','','');
INSERT INTO `zb_admin` VALUES('3','liyu','5ff4c1fa9a4251e53d8dfe8d0c5bdcdc','1','26EtWL','124.205.176.178','1503538437','yu.li@zbglobal.cn','李宇','','');
INSERT INTO `zb_admin` VALUES('4','zhaohui','63d96957687893ed9229dce396691fdd','1','m1Cmik','124.205.176.178','1503538479','dennis.zhao@zbglobal.cn','赵辉','','');
INSERT INTO `zb_admin` VALUES('5','wangzhenyu','6e0bf1bf5dec90903d494c3e038ca417','1','AZgmCV','','0','wangzhenyu@zbglobal.cn','王振宇','','');

DROP TABLE IF EXISTS `zb_admin_panel`;
CREATE TABLE `zb_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_admin_role`;
CREATE TABLE `zb_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `zb_admin_role` VALUES('1','超级管理员','超级管理员','0','0');
INSERT INTO `zb_admin_role` VALUES('2','站点管理员','站点管理员','0','1');
INSERT INTO `zb_admin_role` VALUES('7','发布人员','发布人员','0','1');

DROP TABLE IF EXISTS `zb_admin_role_priv`;
CREATE TABLE `zb_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_announce`;
CREATE TABLE `zb_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_attachment`;
CREATE TABLE `zb_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

INSERT INTO `zb_attachment` VALUES('1','info','0','5.jpg','2017/0819/20170819101013774.jpg','187171','jpg','1','0','0','1','1503108613','115.33.53.210','0','eb8e3d763e1299f8962e6791e8901359','1');
INSERT INTO `zb_attachment` VALUES('2','info','0','6.png','2017/0819/20170819101231419.png','545570','png','1','0','0','1','1503108751','115.33.53.210','0','28edd116a6b94693f526504f89112c51','1');
INSERT INTO `zb_attachment` VALUES('3','info','0','6.png','2017/0819/20170819101314891.png','545570','png','1','0','0','1','1503108794','115.33.53.210','0','c207dfd8c58565d917bb90a99f0c04fe','1');
INSERT INTO `zb_attachment` VALUES('4','info','0','7.png','2017/0819/20170819101346963.png','261580','png','1','0','0','1','1503108826','115.33.53.210','0','8243b7632380a49cff119fbc0eb370c2','1');
INSERT INTO `zb_attachment` VALUES('5','info','0','8.png','2017/0819/20170819101536719.png','579087','png','1','0','0','1','1503108936','115.33.53.210','0','dede0d3cb872e0617d48ec49a71e02bc','1');
INSERT INTO `zb_attachment` VALUES('6','info','0','9.png','2017/0819/20170819101624936.png','533975','png','1','0','0','1','1503108984','115.33.53.210','0','b2b68e9243ee4a3ffff44b18eccdd2bb','1');
INSERT INTO `zb_attachment` VALUES('7','info','0','10.png','2017/0819/20170819101651237.png','581806','png','1','0','0','1','1503109011','115.33.53.210','0','e4725bdaf42990b80f23a9ddd47dc419','1');
INSERT INTO `zb_attachment` VALUES('8','info','0','11.png','2017/0819/20170819101834221.png','184978','png','1','0','0','1','1503109114','115.33.53.210','0','1d99760b1016ec4dd10ac997d1032fcf','1');
INSERT INTO `zb_attachment` VALUES('9','info','0','1.jpg','2017/0819/20170819102240777.jpg','103032','jpg','1','0','0','1','1503109360','115.33.53.210','0','a2f60db8f8ba27ee7a6c5326f98444c2','1');
INSERT INTO `zb_attachment` VALUES('10','info','0','2.jpg','2017/0819/20170819102342465.jpg','93462','jpg','1','0','0','1','1503109422','115.33.53.210','0','8d5024e4a9f0e2fa16281def6c1b9143','1');
INSERT INTO `zb_attachment` VALUES('11','info','0','3.jpg','2017/0819/20170819102507488.jpg','81307','jpg','1','0','0','1','1503109507','115.33.53.210','0','fdcbd5f89986f48c56ffa4dd8d9ea5c2','1');
INSERT INTO `zb_attachment` VALUES('12','info','0','3.jpg','2017/0819/20170819102535916.jpg','81307','jpg','1','0','0','1','1503109535','115.33.53.210','0','5bef2e549d35744f9ecd244319d7d24d','1');
INSERT INTO `zb_attachment` VALUES('13','info','0','4.jpg','2017/0819/20170819102808597.jpg','159698','jpg','1','0','0','1','1503109688','115.33.53.210','0','75336ee2c66590a5015216d29acb9781','1');
INSERT INTO `zb_attachment` VALUES('14','info','0','5.jpg','2017/0819/20170819102907463.jpg','150889','jpg','1','0','0','1','1503109747','115.33.53.210','0','96c47ce7796a594d0d209367bc0c8a59','1');
INSERT INTO `zb_attachment` VALUES('15','info','0','6.jpg','2017/0819/20170819103014423.jpg','139571','jpg','1','0','0','1','1503109814','115.33.53.210','0','5743dcfe2d71d141bc2c4ac7ecc0fe37','1');
INSERT INTO `zb_attachment` VALUES('16','info','0','7.jpg','2017/0819/20170819103118633.jpg','131701','jpg','1','0','0','1','1503109878','115.33.53.210','0','c1beee1b4aa4f878fc52bc860cf6459e','1');
INSERT INTO `zb_attachment` VALUES('17','info','0','8.jpg','2017/0819/20170819103206163.jpg','153192','jpg','1','0','0','1','1503109926','115.33.53.210','0','b0dfc66705178e9fc6cb518d7e151cde','1');
INSERT INTO `zb_attachment` VALUES('18','info','0','9.jpg','2017/0819/20170819103257730.jpg','182041','jpg','1','0','0','1','1503109977','115.33.53.210','0','c38f797d25d25fdc908c303c69cf2a3c','1');
INSERT INTO `zb_attachment` VALUES('19','info','0','双十二静态.jpg','2017/0819/20170819104409161.jpg','1232947','jpg','1','0','0','1','1503110649','115.33.53.210','0','916ad35b4eb9c39b773db8572f672813','1');
INSERT INTO `zb_attachment` VALUES('20','info','0','2.jpg','2017/0819/20170819104631260.jpg','87212','jpg','1','0','0','1','1503110791','115.33.53.210','0','a8e7217670c2b49f6396a7f749006232','1');
INSERT INTO `zb_attachment` VALUES('21','info','0','1.jpg','2017/0819/20170819105011431.jpg','576248','jpg','1','0','0','1','1503111011','115.33.53.210','0','f995382b41beb525017651d959292d0b','1');
INSERT INTO `zb_attachment` VALUES('22','info','0','2.jpg','2017/0819/20170819105056949.jpg','138759','jpg','1','0','0','1','1503111056','115.33.53.210','0','cd660a0d1f8777c263acd612ff299930','1');
INSERT INTO `zb_attachment` VALUES('23','info','0','3.jpg','2017/0819/20170819105132948.jpg','337053','jpg','1','0','0','1','1503111092','115.33.53.210','0','6b6f1fd1018e05dbbb9845d550956611','1');
INSERT INTO `zb_attachment` VALUES('24','info','0','4.jpg','2017/0819/20170819105205817.jpg','85050','jpg','1','0','0','1','1503111125','115.33.53.210','0','6332938e10d70e029afdfdc64be8d7e3','1');
INSERT INTO `zb_attachment` VALUES('25','info','0','5.jpg','2017/0819/20170819105231254.jpg','304114','jpg','1','0','0','1','1503111151','115.33.53.210','0','56e6d03e2dd981a451c3a45fde63b110','1');
INSERT INTO `zb_attachment` VALUES('26','info','0','6.jpg','2017/0819/20170819105312488.jpg','282472','jpg','1','0','0','1','1503111192','115.33.53.210','0','bd6a3ba517fd9ab38284b6c00a01de7e','1');
INSERT INTO `zb_attachment` VALUES('27','info','0','w1jpg.jpg','2017/0819/20170819105930214.jpg','171500','jpg','1','0','0','1','1503111570','115.33.53.210','0','042ede3ec29877972ca02017ea7d662b','1');
INSERT INTO `zb_attachment` VALUES('28','info','0','w2.jpg','2017/0819/20170819105949456.jpg','307182','jpg','1','0','0','1','1503111589','115.33.53.210','0','180ead0d691e9c0e04fd19cb6063dafc','1');
INSERT INTO `zb_attachment` VALUES('29','info','0','w3.jpg','2017/0819/20170819110004576.jpg','429627','jpg','1','0','0','1','1503111604','115.33.53.210','0','24813ffc44abfa7a58a0a9612008a58e','1');
INSERT INTO `zb_attachment` VALUES('30','info','0','w4.jpg','2017/0819/20170819110022100.jpg','277459','jpg','1','0','0','1','1503111622','115.33.53.210','0','5f2208f3849d3cc870b6d0b7340fa149','1');
INSERT INTO `zb_attachment` VALUES('31','info','0','w5.jpg','2017/0819/20170819110035202.jpg','146553','jpg','1','0','0','1','1503111635','115.33.53.210','0','d957857b695a209de0eb8a6e293ebc9a','1');
INSERT INTO `zb_attachment` VALUES('32','info','0','w6.jpg','2017/0819/20170819110049658.jpg','195980','jpg','1','0','0','1','1503111649','115.33.53.210','0','58b3f1055da5d5a656c30503a2a20fe0','1');
INSERT INTO `zb_attachment` VALUES('33','info','0','w7.jpg','2017/0819/20170819110102859.jpg','184367','jpg','1','0','0','1','1503111662','115.33.53.210','0','09eaf7450b4eb39b3b99dd8e5dc0a8d0','1');
INSERT INTO `zb_attachment` VALUES('34','info','0','雅安1.png','2017/0819/20170819121842274.png','542968','png','1','0','0','1','1503116322','115.33.53.210','0','bc809a9a9c013119bbe8acf0edb88b69','1');
INSERT INTO `zb_attachment` VALUES('35','info','0','雅安2.png','2017/0819/20170819121939105.png','124183','png','1','0','0','1','1503116379','115.33.53.210','0','d7065a943ef401c7941ab416234fd73d','1');
INSERT INTO `zb_attachment` VALUES('36','info','0','雅安3.png','2017/0819/20170819122118425.png','905505','png','1','0','0','1','1503116478','115.33.53.210','0','53d4a9d774191a07b6e8ac09b7dddb17','1');
INSERT INTO `zb_attachment` VALUES('37','info','0','雅安4.png','2017/0819/20170819122235949.png','681015','png','1','0','0','1','1503116555','115.33.53.210','0','49e651ac0e01c1674e133865cfac8143','1');
INSERT INTO `zb_attachment` VALUES('38','info','0','雅安5.png','2017/0819/20170819122422767.png','759975','png','1','0','0','1','1503116662','115.33.53.210','0','4eaa86b430dc4518daaad7c5ea115d29','1');
INSERT INTO `zb_attachment` VALUES('39','info','0','雅安6.png','2017/0819/20170819122553720.png','652860','png','1','0','0','1','1503116753','115.33.53.210','0','266942014b17a4cec0c0861c266607f7','1');
INSERT INTO `zb_attachment` VALUES('40','info','0','雅安7.png','2017/0819/20170819122712195.png','847366','png','1','0','0','1','1503116832','115.33.53.210','0','f38d7666313d89fa4a87d83adf6a3eca','1');
INSERT INTO `zb_attachment` VALUES('41','info','0','雅安8.png','2017/0819/20170819122821994.png','750248','png','1','0','0','1','1503116901','115.33.53.210','0','3164b19488017724a466dbff2e657fbc','1');
INSERT INTO `zb_attachment` VALUES('42','info','0','玉树.jpg','2017/0819/20170819124835468.jpg','41090','jpg','1','0','0','1','1503118115','115.33.53.210','0','df653e1c7ab55e68029e05df63a3aa4a','1');
INSERT INTO `zb_attachment` VALUES('43','info','0','少数民族.jpg','2017/0819/20170819125552245.jpg','23676','jpg','1','0','0','1','1503118552','115.33.53.210','0','1c8539186756532f52cc49dd2b55333e','1');
INSERT INTO `zb_attachment` VALUES('44','info','0','学校.jpg','2017/0819/20170819010308387.jpg','29743','jpg','1','0','0','1','1503118988','115.33.53.210','0','ac577b67592b98f7c7fcc56aba00c5fb','1');

DROP TABLE IF EXISTS `zb_attachment_index`;
CREATE TABLE `zb_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_badword`;
CREATE TABLE `zb_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_block`;
CREATE TABLE `zb_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_block_history`;
CREATE TABLE `zb_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_block_priv`;
CREATE TABLE `zb_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_cache`;
CREATE TABLE `zb_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `zb_cache` VALUES('mood_program.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'震惊\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'不解\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'愤怒\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'杯具\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'无聊\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'高兴\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'支持\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'超赞\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('category_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  9 => \'1\',\n  10 => \'1\',\n  11 => \'1\',\n  12 => \'1\',\n  13 => \'1\',\n);\n?>');
INSERT INTO `zb_cache` VALUES('category_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  9 => \n  array (\n    \'catid\' => \'9\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'9,13\',\n    \'catname\' => \'关于中博\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'aboutus\',\n    \'url\' => \'http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=9\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'9\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'guanyuzhongbo\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  10 => \n  array (\n    \'catid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'10\',\n    \'catname\' => \'业务体系\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'business\',\n    \'url\' => \'http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=10\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'10\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'yewutixi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  11 => \n  array (\n    \'catid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'11\',\n    \'catname\' => \'新闻中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'news\',\n    \'url\' => \'http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=11\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'11\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xinwenzhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  12 => \n  array (\n    \'catid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'12\',\n    \'catname\' => \'社会责任\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'responsibility\',\n    \'url\' => \'http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=12\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'12\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shehuizeren\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  13 => \n  array (\n    \'catid\' => \'13\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'9\',\n    \'arrparentid\' => \'0,9\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'13\',\n    \'catname\' => \'企业简介\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'/\',\n    \'catdir\' => \'introduction\',\n    \'url\' => \'http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=13\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'13\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'qiyejianjie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('type_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('type_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('vote.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'default_style\' => \'default\',\n    \'vote_tp_template\' => \'vote_tp\',\n    \'allowguest\' => \'1\',\n    \'enabled\' => \'1\',\n    \'interval\' => \'1\',\n    \'credit\' => \'1\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('link.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('sitelist.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'默认站点\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://zb.php.xmfeel.com/\',\n    \'site_title\' => \'PHPCMS演示站\',\n    \'keywords\' => \'PHPCMS演示站\',\n    \'description\' => \'PHPCMS演示站\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'default\',\n    \'template\' => \'default\',\n    \'setting\' => \'array (\n  \\\'upload_maxsize\\\' => \\\'2048\\\',\n  \\\'upload_allowext\\\' => \\\'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\\\',\n  \\\'watermark_enable\\\' => \\\'1\\\',\n  \\\'watermark_minwidth\\\' => \\\'300\\\',\n  \\\'watermark_minheight\\\' => \\\'300\\\',\n  \\\'watermark_img\\\' => \\\'/statics/images/water/mark.png\\\',\n  \\\'watermark_pct\\\' => \\\'85\\\',\n  \\\'watermark_quality\\\' => \\\'80\\\',\n  \\\'watermark_pos\\\' => \\\'9\\\',\n)\',\n    \'uuid\' => \'0c41704b-8164-11e7-818a-00163e06d297\',\n    \'url\' => \'http://zb.php.xmfeel.com/\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('downservers.cache.php','caches_commons/caches_data/','<?php\nreturn NULL;\n?>');
INSERT INTO `zb_cache` VALUES('badword.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('ipbanned.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('keylink.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('position.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'4\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页焦点图推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'1\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  16 => \n  array (\n    \'posid\' => \'16\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页每日热点\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  15 => \n  array (\n    \'posid\' => \'15\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  14 => \n  array (\n    \'posid\' => \'14\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  12 => \n  array (\n    \'posid\' => \'12\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页图片推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  10 => \n  array (\n    \'posid\' => \'10\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目首页推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  9 => \n  array (\n    \'posid\' => \'9\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'网站顶部推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  8 => \n  array (\n    \'posid\' => \'8\',\n    \'modelid\' => \'30\',\n    \'catid\' => \'54\',\n    \'name\' => \'图片频道首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  5 => \n  array (\n    \'posid\' => \'5\',\n    \'modelid\' => \'69\',\n    \'catid\' => \'0\',\n    \'name\' => \'推荐下载\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  13 => \n  array (\n    \'posid\' => \'13\',\n    \'modelid\' => \'82\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  17 => \n  array (\n    \'posid\' => \'17\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频栏目精彩推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('role_siteid.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('role.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'超级管理员\',\n);\n?>');
INSERT INTO `zb_cache` VALUES('bakup_tables.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  0 => \'zb_admin\',\n  1 => \'zb_admin_panel\',\n  2 => \'zb_admin_role\',\n  3 => \'zb_admin_role_priv\',\n  4 => \'zb_announce\',\n  5 => \'zb_attachment\',\n  6 => \'zb_attachment_index\',\n  7 => \'zb_badword\',\n  8 => \'zb_block\',\n  9 => \'zb_block_history\',\n  10 => \'zb_block_priv\',\n  11 => \'zb_cache\',\n  12 => \'zb_category\',\n  13 => \'zb_category_priv\',\n  14 => \'zb_collection_content\',\n  15 => \'zb_collection_history\',\n  16 => \'zb_collection_node\',\n  17 => \'zb_collection_program\',\n  18 => \'zb_comment\',\n  19 => \'zb_comment_check\',\n  20 => \'zb_comment_data_1\',\n  21 => \'zb_comment_setting\',\n  22 => \'zb_comment_table\',\n  23 => \'zb_content_check\',\n  24 => \'zb_copyfrom\',\n  25 => \'zb_create\',\n  26 => \'zb_datacall\',\n  27 => \'zb_dbsource\',\n  28 => \'zb_download\',\n  29 => \'zb_download_data\',\n  30 => \'zb_downservers\',\n  31 => \'zb_extend_setting\',\n  32 => \'zb_favorite\',\n  33 => \'zb_gyzb\',\n  34 => \'zb_gyzb_cxjy\',\n  35 => \'zb_gyzb_fb\',\n  36 => \'zb_gyzb_fzlc\',\n  37 => \'zb_gyzb_hzhb\',\n  38 => \'zb_gyzb_job\',\n  39 => \'zb_gyzb_qyry\',\n  40 => \'zb_gyzb_sztd\',\n  41 => \'zb_hits\',\n  42 => \'zb_ipbanned\',\n  43 => \'zb_keylink\',\n  44 => \'zb_keyword\',\n  45 => \'zb_keyword_data\',\n  46 => \'zb_link\',\n  47 => \'zb_linkage\',\n  48 => \'zb_log\',\n  49 => \'zb_member\',\n  50 => \'zb_member_detail\',\n  51 => \'zb_member_group\',\n  52 => \'zb_member_menu\',\n  53 => \'zb_member_verify\',\n  54 => \'zb_member_vip\',\n  55 => \'zb_menu\',\n  56 => \'zb_message\',\n  57 => \'zb_message_data\',\n  58 => \'zb_message_group\',\n  59 => \'zb_model\',\n  60 => \'zb_model_field\',\n  61 => \'zb_module\',\n  62 => \'zb_mood\',\n  63 => \'zb_news\',\n  64 => \'zb_news_data\',\n  65 => \'zb_page\',\n  66 => \'zb_pay_account\',\n  67 => \'zb_pay_payment\',\n  68 => \'zb_pay_spend\',\n  69 => \'zb_picture\',\n  70 => \'zb_picture_data\',\n  71 => \'zb_position\',\n  72 => \'zb_position_data\',\n  73 => \'zb_poster\',\n  74 => \'zb_poster_201708\',\n  75 => \'zb_poster_space\',\n  76 => \'zb_queue\',\n  77 => \'zb_release_point\',\n  78 => \'zb_search\',\n  79 => \'zb_search_keyword\',\n  80 => \'zb_session\',\n  81 => \'zb_set\',\n  82 => \'zb_shzr\',\n  83 => \'zb_site\',\n  84 => \'zb_sms_report\',\n  85 => \'zb_special\',\n  86 => \'zb_special_c_data\',\n  87 => \'zb_special_content\',\n  88 => \'zb_sphinx_counter\',\n  89 => \'zb_sso_admin\',\n  90 => \'zb_sso_applications\',\n  91 => \'zb_sso_members\',\n  92 => \'zb_sso_messagequeue\',\n  93 => \'zb_sso_session\',\n  94 => \'zb_sso_settings\',\n  95 => \'zb_tag\',\n  96 => \'zb_template_bak\',\n  97 => \'zb_times\',\n  98 => \'zb_type\',\n  99 => \'zb_urlrule\',\n  100 => \'zb_video\',\n  101 => \'zb_video_content\',\n  102 => \'zb_video_data\',\n  103 => \'zb_video_store\',\n  104 => \'zb_vote_data\',\n  105 => \'zb_vote_option\',\n  106 => \'zb_vote_subject\',\n  107 => \'zb_wap\',\n  108 => \'zb_wap_type\',\n  109 => \'zb_workflow\',\n  110 => \'zb_xwzx\',\n  111 => \'zb_ywtx\',\n  112 => \'zb_ywtx_city\',\n  113 => \'zb_zbll\',\n);\n?>');
INSERT INTO `zb_cache` VALUES('urlrules_detail.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('urlrules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `zb_cache` VALUES('modules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'admin_email\\\' => \\\'phpcms@phpcms.cn\\\',\n  \\\'adminaccessip\\\' => \\\'0\\\',\n  \\\'maxloginfailedtimes\\\' => \\\'8\\\',\n  \\\'maxiplockedtime\\\' => \\\'15\\\',\n  \\\'minrefreshtime\\\' => \\\'2\\\',\n  \\\'mail_type\\\' => \\\'1\\\',\n  \\\'mail_server\\\' => \\\'smtp.qq.com\\\',\n  \\\'mail_port\\\' => \\\'25\\\',\n  \\\'mail_user\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_auth\\\' => \\\'1\\\',\n  \\\'mail_from\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_password\\\' => \\\'\\\',\n  \\\'errorlog_size\\\' => \\\'20\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'10\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\\',\n  \\\'registerverifymessage\\\' => \\\' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'video\' => \n  array (\n    \'module\' => \'video\',\n    \'name\' => \'视频库\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2012-09-28\',\n    \'updatedate\' => \'2012-09-28\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-08-15\',\n    \'updatedate\' => \'2017-08-15\',\n  ),\n  \'comment\' => \n  array (\n    \'module\' => \'comment\',\n    \'name\' => \'评论\',\n    \'url\' => \'comment/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'评论\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-08-15\',\n    \'updatedate\' => \'2017-08-15\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'vote\' => \n  array (\n    \'module\' => \'vote\',\n    \'name\' => \'投票\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\r\n  1 => \r\n  array (\r\n    \\\'default_style\\\' => \\\'default\\\',\r\n    \\\'vote_tp_template\\\' => \\\'vote_tp\\\',\r\n    \\\'allowguest\\\' => \\\'1\\\',\r\n    \\\'enabled\\\' => \\\'1\\\',\r\n    \\\'interval\\\' => \\\'1\\\',\r\n    \\\'credit\\\' => \\\'1\\\',\r\n  ),\r\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'message\' => \n  array (\n    \'module\' => \'message\',\n    \'name\' => \'短消息\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'mood\' => \n  array (\n    \'module\' => \'mood\',\n    \'name\' => \'新闻心情\',\n    \'url\' => \'mood/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'新闻心情\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-08-15\',\n    \'updatedate\' => \'2017-08-15\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-08-15\',\n    \'updatedate\' => \'2017-08-15\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'表单向导\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'用户向我们提交了表单数据，赶快去看看吧。\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'wap\' => \n  array (\n    \'module\' => \'wap\',\n    \'name\' => \'手机门户\',\n    \'url\' => \'wap/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'手机门户\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-08-15\',\n    \'updatedate\' => \'2017-08-15\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'在线升级\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'标签向导\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'标签向导\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-08-15\',\n    \'updatedate\' => \'2017-08-15\',\n  ),\n  \'sms\' => \n  array (\n    \'module\' => \'sms\',\n    \'name\' => \'短信平台\',\n    \'url\' => \'sms/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'短信平台\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-09-02\',\n    \'updatedate\' => \'2011-09-02\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('workflow_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('member_model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `zb_cache` VALUES('special.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('common.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
INSERT INTO `zb_cache` VALUES('category_items_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('category_items_2.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('category_items_3.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `zb_cache` VALUES('category_items_11.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');

DROP TABLE IF EXISTS `zb_category`;
CREATE TABLE `zb_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO `zb_category` VALUES('10','1','content','1','0','0','0','0','10','业务体系','','','','','business','http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=10','0','0','{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}','10','1','0','yewutixi','');
INSERT INTO `zb_category` VALUES('11','1','content','1','0','0','0','0','11','新闻中心','','','','','news','http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=11','0','0','{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}','11','1','0','xinwenzhongxin','');
INSERT INTO `zb_category` VALUES('12','1','content','1','0','0','0','0','12','社会责任','','','','','responsibility','http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=12','0','0','{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}','12','1','0','shehuizeren','');
INSERT INTO `zb_category` VALUES('13','1','content','1','0','9','0,9','0','13','企业简介','','','','/','introduction','http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=13','0','0','{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}','13','1','0','qiyejianjie','');
INSERT INTO `zb_category` VALUES('9','1','content','1','0','0','0','1','9,13','关于中博','','','','','aboutus','http://zb.php.xmfeel.com/index.php?m=content&c=index&a=lists&catid=9','0','0','{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}','9','1','0','guanyuzhongbo','');

DROP TABLE IF EXISTS `zb_category_priv`;
CREATE TABLE `zb_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_collection_content`;
CREATE TABLE `zb_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_collection_history`;
CREATE TABLE `zb_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_collection_node`;
CREATE TABLE `zb_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_collection_program`;
CREATE TABLE `zb_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_comment`;
CREATE TABLE `zb_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `display_type` tinyint(1) DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_comment_check`;
CREATE TABLE `zb_comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '论评ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '数据存储表ID',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_comment_data_1`;
CREATE TABLE `zb_comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '评论ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `creat_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `ip` varchar(15) DEFAULT NULL COMMENT '用户IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `direction` tinyint(1) DEFAULT '0' COMMENT '评论方向{0:无方向,1:正文,2:反方,3:中立}',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为回复',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_comment_setting`;
CREATE TABLE `zb_comment_setting` (
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `guest` tinyint(1) DEFAULT '0' COMMENT '是否允许游客评论',
  `check` tinyint(1) DEFAULT '0' COMMENT '是否需要审核',
  `code` tinyint(1) DEFAULT '0' COMMENT '是否开启验证码',
  `add_point` tinyint(3) unsigned DEFAULT '0' COMMENT '添加的积分数',
  `del_point` tinyint(3) unsigned DEFAULT '0' COMMENT '扣除的积分数',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `zb_comment_setting` VALUES('1','0','0','0','0','0');

DROP TABLE IF EXISTS `zb_comment_table`;
CREATE TABLE `zb_comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表ID号',
  `total` int(10) unsigned DEFAULT '0' COMMENT '数据总量',
  `creat_at` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `zb_comment_table` VALUES('1','0','0');

DROP TABLE IF EXISTS `zb_content_check`;
CREATE TABLE `zb_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_copyfrom`;
CREATE TABLE `zb_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_create`;
CREATE TABLE `zb_create` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lei` varchar(50) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `jianjie` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `pic2` varchar(200) NOT NULL,
  `url` varchar(255) NOT NULL,
  `paixu` int(6) NOT NULL DEFAULT '0',
  `one` varchar(255) NOT NULL,
  `english` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_create` VALUES('1','关于中博','关于中博','关于中博','关于中博1','uploadfile/img/2017/0818/150305049516836.jpg','','','0','关于中博','about us','1502853629','1','1503050502','1','0');
INSERT INTO `zb_create` VALUES('2','业务体系','业务体系','业务体系','业务体系2','uploadfile/img/2017/0818/150305031058646.jpg','','','0','业务体系','BUSINESS SEGMENT','1502853629','1','1503050316','1','0');
INSERT INTO `zb_create` VALUES('3','新闻中心','新闻中心','新闻中心','新闻中心1','uploadfile/img/2017/0818/150304980759032.jpg','','','0','新闻中心','news','1502853629','1','1503050030','1','0');
INSERT INTO `zb_create` VALUES('4','社会责任','社会责任','社会责任','社会责任222','uploadfile/img/2017/0818/150304962847212.jpg','','','0','社会责任','english','1502853629','1','1503049678','1','0');
INSERT INTO `zb_create` VALUES('5','首页','','','11111','statics/gyzb/2017/0819/20170819101708_655.jpg','statics/gyzb/2017/0819/20170819101708_119.png','#','1','','','1503109028','1','1503109028','1','0');
INSERT INTO `zb_create` VALUES('6','首页','','','22222','statics/gyzb/2017/0819/20170819102221_925.jpg','statics/gyzb/2017/0819/20170819102221_750.png','#','2','','','1503109341','1','1503109341','1','0');
INSERT INTO `zb_create` VALUES('7','中博业务','','就业培训就业培训就业培训就业培训就业培训','','uploadfile/img/2017/0819/150311043385774.jpg','','#','1','就业培训','english','1503110452','1','1503110452','1','0');
INSERT INTO `zb_create` VALUES('8','中博旗下子公司','','旗下子公司旗下子公司','','uploadfile/img/2017/0819/150311318362890.png','','#','0','旗下子公司','','1503113210','1','1503113210','1','0');

DROP TABLE IF EXISTS `zb_datacall`;
CREATE TABLE `zb_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_dbsource`;
CREATE TABLE `zb_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_download`;
CREATE TABLE `zb_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_download_data`;
CREATE TABLE `zb_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_downservers`;
CREATE TABLE `zb_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_extend_setting`;
CREATE TABLE `zb_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_favorite`;
CREATE TABLE `zb_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_gyzb`;
CREATE TABLE `zb_gyzb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL,
  `jianjie` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `one` varchar(255) NOT NULL,
  `english` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_gyzb` VALUES('1','中博北京总部','中博北京总部联系方式','中博教育北京总部','uploadfile/img/2017/0819/150311208962301.png','','','中博教育<span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);\">北京总部<br />\r\n北京市海淀区北三环西路甲30号</span><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);\">双天大厦308室</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\" />\r\n<br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\" />\r\n<br />\r\n','1503121962','1');
INSERT INTO `zb_gyzb` VALUES('2','加入中博2','加入中博3','和厉害的人一起，做正确的事儿！','','和厉害的人一起，做正确的事儿！','Do Right Things Together','<b>寻找有理想而不理想化的你<br />\r\n有这样一群人，他们怀揣着梦想，聚集在一起，用自身的学识传递教育的价值。加入中博，我们希望每一位中博人都成为这个时代的中流砥。</b>','1503111420','1');

DROP TABLE IF EXISTS `zb_gyzb_cxjy`;
CREATE TABLE `zb_gyzb_cxjy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL,
  `jianjie` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `paixu` int(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_gyzb_cxjy` VALUES('1','这是一个创新,这是一个创新','这是一个创新这是一个创新这是一个创新这是一个创新','这是一个创新','uploadfile/img/2017/0815/150277952747682.jpg','这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新这是一个创新','0','1502779544','1','1502853629','1','0');
INSERT INTO `zb_gyzb_cxjy` VALUES('2','222','3443','111','','43434234','0','1502780521','1','1502780521','1','1');

DROP TABLE IF EXISTS `zb_gyzb_fb`;
CREATE TABLE `zb_gyzb_fb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `tel` varchar(200) NOT NULL,
  `fax` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` int(6) NOT NULL,
  `address` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  `paixu` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_gyzb_fb` VALUES('1','中博教育天津分部','010-62124859 62120842','010-62120859','student@zbglobal.cn','74','静海区文化路100号','1502786676','1','1503111122','1','1','0');
INSERT INTO `zb_gyzb_fb` VALUES('2','25424','3452','2345','243','1119','2435','1503046626','1','1503046626','1','1','0');
INSERT INTO `zb_gyzb_fb` VALUES('3','中博·天津','022-23246826；5861061','','tianjin_student@zbglobal.cn','72','天津市小白楼CBD（南京路和合肥道）富力中心A座1906室','1503111090','1','1503111870','1','0','0');
INSERT INTO `zb_gyzb_fb` VALUES('4','中博·唐山','03152792252 ，1813237','','tangshan@zbglobal.cn','564','河北省唐山市路北区唐山学院北校区（大学道9号）','1503111204','1','1503111204','1','0','0');
INSERT INTO `zb_gyzb_fb` VALUES('5','中博·广州','020-38662047','','guangzhou@zbglobal.cn','2229','广东省广州市天河区龙口中路194号307室','1503111281','1','1503111281','1','0','0');
INSERT INTO `zb_gyzb_fb` VALUES('6','中博·大连','0411-39022497','','dalian@zbglobal.cn','947','大连市沙河口区学苑广场1号大连软件园18号楼A区4层','1503111331','1','1503111331','1','0','0');
INSERT INTO `zb_gyzb_fb` VALUES('7','中博·上海','021-61992165','','shanghai_edu@zbglobal.cn','67','上海松江大学城文汇路1128弄大学城创业中心228室 ','1503111374','1','1503111374','1','0','0');
INSERT INTO `zb_gyzb_fb` VALUES('8','中博·昆明','15812121571','','kunming@zbglobal.cn','2729','云南省昆明市五华区龙泉路237号云南财经大学逸夫楼805','1503111774','1','1503111774','1','0','0');

DROP TABLE IF EXISTS `zb_gyzb_fzlc`;
CREATE TABLE `zb_gyzb_fzlc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `paixu` int(6) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_gyzb_fzlc` VALUES('1','2017','17','<div>2017年</div>\r\n','1502782408','1','1503116390','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('2','2016','16','2016年，截止2016年12月获得ACCA协会十项黄金级认证，成为中国十项黄金级认证的培训机构，并自主研发ACCA Helper，和全球著名出版集团Wiley就联合开发CFA和FRM教学教研工作达成战略合作；<br />\r\n','1502782422','1','1503116397','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('3','2004','4','2004年公司成立，并首次开发&ldquo;适合中国人自己的ACCA讲义&rdquo;；','1503115171','1','1503116498','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('4','2005','5','2005年首创ACCA在线网络学习课程，ACCA教育开始遍布全国；<br />\r\n','1503115236','1','1503116479','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('5','2006','6','2006年成为对外经济贸易大学ACCA方向班课程合作伙伴，将优质的ACCA课程带入大学正式课堂，迄今中博诚通已与中国149所大学形成战略合作伙伴关系；<br />\r\n','1503115259','1','1503116473','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('6','2007','7','2007年成为众多世界500强的企业内训课程合作伙伴；','1503115311','1','1503116467','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('7','2008','8','2008年被ACCA英国总部授予黄金级培训机构，成为全国第一批获得该荣誉的社会化培训机构；<br />\r\n','1503115335','1','1503116461','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('8','2009','9','年与爱尔兰格里菲斯学院签署合作协议，将ACCA学习与海外留学融为一体，迄今与英美法加多所优秀海外大学形成战略合作；<br />\r\n','1503115366','1','1503116453','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('9','2010','10','2010年中博诚通累计培训学员超过10000人次，迄今已有超过65,000人次的中国人学习到中博诚通优质课程；<br />\r\n','1503115388','1','1503116444','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('10','2011','11','2011年被ACCA英国总部授予ACCA机考中心资格，迄今中博诚通拥有39个机考中心，成为中国规模最大的机考中心；同年被美国管理会计师协会IMA授权为CMA培训机构，首次将CMA高端管理会计课程引入大学本科课堂；<br />\r\n','1503115436','1','1503116436','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('11','2012','12','2012年中博诚通成熟分部ACCA考试通过率首次由ACCA英国总部官方统计并全面超越全球通过率；被ICAEW英格兰及威尔士特许会计师协会总部授予授权ACA课程认证教学机构；同年，被CIMA皇家特许管理会计师公会认定为授权培训机构；<br />\r\n','1503115468','1','1503116430','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('12','2013','13','2013年中博诚通在全国新增了9所分部，迄今中博诚通在全国共有49所直营分部149个教学点；','1503115494','1','1503116424','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('13','2014','14','2014年中博诚通教学研发中心研究开发的ACCA习题集由长江出版社出版，是全球第一部完全由中国人编写的拥有完全自主知识产权的ACCA备考习题集；<br />\r\n','1503116066','1','1503116417','1','0');
INSERT INTO `zb_gyzb_fzlc` VALUES('14','2015','15','2015年中博教育获得ACCA协会6项黄金级认证，成为中国一家获得6项黄金级认证的培训机构；<br />\r\n','1503116098','1','1503116408','1','0');

DROP TABLE IF EXISTS `zb_gyzb_hzhb`;
CREATE TABLE `zb_gyzb_hzhb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `pic2` varchar(255) NOT NULL,
  `paixu` int(6) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_gyzb_hzhb` VALUES('1','山东理工大学','uploadfile/img/2017/0815/150278372768914.jpg','','3','','1502783728','1','1502783951','1','1');
INSERT INTO `zb_gyzb_hzhb` VALUES('2','阿德法撒旦法','uploadfile/img/2017/0815/150278374415744.jpg','','2','','1502783746','1','1502783944','1','1');
INSERT INTO `zb_gyzb_hzhb` VALUES('3','上海应用技术学院','uploadfile/img/2017/0819/150310362678569.jpg','','0','','1503103634','1','1503103634','1','0');
INSERT INTO `zb_gyzb_hzhb` VALUES('4','山东青年政治学院','uploadfile/img/2017/0819/150310379386781.jpg','','0','','1503103796','1','1503103796','1','0');
INSERT INTO `zb_gyzb_hzhb` VALUES('5','山东建筑大学','uploadfile/img/2017/0819/150310385710448.jpg','','0','','1503103859','1','1503103859','1','0');
INSERT INTO `zb_gyzb_hzhb` VALUES('6','山东科技大学','uploadfile/img/2017/0819/150310394285857.jpg','','0','','1503103945','1','1503103945','1','0');
INSERT INTO `zb_gyzb_hzhb` VALUES('7','山东财经大学','uploadfile/img/2017/0819/150310400578646.jpg','','0','','1503104007','1','1503104007','1','0');
INSERT INTO `zb_gyzb_hzhb` VALUES('8','中山大学','uploadfile/img/2017/0819/150310407688199.jpg','','0','','1503104078','1','1503104078','1','0');
INSERT INTO `zb_gyzb_hzhb` VALUES('9','青岛理工大学','uploadfile/img/2017/0819/150310416380635.jpg','','0','','1503104178','1','1503104178','1','1');
INSERT INTO `zb_gyzb_hzhb` VALUES('10','中原工学院','uploadfile/img/2017/0819/150310455373705.jpg','','0','','1503104562','1','1503104562','1','0');
INSERT INTO `zb_gyzb_hzhb` VALUES('11','中国传媒大学','uploadfile/img/2017/0819/150310464837627.jpg','','0','','1503104649','1','1503104649','1','0');
INSERT INTO `zb_gyzb_hzhb` VALUES('12','浙江财经大学','uploadfile/img/2017/0819/150310473049002.jpg','','0','','1503104732','1','1503104732','1','0');
INSERT INTO `zb_gyzb_hzhb` VALUES('13','天津外国语大学','uploadfile/img/2017/0819/150310481555678.jpg','','0','','1503104817','1','1503104817','1','0');

DROP TABLE IF EXISTS `zb_gyzb_job`;
CREATE TABLE `zb_gyzb_job` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) NOT NULL COMMENT '所属企业',
  `tag` text NOT NULL COMMENT '标签ID',
  `position` varchar(50) NOT NULL COMMENT '职位名称',
  `attribute` int(6) NOT NULL COMMENT '属性（0：实习；1：全职；2：兼职）',
  `money` varchar(50) NOT NULL COMMENT '薪资',
  `city` int(6) NOT NULL COMMENT '工作地点',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `worktime` varchar(50) NOT NULL COMMENT '工作时间',
  `education` varchar(50) NOT NULL COMMENT '学历要求',
  `num` varchar(20) NOT NULL COMMENT '招收人数',
  `endtime` int(11) NOT NULL COMMENT '招聘有效期',
  `retention` int(11) NOT NULL COMMENT '是否留用（0：否；1：是）',
  `introduce` text NOT NULL COMMENT '岗位介绍',
  `requirement` text NOT NULL COMMENT '任职要求',
  `duty` text NOT NULL COMMENT '岗位职责',
  `welfare` text NOT NULL COMMENT '职位福利',
  `hot` int(6) NOT NULL DEFAULT '0' COMMENT '状态（0：正常；1：加急）',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `moditime` int(11) NOT NULL COMMENT '修改时间',
  `adduser` int(6) NOT NULL COMMENT '发布人',
  `modiuser` int(6) NOT NULL COMMENT '修改人',
  `status_del` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_gyzb_job` VALUES('1','上云科技发展有限公司','0','PHP 程序员','1','6-8K','40','五里桥一街','早9点至晚6点','大专','2','0','1','岗位介绍岗位介绍岗位介绍','任职要求任职要求任职要求','岗位职责岗位职责岗位职责','带薪年假,五险一金,周末双休,123','0','1502790055','1503039782','1','1','1');
INSERT INTO `zb_gyzb_job` VALUES('2','中博教育','3362','咨询专员','1','面议','42','北京市海淀区北三环双天大厦','9:00 - 18:00','本科','20人','0','1','招聘课程咨询专员，负责咨询部日常运行工作；及时录入市场活动获取的学员名单，并做好分类统计以便后期跟进；学员提供深度咨询，分析潜在需求，挖掘意向学员，并为学员制定详细学习计划等工作！\r\n','1.大专及以上学历，经管、英语、教育、财经类专业优先；\r\n2.个性主动，思路敏捷，具有良好的沟通能力和亲和力；\r\n3.拥有高度责任感和客户服务意识；\r\n4.能够承受一定的工作压力；\r\n5.气质优雅、形象佳；\r\n6.英语良好优先考虑；\r\n7.能熟练使用OFFICE办公软件；\r\n8.有驾照者优先。','1.负责咨询部日常运行工作；\r\n2.及时录入市场活动获取的学员名单，并做好分类统计以便后期跟进；\r\n3.为学员提供深度咨询，分析潜在需求，挖掘意向学员，并为学员制定详细学习计划；\r\n4.通过网络，QQ，微信等不同渠道跟进不断改进学员服务质量，达到良好的售后管理和口碑。\r\n5.安排接待来访学员，并办理相关手续；','一、八小时工作制+双休+法定假日\r\n二、五险+公积金（转正后）\r\n三、工资+半年奖+年终奖\r\n四、员工宿舍+全身体检\r\n五、基础培训+能力培训+技术培训+量身定制发展通道\r\n六、宽松的环境+和谐的氛围+团结的团队\r\n七、生日Party+团队聚会+团队旅游\r\n八、薪资增涨+岗位晋升','0','1503111523','1503111523','1','1','0');
INSERT INTO `zb_gyzb_job` VALUES('3','中博教育','3362','行政专员','1','面议','42','北京市海淀区北三环双天大厦','9:00 - 18:00','本科','10人','0','1','招聘行政专员，维护公司办公设备和固定资产，定期盘点、维护、维修、报损，确保公司办公正常开展。负责办公用品的预算及购买，储存、发放公司办公用品、设备等，建立经济合理的采购物品收支账目等工作！','1.熟悉网络、办公设备维护者优先。\r\n2.熟悉物品采购、储存和发放流程者优先。\r\n3.较强的责任心、积极的心态、学习能力和团队意识。\r\n4.有驾照者优先。','1、维护公司办公设备和固定资产，定期盘点、维护、维修、报损，确保公司办公正常开展。\r\n2、负责办公用品的预算及购买，储存、发放公司办公用品、设备等，建立经济合理的采购物品收支账目。\r\n3、负责公司水电暖、租金、话费等办公费用的缴纳和核查。 \r\n4、处理人事日常管理工作，负责人事档案管理，请假、招聘、录用、合同、保险、离退职的手续办理等，\r\n5、办公室租赁、办公环境和清洁等其他后勤服务管理。\r\n6、负责办公室网络维护、为相关信息化系统的实施提供日常的技术维护，\r\n7、负责部门沟通与人员协调，准确理解领导意图，做好上传下达的工作；\r\n8、处理日常行政事务，接听电话来访，文件制发及归档，组织例会等。','一、八小时工作制+双休+法定假日\r\n二、五险+公积金（转正后）\r\n三、工资+半年奖+年终奖\r\n四、员工宿舍+全身体检\r\n五、基础培训+能力培训+技术培训+量身定制发展通道\r\n六、宽松的环境+和谐的氛围+团结的团队\r\n七、生日Party+团队聚会+团队旅游\r\n八、薪资增涨+岗位晋升','0','1503111595','1503111595','1','1','0');
INSERT INTO `zb_gyzb_job` VALUES('4','中博教育','3363','教务','1','面议','42','北京市海淀区北三环双天大厦','9:00 - 18:00','本科','10人','0','1','招聘教务，协助教务主管完成师资调度；教学资料归档、调阅及管理；协助教务主管完成讲师教学质量的收集、评估与反馈；各项目课程的教学质量进行监控、检查和评估；负责ACCA教学考务管理。','1.本科及以上学历，英语专业优先。\r\n2.良好的组织能力、沟通能力、写作能力，Office操作熟练；\r\n3.热爱教学工作，具有高度的敬业精神，团队合作精神和责任感。','1.协助教务主管完成师资调度；\r\n2.教学资料归档、调阅及管理；\r\n3.协助教务主管完成讲师教学质量的收集、评估与反馈；\r\n4.各项目课程的教学质量进行监控、检查和评估；\r\n5.负责ACCA教学考务管理。','一、八小时工作制+双休+法定假日\r\n二、五险+公积金（转正后）\r\n三、工资+半年奖+年终奖\r\n四、员工宿舍+全身体检\r\n五、基础培训+能力培训+技术培训+量身定制发展通道\r\n六、宽松的环境+和谐的氛围+团结的团队\r\n七、生日Party+团队聚会+团队旅游\r\n八、薪资增涨+岗位晋升','0','1503111666','1503111666','1','1','0');

DROP TABLE IF EXISTS `zb_gyzb_qyry`;
CREATE TABLE `zb_gyzb_qyry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `paixu` int(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_gyzb_qyry` VALUES('1','这是一个企业荣誉这是一个企业荣誉','uploadfile/img/2017/0815/150278462735988.jpg','0','1502784631','1','1503118434','1','1');
INSERT INTO `zb_gyzb_qyry` VALUES('2','adfadsfasdfa','uploadfile/img/2017/0819/150311360548153.jpg','2','1503113607','1','1503113607','1','1');
INSERT INTO `zb_gyzb_qyry` VALUES('3','腾讯网“影响力教育品牌”大奖','uploadfile/img/2017/0819/150311518381795.jpg','0','1503115186','1','1503115186','1','0');
INSERT INTO `zb_gyzb_qyry` VALUES('4','新华网“品牌知名度教育机构”大奖','uploadfile/img/2017/0819/150311536353819.jpg','0','1503115365','1','1503115365','1','0');
INSERT INTO `zb_gyzb_qyry` VALUES('5','JHC大比拼角逐全国总冠军','uploadfile/img/2017/0819/150311548331194.png','0','1503115484','1','1503115484','1','0');
INSERT INTO `zb_gyzb_qyry` VALUES('6','中博诚通2016年度“品牌知名度教育机构”','uploadfile/img/2017/0819/150311830981454.jpg','0','1503118311','1','1503118311','1','0');

DROP TABLE IF EXISTS `zb_gyzb_sztd`;
CREATE TABLE `zb_gyzb_sztd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL,
  `jianjie` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `ren` varchar(200) NOT NULL,
  `english` varchar(200) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `pic2` varchar(200) NOT NULL,
  `summer` text NOT NULL,
  `jszl` varchar(255) NOT NULL,
  `zjkm` varchar(255) NOT NULL,
  `cysj` varchar(255) NOT NULL,
  `jsgy` text NOT NULL,
  `jsjj` text NOT NULL,
  `jybj` text NOT NULL,
  `gzjl` text NOT NULL,
  `content` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  `paixu` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_gyzb_sztd` VALUES('1','关键字','简介','seo标题','中文名','英文名','statics/gyzb/2017/0817/20170817100049_776.jpg','statics/gyzb/2017/0817/20170817100049_217.jpg','摘要','教师资历','主讲科目,主讲科目2','从业时间','讲师格言','教师简介','教育背景','<div class=\"list\"> <i>教师资历：</i>\r\n            <div class=\"l_p\">中博诚通全日制金牌讲师    ACCA会员</div>\r\n          </div>\r\n          <div class=\"list\"> <i>教师资历：</i>\r\n            <div class=\"l_p\">中博诚通全日制金牌讲师    ACCA会员</div>\r\n          </div>\r\n          <div class=\"list\"> <i>主讲科目：</i>\r\n            <div class=\"l_p\">中博诚通全日制金牌讲师中博诚通全日制金牌讲师中博诚通全日制金牌讲师中博诚通全日制金牌讲师中博诚通全日制金牌讲师中博诚通全日制金牌讲师</div>\r\n          </div>\r\n          <div class=\"list\"> <i>教师资历：</i>\r\n            <div class=\"l_p\">中博诚通全日制金牌讲师    ACCA会员中博诚通全日制金牌讲师    ACCA会员中博诚通全日制金牌讲师    ACCA会员</div>\r\n          </div>','教学理念和风格','1502935249','1','1502935249','1','1','0');
INSERT INTO `zb_gyzb_sztd` VALUES('2','ACCA讲师','1995年毕业于对外经济贸易大学外贸英语系。北京中博诚通国际创始人之一。现任北京中博诚通国际董事长、对外经济贸易大学校董、成都理工大学客座教授。','中博老师','毛金明','Jimmy  Mao','statics/gyzb/2017/0823/20170823145810_438.jpg','statics/gyzb/2017/0823/20170823145810_932.jpg','F1, F8, P1, P3全日制讲师，ACCA , CMA, CFA，CIMA项目教学背景。','ACCA会员','F1, F8, P1, P3','11年教学经验。','享受教书育人给自己带来的成就感和快乐，希望所有的人都能中博诚通。','<p style=\"margin: 0px; text-align: left;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">1995年毕业于对外经济贸易大学外贸英语系。曾就职于铁道部下属单位和新加坡海外公司，担任合同和采购部负责人。在</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">北京中博诚通国际创始人之一。现任北京中博诚通国际董事长、对外经济贸易大学校董、成都理工大学客座教授。</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">对外经济贸易大学、中山大学等十数所高校教授</font>ACCA、CMA、CIMA、CFA相关课程。在中石油、海南航空、民生银行、沃尔玛、大金等公司任企业内训课程讲师。</span></font></p>\r\n','<span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">对外经济贸易大学、中山大学等十数所高校教授</font>ACCA、CMA、CIMA、CFA相关课程。在中石油、海南航空、民生银行、沃尔玛、大金等公司任企业内训课程讲师。</span>','<span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">1995年毕业于对外经济贸易大学外贸英语系。曾就职于铁道部下属单位和新加坡海外公司，担任合同和采购部负责人。</span>','<p>擅长案例分析，引导学生发散性思维，把复杂问题简单化，在证书类课程中，善于抓大放小，抓住重点脉络，不断拔高，策略性重复，以提高学员通过率。将工作实践中积累的大量管理经验和管理案例，细细剖析， 不断指导学员去梳理脉络，从而更好地启发学生自我思考和创造性思维。善于举一反三，尽量用最容易理解的语言讲解复杂的知识点，并融入幽默的语言使讲解生动有趣，使学员在快乐中享受中学习高端财经管理类课程。</p>\r\n','1503107893','1','1503543950','4','0','0');
INSERT INTO `zb_gyzb_sztd` VALUES('3','ACCA讲师','ACCA 国际注册会计师协会会员；IMA美国管理会计师协会会员；\r\n新加坡 CPA 协会准会员; 英国牛津布鲁克斯大学应用会计学士学位','中博老师','吴奇奇','WU QIQI','statics/gyzb/2017/0823/20170823150239_223.jpg','statics/gyzb/2017/0823/20170823150239_507.jpg','曾任职于新加坡均富国际（Grant Thornton ) 会计师事务所IPO审计，协助多家公司在海外成功上市\r\n联想（北京）集团，财务分析','ACCA 准会员. CMA 全日制讲师，IMA会员.','ACCA F2/F3/F5全日制讲师','7年教学经验。','一个人在25岁之前多努力一分，他将在30岁以后少付出十分 一个人在25岁之前多消闲一分，他将在30岁以后多付出十分','<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font color=\"#000000\">ACCA <font face=\"宋体\">国际注册会计师协会会员；</font><font face=\"Calibri\">IMA</font><font face=\"宋体\">美国管理会计师协会会员；</font></font></span></p>\r\n<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">新加坡</font> </span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">CPA </span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">协会准会员</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\">;</span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\">&nbsp;</span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">英国牛津布鲁克斯大学应用会计学士学位</font></span></font></p>\r\n<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">曾任职于</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">新加坡均富国际（</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">Grant Thornton </span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">)</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">&nbsp;</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">会计</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">师事务所</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">IPO审计</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">，</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">协助多家公司在海外成功上市</font></span></font></p>\r\n<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">联想</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">（</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">北京</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">）</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">集团，财务分析</font></span></font></p>\r\n','<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">新加坡</font> </span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">CPA </span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">协会准会员</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\">;</span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\">&nbsp;</span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">英国牛津布鲁克斯大学应用会计学士学位</font></span></font></p>\r\n','<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">曾任职于</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">新加坡均富国际（</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">Grant Thornton </span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">)</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">&nbsp;</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">会计</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">师事务所</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">IPO审计</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">，</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">协助多家公司在海外成功上市</font></span></font></p>\r\n<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">联想</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">（</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">北京</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">）</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">集团，财务分析</font></span></font></p>\r\n','<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font color=\"#000000\"><font face=\"微软雅黑\">擅长根据学生的个人特点，激发学习动力，注重培养学生的思考能力和解决问题的能力；结合案例教学，将实际工作情景融入课堂当中，深入浅出，因材施教。熟练掌握英</font>/美考试的出题思路，考试风格，帮助学员达到事半功倍的效果。</font></span></p>\r\n','1503108805','1','1503471759','1','0','0');
INSERT INTO `zb_gyzb_sztd` VALUES('4','ACCA讲师','1995年毕业于北京联合大学文法学院。曾就职于奥地利中央合作银行股份有限公司风险控制部、担任高级财务分析师、法律部副总经理、北京中博诚通国际创始人之一。现任北京中博诚通国际董事、在对外经济贸易大学、沈阳大学等十数所高校教授ACCA相关课程。','中博老师','水江洋','Susan Shui','statics/gyzb/2017/0819/20170819103315_427.jpg','statics/gyzb/2017/0819/20170819101907_435.jpg','现任北京中博诚通国际董事、在对外经济贸易大学、沈阳大学等十数所高校教授ACCA相关课程。','ACCA 会员','F3.F7','11年教学经验','就当学习是一种考验吧，享受ACCA学习之旅。','<p style=\"margin: 0px; text-align: left;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font color=\"#000000\">1995年毕业于北京联合大学文法学院。曾就职于奥地利中央合作银行股份有限公司风险控制部、担任高级财务分析师、法律部副总经理、北京中博诚通国际创始人之一。现任北京中博诚通国际董事、在对外经济贸易大学、沈阳大学等十数所高校教授ACCA相关课程。</font></span></p>\r\n','<span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font color=\"#000000\">1995年毕业于北京联合大学文法学院。现任北京中博诚通国际董事、在对外经济贸易大学、沈阳大学等十数所高校教授ACCA相关课程。</font></span>','<font face=\"微软雅黑\">曾就职于奥地利中央合作银行股份有限公司风险控制部、担任高级财务分析师、法律部副总经理、北京中博诚通国际创始人之一。</font>','<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">擅长把复杂问题简单化，用步骤法和重点解析法，</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">将工作实践中积累的大量风险控制、财务分析、法律案例与教学大纲密切联系，启发学生自我思考和创造性思维。善于全景故事性教学方法，生动有趣，入门学员在娱乐享受中学习高端财经课程。</font> </span></font></p>\r\n','1503109147','1','1503109995','1','0','0');
INSERT INTO `zb_gyzb_sztd` VALUES('5','ACCA讲师','毕业于985工程重点院校，取得会计学硕士学位，在校期间一次性通过ACCA全球考试。','中博ACCA讲师','储玮娜','Yovela','statics/gyzb/2017/0819/20170819104535_896.jpg','statics/gyzb/2017/0819/20170819102539_612.jpg','多年从事审计及财务管理工作，有着丰富的理论与实战经验，熟悉企业财务各业务流程与职能，对于企业财务管理有深入研究。\r\n','ACCA会员','F2 ','7年教学经验。','宝剑锋从磨砺出，梅花香自苦寒来','<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">毕业于</font>985工程重点院校，取得会计学硕士学位，在校期间</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">一次性通过</font>ACCA全球考试</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">。曾就职于国际四大会计师事务所，参与完成多家世界</font>500强企业上市年度审计工作。现就职于知名股份制商业银行，从事财务管理工作。多年从事审计及财务管理工作，</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">有着丰富的理论与实战经验</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">，</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">熟悉</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">企业</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">财务各业务流程与职能，</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">对于企业财务管理有深入研究。</font></span></font></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font color=\"#000000\">&nbsp;</font></span></p>\r\n','<span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">毕业于</font>985工程重点院校，取得会计学硕士学位，在校期间</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">一次性通过</font>ACCA全球考试</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">。</font></span>','<font face=\"微软雅黑\">曾就职于国际四大会计师事务所，参与完成多家世界500强企业上市年度审计工作。现就职于知名股份制商业银行，从事财务管理工作。</font>','<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font color=\"#000000\" face=\"微软雅黑\">多年财务管理经验，对知识体系的讲解深入浅出，擅长将基本原理与经典生动案例相结合，加深学员对知识要点的理解，帮助学员快速搭建知识架构、掌握知识精髓，善于总结归纳应试技巧，有效提升复习效果，帮助学员轻松、顺利通过考试。</font></span></p>\r\n','1503109539','1','1503110735','1','0','0');
INSERT INTO `zb_gyzb_sztd` VALUES('6','ACCA讲师','本科就读于东北财经大学会计学院，大学四年所有专业平均分93+，并以专业第一名成绩保送中国人民大学会计系攻读硕士学位，现就职于某985高校。任对外经济贸易大学、北京外国语大学、山东财经大学等合作院校业余班讲师。','中博老师','潘晓丽','Shirley','statics/gyzb/2017/0819/20170819103104_406.jpg','statics/gyzb/2017/0819/20170819103104_529.jpg','本科就读于东北财经大学会计学院，大学四年所有专业平均分93+，并以专业第一名成绩保送中国人民大学会计系攻读硕士学位，现就职于某985高校。','ACCA 、CGA准会员','F2','5年教学经验','行动之前，首先你得知道自己要什么，考试如此，生活亦然。','<p style=\"margin: 0px;\">本科就读于东北财经大学会计学院，大学四年所有专业平均分93+，并以专业第一名成绩保送中国人民大学会计系攻读硕士学位，现就职于某985高校。任对外经济贸易大学、北京外国语大学、山东财经大学等合作院校业余班讲师。</p>\r\n','<p style=\"margin: 0px;\">本科就读于东北财经大学会计学院，大学四年所有专业平均分93+，并以专业第一名成绩保送中国人民大学会计系攻读硕士学位。</p>\r\n','<p>现就职于某985高校。任对外经济贸易大学、北京外国语大学、山东财经大学等合作院校业余班讲师。</p>\r\n','<p style=\"margin: 0px;\">擅长将多年应试经验传达给学生，能准确地把握考点，授课逻辑清晰，用生活中的实例串联抽象的知识点，便于学生理解。</p>\r\n','1503109864','1','1503544265','4','0','0');
INSERT INTO `zb_gyzb_sztd` VALUES('7','ACCA讲师','北京工商大学管理学学士、新西兰怀卡托大学教育学硕士、CIMA&CGMA会员。大学会计专业讲师、近三年海外工作学习经历、三年大型能源类国有企业会计。','中博老师','张雨桐','Rainz Zhang','statics/gyzb/2017/0819/20170819103754_313.jpg','statics/gyzb/2017/0819/20170819103754_564.jpg','北京工商大学管理学学士、新西兰怀卡托大学教育学硕士、CIMA&CGMA会员。大学会计专业讲师、近三年海外工作学习经历、三年大型能源类国有企业会计。','CIMA、CGMA会员','ACCA F5,P5 CIMA C01, P1','7年教学经验','这期间给我带来损失最大的一句话就是”到今天我一直都是这么生活的”。（格雷斯.霍波） 把现在做好，机会就会出现。','<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">北京工商大学管理学学士、新西兰怀卡托大学教育学硕士、</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">CIMA&amp;CGMA</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">会员。大学会计专业讲师、近三年海外工作学习经历、三年大型能源类国有企业会计。</font></span></font></p>\r\n','<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">北京工商大学管理学学士、新西兰怀卡托大学教育学硕士、</font></span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\">CIMA&amp;CGMA</span><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 9pt;\"><font face=\"微软雅黑\">会员。</font></span></font></p>\r\n','<font face=\"微软雅黑\">大学会计专业讲师、近三年海外工作学习经历、三年大型能源类国有企业会计。</font>','<p style=\"margin: 0px;\"><font color=\"#000000\"><span style=\"margin: 0px; font-family: 宋体; font-size: 10.5pt;\"><font face=\"宋体\">擅长发现学生的思维断层、启发学生独立思考。教学与考纲紧密结合，注重培养学生完整的思维模式和成熟的答题习惯。通过案例教学，</font></span><span style=\"margin: 0px; font-family: 宋体; font-size: 10pt;\"><font face=\"宋体\">总结归纳</font>ACCA、</span><span style=\"margin: 0px; font-family: 宋体; font-size: 10pt;\">CIMA</span><span style=\"margin: 0px; font-family: 宋体; font-size: 10pt;\"><font face=\"宋体\">对学生学习结果的要求，并不断总结适合中国学生的简便学习和考试方法，帮助学员提高学习效率和通过率。</font></span></font></p>\r\n','1503110274','1','1503110274','1','0','0');

DROP TABLE IF EXISTS `zb_hits`;
CREATE TABLE `zb_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_ipbanned`;
CREATE TABLE `zb_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_keylink`;
CREATE TABLE `zb_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_keyword`;
CREATE TABLE `zb_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_keyword_data`;
CREATE TABLE `zb_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_link`;
CREATE TABLE `zb_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `zb_link` VALUES('1','1','0','1','PHPCMS','http://www.phpcms.cn','http://www.phpcms.cn/images/logo_88_31.gif','','','0','0','1','1502765185');
INSERT INTO `zb_link` VALUES('2','1','0','1','盛大在线','http://www.sdo.com','http://www.snda.com/cn/logo/comp_logo_sdo.gif','','','0','0','1','1502765185');

DROP TABLE IF EXISTS `zb_linkage`;
CREATE TABLE `zb_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3364 DEFAULT CHARSET=utf8;

INSERT INTO `zb_linkage` VALUES('1','中国','1','0','0','','0','0','','','0');
INSERT INTO `zb_linkage` VALUES('2','北京市','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3','上海市','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('4','天津市','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('5','重庆市','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('6','河北省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('7','山西省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('8','内蒙古','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('9','辽宁省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('10','吉林省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('11','黑龙江省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('12','江苏省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('13','浙江省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('14','安徽省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('15','福建省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('16','江西省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('17','山东省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('18','河南省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('19','湖北省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('20','湖南省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('21','广东省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('22','广西','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('23','海南省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('24','四川省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('25','贵州省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('26','云南省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('27','西藏','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('28','陕西省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('29','甘肃省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('30','青海省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('31','宁夏','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('32','新疆','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('33','台湾省','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('34','香港','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('35','澳门','0','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('36','东城区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('37','西城区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('38','崇文区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('39','宣武区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('40','朝阳区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('41','石景山区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('42','海淀区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('43','门头沟区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('44','房山区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('45','通州区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('46','顺义区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('47','昌平区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('48','大兴区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('49','怀柔区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('50','平谷区','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('51','密云县','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('52','延庆县','0','2','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('53','黄浦区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('54','卢湾区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('55','徐汇区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('56','长宁区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('57','静安区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('58','普陀区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('59','闸北区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('60','虹口区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('61','杨浦区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('62','闵行区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('63','宝山区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('64','嘉定区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('65','浦东新区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('66','金山区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('67','松江区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('68','青浦区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('69','南汇区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('70','奉贤区','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('71','崇明县','0','3','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('72','和平区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('73','河东区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('74','河西区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('75','南开区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('76','河北区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('77','红桥区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('78','塘沽区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('79','汉沽区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('80','大港区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('81','东丽区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('82','西青区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('83','津南区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('84','北辰区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('85','武清区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('86','宝坻区','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('87','宁河县','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('88','静海县','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('89','蓟县','0','4','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('90','万州区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('91','涪陵区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('92','渝中区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('93','大渡口区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('94','江北区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('95','沙坪坝区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('96','九龙坡区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('97','南岸区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('98','北碚区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('99','万盛区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('100','双桥区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('101','渝北区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('102','巴南区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('103','黔江区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('104','长寿区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('105','綦江县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('106','潼南县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('107','铜梁县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('108','大足县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('109','荣昌县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('110','璧山县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('111','梁平县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('112','城口县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('113','丰都县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('114','垫江县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('115','武隆县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('116','忠县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('117','开县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('118','云阳县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('119','奉节县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('120','巫山县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('121','巫溪县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('122','石柱县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('123','秀山县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('124','酉阳县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('125','彭水县','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('126','江津区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('127','合川区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('128','永川区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('129','南川区','0','5','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('130','石家庄市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('131','唐山市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('132','秦皇岛市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('133','邯郸市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('134','邢台市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('135','保定市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('136','张家口市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('137','承德市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('138','沧州市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('139','廊坊市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('140','衡水市','0','6','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('141','太原市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('142','大同市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('143','阳泉市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('144','长治市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('145','晋城市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('146','朔州市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('147','晋中市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('148','运城市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('149','忻州市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('150','临汾市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('151','吕梁市','0','7','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('152','呼和浩特市','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('153','包头市','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('154','乌海市','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('155','赤峰市','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('156','通辽市','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('157','鄂尔多斯市','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('158','呼伦贝尔市','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('159','巴彦淖尔市','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('160','乌兰察布市','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('161','兴安盟','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('162','锡林郭勒盟','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('163','阿拉善盟','0','8','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('164','沈阳市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('165','大连市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('166','鞍山市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('167','抚顺市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('168','本溪市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('169','丹东市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('170','锦州市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('171','营口市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('172','阜新市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('173','辽阳市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('174','盘锦市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('175','铁岭市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('176','朝阳市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('177','葫芦岛市','0','9','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('178','长春市','0','10','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('179','吉林市','0','10','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('180','四平市','0','10','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('181','辽源市','0','10','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('182','通化市','0','10','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('183','白山市','0','10','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('184','松原市','0','10','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('185','白城市','0','10','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('186','延边','0','10','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('187','哈尔滨市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('188','齐齐哈尔市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('189','鸡西市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('190','鹤岗市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('191','双鸭山市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('192','大庆市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('193','伊春市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('194','佳木斯市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('195','七台河市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('196','牡丹江市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('197','黑河市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('198','绥化市','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('199','大兴安岭地区','0','11','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('200','南京市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('201','无锡市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('202','徐州市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('203','常州市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('204','苏州市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('205','南通市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('206','连云港市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('207','淮安市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('208','盐城市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('209','扬州市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('210','镇江市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('211','泰州市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('212','宿迁市','0','12','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('213','杭州市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('214','宁波市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('215','温州市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('216','嘉兴市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('217','湖州市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('218','绍兴市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('219','金华市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('220','衢州市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('221','舟山市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('222','台州市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('223','丽水市','0','13','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('224','合肥市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('225','芜湖市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('226','蚌埠市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('227','淮南市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('228','马鞍山市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('229','淮北市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('230','铜陵市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('231','安庆市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('232','黄山市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('233','滁州市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('234','阜阳市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('235','宿州市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('236','巢湖市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('237','六安市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('238','亳州市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('239','池州市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('240','宣城市','0','14','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('241','福州市','0','15','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('242','厦门市','0','15','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('243','莆田市','0','15','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('244','三明市','0','15','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('245','泉州市','0','15','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('246','漳州市','0','15','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('247','南平市','0','15','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('248','龙岩市','0','15','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('249','宁德市','0','15','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('250','南昌市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('251','景德镇市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('252','萍乡市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('253','九江市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('254','新余市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('255','鹰潭市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('256','赣州市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('257','吉安市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('258','宜春市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('259','抚州市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('260','上饶市','0','16','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('261','济南市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('262','青岛市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('263','淄博市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('264','枣庄市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('265','东营市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('266','烟台市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('267','潍坊市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('268','济宁市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('269','泰安市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('270','威海市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('271','日照市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('272','莱芜市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('273','临沂市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('274','德州市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('275','聊城市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('276','滨州市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('277','荷泽市','0','17','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('278','郑州市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('279','开封市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('280','洛阳市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('281','平顶山市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('282','安阳市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('283','鹤壁市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('284','新乡市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('285','焦作市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('286','濮阳市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('287','许昌市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('288','漯河市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('289','三门峡市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('290','南阳市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('291','商丘市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('292','信阳市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('293','周口市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('294','驻马店市','0','18','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('295','武汉市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('296','黄石市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('297','十堰市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('298','宜昌市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('299','襄樊市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('300','鄂州市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('301','荆门市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('302','孝感市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('303','荆州市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('304','黄冈市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('305','咸宁市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('306','随州市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('307','恩施土家族苗族自治州','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('308','仙桃市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('309','潜江市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('310','天门市','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('311','神农架林区','0','19','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('312','长沙市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('313','株洲市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('314','湘潭市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('315','衡阳市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('316','邵阳市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('317','岳阳市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('318','常德市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('319','张家界市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('320','益阳市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('321','郴州市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('322','永州市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('323','怀化市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('324','娄底市','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('325','湘西土家族苗族自治州','0','20','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('326','广州市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('327','韶关市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('328','深圳市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('329','珠海市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('330','汕头市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('331','佛山市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('332','江门市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('333','湛江市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('334','茂名市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('335','肇庆市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('336','惠州市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('337','梅州市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('338','汕尾市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('339','河源市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('340','阳江市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('341','清远市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('342','东莞市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('343','中山市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('344','潮州市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('345','揭阳市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('346','云浮市','0','21','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('347','南宁市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('348','柳州市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('349','桂林市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('350','梧州市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('351','北海市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('352','防城港市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('353','钦州市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('354','贵港市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('355','玉林市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('356','百色市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('357','贺州市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('358','河池市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('359','来宾市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('360','崇左市','0','22','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('361','海口市','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('362','三亚市','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('363','五指山市','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('364','琼海市','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('365','儋州市','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('366','文昌市','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('367','万宁市','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('368','东方市','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('369','定安县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('370','屯昌县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('371','澄迈县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('372','临高县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('373','白沙黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('374','昌江黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('375','乐东黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('376','陵水黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('377','保亭黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('378','琼中黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('379','西沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('380','南沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('381','中沙群岛的岛礁及其海域','0','23','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('382','成都市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('383','自贡市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('384','攀枝花市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('385','泸州市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('386','德阳市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('387','绵阳市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('388','广元市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('389','遂宁市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('390','内江市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('391','乐山市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('392','南充市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('393','眉山市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('394','宜宾市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('395','广安市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('396','达州市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('397','雅安市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('398','巴中市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('399','资阳市','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('400','阿坝州','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('401','甘孜州','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('402','凉山州','0','24','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('403','贵阳市','0','25','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('404','六盘水市','0','25','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('405','遵义市','0','25','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('406','安顺市','0','25','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('407','铜仁地区','0','25','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('408','黔西南州','0','25','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('409','毕节地区','0','25','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('410','黔东南州','0','25','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('411','黔南州','0','25','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('412','昆明市','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('413','曲靖市','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('414','玉溪市','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('415','保山市','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('416','昭通市','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('417','丽江市','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('418','思茅市','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('419','临沧市','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('420','楚雄州','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('421','红河州','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('422','文山州','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('423','西双版纳','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('424','大理','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('425','德宏','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('426','怒江','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('427','迪庆','0','26','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('428','拉萨市','0','27','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('429','昌都','0','27','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('430','山南','0','27','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('431','日喀则','0','27','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('432','那曲','0','27','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('433','阿里','0','27','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('434','林芝','0','27','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('435','西安市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('436','铜川市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('437','宝鸡市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('438','咸阳市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('439','渭南市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('440','延安市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('441','汉中市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('442','榆林市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('443','安康市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('444','商洛市','0','28','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('445','兰州市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('446','嘉峪关市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('447','金昌市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('448','白银市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('449','天水市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('450','武威市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('451','张掖市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('452','平凉市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('453','酒泉市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('454','庆阳市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('455','定西市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('456','陇南市','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('457','临夏州','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('458','甘州','0','29','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('459','西宁市','0','30','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('460','海东地区','0','30','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('461','海州','0','30','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('462','黄南州','0','30','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('463','海南州','0','30','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('464','果洛州','0','30','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('465','玉树州','0','30','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('466','海西州','0','30','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('467','银川市','0','31','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('468','石嘴山市','0','31','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('469','吴忠市','0','31','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('470','固原市','0','31','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('471','中卫市','0','31','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('472','乌鲁木齐市','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('473','克拉玛依市','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('474','吐鲁番地区','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('475','哈密地区','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('476','昌吉州','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('477','博尔州','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('478','巴音郭楞州','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('479','阿克苏地区','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('480','克孜勒苏柯尔克孜自治州','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('481','喀什地区','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('482','和田地区','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('483','伊犁州','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('484','塔城地区','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('485','阿勒泰地区','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('486','石河子市','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('487','阿拉尔市','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('488','图木舒克市','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('489','五家渠市','0','32','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('490','台北市','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('491','高雄市','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('492','基隆市','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('493','新竹市','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('494','台中市','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('495','嘉义市','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('496','台南市','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('497','台北县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('498','桃园县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('499','新竹县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('500','苗栗县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('501','台中县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('502','彰化县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('503','南投县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('504','云林县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('505','嘉义县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('506','台南县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('507','高雄县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('508','屏东县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('509','宜兰县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('510','花莲县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('511','台东县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('512','澎湖县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('513','金门县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('514','连江县','0','33','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('515','中西区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('516','东区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('517','南区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('518','湾仔区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('519','九龙城区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('520','观塘区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('521','深水埗区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('522','黄大仙区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('523','油尖旺区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('524','离岛区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('525','葵青区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('526','北区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('527','西贡区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('528','沙田区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('529','大埔区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('530','荃湾区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('531','屯门区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('532','元朗区','0','34','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('533','花地玛堂区','0','35','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('534','市圣安多尼堂区','0','35','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('535','大堂区','0','35','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('536','望德堂区','0','35','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('537','风顺堂区','0','35','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('538','嘉模堂区','0','35','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('539','圣方济各堂区','0','35','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('540','长安区','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('541','桥东区','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('542','桥西区','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('543','新华区','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('544','井陉矿区','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('545','裕华区','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('546','井陉县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('547','正定县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('548','栾城县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('549','行唐县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('550','灵寿县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('551','高邑县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('552','深泽县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('553','赞皇县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('554','无极县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('555','平山县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('556','元氏县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('557','赵县','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('558','辛集市','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('559','藁城市','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('560','晋州市','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('561','新乐市','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('562','鹿泉市','0','130','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('563','路南区','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('564','路北区','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('565','古冶区','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('566','开平区','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('567','丰南区','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('568','丰润区','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('569','滦县','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('570','滦南县','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('571','乐亭县','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('572','迁西县','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('573','玉田县','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('574','唐海县','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('575','遵化市','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('576','迁安市','0','131','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('577','海港区','0','132','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('578','山海关区','0','132','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('579','北戴河区','0','132','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('580','青龙县','0','132','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('581','昌黎县','0','132','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('582','抚宁县','0','132','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('583','卢龙县','0','132','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('584','邯山区','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('585','丛台区','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('586','复兴区','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('587','峰峰矿区','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('588','邯郸县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('589','临漳县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('590','成安县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('591','大名县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('592','涉县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('593','磁县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('594','肥乡县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('595','永年县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('596','邱县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('597','鸡泽县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('598','广平县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('599','馆陶县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('600','魏县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('601','曲周县','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('602','武安市','0','133','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('603','桥东区','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('604','桥西区','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('605','邢台县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('606','临城县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('607','内丘县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('608','柏乡县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('609','隆尧县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('610','任县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('611','南和县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('612','宁晋县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('613','巨鹿县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('614','新河县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('615','广宗县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('616','平乡县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('617','威县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('618','清河县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('619','临西县','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('620','南宫市','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('621','沙河市','0','134','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('622','新市区','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('623','北市区','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('624','南市区','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('625','满城县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('626','清苑县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('627','涞水县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('628','阜平县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('629','徐水县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('630','定兴县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('631','唐县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('632','高阳县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('633','容城县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('634','涞源县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('635','望都县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('636','安新县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('637','易县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('638','曲阳县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('639','蠡县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('640','顺平县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('641','博野县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('642','雄县','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('643','涿州市','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('644','定州市','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('645','安国市','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('646','高碑店市','0','135','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('647','桥东区','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('648','桥西区','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('649','宣化区','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('650','下花园区','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('651','宣化县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('652','张北县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('653','康保县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('654','沽源县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('655','尚义县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('656','蔚县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('657','阳原县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('658','怀安县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('659','万全县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('660','怀来县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('661','涿鹿县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('662','赤城县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('663','崇礼县','0','136','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('664','双桥区','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('665','双滦区','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('666','鹰手营子矿区','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('667','承德县','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('668','兴隆县','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('669','平泉县','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('670','滦平县','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('671','隆化县','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('672','丰宁县','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('673','宽城县','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('674','围场县','0','137','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('675','新华区','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('676','运河区','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('677','沧县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('678','青县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('679','东光县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('680','海兴县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('681','盐山县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('682','肃宁县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('683','南皮县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('684','吴桥县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('685','献县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('686','孟村县','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('687','泊头市','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('688','任丘市','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('689','黄骅市','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('690','河间市','0','138','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('691','安次区','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('692','广阳区','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('693','固安县','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('694','永清县','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('695','香河县','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('696','大城县','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('697','文安县','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('698','大厂县','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('699','霸州市','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('700','三河市','0','139','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('701','桃城区','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('702','枣强县','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('703','武邑县','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('704','武强县','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('705','饶阳县','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('706','安平县','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('707','故城县','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('708','景县','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('709','阜城县','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('710','冀州市','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('711','深州市','0','140','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('712','小店区','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('713','迎泽区','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('714','杏花岭区','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('715','尖草坪区','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('716','万柏林区','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('717','晋源区','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('718','清徐县','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('719','阳曲县','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('720','娄烦县','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('721','古交市','0','141','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('722','城区','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('723','矿区','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('724','南郊区','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('725','新荣区','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('726','阳高县','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('727','天镇县','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('728','广灵县','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('729','灵丘县','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('730','浑源县','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('731','左云县','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('732','大同县','0','142','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('733','城区','0','143','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('734','矿区','0','143','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('735','郊区','0','143','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('736','平定县','0','143','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('737','盂县','0','143','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('738','城区','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('739','郊区','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('740','长治县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('741','襄垣县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('742','屯留县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('743','平顺县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('744','黎城县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('745','壶关县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('746','长子县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('747','武乡县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('748','沁县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('749','沁源县','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('750','潞城市','0','144','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('751','城区','0','145','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('752','沁水县','0','145','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('753','阳城县','0','145','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('754','陵川县','0','145','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('755','泽州县','0','145','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('756','高平市','0','145','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('757','朔城区','0','146','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('758','平鲁区','0','146','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('759','山阴县','0','146','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('760','应县','0','146','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('761','右玉县','0','146','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('762','怀仁县','0','146','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('763','榆次区','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('764','榆社县','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('765','左权县','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('766','和顺县','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('767','昔阳县','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('768','寿阳县','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('769','太谷县','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('770','祁县','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('771','平遥县','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('772','灵石县','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('773','介休市','0','147','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('774','盐湖区','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('775','临猗县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('776','万荣县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('777','闻喜县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('778','稷山县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('779','新绛县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('780','绛县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('781','垣曲县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('782','夏县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('783','平陆县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('784','芮城县','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('785','永济市','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('786','河津市','0','148','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('787','忻府区','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('788','定襄县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('789','五台县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('790','代县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('791','繁峙县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('792','宁武县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('793','静乐县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('794','神池县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('795','五寨县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('796','岢岚县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('797','河曲县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('798','保德县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('799','偏关县','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('800','原平市','0','149','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('801','尧都区','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('802','曲沃县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('803','翼城县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('804','襄汾县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('805','洪洞县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('806','古县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('807','安泽县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('808','浮山县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('809','吉县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('810','乡宁县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('811','大宁县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('812','隰县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('813','永和县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('814','蒲县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('815','汾西县','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('816','侯马市','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('817','霍州市','0','150','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('818','离石区','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('819','文水县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('820','交城县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('821','兴县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('822','临县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('823','柳林县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('824','石楼县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('825','岚县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('826','方山县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('827','中阳县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('828','交口县','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('829','孝义市','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('830','汾阳市','0','151','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('831','新城区','0','152','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('832','回民区','0','152','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('833','玉泉区','0','152','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('834','赛罕区','0','152','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('835','土默特左旗','0','152','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('836','托克托县','0','152','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('837','和林格尔县','0','152','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('838','清水河县','0','152','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('839','武川县','0','152','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('840','东河区','0','153','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('841','昆都仑区','0','153','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('842','青山区','0','153','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('843','石拐区','0','153','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('844','白云矿区','0','153','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('845','九原区','0','153','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('846','土默特右旗','0','153','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('847','固阳县','0','153','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('848','达尔罕茂明安联合旗','0','153','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('849','海勃湾区','0','154','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('850','海南区','0','154','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('851','乌达区','0','154','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('852','红山区','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('853','元宝山区','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('854','松山区','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('855','阿鲁科尔沁旗','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('856','巴林左旗','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('857','巴林右旗','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('858','林西县','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('859','克什克腾旗','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('860','翁牛特旗','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('861','喀喇沁旗','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('862','宁城县','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('863','敖汉旗','0','155','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('864','科尔沁区','0','156','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('865','科尔沁左翼中旗','0','156','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('866','科尔沁左翼后旗','0','156','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('867','开鲁县','0','156','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('868','库伦旗','0','156','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('869','奈曼旗','0','156','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('870','扎鲁特旗','0','156','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('871','霍林郭勒市','0','156','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('872','东胜区','0','157','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('873','达拉特旗','0','157','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('874','准格尔旗','0','157','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('875','鄂托克前旗','0','157','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('876','鄂托克旗','0','157','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('877','杭锦旗','0','157','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('878','乌审旗','0','157','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('879','伊金霍洛旗','0','157','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('880','海拉尔区','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('881','阿荣旗','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('882','莫力达瓦达斡尔族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('883','鄂伦春自治旗','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('884','鄂温克族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('885','陈巴尔虎旗','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('886','新巴尔虎左旗','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('887','新巴尔虎右旗','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('888','满洲里市','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('889','牙克石市','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('890','扎兰屯市','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('891','额尔古纳市','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('892','根河市','0','158','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('893','临河区','0','159','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('894','五原县','0','159','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('895','磴口县','0','159','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('896','乌拉特前旗','0','159','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('897','乌拉特中旗','0','159','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('898','乌拉特后旗','0','159','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('899','杭锦后旗','0','159','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('900','集宁区','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('901','卓资县','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('902','化德县','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('903','商都县','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('904','兴和县','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('905','凉城县','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('906','察哈尔右翼前旗','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('907','察哈尔右翼中旗','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('908','察哈尔右翼后旗','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('909','四子王旗','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('910','丰镇市','0','160','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('911','乌兰浩特市','0','161','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('912','阿尔山市','0','161','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('913','科尔沁右翼前旗','0','161','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('914','科尔沁右翼中旗','0','161','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('915','扎赉特旗','0','161','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('916','突泉县','0','161','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('917','二连浩特市','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('918','锡林浩特市','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('919','阿巴嘎旗','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('920','苏尼特左旗','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('921','苏尼特右旗','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('922','东乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('923','西乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('924','太仆寺旗','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('925','镶黄旗','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('926','正镶白旗','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('927','正蓝旗','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('928','多伦县','0','162','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('929','阿拉善左旗','0','163','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('930','阿拉善右旗','0','163','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('931','额济纳旗','0','163','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('932','和平区','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('933','沈河区','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('934','大东区','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('935','皇姑区','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('936','铁西区','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('937','苏家屯区','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('938','东陵区','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('939','新城子区','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('940','于洪区','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('941','辽中县','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('942','康平县','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('943','法库县','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('944','新民市','0','164','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('945','中山区','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('946','西岗区','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('947','沙河口区','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('948','甘井子区','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('949','旅顺口区','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('950','金州区','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('951','长海县','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('952','瓦房店市','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('953','普兰店市','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('954','庄河市','0','165','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('955','铁东区','0','166','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('956','铁西区','0','166','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('957','立山区','0','166','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('958','千山区','0','166','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('959','台安县','0','166','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('960','岫岩满族自治县','0','166','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('961','海城市','0','166','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('962','新抚区','0','167','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('963','东洲区','0','167','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('964','望花区','0','167','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('965','顺城区','0','167','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('966','抚顺县','0','167','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('967','新宾满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('968','清原满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('969','平山区','0','168','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('970','溪湖区','0','168','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('971','明山区','0','168','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('972','南芬区','0','168','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('973','本溪满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('974','桓仁满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('975','元宝区','0','169','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('976','振兴区','0','169','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('977','振安区','0','169','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('978','宽甸满族自治县','0','169','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('979','东港市','0','169','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('980','凤城市','0','169','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('981','古塔区','0','170','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('982','凌河区','0','170','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('983','太和区','0','170','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('984','黑山县','0','170','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('985','义县','0','170','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('986','凌海市','0','170','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('987','北镇市','0','170','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('988','站前区','0','171','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('989','西市区','0','171','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('990','鲅鱼圈区','0','171','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('991','老边区','0','171','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('992','盖州市','0','171','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('993','大石桥市','0','171','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('994','海州区','0','172','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('995','新邱区','0','172','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('996','太平区','0','172','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('997','清河门区','0','172','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('998','细河区','0','172','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('999','阜新蒙古族自治县','0','172','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1000','彰武县','0','172','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1001','白塔区','0','173','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1002','文圣区','0','173','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1003','宏伟区','0','173','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1004','弓长岭区','0','173','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1005','太子河区','0','173','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1006','辽阳县','0','173','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1007','灯塔市','0','173','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1008','双台子区','0','174','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1009','兴隆台区','0','174','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1010','大洼县','0','174','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1011','盘山县','0','174','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1012','银州区','0','175','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1013','清河区','0','175','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1014','铁岭县','0','175','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1015','西丰县','0','175','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1016','昌图县','0','175','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1017','调兵山市','0','175','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1018','开原市','0','175','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1019','双塔区','0','176','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1020','龙城区','0','176','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1021','朝阳县','0','176','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1022','建平县','0','176','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1023','喀喇沁左翼蒙古族自治县','0','176','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1024','北票市','0','176','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1025','凌源市','0','176','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1026','连山区','0','177','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1027','龙港区','0','177','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1028','南票区','0','177','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1029','绥中县','0','177','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1030','建昌县','0','177','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1031','兴城市','0','177','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1032','南关区','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1033','宽城区','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1034','朝阳区','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1035','二道区','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1036','绿园区','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1037','双阳区','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1038','农安县','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1039','九台市','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1040','榆树市','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1041','德惠市','0','178','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1042','昌邑区','0','179','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1043','龙潭区','0','179','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1044','船营区','0','179','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1045','丰满区','0','179','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1046','永吉县','0','179','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1047','蛟河市','0','179','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1048','桦甸市','0','179','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1049','舒兰市','0','179','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1050','磐石市','0','179','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1051','铁西区','0','180','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1052','铁东区','0','180','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1053','梨树县','0','180','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1054','伊通满族自治县','0','180','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1055','公主岭市','0','180','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1056','双辽市','0','180','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1057','龙山区','0','181','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1058','西安区','0','181','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1059','东丰县','0','181','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1060','东辽县','0','181','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1061','东昌区','0','182','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1062','二道江区','0','182','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1063','通化县','0','182','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1064','辉南县','0','182','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1065','柳河县','0','182','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1066','梅河口市','0','182','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1067','集安市','0','182','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1068','八道江区','0','183','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1069','抚松县','0','183','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1070','靖宇县','0','183','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1071','长白朝鲜族自治县','0','183','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1072','江源县','0','183','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1073','临江市','0','183','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1074','宁江区','0','184','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1075','前郭尔罗斯蒙古族自治县','0','184','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1076','长岭县','0','184','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1077','乾安县','0','184','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1078','扶余县','0','184','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1079','洮北区','0','185','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1080','镇赉县','0','185','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1081','通榆县','0','185','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1082','洮南市','0','185','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1083','大安市','0','185','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1084','延吉市','0','186','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1085','图们市','0','186','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1086','敦化市','0','186','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1087','珲春市','0','186','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1088','龙井市','0','186','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1089','和龙市','0','186','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1090','汪清县','0','186','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1091','安图县','0','186','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1092','道里区','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1093','南岗区','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1094','道外区','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1095','香坊区','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1096','动力区','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1097','平房区','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1098','松北区','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1099','呼兰区','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1100','依兰县','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1101','方正县','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1102','宾县','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1103','巴彦县','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1104','木兰县','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1105','通河县','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1106','延寿县','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1107','阿城市','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1108','双城市','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1109','尚志市','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1110','五常市','0','187','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1111','龙沙区','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1112','建华区','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1113','铁锋区','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1114','昂昂溪区','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1115','富拉尔基区','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1116','碾子山区','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1117','梅里斯达斡尔族区','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1118','龙江县','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1119','依安县','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1120','泰来县','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1121','甘南县','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1122','富裕县','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1123','克山县','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1124','克东县','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1125','拜泉县','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1126','讷河市','0','188','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1127','鸡冠区','0','189','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1128','恒山区','0','189','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1129','滴道区','0','189','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1130','梨树区','0','189','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1131','城子河区','0','189','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1132','麻山区','0','189','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1133','鸡东县','0','189','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1134','虎林市','0','189','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1135','密山市','0','189','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1136','向阳区','0','190','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1137','工农区','0','190','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1138','南山区','0','190','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1139','兴安区','0','190','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1140','东山区','0','190','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1141','兴山区','0','190','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1142','萝北县','0','190','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1143','绥滨县','0','190','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1144','尖山区','0','191','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1145','岭东区','0','191','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1146','四方台区','0','191','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1147','宝山区','0','191','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1148','集贤县','0','191','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1149','友谊县','0','191','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1150','宝清县','0','191','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1151','饶河县','0','191','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1152','萨尔图区','0','192','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1153','龙凤区','0','192','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1154','让胡路区','0','192','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1155','红岗区','0','192','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1156','大同区','0','192','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1157','肇州县','0','192','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1158','肇源县','0','192','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1159','林甸县','0','192','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1160','杜尔伯特蒙古族自治县','0','192','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1161','伊春区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1162','南岔区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1163','友好区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1164','西林区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1165','翠峦区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1166','新青区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1167','美溪区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1168','金山屯区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1169','五营区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1170','乌马河区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1171','汤旺河区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1172','带岭区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1173','乌伊岭区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1174','红星区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1175','上甘岭区','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1176','嘉荫县','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1177','铁力市','0','193','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1178','永红区','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1179','向阳区','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1180','前进区','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1181','东风区','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1182','郊区','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1183','桦南县','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1184','桦川县','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1185','汤原县','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1186','抚远县','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1187','同江市','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1188','富锦市','0','194','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1189','新兴区','0','195','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1190','桃山区','0','195','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1191','茄子河区','0','195','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1192','勃利县','0','195','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1193','东安区','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1194','阳明区','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1195','爱民区','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1196','西安区','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1197','东宁县','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1198','林口县','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1199','绥芬河市','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1200','海林市','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1201','宁安市','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1202','穆棱市','0','196','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1203','爱辉区','0','197','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1204','嫩江县','0','197','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1205','逊克县','0','197','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1206','孙吴县','0','197','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1207','北安市','0','197','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1208','五大连池市','0','197','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1209','北林区','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1210','望奎县','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1211','兰西县','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1212','青冈县','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1213','庆安县','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1214','明水县','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1215','绥棱县','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1216','安达市','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1217','肇东市','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1218','海伦市','0','198','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1219','呼玛县','0','199','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1220','塔河县','0','199','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1221','漠河县','0','199','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1222','玄武区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1223','白下区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1224','秦淮区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1225','建邺区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1226','鼓楼区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1227','下关区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1228','浦口区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1229','栖霞区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1230','雨花台区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1231','江宁区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1232','六合区','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1233','溧水县','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1234','高淳县','0','200','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1235','崇安区','0','201','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1236','南长区','0','201','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1237','北塘区','0','201','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1238','锡山区','0','201','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1239','惠山区','0','201','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1240','滨湖区','0','201','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1241','江阴市','0','201','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1242','宜兴市','0','201','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1243','鼓楼区','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1244','云龙区','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1245','九里区','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1246','贾汪区','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1247','泉山区','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1248','丰县','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1249','沛县','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1250','铜山县','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1251','睢宁县','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1252','新沂市','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1253','邳州市','0','202','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1254','天宁区','0','203','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1255','钟楼区','0','203','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1256','戚墅堰区','0','203','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1257','新北区','0','203','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1258','武进区','0','203','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1259','溧阳市','0','203','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1260','金坛市','0','203','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1261','沧浪区','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1262','平江区','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1263','金阊区','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1264','虎丘区','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1265','吴中区','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1266','相城区','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1267','常熟市','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1268','张家港市','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1269','昆山市','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1270','吴江市','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1271','太仓市','0','204','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1272','崇川区','0','205','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1273','港闸区','0','205','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1274','海安县','0','205','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1275','如东县','0','205','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1276','启东市','0','205','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1277','如皋市','0','205','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1278','通州市','0','205','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1279','海门市','0','205','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1280','连云区','0','206','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1281','新浦区','0','206','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1282','海州区','0','206','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1283','赣榆县','0','206','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1284','东海县','0','206','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1285','灌云县','0','206','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1286','灌南县','0','206','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1287','清河区','0','207','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1288','楚州区','0','207','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1289','淮阴区','0','207','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1290','清浦区','0','207','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1291','涟水县','0','207','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1292','洪泽县','0','207','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1293','盱眙县','0','207','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1294','金湖县','0','207','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1295','亭湖区','0','208','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1296','盐都区','0','208','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1297','响水县','0','208','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1298','滨海县','0','208','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1299','阜宁县','0','208','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1300','射阳县','0','208','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1301','建湖县','0','208','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1302','东台市','0','208','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1303','大丰市','0','208','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1304','广陵区','0','209','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1305','邗江区','0','209','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1306','维扬区','0','209','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1307','宝应县','0','209','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1308','仪征市','0','209','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1309','高邮市','0','209','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1310','江都市','0','209','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1311','京口区','0','210','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1312','润州区','0','210','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1313','丹徒区','0','210','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1314','丹阳市','0','210','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1315','扬中市','0','210','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1316','句容市','0','210','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1317','海陵区','0','211','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1318','高港区','0','211','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1319','兴化市','0','211','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1320','靖江市','0','211','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1321','泰兴市','0','211','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1322','姜堰市','0','211','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1323','宿城区','0','212','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1324','宿豫区','0','212','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1325','沭阳县','0','212','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1326','泗阳县','0','212','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1327','泗洪县','0','212','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1328','上城区','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1329','下城区','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1330','江干区','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1331','拱墅区','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1332','西湖区','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1333','滨江区','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1334','萧山区','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1335','余杭区','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1336','桐庐县','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1337','淳安县','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1338','建德市','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1339','富阳市','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1340','临安市','0','213','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1341','海曙区','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1342','江东区','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1343','江北区','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1344','北仑区','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1345','镇海区','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1346','鄞州区','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1347','象山县','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1348','宁海县','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1349','余姚市','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1350','慈溪市','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1351','奉化市','0','214','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1352','鹿城区','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1353','龙湾区','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1354','瓯海区','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1355','洞头县','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1356','永嘉县','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1357','平阳县','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1358','苍南县','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1359','文成县','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1360','泰顺县','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1361','瑞安市','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1362','乐清市','0','215','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1363','秀城区','0','216','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1364','秀洲区','0','216','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1365','嘉善县','0','216','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1366','海盐县','0','216','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1367','海宁市','0','216','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1368','平湖市','0','216','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1369','桐乡市','0','216','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1370','吴兴区','0','217','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1371','南浔区','0','217','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1372','德清县','0','217','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1373','长兴县','0','217','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1374','安吉县','0','217','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1375','越城区','0','218','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1376','绍兴县','0','218','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1377','新昌县','0','218','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1378','诸暨市','0','218','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1379','上虞市','0','218','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1380','嵊州市','0','218','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1381','婺城区','0','219','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1382','金东区','0','219','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1383','武义县','0','219','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1384','浦江县','0','219','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1385','磐安县','0','219','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1386','兰溪市','0','219','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1387','义乌市','0','219','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1388','东阳市','0','219','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1389','永康市','0','219','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1390','柯城区','0','220','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1391','衢江区','0','220','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1392','常山县','0','220','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1393','开化县','0','220','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1394','龙游县','0','220','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1395','江山市','0','220','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1396','定海区','0','221','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1397','普陀区','0','221','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1398','岱山县','0','221','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1399','嵊泗县','0','221','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1400','椒江区','0','222','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1401','黄岩区','0','222','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1402','路桥区','0','222','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1403','玉环县','0','222','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1404','三门县','0','222','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1405','天台县','0','222','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1406','仙居县','0','222','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1407','温岭市','0','222','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1408','临海市','0','222','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1409','莲都区','0','223','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1410','青田县','0','223','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1411','缙云县','0','223','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1412','遂昌县','0','223','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1413','松阳县','0','223','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1414','云和县','0','223','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1415','庆元县','0','223','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1416','景宁畲族自治县','0','223','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1417','龙泉市','0','223','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1418','瑶海区','0','224','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1419','庐阳区','0','224','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1420','蜀山区','0','224','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1421','包河区','0','224','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1422','长丰县','0','224','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1423','肥东县','0','224','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1424','肥西县','0','224','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1425','镜湖区','0','225','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1426','弋江区','0','225','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1427','鸠江区','0','225','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1428','三山区','0','225','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1429','芜湖县','0','225','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1430','繁昌县','0','225','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1431','南陵县','0','225','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1432','龙子湖区','0','226','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1433','蚌山区','0','226','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1434','禹会区','0','226','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1435','淮上区','0','226','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1436','怀远县','0','226','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1437','五河县','0','226','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1438','固镇县','0','226','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1439','大通区','0','227','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1440','田家庵区','0','227','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1441','谢家集区','0','227','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1442','八公山区','0','227','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1443','潘集区','0','227','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1444','凤台县','0','227','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1445','金家庄区','0','228','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1446','花山区','0','228','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1447','雨山区','0','228','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1448','当涂县','0','228','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1449','杜集区','0','229','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1450','相山区','0','229','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1451','烈山区','0','229','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1452','濉溪县','0','229','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1453','铜官山区','0','230','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1454','狮子山区','0','230','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1455','郊区','0','230','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1456','铜陵县','0','230','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1457','迎江区','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1458','大观区','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1459','宜秀区','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1460','怀宁县','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1461','枞阳县','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1462','潜山县','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1463','太湖县','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1464','宿松县','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1465','望江县','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1466','岳西县','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1467','桐城市','0','231','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1468','屯溪区','0','232','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1469','黄山区','0','232','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1470','徽州区','0','232','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1471','歙县','0','232','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1472','休宁县','0','232','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1473','黟县','0','232','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1474','祁门县','0','232','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1475','琅琊区','0','233','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1476','南谯区','0','233','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1477','来安县','0','233','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1478','全椒县','0','233','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1479','定远县','0','233','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1480','凤阳县','0','233','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1481','天长市','0','233','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1482','明光市','0','233','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1483','颍州区','0','234','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1484','颍东区','0','234','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1485','颍泉区','0','234','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1486','临泉县','0','234','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1487','太和县','0','234','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1488','阜南县','0','234','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1489','颍上县','0','234','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1490','界首市','0','234','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1491','埇桥区','0','235','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1492','砀山县','0','235','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1493','萧县','0','235','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1494','灵璧县','0','235','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1495','泗县','0','235','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1496','居巢区','0','236','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1497','庐江县','0','236','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1498','无为县','0','236','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1499','含山县','0','236','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1500','和县','0','236','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1501','金安区','0','237','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1502','裕安区','0','237','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1503','寿县','0','237','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1504','霍邱县','0','237','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1505','舒城县','0','237','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1506','金寨县','0','237','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1507','霍山县','0','237','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1508','谯城区','0','238','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1509','涡阳县','0','238','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1510','蒙城县','0','238','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1511','利辛县','0','238','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1512','贵池区','0','239','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1513','东至县','0','239','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1514','石台县','0','239','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1515','青阳县','0','239','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1516','宣州区','0','240','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1517','郎溪县','0','240','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1518','广德县','0','240','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1519','泾县','0','240','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1520','绩溪县','0','240','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1521','旌德县','0','240','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1522','宁国市','0','240','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1523','鼓楼区','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1524','台江区','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1525','仓山区','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1526','马尾区','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1527','晋安区','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1528','闽侯县','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1529','连江县','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1530','罗源县','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1531','闽清县','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1532','永泰县','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1533','平潭县','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1534','福清市','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1535','长乐市','0','241','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1536','思明区','0','242','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1537','海沧区','0','242','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1538','湖里区','0','242','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1539','集美区','0','242','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1540','同安区','0','242','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1541','翔安区','0','242','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1542','城厢区','0','243','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1543','涵江区','0','243','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1544','荔城区','0','243','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1545','秀屿区','0','243','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1546','仙游县','0','243','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1547','梅列区','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1548','三元区','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1549','明溪县','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1550','清流县','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1551','宁化县','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1552','大田县','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1553','尤溪县','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1554','沙县','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1555','将乐县','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1556','泰宁县','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1557','建宁县','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1558','永安市','0','244','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1559','鲤城区','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1560','丰泽区','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1561','洛江区','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1562','泉港区','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1563','惠安县','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1564','安溪县','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1565','永春县','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1566','德化县','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1567','金门县','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1568','石狮市','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1569','晋江市','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1570','南安市','0','245','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1571','芗城区','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1572','龙文区','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1573','云霄县','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1574','漳浦县','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1575','诏安县','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1576','长泰县','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1577','东山县','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1578','南靖县','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1579','平和县','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1580','华安县','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1581','龙海市','0','246','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1582','延平区','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1583','顺昌县','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1584','浦城县','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1585','光泽县','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1586','松溪县','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1587','政和县','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1588','邵武市','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1589','武夷山市','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1590','建瓯市','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1591','建阳市','0','247','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1592','新罗区','0','248','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1593','长汀县','0','248','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1594','永定县','0','248','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1595','上杭县','0','248','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1596','武平县','0','248','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1597','连城县','0','248','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1598','漳平市','0','248','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1599','蕉城区','0','249','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1600','霞浦县','0','249','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1601','古田县','0','249','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1602','屏南县','0','249','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1603','寿宁县','0','249','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1604','周宁县','0','249','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1605','柘荣县','0','249','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1606','福安市','0','249','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1607','福鼎市','0','249','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1608','东湖区','0','250','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1609','西湖区','0','250','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1610','青云谱区','0','250','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1611','湾里区','0','250','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1612','青山湖区','0','250','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1613','南昌县','0','250','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1614','新建县','0','250','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1615','安义县','0','250','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1616','进贤县','0','250','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1617','昌江区','0','251','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1618','珠山区','0','251','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1619','浮梁县','0','251','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1620','乐平市','0','251','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1621','安源区','0','252','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1622','湘东区','0','252','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1623','莲花县','0','252','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1624','上栗县','0','252','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1625','芦溪县','0','252','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1626','庐山区','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1627','浔阳区','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1628','九江县','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1629','武宁县','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1630','修水县','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1631','永修县','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1632','德安县','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1633','星子县','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1634','都昌县','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1635','湖口县','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1636','彭泽县','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1637','瑞昌市','0','253','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1638','渝水区','0','254','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1639','分宜县','0','254','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1640','月湖区','0','255','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1641','余江县','0','255','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1642','贵溪市','0','255','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1643','章贡区','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1644','赣县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1645','信丰县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1646','大余县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1647','上犹县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1648','崇义县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1649','安远县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1650','龙南县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1651','定南县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1652','全南县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1653','宁都县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1654','于都县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1655','兴国县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1656','会昌县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1657','寻乌县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1658','石城县','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1659','瑞金市','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1660','南康市','0','256','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1661','吉州区','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1662','青原区','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1663','吉安县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1664','吉水县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1665','峡江县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1666','新干县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1667','永丰县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1668','泰和县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1669','遂川县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1670','万安县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1671','安福县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1672','永新县','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1673','井冈山市','0','257','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1674','袁州区','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1675','奉新县','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1676','万载县','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1677','上高县','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1678','宜丰县','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1679','靖安县','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1680','铜鼓县','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1681','丰城市','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1682','樟树市','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1683','高安市','0','258','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1684','临川区','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1685','南城县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1686','黎川县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1687','南丰县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1688','崇仁县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1689','乐安县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1690','宜黄县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1691','金溪县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1692','资溪县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1693','东乡县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1694','广昌县','0','259','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1695','信州区','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1696','上饶县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1697','广丰县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1698','玉山县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1699','铅山县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1700','横峰县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1701','弋阳县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1702','余干县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1703','鄱阳县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1704','万年县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1705','婺源县','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1706','德兴市','0','260','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1707','历下区','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1708','市中区','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1709','槐荫区','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1710','天桥区','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1711','历城区','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1712','长清区','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1713','平阴县','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1714','济阳县','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1715','商河县','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1716','章丘市','0','261','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1717','市南区','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1718','市北区','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1719','四方区','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1720','黄岛区','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1721','崂山区','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1722','李沧区','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1723','城阳区','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1724','胶州市','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1725','即墨市','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1726','平度市','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1727','胶南市','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1728','莱西市','0','262','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1729','淄川区','0','263','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1730','张店区','0','263','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1731','博山区','0','263','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1732','临淄区','0','263','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1733','周村区','0','263','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1734','桓台县','0','263','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1735','高青县','0','263','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1736','沂源县','0','263','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1737','市中区','0','264','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1738','薛城区','0','264','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1739','峄城区','0','264','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1740','台儿庄区','0','264','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1741','山亭区','0','264','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1742','滕州市','0','264','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1743','东营区','0','265','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1744','河口区','0','265','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1745','垦利县','0','265','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1746','利津县','0','265','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1747','广饶县','0','265','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1748','芝罘区','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1749','福山区','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1750','牟平区','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1751','莱山区','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1752','长岛县','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1753','龙口市','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1754','莱阳市','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1755','莱州市','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1756','蓬莱市','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1757','招远市','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1758','栖霞市','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1759','海阳市','0','266','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1760','潍城区','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1761','寒亭区','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1762','坊子区','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1763','奎文区','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1764','临朐县','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1765','昌乐县','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1766','青州市','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1767','诸城市','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1768','寿光市','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1769','安丘市','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1770','高密市','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1771','昌邑市','0','267','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1772','市中区','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1773','任城区','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1774','微山县','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1775','鱼台县','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1776','金乡县','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1777','嘉祥县','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1778','汶上县','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1779','泗水县','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1780','梁山县','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1781','曲阜市','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1782','兖州市','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1783','邹城市','0','268','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1784','泰山区','0','269','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1785','岱岳区','0','269','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1786','宁阳县','0','269','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1787','东平县','0','269','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1788','新泰市','0','269','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1789','肥城市','0','269','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1790','环翠区','0','270','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1791','文登市','0','270','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1792','荣成市','0','270','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1793','乳山市','0','270','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1794','东港区','0','271','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1795','岚山区','0','271','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1796','五莲县','0','271','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1797','莒县','0','271','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1798','莱城区','0','272','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1799','钢城区','0','272','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1800','兰山区','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1801','罗庄区','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1802','河东区','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1803','沂南县','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1804','郯城县','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1805','沂水县','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1806','苍山县','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1807','费县','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1808','平邑县','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1809','莒南县','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1810','蒙阴县','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1811','临沭县','0','273','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1812','德城区','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1813','陵县','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1814','宁津县','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1815','庆云县','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1816','临邑县','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1817','齐河县','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1818','平原县','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1819','夏津县','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1820','武城县','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1821','乐陵市','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1822','禹城市','0','274','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1823','东昌府区','0','275','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1824','阳谷县','0','275','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1825','莘县','0','275','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1826','茌平县','0','275','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1827','东阿县','0','275','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1828','冠县','0','275','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1829','高唐县','0','275','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1830','临清市','0','275','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1831','滨城区','0','276','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1832','惠民县','0','276','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1833','阳信县','0','276','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1834','无棣县','0','276','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1835','沾化县','0','276','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1836','博兴县','0','276','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1837','邹平县','0','276','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1838','牡丹区','0','277','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1839','曹县','0','277','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1840','单县','0','277','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1841','成武县','0','277','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1842','巨野县','0','277','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1843','郓城县','0','277','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1844','鄄城县','0','277','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1845','定陶县','0','277','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1846','东明县','0','277','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1847','中原区','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1848','二七区','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1849','管城回族区','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1850','金水区','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1851','上街区','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1852','惠济区','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1853','中牟县','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1854','巩义市','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1855','荥阳市','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1856','新密市','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1857','新郑市','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1858','登封市','0','278','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1859','龙亭区','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1860','顺河回族区','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1861','鼓楼区','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1862','禹王台区','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1863','金明区','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1864','杞县','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1865','通许县','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1866','尉氏县','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1867','开封县','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1868','兰考县','0','279','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1869','老城区','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1870','西工区','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1871','廛河回族区','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1872','涧西区','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1873','吉利区','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1874','洛龙区','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1875','孟津县','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1876','新安县','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1877','栾川县','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1878','嵩县','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1879','汝阳县','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1880','宜阳县','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1881','洛宁县','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1882','伊川县','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1883','偃师市','0','280','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1884','新华区','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1885','卫东区','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1886','石龙区','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1887','湛河区','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1888','宝丰县','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1889','叶县','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1890','鲁山县','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1891','郏县','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1892','舞钢市','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1893','汝州市','0','281','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1894','文峰区','0','282','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1895','北关区','0','282','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1896','殷都区','0','282','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1897','龙安区','0','282','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1898','安阳县','0','282','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1899','汤阴县','0','282','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1900','滑县','0','282','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1901','内黄县','0','282','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1902','林州市','0','282','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1903','鹤山区','0','283','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1904','山城区','0','283','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1905','淇滨区','0','283','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1906','浚县','0','283','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1907','淇县','0','283','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1908','红旗区','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1909','卫滨区','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1910','凤泉区','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1911','牧野区','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1912','新乡县','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1913','获嘉县','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1914','原阳县','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1915','延津县','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1916','封丘县','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1917','长垣县','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1918','卫辉市','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1919','辉县市','0','284','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1920','解放区','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1921','中站区','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1922','马村区','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1923','山阳区','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1924','修武县','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1925','博爱县','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1926','武陟县','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1927','温县','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1928','济源市','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1929','沁阳市','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1930','孟州市','0','285','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1931','华龙区','0','286','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1932','清丰县','0','286','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1933','南乐县','0','286','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1934','范县','0','286','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1935','台前县','0','286','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1936','濮阳县','0','286','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1937','魏都区','0','287','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1938','许昌县','0','287','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1939','鄢陵县','0','287','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1940','襄城县','0','287','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1941','禹州市','0','287','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1942','长葛市','0','287','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1943','源汇区','0','288','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1944','郾城区','0','288','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1945','召陵区','0','288','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1946','舞阳县','0','288','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1947','临颍县','0','288','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1948','湖滨区','0','289','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1949','渑池县','0','289','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1950','陕县','0','289','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1951','卢氏县','0','289','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1952','义马市','0','289','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1953','灵宝市','0','289','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1954','宛城区','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1955','卧龙区','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1956','南召县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1957','方城县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1958','西峡县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1959','镇平县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1960','内乡县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1961','淅川县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1962','社旗县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1963','唐河县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1964','新野县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1965','桐柏县','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1966','邓州市','0','290','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1967','梁园区','0','291','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1968','睢阳区','0','291','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1969','民权县','0','291','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1970','睢县','0','291','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1971','宁陵县','0','291','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1972','柘城县','0','291','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1973','虞城县','0','291','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1974','夏邑县','0','291','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1975','永城市','0','291','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1976','浉河区','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1977','平桥区','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1978','罗山县','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1979','光山县','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1980','新县','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1981','商城县','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1982','固始县','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1983','潢川县','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1984','淮滨县','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1985','息县','0','292','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1986','川汇区','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1987','扶沟县','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1988','西华县','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1989','商水县','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1990','沈丘县','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1991','郸城县','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1992','淮阳县','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1993','太康县','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1994','鹿邑县','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1995','项城市','0','293','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1996','驿城区','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1997','西平县','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1998','上蔡县','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('1999','平舆县','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2000','正阳县','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2001','确山县','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2002','泌阳县','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2003','汝南县','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2004','遂平县','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2005','新蔡县','0','294','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2006','江岸区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2007','江汉区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2008','硚口区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2009','汉阳区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2010','武昌区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2011','青山区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2012','洪山区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2013','东西湖区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2014','汉南区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2015','蔡甸区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2016','江夏区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2017','黄陂区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2018','新洲区','0','295','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2019','黄石港区','0','296','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2020','西塞山区','0','296','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2021','下陆区','0','296','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2022','铁山区','0','296','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2023','阳新县','0','296','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2024','大冶市','0','296','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2025','茅箭区','0','297','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2026','张湾区','0','297','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2027','郧县','0','297','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2028','郧西县','0','297','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2029','竹山县','0','297','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2030','竹溪县','0','297','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2031','房县','0','297','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2032','丹江口市','0','297','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2033','西陵区','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2034','伍家岗区','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2035','点军区','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2036','猇亭区','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2037','夷陵区','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2038','远安县','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2039','兴山县','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2040','秭归县','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2041','长阳土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2042','五峰土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2043','宜都市','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2044','当阳市','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2045','枝江市','0','298','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2046','襄城区','0','299','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2047','樊城区','0','299','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2048','襄阳区','0','299','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2049','南漳县','0','299','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2050','谷城县','0','299','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2051','保康县','0','299','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2052','老河口市','0','299','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2053','枣阳市','0','299','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2054','宜城市','0','299','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2055','梁子湖区','0','300','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2056','华容区','0','300','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2057','鄂城区','0','300','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2058','东宝区','0','301','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2059','掇刀区','0','301','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2060','京山县','0','301','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2061','沙洋县','0','301','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2062','钟祥市','0','301','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2063','孝南区','0','302','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2064','孝昌县','0','302','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2065','大悟县','0','302','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2066','云梦县','0','302','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2067','应城市','0','302','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2068','安陆市','0','302','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2069','汉川市','0','302','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2070','沙市区','0','303','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2071','荆州区','0','303','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2072','公安县','0','303','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2073','监利县','0','303','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2074','江陵县','0','303','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2075','石首市','0','303','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2076','洪湖市','0','303','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2077','松滋市','0','303','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2078','黄州区','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2079','团风县','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2080','红安县','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2081','罗田县','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2082','英山县','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2083','浠水县','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2084','蕲春县','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2085','黄梅县','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2086','麻城市','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2087','武穴市','0','304','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2088','咸安区','0','305','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2089','嘉鱼县','0','305','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2090','通城县','0','305','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2091','崇阳县','0','305','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2092','通山县','0','305','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2093','赤壁市','0','305','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2094','曾都区','0','306','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2095','广水市','0','306','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2096','恩施市','0','307','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2097','利川市','0','307','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2098','建始县','0','307','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2099','巴东县','0','307','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2100','宣恩县','0','307','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2101','咸丰县','0','307','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2102','来凤县','0','307','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2103','鹤峰县','0','307','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2104','芙蓉区','0','312','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2105','天心区','0','312','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2106','岳麓区','0','312','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2107','开福区','0','312','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2108','雨花区','0','312','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2109','长沙县','0','312','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2110','望城县','0','312','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2111','宁乡县','0','312','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2112','浏阳市','0','312','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2113','荷塘区','0','313','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2114','芦淞区','0','313','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2115','石峰区','0','313','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2116','天元区','0','313','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2117','株洲县','0','313','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2118','攸县','0','313','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2119','茶陵县','0','313','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2120','炎陵县','0','313','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2121','醴陵市','0','313','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2122','雨湖区','0','314','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2123','岳塘区','0','314','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2124','湘潭县','0','314','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2125','湘乡市','0','314','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2126','韶山市','0','314','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2127','珠晖区','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2128','雁峰区','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2129','石鼓区','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2130','蒸湘区','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2131','南岳区','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2132','衡阳县','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2133','衡南县','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2134','衡山县','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2135','衡东县','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2136','祁东县','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2137','耒阳市','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2138','常宁市','0','315','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2139','双清区','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2140','大祥区','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2141','北塔区','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2142','邵东县','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2143','新邵县','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2144','邵阳县','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2145','隆回县','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2146','洞口县','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2147','绥宁县','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2148','新宁县','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2149','城步苗族自治县','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2150','武冈市','0','316','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2151','岳阳楼区','0','317','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2152','云溪区','0','317','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2153','君山区','0','317','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2154','岳阳县','0','317','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2155','华容县','0','317','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2156','湘阴县','0','317','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2157','平江县','0','317','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2158','汨罗市','0','317','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2159','临湘市','0','317','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2160','武陵区','0','318','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2161','鼎城区','0','318','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2162','安乡县','0','318','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2163','汉寿县','0','318','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2164','澧县','0','318','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2165','临澧县','0','318','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2166','桃源县','0','318','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2167','石门县','0','318','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2168','津市市','0','318','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2169','永定区','0','319','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2170','武陵源区','0','319','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2171','慈利县','0','319','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2172','桑植县','0','319','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2173','资阳区','0','320','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2174','赫山区','0','320','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2175','南县','0','320','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2176','桃江县','0','320','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2177','安化县','0','320','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2178','沅江市','0','320','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2179','北湖区','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2180','苏仙区','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2181','桂阳县','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2182','宜章县','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2183','永兴县','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2184','嘉禾县','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2185','临武县','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2186','汝城县','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2187','桂东县','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2188','安仁县','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2189','资兴市','0','321','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2190','零陵区','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2191','冷水滩区','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2192','祁阳县','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2193','东安县','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2194','双牌县','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2195','道县','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2196','江永县','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2197','宁远县','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2198','蓝山县','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2199','新田县','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2200','江华瑶族自治县','0','322','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2201','鹤城区','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2202','中方县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2203','沅陵县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2204','辰溪县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2205','溆浦县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2206','会同县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2207','麻阳苗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2208','新晃侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2209','芷江侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2210','靖州苗族侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2211','通道侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2212','洪江市','0','323','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2213','娄星区','0','324','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2214','双峰县','0','324','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2215','新化县','0','324','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2216','冷水江市','0','324','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2217','涟源市','0','324','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2218','吉首市','0','325','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2219','泸溪县','0','325','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2220','凤凰县','0','325','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2221','花垣县','0','325','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2222','保靖县','0','325','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2223','古丈县','0','325','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2224','永顺县','0','325','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2225','龙山县','0','325','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2226','荔湾区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2227','越秀区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2228','海珠区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2229','天河区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2230','白云区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2231','黄埔区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2232','番禺区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2233','花都区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2234','南沙区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2235','萝岗区','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2236','增城市','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2237','从化市','0','326','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2238','武江区','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2239','浈江区','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2240','曲江区','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2241','始兴县','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2242','仁化县','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2243','翁源县','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2244','乳源瑶族自治县','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2245','新丰县','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2246','乐昌市','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2247','南雄市','0','327','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2248','罗湖区','0','328','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2249','福田区','0','328','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2250','南山区','0','328','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2251','宝安区','0','328','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2252','龙岗区','0','328','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2253','盐田区','0','328','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2254','香洲区','0','329','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2255','斗门区','0','329','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2256','金湾区','0','329','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2257','龙湖区','0','330','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2258','金平区','0','330','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2259','濠江区','0','330','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2260','潮阳区','0','330','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2261','潮南区','0','330','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2262','澄海区','0','330','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2263','南澳县','0','330','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2264','禅城区','0','331','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2265','南海区','0','331','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2266','顺德区','0','331','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2267','三水区','0','331','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2268','高明区','0','331','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2269','蓬江区','0','332','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2270','江海区','0','332','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2271','新会区','0','332','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2272','台山市','0','332','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2273','开平市','0','332','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2274','鹤山市','0','332','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2275','恩平市','0','332','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2276','赤坎区','0','333','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2277','霞山区','0','333','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2278','坡头区','0','333','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2279','麻章区','0','333','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2280','遂溪县','0','333','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2281','徐闻县','0','333','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2282','廉江市','0','333','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2283','雷州市','0','333','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2284','吴川市','0','333','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2285','茂南区','0','334','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2286','茂港区','0','334','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2287','电白县','0','334','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2288','高州市','0','334','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2289','化州市','0','334','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2290','信宜市','0','334','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2291','端州区','0','335','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2292','鼎湖区','0','335','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2293','广宁县','0','335','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2294','怀集县','0','335','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2295','封开县','0','335','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2296','德庆县','0','335','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2297','高要市','0','335','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2298','四会市','0','335','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2299','惠城区','0','336','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2300','惠阳区','0','336','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2301','博罗县','0','336','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2302','惠东县','0','336','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2303','龙门县','0','336','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2304','梅江区','0','337','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2305','梅县','0','337','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2306','大埔县','0','337','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2307','丰顺县','0','337','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2308','五华县','0','337','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2309','平远县','0','337','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2310','蕉岭县','0','337','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2311','兴宁市','0','337','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2312','城区','0','338','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2313','海丰县','0','338','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2314','陆河县','0','338','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2315','陆丰市','0','338','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2316','源城区','0','339','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2317','紫金县','0','339','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2318','龙川县','0','339','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2319','连平县','0','339','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2320','和平县','0','339','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2321','东源县','0','339','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2322','江城区','0','340','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2323','阳西县','0','340','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2324','阳东县','0','340','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2325','阳春市','0','340','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2326','清城区','0','341','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2327','佛冈县','0','341','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2328','阳山县','0','341','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2329','连山壮族瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2330','连南瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2331','清新县','0','341','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2332','英德市','0','341','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2333','连州市','0','341','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2334','湘桥区','0','344','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2335','潮安县','0','344','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2336','饶平县','0','344','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2337','榕城区','0','345','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2338','揭东县','0','345','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2339','揭西县','0','345','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2340','惠来县','0','345','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2341','普宁市','0','345','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2342','云城区','0','346','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2343','新兴县','0','346','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2344','郁南县','0','346','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2345','云安县','0','346','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2346','罗定市','0','346','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2347','兴宁区','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2348','青秀区','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2349','江南区','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2350','西乡塘区','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2351','良庆区','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2352','邕宁区','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2353','武鸣县','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2354','隆安县','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2355','马山县','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2356','上林县','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2357','宾阳县','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2358','横县','0','347','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2359','城中区','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2360','鱼峰区','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2361','柳南区','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2362','柳北区','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2363','柳江县','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2364','柳城县','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2365','鹿寨县','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2366','融安县','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2367','融水苗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2368','三江侗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2369','秀峰区','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2370','叠彩区','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2371','象山区','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2372','七星区','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2373','雁山区','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2374','阳朔县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2375','临桂县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2376','灵川县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2377','全州县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2378','兴安县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2379','永福县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2380','灌阳县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2381','龙胜各族自治县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2382','资源县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2383','平乐县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2384','荔蒲县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2385','恭城瑶族自治县','0','349','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2386','万秀区','0','350','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2387','蝶山区','0','350','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2388','长洲区','0','350','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2389','苍梧县','0','350','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2390','藤县','0','350','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2391','蒙山县','0','350','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2392','岑溪市','0','350','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2393','海城区','0','351','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2394','银海区','0','351','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2395','铁山港区','0','351','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2396','合浦县','0','351','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2397','港口区','0','352','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2398','防城区','0','352','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2399','上思县','0','352','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2400','东兴市','0','352','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2401','钦南区','0','353','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2402','钦北区','0','353','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2403','灵山县','0','353','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2404','浦北县','0','353','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2405','港北区','0','354','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2406','港南区','0','354','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2407','覃塘区','0','354','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2408','平南县','0','354','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2409','桂平市','0','354','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2410','玉州区','0','355','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2411','容县','0','355','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2412','陆川县','0','355','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2413','博白县','0','355','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2414','兴业县','0','355','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2415','北流市','0','355','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2416','右江区','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2417','田阳县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2418','田东县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2419','平果县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2420','德保县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2421','靖西县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2422','那坡县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2423','凌云县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2424','乐业县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2425','田林县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2426','西林县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2427','隆林各族自治县','0','356','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2428','八步区','0','357','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2429','昭平县','0','357','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2430','钟山县','0','357','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2431','富川瑶族自治县','0','357','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2432','金城江区','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2433','南丹县','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2434','天峨县','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2435','凤山县','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2436','东兰县','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2437','罗城仫佬族自治县','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2438','环江毛南族自治县','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2439','巴马瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2440','都安瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2441','大化瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2442','宜州市','0','358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2443','兴宾区','0','359','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2444','忻城县','0','359','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2445','象州县','0','359','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2446','武宣县','0','359','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2447','金秀瑶族自治县','0','359','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2448','合山市','0','359','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2449','江洲区','0','360','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2450','扶绥县','0','360','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2451','宁明县','0','360','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2452','龙州县','0','360','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2453','大新县','0','360','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2454','天等县','0','360','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2455','凭祥市','0','360','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2456','秀英区','0','361','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2457','龙华区','0','361','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2458','琼山区','0','361','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2459','美兰区','0','361','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2460','锦江区','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2461','青羊区','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2462','金牛区','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2463','武侯区','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2464','成华区','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2465','龙泉驿区','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2466','青白江区','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2467','新都区','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2468','温江区','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2469','金堂县','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2470','双流县','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2471','郫县','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2472','大邑县','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2473','蒲江县','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2474','新津县','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2475','都江堰市','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2476','彭州市','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2477','邛崃市','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2478','崇州市','0','382','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2479','自流井区','0','383','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2480','贡井区','0','383','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2481','大安区','0','383','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2482','沿滩区','0','383','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2483','荣县','0','383','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2484','富顺县','0','383','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2485','东区','0','384','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2486','西区','0','384','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2487','仁和区','0','384','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2488','米易县','0','384','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2489','盐边县','0','384','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2490','江阳区','0','385','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2491','纳溪区','0','385','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2492','龙马潭区','0','385','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2493','泸县','0','385','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2494','合江县','0','385','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2495','叙永县','0','385','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2496','古蔺县','0','385','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2497','旌阳区','0','386','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2498','中江县','0','386','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2499','罗江县','0','386','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2500','广汉市','0','386','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2501','什邡市','0','386','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2502','绵竹市','0','386','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2503','涪城区','0','387','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2504','游仙区','0','387','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2505','三台县','0','387','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2506','盐亭县','0','387','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2507','安县','0','387','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2508','梓潼县','0','387','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2509','北川羌族自治县','0','387','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2510','平武县','0','387','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2511','江油市','0','387','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2512','市中区','0','388','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2513','元坝区','0','388','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2514','朝天区','0','388','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2515','旺苍县','0','388','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2516','青川县','0','388','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2517','剑阁县','0','388','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2518','苍溪县','0','388','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2519','船山区','0','389','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2520','安居区','0','389','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2521','蓬溪县','0','389','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2522','射洪县','0','389','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2523','大英县','0','389','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2524','市中区','0','390','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2525','东兴区','0','390','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2526','威远县','0','390','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2527','资中县','0','390','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2528','隆昌县','0','390','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2529','市中区','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2530','沙湾区','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2531','五通桥区','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2532','金口河区','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2533','犍为县','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2534','井研县','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2535','夹江县','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2536','沐川县','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2537','峨边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2538','马边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2539','峨眉山市','0','391','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2540','顺庆区','0','392','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2541','高坪区','0','392','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2542','嘉陵区','0','392','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2543','南部县','0','392','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2544','营山县','0','392','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2545','蓬安县','0','392','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2546','仪陇县','0','392','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2547','西充县','0','392','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2548','阆中市','0','392','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2549','东坡区','0','393','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2550','仁寿县','0','393','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2551','彭山县','0','393','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2552','洪雅县','0','393','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2553','丹棱县','0','393','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2554','青神县','0','393','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2555','翠屏区','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2556','宜宾县','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2557','南溪县','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2558','江安县','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2559','长宁县','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2560','高县','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2561','珙县','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2562','筠连县','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2563','兴文县','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2564','屏山县','0','394','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2565','广安区','0','395','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2566','岳池县','0','395','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2567','武胜县','0','395','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2568','邻水县','0','395','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2569','华蓥市','0','395','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2570','通川区','0','396','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2571','达县','0','396','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2572','宣汉县','0','396','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2573','开江县','0','396','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2574','大竹县','0','396','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2575','渠县','0','396','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2576','万源市','0','396','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2577','雨城区','0','397','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2578','名山县','0','397','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2579','荥经县','0','397','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2580','汉源县','0','397','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2581','石棉县','0','397','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2582','天全县','0','397','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2583','芦山县','0','397','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2584','宝兴县','0','397','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2585','巴州区','0','398','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2586','通江县','0','398','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2587','南江县','0','398','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2588','平昌县','0','398','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2589','雁江区','0','399','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2590','安岳县','0','399','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2591','乐至县','0','399','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2592','简阳市','0','399','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2593','汶川县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2594','理县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2595','茂县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2596','松潘县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2597','九寨沟县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2598','金川县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2599','小金县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2600','黑水县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2601','马尔康县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2602','壤塘县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2603','阿坝县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2604','若尔盖县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2605','红原县','0','400','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2606','康定县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2607','泸定县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2608','丹巴县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2609','九龙县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2610','雅江县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2611','道孚县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2612','炉霍县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2613','甘孜县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2614','新龙县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2615','德格县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2616','白玉县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2617','石渠县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2618','色达县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2619','理塘县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2620','巴塘县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2621','乡城县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2622','稻城县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2623','得荣县','0','401','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2624','西昌市','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2625','木里藏族自治县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2626','盐源县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2627','德昌县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2628','会理县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2629','会东县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2630','宁南县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2631','普格县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2632','布拖县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2633','金阳县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2634','昭觉县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2635','喜德县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2636','冕宁县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2637','越西县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2638','甘洛县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2639','美姑县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2640','雷波县','0','402','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2641','南明区','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2642','云岩区','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2643','花溪区','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2644','乌当区','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2645','白云区','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2646','小河区','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2647','开阳县','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2648','息烽县','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2649','修文县','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2650','清镇市','0','403','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2651','钟山区','0','404','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2652','六枝特区','0','404','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2653','水城县','0','404','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2654','盘县','0','404','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2655','红花岗区','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2656','汇川区','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2657','遵义县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2658','桐梓县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2659','绥阳县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2660','正安县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2661','道真仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2662','务川仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2663','凤冈县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2664','湄潭县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2665','余庆县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2666','习水县','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2667','赤水市','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2668','仁怀市','0','405','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2669','西秀区','0','406','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2670','平坝县','0','406','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2671','普定县','0','406','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2672','镇宁布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2673','关岭布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2674','紫云苗族布依族自治县','0','406','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2675','铜仁市','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2676','江口县','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2677','玉屏侗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2678','石阡县','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2679','思南县','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2680','印江土家族苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2681','德江县','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2682','沿河土家族自治县','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2683','松桃苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2684','万山特区','0','407','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2685','兴义市','0','408','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2686','兴仁县','0','408','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2687','普安县','0','408','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2688','晴隆县','0','408','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2689','贞丰县','0','408','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2690','望谟县','0','408','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2691','册亨县','0','408','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2692','安龙县','0','408','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2693','毕节市','0','409','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2694','大方县','0','409','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2695','黔西县','0','409','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2696','金沙县','0','409','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2697','织金县','0','409','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2698','纳雍县','0','409','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2699','威宁彝族回族苗族自治县','0','409','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2700','赫章县','0','409','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2701','凯里市','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2702','黄平县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2703','施秉县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2704','三穗县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2705','镇远县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2706','岑巩县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2707','天柱县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2708','锦屏县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2709','剑河县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2710','台江县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2711','黎平县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2712','榕江县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2713','从江县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2714','雷山县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2715','麻江县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2716','丹寨县','0','410','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2717','都匀市','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2718','福泉市','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2719','荔波县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2720','贵定县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2721','瓮安县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2722','独山县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2723','平塘县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2724','罗甸县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2725','长顺县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2726','龙里县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2727','惠水县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2728','三都水族自治县','0','411','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2729','五华区','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2730','盘龙区','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2731','官渡区','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2732','西山区','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2733','东川区','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2734','呈贡县','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2735','晋宁县','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2736','富民县','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2737','宜良县','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2738','石林彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2739','嵩明县','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2740','禄劝彝族苗族自治县','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2741','寻甸回族彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2742','安宁市','0','412','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2743','麒麟区','0','413','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2744','马龙县','0','413','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2745','陆良县','0','413','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2746','师宗县','0','413','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2747','罗平县','0','413','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2748','富源县','0','413','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2749','会泽县','0','413','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2750','沾益县','0','413','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2751','宣威市','0','413','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2752','红塔区','0','414','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2753','江川县','0','414','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2754','澄江县','0','414','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2755','通海县','0','414','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2756','华宁县','0','414','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2757','易门县','0','414','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2758','峨山彝族自治县','0','414','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2759','新平彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2760','元江哈尼族彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2761','隆阳区','0','415','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2762','施甸县','0','415','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2763','腾冲县','0','415','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2764','龙陵县','0','415','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2765','昌宁县','0','415','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2766','昭阳区','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2767','鲁甸县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2768','巧家县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2769','盐津县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2770','大关县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2771','永善县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2772','绥江县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2773','镇雄县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2774','彝良县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2775','威信县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2776','水富县','0','416','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2777','古城区','0','417','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2778','玉龙纳西族自治县','0','417','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2779','永胜县','0','417','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2780','华坪县','0','417','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2781','宁蒗彝族自治县','0','417','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2782','翠云区','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2783','普洱哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2784','墨江哈尼族自治县','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2785','景东彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2786','景谷傣族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2787','镇沅彝族哈尼族拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2788','江城哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2789','孟连傣族拉祜族佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2790','澜沧拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2791','西盟佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2792','临翔区','0','419','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2793','凤庆县','0','419','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2794','云县','0','419','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2795','永德县','0','419','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2796','镇康县','0','419','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2797','双江拉祜族佤族布朗族傣族自治县','0','419','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2798','耿马傣族佤族自治县','0','419','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2799','沧源佤族自治县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2800','楚雄市','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2801','双柏县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2802','牟定县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2803','南华县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2804','姚安县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2805','大姚县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2806','永仁县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2807','元谋县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2808','武定县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2809','禄丰县','0','420','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2810','个旧市','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2811','开远市','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2812','蒙自县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2813','屏边苗族自治县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2814','建水县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2815','石屏县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2816','弥勒县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2817','泸西县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2818','元阳县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2819','红河县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2820','金平苗族瑶族傣族自治县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2821','绿春县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2822','河口瑶族自治县','0','421','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2823','文山县','0','422','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2824','砚山县','0','422','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2825','西畴县','0','422','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2826','麻栗坡县','0','422','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2827','马关县','0','422','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2828','丘北县','0','422','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2829','广南县','0','422','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2830','富宁县','0','422','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2831','景洪市','0','423','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2832','勐海县','0','423','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2833','勐腊县','0','423','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2834','大理市','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2835','漾濞彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2836','祥云县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2837','宾川县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2838','弥渡县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2839','南涧彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2840','巍山彝族回族自治县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2841','永平县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2842','云龙县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2843','洱源县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2844','剑川县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2845','鹤庆县','0','424','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2846','瑞丽市','0','425','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2847','潞西市','0','425','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2848','梁河县','0','425','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2849','盈江县','0','425','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2850','陇川县','0','425','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2851','泸水县','0','426','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2852','福贡县','0','426','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2853','贡山独龙族怒族自治县','0','426','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2854','兰坪白族普米族自治县','0','426','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2855','香格里拉县','0','427','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2856','德钦县','0','427','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2857','维西傈僳族自治县','0','427','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2858','城关区','0','428','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2859','林周县','0','428','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2860','当雄县','0','428','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2861','尼木县','0','428','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2862','曲水县','0','428','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2863','堆龙德庆县','0','428','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2864','达孜县','0','428','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2865','墨竹工卡县','0','428','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2866','昌都县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2867','江达县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2868','贡觉县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2869','类乌齐县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2870','丁青县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2871','察雅县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2872','八宿县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2873','左贡县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2874','芒康县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2875','洛隆县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2876','边坝县','0','429','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2877','乃东县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2878','扎囊县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2879','贡嘎县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2880','桑日县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2881','琼结县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2882','曲松县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2883','措美县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2884','洛扎县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2885','加查县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2886','隆子县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2887','错那县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2888','浪卡子县','0','430','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2889','日喀则市','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2890','南木林县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2891','江孜县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2892','定日县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2893','萨迦县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2894','拉孜县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2895','昂仁县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2896','谢通门县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2897','白朗县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2898','仁布县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2899','康马县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2900','定结县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2901','仲巴县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2902','亚东县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2903','吉隆县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2904','聂拉木县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2905','萨嘎县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2906','岗巴县','0','431','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2907','那曲县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2908','嘉黎县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2909','比如县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2910','聂荣县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2911','安多县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2912','申扎县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2913','索县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2914','班戈县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2915','巴青县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2916','尼玛县','0','432','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2917','普兰县','0','433','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2918','札达县','0','433','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2919','噶尔县','0','433','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2920','日土县','0','433','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2921','革吉县','0','433','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2922','改则县','0','433','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2923','措勤县','0','433','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2924','林芝县','0','434','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2925','工布江达县','0','434','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2926','米林县','0','434','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2927','墨脱县','0','434','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2928','波密县','0','434','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2929','察隅县','0','434','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2930','朗县','0','434','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2931','新城区','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2932','碑林区','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2933','莲湖区','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2934','灞桥区','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2935','未央区','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2936','雁塔区','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2937','阎良区','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2938','临潼区','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2939','长安区','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2940','蓝田县','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2941','周至县','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2942','户县','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2943','高陵县','0','435','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2944','王益区','0','436','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2945','印台区','0','436','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2946','耀州区','0','436','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2947','宜君县','0','436','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2948','渭滨区','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2949','金台区','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2950','陈仓区','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2951','凤翔县','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2952','岐山县','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2953','扶风县','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2954','眉县','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2955','陇县','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2956','千阳县','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2957','麟游县','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2958','凤县','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2959','太白县','0','437','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2960','秦都区','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2961','杨凌区','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2962','渭城区','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2963','三原县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2964','泾阳县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2965','乾县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2966','礼泉县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2967','永寿县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2968','彬县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2969','长武县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2970','旬邑县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2971','淳化县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2972','武功县','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2973','兴平市','0','438','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2974','临渭区','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2975','华县','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2976','潼关县','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2977','大荔县','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2978','合阳县','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2979','澄城县','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2980','蒲城县','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2981','白水县','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2982','富平县','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2983','韩城市','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2984','华阴市','0','439','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2985','宝塔区','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2986','延长县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2987','延川县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2988','子长县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2989','安塞县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2990','志丹县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2991','吴起县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2992','甘泉县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2993','富县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2994','洛川县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2995','宜川县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2996','黄龙县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2997','黄陵县','0','440','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2998','汉台区','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('2999','南郑县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3000','城固县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3001','洋县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3002','西乡县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3003','勉县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3004','宁强县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3005','略阳县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3006','镇巴县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3007','留坝县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3008','佛坪县','0','441','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3009','榆阳区','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3010','神木县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3011','府谷县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3012','横山县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3013','靖边县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3014','定边县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3015','绥德县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3016','米脂县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3017','佳县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3018','吴堡县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3019','清涧县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3020','子洲县','0','442','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3021','汉滨区','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3022','汉阴县','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3023','石泉县','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3024','宁陕县','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3025','紫阳县','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3026','岚皋县','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3027','平利县','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3028','镇坪县','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3029','旬阳县','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3030','白河县','0','443','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3031','商州区','0','444','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3032','洛南县','0','444','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3033','丹凤县','0','444','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3034','商南县','0','444','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3035','山阳县','0','444','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3036','镇安县','0','444','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3037','柞水县','0','444','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3038','城关区','0','445','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3039','七里河区','0','445','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3040','西固区','0','445','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3041','安宁区','0','445','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3042','红古区','0','445','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3043','永登县','0','445','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3044','皋兰县','0','445','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3045','榆中县','0','445','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3046','金川区','0','447','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3047','永昌县','0','447','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3048','白银区','0','448','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3049','平川区','0','448','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3050','靖远县','0','448','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3051','会宁县','0','448','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3052','景泰县','0','448','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3053','秦城区','0','449','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3054','北道区','0','449','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3055','清水县','0','449','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3056','秦安县','0','449','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3057','甘谷县','0','449','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3058','武山县','0','449','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3059','张家川回族自治县','0','449','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3060','凉州区','0','450','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3061','民勤县','0','450','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3062','古浪县','0','450','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3063','天祝藏族自治县','0','450','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3064','甘州区','0','451','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3065','肃南裕固族自治县','0','451','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3066','民乐县','0','451','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3067','临泽县','0','451','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3068','高台县','0','451','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3069','山丹县','0','451','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3070','崆峒区','0','452','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3071','泾川县','0','452','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3072','灵台县','0','452','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3073','崇信县','0','452','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3074','华亭县','0','452','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3075','庄浪县','0','452','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3076','静宁县','0','452','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3077','肃州区','0','453','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3078','金塔县','0','453','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3079','瓜州县','0','453','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3080','肃北蒙古族自治县','0','453','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3081','阿克塞哈萨克族自治县','0','453','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3082','玉门市','0','453','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3083','敦煌市','0','453','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3084','西峰区','0','454','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3085','庆城县','0','454','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3086','环县','0','454','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3087','华池县','0','454','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3088','合水县','0','454','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3089','正宁县','0','454','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3090','宁县','0','454','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3091','镇原县','0','454','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3092','安定区','0','455','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3093','通渭县','0','455','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3094','陇西县','0','455','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3095','渭源县','0','455','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3096','临洮县','0','455','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3097','漳县','0','455','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3098','岷县','0','455','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3099','武都区','0','456','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3100','成县','0','456','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3101','文县','0','456','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3102','宕昌县','0','456','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3103','康县','0','456','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3104','西和县','0','456','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3105','礼县','0','456','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3106','徽县','0','456','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3107','两当县','0','456','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3108','临夏市','0','457','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3109','临夏县','0','457','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3110','康乐县','0','457','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3111','永靖县','0','457','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3112','广河县','0','457','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3113','和政县','0','457','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3114','东乡族自治县','0','457','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3115','积石山保安族东乡族撒拉族自治县','0','457','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3116','合作市','0','458','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3117','临潭县','0','458','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3118','卓尼县','0','458','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3119','舟曲县','0','458','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3120','迭部县','0','458','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3121','玛曲县','0','458','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3122','碌曲县','0','458','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3123','夏河县','0','458','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3124','城东区','0','459','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3125','城中区','0','459','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3126','城西区','0','459','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3127','城北区','0','459','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3128','大通回族土族自治县','0','459','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3129','湟中县','0','459','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3130','湟源县','0','459','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3131','平安县','0','460','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3132','民和回族土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3133','乐都县','0','460','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3134','互助土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3135','化隆回族自治县','0','460','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3136','循化撒拉族自治县','0','460','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3137','门源回族自治县','0','461','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3138','祁连县','0','461','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3139','海晏县','0','461','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3140','刚察县','0','461','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3141','同仁县','0','462','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3142','尖扎县','0','462','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3143','泽库县','0','462','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3144','河南蒙古族自治县','0','462','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3145','共和县','0','463','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3146','同德县','0','463','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3147','贵德县','0','463','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3148','兴海县','0','463','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3149','贵南县','0','463','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3150','玛沁县','0','464','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3151','班玛县','0','464','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3152','甘德县','0','464','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3153','达日县','0','464','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3154','久治县','0','464','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3155','玛多县','0','464','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3156','玉树县','0','465','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3157','杂多县','0','465','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3158','称多县','0','465','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3159','治多县','0','465','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3160','囊谦县','0','465','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3161','曲麻莱县','0','465','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3162','格尔木市','0','466','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3163','德令哈市','0','466','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3164','乌兰县','0','466','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3165','都兰县','0','466','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3166','天峻县','0','466','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3167','兴庆区','0','467','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3168','西夏区','0','467','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3169','金凤区','0','467','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3170','永宁县','0','467','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3171','贺兰县','0','467','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3172','灵武市','0','467','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3173','大武口区','0','468','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3174','惠农区','0','468','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3175','平罗县','0','468','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3176','利通区','0','469','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3177','盐池县','0','469','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3178','同心县','0','469','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3179','青铜峡市','0','469','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3180','原州区','0','470','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3181','西吉县','0','470','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3182','隆德县','0','470','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3183','泾源县','0','470','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3184','彭阳县','0','470','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3185','沙坡头区','0','471','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3186','中宁县','0','471','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3187','海原县','0','471','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3188','天山区','0','472','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3189','沙依巴克区','0','472','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3190','新市区','0','472','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3191','水磨沟区','0','472','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3192','头屯河区','0','472','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3193','达坂城区','0','472','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3194','东山区','0','472','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3195','乌鲁木齐县','0','472','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3196','独山子区','0','473','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3197','克拉玛依区','0','473','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3198','白碱滩区','0','473','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3199','乌尔禾区','0','473','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3200','吐鲁番市','0','474','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3201','鄯善县','0','474','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3202','托克逊县','0','474','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3203','哈密市','0','475','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3204','巴里坤哈萨克自治县','0','475','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3205','伊吾县','0','475','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3206','昌吉市','0','476','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3207','阜康市','0','476','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3208','米泉市','0','476','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3209','呼图壁县','0','476','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3210','玛纳斯县','0','476','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3211','奇台县','0','476','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3212','吉木萨尔县','0','476','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3213','木垒哈萨克自治县','0','476','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3214','博乐市','0','477','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3215','精河县','0','477','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3216','温泉县','0','477','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3217','库尔勒市','0','478','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3218','轮台县','0','478','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3219','尉犁县','0','478','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3220','若羌县','0','478','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3221','且末县','0','478','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3222','焉耆回族自治县','0','478','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3223','和静县','0','478','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3224','和硕县','0','478','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3225','博湖县','0','478','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3226','阿克苏市','0','479','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3227','温宿县','0','479','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3228','库车县','0','479','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3229','沙雅县','0','479','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3230','新和县','0','479','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3231','拜城县','0','479','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3232','乌什县','0','479','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3233','阿瓦提县','0','479','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3234','柯坪县','0','479','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3235','阿图什市','0','480','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3236','阿克陶县','0','480','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3237','阿合奇县','0','480','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3238','乌恰县','0','480','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3239','喀什市','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3240','疏附县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3241','疏勒县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3242','英吉沙县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3243','泽普县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3244','莎车县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3245','叶城县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3246','麦盖提县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3247','岳普湖县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3248','伽师县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3249','巴楚县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3250','塔什库尔干塔吉克自治县','0','481','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3251','和田市','0','482','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3252','和田县','0','482','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3253','墨玉县','0','482','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3254','皮山县','0','482','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3255','洛浦县','0','482','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3256','策勒县','0','482','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3257','于田县','0','482','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3258','民丰县','0','482','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3259','伊宁市','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3260','奎屯市','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3261','伊宁县','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3262','察布查尔锡伯自治县','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3263','霍城县','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3264','巩留县','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3265','新源县','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3266','昭苏县','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3267','特克斯县','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3268','尼勒克县','0','483','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3269','塔城市','0','484','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3270','乌苏市','0','484','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3271','额敏县','0','484','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3272','沙湾县','0','484','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3273','托里县','0','484','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3274','裕民县','0','484','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3275','和布克赛尔蒙古自治县','0','484','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3276','阿勒泰市','0','485','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3277','布尔津县','0','485','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3278','富蕴县','0','485','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3279','福海县','0','485','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3280','哈巴河县','0','485','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3281','青河县','0','485','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3282','吉木乃县','0','485','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3358','钓鱼岛','','0','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3359','钓鱼岛','','3358','0','','1','0','','','0');
INSERT INTO `zb_linkage` VALUES('3360','招聘标签','0','0','0','','0','0','','','0');
INSERT INTO `zb_linkage` VALUES('3361','带薪年假','','0','0','3361','3360','0','','','0');
INSERT INTO `zb_linkage` VALUES('3362','五险一金','','0','0','3362','3360','0','','','0');
INSERT INTO `zb_linkage` VALUES('3363','周末双休','','0','0','3363','3360','0','','','0');

DROP TABLE IF EXISTS `zb_log`;
CREATE TABLE `zb_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=531 DEFAULT CHARSET=utf8;

INSERT INTO `zb_log` VALUES('1','','0','admin','','index','?m=admin&c=index&a=login','','0','','103.43.186.34','2017-08-15 10:46:29');
INSERT INTO `zb_log` VALUES('2','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.226.125.100','2017-08-15 10:46:39');
INSERT INTO `zb_log` VALUES('3','','0','admin','','index','?m=admin&c=index&a=login','','0','','103.43.186.34','2017-08-15 10:46:58');
INSERT INTO `zb_log` VALUES('4','','0','admin','','index','?m=admin&c=index&a=login','','0','','103.43.186.34','2017-08-15 10:47:13');
INSERT INTO `zb_log` VALUES('5','','0','admin','','index','?m=admin&c=index&a=login','','0','','103.43.186.34','2017-08-15 10:54:20');
INSERT INTO `zb_log` VALUES('6','','0','admin','','index','?m=admin&c=index&a=login','','0','','103.43.186.34','2017-08-15 10:54:28');
INSERT INTO `zb_log` VALUES('7','','0','admin','','category','?m=admin&c=category&a=delete','','1','admin','103.43.186.34','2017-08-15 10:54:43');
INSERT INTO `zb_log` VALUES('8','','0','admin','','category','?m=admin&c=category&a=delete','','1','admin','103.43.186.34','2017-08-15 10:54:49');
INSERT INTO `zb_log` VALUES('9','','0','admin','','category','?m=admin&c=category&a=delete','','1','admin','103.43.186.34','2017-08-15 10:54:52');
INSERT INTO `zb_log` VALUES('10','','0','admin','','category','?m=admin&c=category&a=delete','','1','admin','103.43.186.34','2017-08-15 10:54:55');
INSERT INTO `zb_log` VALUES('11','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 10:58:34');
INSERT INTO `zb_log` VALUES('12','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:01:45');
INSERT INTO `zb_log` VALUES('13','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:02:11');
INSERT INTO `zb_log` VALUES('14','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:02:24');
INSERT INTO `zb_log` VALUES('15','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:02:25');
INSERT INTO `zb_log` VALUES('16','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:02:41');
INSERT INTO `zb_log` VALUES('17','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:03:04');
INSERT INTO `zb_log` VALUES('18','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:03:37');
INSERT INTO `zb_log` VALUES('19','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:03:44');
INSERT INTO `zb_log` VALUES('20','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:03:55');
INSERT INTO `zb_log` VALUES('21','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:04:01');
INSERT INTO `zb_log` VALUES('22','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:04:22');
INSERT INTO `zb_log` VALUES('23','','0','content','','content','?m=content&c=content&a=add','','1','admin','103.43.186.34','2017-08-15 11:08:29');
INSERT INTO `zb_log` VALUES('24','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:08:59');
INSERT INTO `zb_log` VALUES('25','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:09:25');
INSERT INTO `zb_log` VALUES('26','','0','content','','content','?m=content&c=content&a=add','','1','admin','103.43.186.34','2017-08-15 11:09:51');
INSERT INTO `zb_log` VALUES('27','','0','content','','content','?m=content&c=content&a=add','','1','admin','103.43.186.34','2017-08-15 11:09:54');
INSERT INTO `zb_log` VALUES('28','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:10:09');
INSERT INTO `zb_log` VALUES('29','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','103.43.186.34','2017-08-15 11:10:30');
INSERT INTO `zb_log` VALUES('30','','0','content','','sitemodel','?m=content&c=sitemodel&a=edit','','1','admin','103.43.186.34','2017-08-15 11:10:38');
INSERT INTO `zb_log` VALUES('31','','0','content','','content','?m=content&c=content&a=add','','1','admin','103.43.186.34','2017-08-15 11:10:48');
INSERT INTO `zb_log` VALUES('32','','0','template','','file','?m=template&c=file&a=edit_pc_tag','','1','admin','103.43.186.34','2017-08-15 11:11:04');
INSERT INTO `zb_log` VALUES('33','','0','content','','content','?m=content&c=content&a=add','','1','admin','103.43.186.34','2017-08-15 11:11:15');
INSERT INTO `zb_log` VALUES('34','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','103.43.186.34','2017-08-15 11:12:14');
INSERT INTO `zb_log` VALUES('35','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','103.43.186.34','2017-08-15 11:12:15');
INSERT INTO `zb_log` VALUES('36','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','103.43.186.34','2017-08-15 11:12:24');
INSERT INTO `zb_log` VALUES('37','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','103.43.186.34','2017-08-15 11:12:29');
INSERT INTO `zb_log` VALUES('38','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','103.43.186.34','2017-08-15 11:12:30');
INSERT INTO `zb_log` VALUES('39','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','103.43.186.34','2017-08-15 11:12:32');
INSERT INTO `zb_log` VALUES('40','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','103.43.186.34','2017-08-15 11:12:42');
INSERT INTO `zb_log` VALUES('41','','0','admin','','category','?m=admin&c=category&a=batch_edit','','1','admin','103.43.186.34','2017-08-15 11:12:56');
INSERT INTO `zb_log` VALUES('42','','0','admin','','category','?m=admin&c=category&a=batch_edit','','1','admin','103.43.186.34','2017-08-15 11:13:04');
INSERT INTO `zb_log` VALUES('43','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 13:56:46');
INSERT INTO `zb_log` VALUES('44','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 13:57:35');
INSERT INTO `zb_log` VALUES('45','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 13:57:42');
INSERT INTO `zb_log` VALUES('46','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 13:58:00');
INSERT INTO `zb_log` VALUES('47','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 13:58:37');
INSERT INTO `zb_log` VALUES('48','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','103.43.186.34','2017-08-15 14:01:13');
INSERT INTO `zb_log` VALUES('49','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','103.43.186.34','2017-08-15 14:01:17');
INSERT INTO `zb_log` VALUES('50','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 14:10:33');
INSERT INTO `zb_log` VALUES('51','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 14:11:18');
INSERT INTO `zb_log` VALUES('52','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 14:11:20');
INSERT INTO `zb_log` VALUES('53','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','103.43.186.34','2017-08-15 14:11:30');
INSERT INTO `zb_log` VALUES('54','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','103.43.186.34','2017-08-15 14:11:37');
INSERT INTO `zb_log` VALUES('55','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','103.43.186.34','2017-08-15 14:37:01');
INSERT INTO `zb_log` VALUES('56','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','103.43.186.34','2017-08-15 14:37:09');
INSERT INTO `zb_log` VALUES('57','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','103.43.186.34','2017-08-15 14:46:05');
INSERT INTO `zb_log` VALUES('58','','0','member','','member','?m=member&c=member&a=manage','','1','admin','103.43.186.34','2017-08-15 14:48:14');
INSERT INTO `zb_log` VALUES('59','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','103.43.186.34','2017-08-15 14:48:15');
INSERT INTO `zb_log` VALUES('60','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','103.43.186.34','2017-08-15 14:48:18');
INSERT INTO `zb_log` VALUES('61','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 14:58:06');
INSERT INTO `zb_log` VALUES('62','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 14:59:00');
INSERT INTO `zb_log` VALUES('63','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 14:59:06');
INSERT INTO `zb_log` VALUES('64','','0','admin','','menu','?m=admin&c=menu&a=delete','','1','admin','103.43.186.34','2017-08-15 14:59:26');
INSERT INTO `zb_log` VALUES('65','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 14:59:32');
INSERT INTO `zb_log` VALUES('66','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 14:59:49');
INSERT INTO `zb_log` VALUES('67','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','103.43.186.34','2017-08-15 15:00:50');
INSERT INTO `zb_log` VALUES('68','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','103.43.186.34','2017-08-15 15:01:34');
INSERT INTO `zb_log` VALUES('69','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','103.43.186.34','2017-08-15 15:27:50');
INSERT INTO `zb_log` VALUES('70','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','103.43.186.34','2017-08-15 15:27:54');
INSERT INTO `zb_log` VALUES('71','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','103.43.186.34','2017-08-15 15:27:58');
INSERT INTO `zb_log` VALUES('72','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:28:08');
INSERT INTO `zb_log` VALUES('73','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:28:44');
INSERT INTO `zb_log` VALUES('74','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:28:47');
INSERT INTO `zb_log` VALUES('75','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:29:30');
INSERT INTO `zb_log` VALUES('76','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:29:31');
INSERT INTO `zb_log` VALUES('77','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:30:07');
INSERT INTO `zb_log` VALUES('78','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','103.43.186.34','2017-08-15 15:30:33');
INSERT INTO `zb_log` VALUES('79','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:52:06');
INSERT INTO `zb_log` VALUES('80','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:53:02');
INSERT INTO `zb_log` VALUES('81','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:53:04');
INSERT INTO `zb_log` VALUES('82','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:54:06');
INSERT INTO `zb_log` VALUES('83','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:54:07');
INSERT INTO `zb_log` VALUES('84','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:54:38');
INSERT INTO `zb_log` VALUES('85','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','103.43.186.34','2017-08-15 15:54:39');
INSERT INTO `zb_log` VALUES('86','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','103.43.186.34','2017-08-15 15:54:55');
INSERT INTO `zb_log` VALUES('87','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:08:32');
INSERT INTO `zb_log` VALUES('88','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:09:04');
INSERT INTO `zb_log` VALUES('89','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:09:05');
INSERT INTO `zb_log` VALUES('90','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:09:23');
INSERT INTO `zb_log` VALUES('91','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:09:27');
INSERT INTO `zb_log` VALUES('92','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:09:54');
INSERT INTO `zb_log` VALUES('93','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.122','2017-08-15 16:10:09');
INSERT INTO `zb_log` VALUES('94','','0','admin','','linkage','?m=admin&c=linkage&a=edit','','1','admin','43.246.229.122','2017-08-15 16:28:09');
INSERT INTO `zb_log` VALUES('95','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:39:21');
INSERT INTO `zb_log` VALUES('96','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:39:44');
INSERT INTO `zb_log` VALUES('97','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:39:45');
INSERT INTO `zb_log` VALUES('98','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:40:06');
INSERT INTO `zb_log` VALUES('99','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:40:06');
INSERT INTO `zb_log` VALUES('100','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:40:29');
INSERT INTO `zb_log` VALUES('101','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:40:31');
INSERT INTO `zb_log` VALUES('102','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 16:41:16');
INSERT INTO `zb_log` VALUES('103','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.122','2017-08-15 16:41:40');
INSERT INTO `zb_log` VALUES('104','','0','admin','','linkage','?m=admin&c=linkage&a=add','','1','admin','43.246.229.122','2017-08-15 17:31:31');
INSERT INTO `zb_log` VALUES('105','','0','admin','','linkage','?m=admin&c=linkage&a=add','','1','admin','43.246.229.122','2017-08-15 17:31:54');
INSERT INTO `zb_log` VALUES('106','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 17:35:14');
INSERT INTO `zb_log` VALUES('107','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 17:35:47');
INSERT INTO `zb_log` VALUES('108','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 17:35:49');
INSERT INTO `zb_log` VALUES('109','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 17:36:13');
INSERT INTO `zb_log` VALUES('110','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 17:36:14');
INSERT INTO `zb_log` VALUES('111','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 17:36:31');
INSERT INTO `zb_log` VALUES('112','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 17:36:32');
INSERT INTO `zb_log` VALUES('113','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-15 17:36:59');
INSERT INTO `zb_log` VALUES('114','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.122','2017-08-15 17:37:17');
INSERT INTO `zb_log` VALUES('115','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.122','2017-08-16 09:24:55');
INSERT INTO `zb_log` VALUES('116','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.122','2017-08-16 09:25:03');
INSERT INTO `zb_log` VALUES('117','','0','content','','content','?m=content&c=content&a=add','','1','admin','43.246.229.122','2017-08-16 09:42:16');
INSERT INTO `zb_log` VALUES('118','','0','admin','','linkage','?m=admin&c=linkage&a=edit','','1','admin','43.246.229.122','2017-08-16 10:19:11');
INSERT INTO `zb_log` VALUES('119','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:02:58');
INSERT INTO `zb_log` VALUES('120','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:04:26');
INSERT INTO `zb_log` VALUES('121','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:04:53');
INSERT INTO `zb_log` VALUES('122','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:05:18');
INSERT INTO `zb_log` VALUES('123','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:05:36');
INSERT INTO `zb_log` VALUES('124','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:05:50');
INSERT INTO `zb_log` VALUES('125','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:06:20');
INSERT INTO `zb_log` VALUES('126','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:06:30');
INSERT INTO `zb_log` VALUES('127','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:06:32');
INSERT INTO `zb_log` VALUES('128','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:06:41');
INSERT INTO `zb_log` VALUES('129','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:06:49');
INSERT INTO `zb_log` VALUES('130','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:06:54');
INSERT INTO `zb_log` VALUES('131','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:07:16');
INSERT INTO `zb_log` VALUES('132','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:07:19');
INSERT INTO `zb_log` VALUES('133','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:07:41');
INSERT INTO `zb_log` VALUES('134','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:07:44');
INSERT INTO `zb_log` VALUES('135','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:07:55');
INSERT INTO `zb_log` VALUES('136','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:07:58');
INSERT INTO `zb_log` VALUES('137','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:08:08');
INSERT INTO `zb_log` VALUES('138','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:08:18');
INSERT INTO `zb_log` VALUES('139','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:08:27');
INSERT INTO `zb_log` VALUES('140','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:08:29');
INSERT INTO `zb_log` VALUES('141','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:08:36');
INSERT INTO `zb_log` VALUES('142','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:09:09');
INSERT INTO `zb_log` VALUES('143','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:09:17');
INSERT INTO `zb_log` VALUES('144','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:09:25');
INSERT INTO `zb_log` VALUES('145','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:09:34');
INSERT INTO `zb_log` VALUES('146','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:09:43');
INSERT INTO `zb_log` VALUES('147','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:09:50');
INSERT INTO `zb_log` VALUES('148','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:09:56');
INSERT INTO `zb_log` VALUES('149','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:10:11');
INSERT INTO `zb_log` VALUES('150','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:10:16');
INSERT INTO `zb_log` VALUES('151','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:10:25');
INSERT INTO `zb_log` VALUES('152','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:10:35');
INSERT INTO `zb_log` VALUES('153','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:10:47');
INSERT INTO `zb_log` VALUES('154','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:10:55');
INSERT INTO `zb_log` VALUES('155','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:11:04');
INSERT INTO `zb_log` VALUES('156','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:11:10');
INSERT INTO `zb_log` VALUES('157','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:11:20');
INSERT INTO `zb_log` VALUES('158','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:11:25');
INSERT INTO `zb_log` VALUES('159','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:11:41');
INSERT INTO `zb_log` VALUES('160','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:11:47');
INSERT INTO `zb_log` VALUES('161','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:11:55');
INSERT INTO `zb_log` VALUES('162','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:12:00');
INSERT INTO `zb_log` VALUES('163','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:12:06');
INSERT INTO `zb_log` VALUES('164','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:12:12');
INSERT INTO `zb_log` VALUES('165','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:12:17');
INSERT INTO `zb_log` VALUES('166','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:12:32');
INSERT INTO `zb_log` VALUES('167','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:12:48');
INSERT INTO `zb_log` VALUES('168','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:12:53');
INSERT INTO `zb_log` VALUES('169','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:13:02');
INSERT INTO `zb_log` VALUES('170','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:13:07');
INSERT INTO `zb_log` VALUES('171','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:13:17');
INSERT INTO `zb_log` VALUES('172','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:13:22');
INSERT INTO `zb_log` VALUES('173','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:13:30');
INSERT INTO `zb_log` VALUES('174','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 11:13:35');
INSERT INTO `zb_log` VALUES('175','','0','admin','','menu','?m=admin&c=menu&a=delete','','1','admin','43.246.229.122','2017-08-16 11:13:44');
INSERT INTO `zb_log` VALUES('176','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.122','2017-08-16 11:14:42');
INSERT INTO `zb_log` VALUES('177','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.122','2017-08-16 11:17:03');
INSERT INTO `zb_log` VALUES('178','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.122','2017-08-16 11:17:05');
INSERT INTO `zb_log` VALUES('179','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.122','2017-08-16 11:17:14');
INSERT INTO `zb_log` VALUES('180','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:21:03');
INSERT INTO `zb_log` VALUES('181','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:21:36');
INSERT INTO `zb_log` VALUES('182','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.122','2017-08-16 11:21:48');
INSERT INTO `zb_log` VALUES('183','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:22:24');
INSERT INTO `zb_log` VALUES('184','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:22:41');
INSERT INTO `zb_log` VALUES('185','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:22:46');
INSERT INTO `zb_log` VALUES('186','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:22:58');
INSERT INTO `zb_log` VALUES('187','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:22:59');
INSERT INTO `zb_log` VALUES('188','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 11:23:11');
INSERT INTO `zb_log` VALUES('189','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.122','2017-08-16 11:23:44');
INSERT INTO `zb_log` VALUES('190','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.122','2017-08-16 13:48:34');
INSERT INTO `zb_log` VALUES('191','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.122','2017-08-16 13:49:30');
INSERT INTO `zb_log` VALUES('192','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 13:49:44');
INSERT INTO `zb_log` VALUES('193','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 13:49:59');
INSERT INTO `zb_log` VALUES('194','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 13:50:06');
INSERT INTO `zb_log` VALUES('195','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 13:51:38');
INSERT INTO `zb_log` VALUES('196','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:04:24');
INSERT INTO `zb_log` VALUES('197','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:04:26');
INSERT INTO `zb_log` VALUES('198','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:04:28');
INSERT INTO `zb_log` VALUES('199','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:04:51');
INSERT INTO `zb_log` VALUES('200','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:04:54');
INSERT INTO `zb_log` VALUES('201','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:04:55');
INSERT INTO `zb_log` VALUES('202','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 14:33:58');
INSERT INTO `zb_log` VALUES('203','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.122','2017-08-16 14:34:56');
INSERT INTO `zb_log` VALUES('204','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:35:14');
INSERT INTO `zb_log` VALUES('205','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:35:17');
INSERT INTO `zb_log` VALUES('206','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:35:31');
INSERT INTO `zb_log` VALUES('207','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:35:34');
INSERT INTO `zb_log` VALUES('208','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:35:46');
INSERT INTO `zb_log` VALUES('209','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:35:49');
INSERT INTO `zb_log` VALUES('210','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.122','2017-08-16 14:35:51');
INSERT INTO `zb_log` VALUES('211','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:00:45');
INSERT INTO `zb_log` VALUES('212','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:01:17');
INSERT INTO `zb_log` VALUES('213','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:01:27');
INSERT INTO `zb_log` VALUES('214','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:01:59');
INSERT INTO `zb_log` VALUES('215','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:02:01');
INSERT INTO `zb_log` VALUES('216','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:02:18');
INSERT INTO `zb_log` VALUES('217','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:02:20');
INSERT INTO `zb_log` VALUES('218','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:02:47');
INSERT INTO `zb_log` VALUES('219','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-16 16:03:04');
INSERT INTO `zb_log` VALUES('220','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:27:52');
INSERT INTO `zb_log` VALUES('221','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:28:17');
INSERT INTO `zb_log` VALUES('222','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:28:29');
INSERT INTO `zb_log` VALUES('223','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:28:53');
INSERT INTO `zb_log` VALUES('224','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:28:55');
INSERT INTO `zb_log` VALUES('225','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:29:15');
INSERT INTO `zb_log` VALUES('226','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:29:17');
INSERT INTO `zb_log` VALUES('227','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:29:47');
INSERT INTO `zb_log` VALUES('228','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-16 16:30:06');
INSERT INTO `zb_log` VALUES('229','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:36:25');
INSERT INTO `zb_log` VALUES('230','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:36:42');
INSERT INTO `zb_log` VALUES('231','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:36:53');
INSERT INTO `zb_log` VALUES('232','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:37:14');
INSERT INTO `zb_log` VALUES('233','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:37:16');
INSERT INTO `zb_log` VALUES('234','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:37:40');
INSERT INTO `zb_log` VALUES('235','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:37:41');
INSERT INTO `zb_log` VALUES('236','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 16:38:05');
INSERT INTO `zb_log` VALUES('237','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-16 16:38:19');
INSERT INTO `zb_log` VALUES('238','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:14:53');
INSERT INTO `zb_log` VALUES('239','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:15:28');
INSERT INTO `zb_log` VALUES('240','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:15:29');
INSERT INTO `zb_log` VALUES('241','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:15:42');
INSERT INTO `zb_log` VALUES('242','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:15:44');
INSERT INTO `zb_log` VALUES('243','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:16:19');
INSERT INTO `zb_log` VALUES('244','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-16 17:16:39');
INSERT INTO `zb_log` VALUES('245','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:16:53');
INSERT INTO `zb_log` VALUES('246','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:17:18');
INSERT INTO `zb_log` VALUES('247','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:17:19');
INSERT INTO `zb_log` VALUES('248','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:17:45');
INSERT INTO `zb_log` VALUES('249','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:17:55');
INSERT INTO `zb_log` VALUES('250','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:18:17');
INSERT INTO `zb_log` VALUES('251','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:18:35');
INSERT INTO `zb_log` VALUES('252','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:18:58');
INSERT INTO `zb_log` VALUES('253','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:18:59');
INSERT INTO `zb_log` VALUES('254','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:19:20');
INSERT INTO `zb_log` VALUES('255','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:19:26');
INSERT INTO `zb_log` VALUES('256','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:19:44');
INSERT INTO `zb_log` VALUES('257','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-16 17:20:04');
INSERT INTO `zb_log` VALUES('258','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:33:29');
INSERT INTO `zb_log` VALUES('259','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:33:51');
INSERT INTO `zb_log` VALUES('260','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:33:52');
INSERT INTO `zb_log` VALUES('261','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-16 17:34:20');
INSERT INTO `zb_log` VALUES('262','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 09:39:31');
INSERT INTO `zb_log` VALUES('263','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 09:39:46');
INSERT INTO `zb_log` VALUES('264','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-17 09:40:08');
INSERT INTO `zb_log` VALUES('265','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 09:40:14');
INSERT INTO `zb_log` VALUES('266','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 09:40:40');
INSERT INTO `zb_log` VALUES('267','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 09:40:41');
INSERT INTO `zb_log` VALUES('268','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 09:41:05');
INSERT INTO `zb_log` VALUES('269','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 09:41:06');
INSERT INTO `zb_log` VALUES('270','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 09:41:33');
INSERT INTO `zb_log` VALUES('271','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-17 09:41:50');
INSERT INTO `zb_log` VALUES('272','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:37:08');
INSERT INTO `zb_log` VALUES('273','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:37:43');
INSERT INTO `zb_log` VALUES('274','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:37:46');
INSERT INTO `zb_log` VALUES('275','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:38:13');
INSERT INTO `zb_log` VALUES('276','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:38:14');
INSERT INTO `zb_log` VALUES('277','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:38:40');
INSERT INTO `zb_log` VALUES('278','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-17 10:38:56');
INSERT INTO `zb_log` VALUES('279','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:52:10');
INSERT INTO `zb_log` VALUES('280','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:52:31');
INSERT INTO `zb_log` VALUES('281','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:52:38');
INSERT INTO `zb_log` VALUES('282','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:53:05');
INSERT INTO `zb_log` VALUES('283','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:56:45');
INSERT INTO `zb_log` VALUES('284','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:57:00');
INSERT INTO `zb_log` VALUES('285','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:57:08');
INSERT INTO `zb_log` VALUES('286','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:57:35');
INSERT INTO `zb_log` VALUES('287','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-17 10:57:53');
INSERT INTO `zb_log` VALUES('288','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 10:59:30');
INSERT INTO `zb_log` VALUES('289','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 12:55:39');
INSERT INTO `zb_log` VALUES('290','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 13:00:45');
INSERT INTO `zb_log` VALUES('291','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 13:01:03');
INSERT INTO `zb_log` VALUES('292','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 13:01:09');
INSERT INTO `zb_log` VALUES('293','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 13:01:29');
INSERT INTO `zb_log` VALUES('294','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 13:07:03');
INSERT INTO `zb_log` VALUES('295','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 13:07:16');
INSERT INTO `zb_log` VALUES('296','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 13:07:23');
INSERT INTO `zb_log` VALUES('297','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-17 13:07:49');
INSERT INTO `zb_log` VALUES('298','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-17 14:46:56');
INSERT INTO `zb_log` VALUES('299','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-17 14:47:04');
INSERT INTO `zb_log` VALUES('300','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','43.246.229.178','2017-08-17 17:23:00');
INSERT INTO `zb_log` VALUES('301','','0','admin','','index','?m=admin&c=index&a=login','','0','','43.246.229.178','2017-08-17 17:35:26');
INSERT INTO `zb_log` VALUES('302','','0','admin','','index','?m=admin&c=index&a=login','','0','','43.246.229.178','2017-08-17 17:35:27');
INSERT INTO `zb_log` VALUES('303','','0','admin','','index','?m=admin&c=index&a=login','','0','','43.246.229.178','2017-08-17 17:35:28');
INSERT INTO `zb_log` VALUES('304','','0','admin','','index','?m=admin&c=index&a=login','','0','','43.246.229.178','2017-08-18 09:04:59');
INSERT INTO `zb_log` VALUES('305','','0','admin','','index','?m=admin&c=index&a=login','','0','','43.246.229.178','2017-08-18 09:09:25');
INSERT INTO `zb_log` VALUES('306','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-18 13:19:01');
INSERT INTO `zb_log` VALUES('307','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-18 13:19:01');
INSERT INTO `zb_log` VALUES('308','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-18 13:19:09');
INSERT INTO `zb_log` VALUES('309','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-18 13:20:04');
INSERT INTO `zb_log` VALUES('310','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-18 13:20:10');
INSERT INTO `zb_log` VALUES('311','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-18 13:20:12');
INSERT INTO `zb_log` VALUES('312','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','43.246.229.178','2017-08-18 13:20:19');
INSERT INTO `zb_log` VALUES('313','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','43.246.229.178','2017-08-18 13:20:24');
INSERT INTO `zb_log` VALUES('314','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','43.246.229.178','2017-08-18 13:20:25');
INSERT INTO `zb_log` VALUES('315','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','43.246.229.178','2017-08-18 13:20:27');
INSERT INTO `zb_log` VALUES('316','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','43.246.229.178','2017-08-18 13:20:28');
INSERT INTO `zb_log` VALUES('317','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','43.246.229.178','2017-08-18 13:20:29');
INSERT INTO `zb_log` VALUES('318','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','43.246.229.178','2017-08-18 13:20:30');
INSERT INTO `zb_log` VALUES('319','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','43.246.229.178','2017-08-18 13:21:54');
INSERT INTO `zb_log` VALUES('320','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','43.246.229.178','2017-08-18 13:21:57');
INSERT INTO `zb_log` VALUES('321','','0','admin','','index','?m=admin&c=index&a=login','','0','','43.246.229.178','2017-08-18 16:44:04');
INSERT INTO `zb_log` VALUES('322','','0','admin','','index','?m=admin&c=index&a=login','','0','','43.246.229.178','2017-08-18 16:44:14');
INSERT INTO `zb_log` VALUES('323','','0','admin','','index','?m=admin&c=index&a=login','','0','','43.246.229.178','2017-08-18 16:45:25');
INSERT INTO `zb_log` VALUES('324','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-18 16:46:10');
INSERT INTO `zb_log` VALUES('325','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-18 16:46:40');
INSERT INTO `zb_log` VALUES('326','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-18 16:53:46');
INSERT INTO `zb_log` VALUES('327','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-18 16:55:17');
INSERT INTO `zb_log` VALUES('328','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-18 16:55:19');
INSERT INTO `zb_log` VALUES('329','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-18 16:55:34');
INSERT INTO `zb_log` VALUES('330','','0','admin','','index','?m=admin&c=index&a=login','','0','','43.246.229.178','2017-08-18 16:55:47');
INSERT INTO `zb_log` VALUES('331','','0','admin','','index','?m=admin&c=index&a=login','','0','','113.108.10.15','2017-08-18 17:05:46');
INSERT INTO `zb_log` VALUES('332','','0','admin','','index','?m=admin&c=index&a=login','','0','','183.3.239.168','2017-08-18 17:05:47');
INSERT INTO `zb_log` VALUES('333','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-18 17:06:00');
INSERT INTO `zb_log` VALUES('334','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-18 17:06:24');
INSERT INTO `zb_log` VALUES('335','','0','admin','','index','?m=admin&c=index&a=login','','0','','117.185.27.113','2017-08-18 17:07:52');
INSERT INTO `zb_log` VALUES('336','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:25:21');
INSERT INTO `zb_log` VALUES('337','','0','admin','','index','?m=admin&c=index&a=login','','0','','183.3.239.163','2017-08-19 08:25:30');
INSERT INTO `zb_log` VALUES('338','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.226.33.221','2017-08-19 08:25:31');
INSERT INTO `zb_log` VALUES('339','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:26:36');
INSERT INTO `zb_log` VALUES('340','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:27:03');
INSERT INTO `zb_log` VALUES('341','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:27:24');
INSERT INTO `zb_log` VALUES('342','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:27:28');
INSERT INTO `zb_log` VALUES('343','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:27:28');
INSERT INTO `zb_log` VALUES('344','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:27:32');
INSERT INTO `zb_log` VALUES('345','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.226.33.218','2017-08-19 08:27:39');
INSERT INTO `zb_log` VALUES('346','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:28:05');
INSERT INTO `zb_log` VALUES('347','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:28:08');
INSERT INTO `zb_log` VALUES('348','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:28:28');
INSERT INTO `zb_log` VALUES('349','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:28:55');
INSERT INTO `zb_log` VALUES('350','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 08:28:58');
INSERT INTO `zb_log` VALUES('351','','0','content','','content','?m=content&c=content&a=add','','1','admin','115.33.53.210','2017-08-19 08:31:21');
INSERT INTO `zb_log` VALUES('352','','0','content','','content','?m=content&c=content&a=add','','1','admin','115.33.53.210','2017-08-19 08:31:26');
INSERT INTO `zb_log` VALUES('353','','0','content','','content','?m=content&c=content&a=add','','1','admin','115.33.53.210','2017-08-19 08:31:29');
INSERT INTO `zb_log` VALUES('354','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 09:41:51');
INSERT INTO `zb_log` VALUES('355','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.33.53.210','2017-08-19 09:42:16');
INSERT INTO `zb_log` VALUES('356','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','43.246.229.178','2017-08-19 09:45:58');
INSERT INTO `zb_log` VALUES('357','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 09:47:01');
INSERT INTO `zb_log` VALUES('358','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 09:47:04');
INSERT INTO `zb_log` VALUES('359','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 09:47:06');
INSERT INTO `zb_log` VALUES('360','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=edit','','1','admin','43.246.229.178','2017-08-19 09:47:32');
INSERT INTO `zb_log` VALUES('361','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 09:47:47');
INSERT INTO `zb_log` VALUES('362','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 09:47:50');
INSERT INTO `zb_log` VALUES('363','','0','admin','','role','?m=admin&c=role&a=delete','','1','admin','43.246.229.178','2017-08-19 09:47:57');
INSERT INTO `zb_log` VALUES('364','','0','admin','','role','?m=admin&c=role&a=delete','','1','admin','43.246.229.178','2017-08-19 09:48:01');
INSERT INTO `zb_log` VALUES('365','','0','admin','','role','?m=admin&c=role&a=delete','','1','admin','43.246.229.178','2017-08-19 09:48:05');
INSERT INTO `zb_log` VALUES('366','','0','admin','','role','?m=admin&c=role&a=edit','','1','admin','43.246.229.178','2017-08-19 09:48:07');
INSERT INTO `zb_log` VALUES('367','','0','admin','','role','?m=admin&c=role&a=edit','','1','admin','43.246.229.178','2017-08-19 09:48:11');
INSERT INTO `zb_log` VALUES('368','','0','admin','','role','?m=admin&c=role&a=edit','','1','admin','43.246.229.178','2017-08-19 09:48:13');
INSERT INTO `zb_log` VALUES('369','','0','admin','','role','?m=admin&c=role&a=edit','','1','admin','43.246.229.178','2017-08-19 09:48:15');
INSERT INTO `zb_log` VALUES('370','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=edit','','1','admin','43.246.229.178','2017-08-19 09:48:19');
INSERT INTO `zb_log` VALUES('371','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 09:48:28');
INSERT INTO `zb_log` VALUES('372','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 09:48:30');
INSERT INTO `zb_log` VALUES('373','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 09:48:32');
INSERT INTO `zb_log` VALUES('374','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 09:50:54');
INSERT INTO `zb_log` VALUES('375','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 09:51:21');
INSERT INTO `zb_log` VALUES('376','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-19 09:51:34');
INSERT INTO `zb_log` VALUES('377','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 09:51:51');
INSERT INTO `zb_log` VALUES('378','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 09:52:32');
INSERT INTO `zb_log` VALUES('379','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','115.33.53.210','2017-08-19 09:52:34');
INSERT INTO `zb_log` VALUES('380','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','115.33.53.210','2017-08-19 09:52:40');
INSERT INTO `zb_log` VALUES('381','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','115.33.53.210','2017-08-19 09:52:51');
INSERT INTO `zb_log` VALUES('382','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:11:03');
INSERT INTO `zb_log` VALUES('383','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:11:54');
INSERT INTO `zb_log` VALUES('384','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:11:55');
INSERT INTO `zb_log` VALUES('385','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:12:12');
INSERT INTO `zb_log` VALUES('386','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:12:13');
INSERT INTO `zb_log` VALUES('387','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:12:31');
INSERT INTO `zb_log` VALUES('388','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-19 10:12:41');
INSERT INTO `zb_log` VALUES('389','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:37:43');
INSERT INTO `zb_log` VALUES('390','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:37:54');
INSERT INTO `zb_log` VALUES('391','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:38:00');
INSERT INTO `zb_log` VALUES('392','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:38:18');
INSERT INTO `zb_log` VALUES('393','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:38:19');
INSERT INTO `zb_log` VALUES('394','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:38:33');
INSERT INTO `zb_log` VALUES('395','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:38:34');
INSERT INTO `zb_log` VALUES('396','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 10:38:55');
INSERT INTO `zb_log` VALUES('397','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-19 10:39:07');
INSERT INTO `zb_log` VALUES('398','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','115.33.53.210','2017-08-19 10:46:26');
INSERT INTO `zb_log` VALUES('399','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','115.33.53.210','2017-08-19 10:46:37');
INSERT INTO `zb_log` VALUES('400','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','115.33.53.210','2017-08-19 10:46:39');
INSERT INTO `zb_log` VALUES('401','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','115.33.53.210','2017-08-19 10:46:53');
INSERT INTO `zb_log` VALUES('402','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 11:15:45');
INSERT INTO `zb_log` VALUES('403','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 11:15:57');
INSERT INTO `zb_log` VALUES('404','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 11:16:01');
INSERT INTO `zb_log` VALUES('405','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 11:16:28');
INSERT INTO `zb_log` VALUES('406','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 11:16:29');
INSERT INTO `zb_log` VALUES('407','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 11:16:45');
INSERT INTO `zb_log` VALUES('408','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 11:16:47');
INSERT INTO `zb_log` VALUES('409','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 11:17:15');
INSERT INTO `zb_log` VALUES('410','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 11:17:21');
INSERT INTO `zb_log` VALUES('411','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 11:17:24');
INSERT INTO `zb_log` VALUES('412','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-19 11:17:41');
INSERT INTO `zb_log` VALUES('413','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 11:26:12');
INSERT INTO `zb_log` VALUES('414','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 11:26:15');
INSERT INTO `zb_log` VALUES('415','','0','admin','','index','?m=admin&c=index&a=login','','0','','221.217.173.139','2017-08-19 12:42:36');
INSERT INTO `zb_log` VALUES('416','','0','admin','','index','?m=admin&c=index&a=login','','0','','221.217.173.139','2017-08-19 12:42:46');
INSERT INTO `zb_log` VALUES('417','','0','admin','','index','?m=admin&c=index&a=login','','0','','221.217.173.139','2017-08-19 12:42:47');
INSERT INTO `zb_log` VALUES('418','','0','admin','','index','?m=admin&c=index&a=login','','0','','221.217.173.139','2017-08-19 12:43:06');
INSERT INTO `zb_log` VALUES('419','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 13:25:24');
INSERT INTO `zb_log` VALUES('420','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 13:25:33');
INSERT INTO `zb_log` VALUES('421','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 13:25:39');
INSERT INTO `zb_log` VALUES('422','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 13:26:20');
INSERT INTO `zb_log` VALUES('423','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 13:26:22');
INSERT INTO `zb_log` VALUES('424','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 13:26:48');
INSERT INTO `zb_log` VALUES('425','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 13:26:49');
INSERT INTO `zb_log` VALUES('426','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 13:27:10');
INSERT INTO `zb_log` VALUES('427','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-19 13:27:27');
INSERT INTO `zb_log` VALUES('428','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 14:42:41');
INSERT INTO `zb_log` VALUES('429','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 14:42:50');
INSERT INTO `zb_log` VALUES('430','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 14:42:51');
INSERT INTO `zb_log` VALUES('431','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 14:43:01');
INSERT INTO `zb_log` VALUES('432','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 14:43:34');
INSERT INTO `zb_log` VALUES('433','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 14:43:52');
INSERT INTO `zb_log` VALUES('434','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 14:43:57');
INSERT INTO `zb_log` VALUES('435','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','43.246.229.178','2017-08-19 14:44:49');
INSERT INTO `zb_log` VALUES('436','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','43.246.229.178','2017-08-19 14:45:12');
INSERT INTO `zb_log` VALUES('437','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','43.246.229.178','2017-08-19 15:35:14');
INSERT INTO `zb_log` VALUES('438','','0','admin','','urlrule','?m=admin&c=urlrule&a=edit','','1','admin','43.246.229.178','2017-08-19 15:37:33');
INSERT INTO `zb_log` VALUES('439','','0','admin','','urlrule','?m=admin&c=urlrule&a=edit','','1','admin','43.246.229.178','2017-08-19 15:37:36');
INSERT INTO `zb_log` VALUES('440','','0','admin','','urlrule','?m=admin&c=urlrule&a=edit','','1','admin','43.246.229.178','2017-08-19 15:37:40');
INSERT INTO `zb_log` VALUES('441','','0','admin','','urlrule','?m=admin&c=urlrule&a=edit','','1','admin','43.246.229.178','2017-08-19 15:37:42');
INSERT INTO `zb_log` VALUES('442','','0','admin','','urlrule','?m=admin&c=urlrule&a=edit','','1','admin','43.246.229.178','2017-08-19 15:37:44');
INSERT INTO `zb_log` VALUES('443','','0','admin','','urlrule','?m=admin&c=urlrule&a=edit','','1','admin','43.246.229.178','2017-08-19 15:37:47');
INSERT INTO `zb_log` VALUES('444','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','43.246.229.178','2017-08-19 16:11:20');
INSERT INTO `zb_log` VALUES('445','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','43.246.229.178','2017-08-19 16:11:22');
INSERT INTO `zb_log` VALUES('446','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','43.246.229.178','2017-08-19 16:11:24');
INSERT INTO `zb_log` VALUES('447','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','43.246.229.178','2017-08-19 16:11:27');
INSERT INTO `zb_log` VALUES('448','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 16:12:01');
INSERT INTO `zb_log` VALUES('449','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 16:12:03');
INSERT INTO `zb_log` VALUES('450','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','115.33.53.210','2017-08-19 17:51:32');
INSERT INTO `zb_log` VALUES('451','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','115.33.53.210','2017-08-19 17:51:44');
INSERT INTO `zb_log` VALUES('452','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','115.33.53.210','2017-08-19 17:51:45');
INSERT INTO `zb_log` VALUES('453','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','115.33.53.210','2017-08-19 17:51:57');
INSERT INTO `zb_log` VALUES('454','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:11:30');
INSERT INTO `zb_log` VALUES('455','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:11:35');
INSERT INTO `zb_log` VALUES('456','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:12:19');
INSERT INTO `zb_log` VALUES('457','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:12:21');
INSERT INTO `zb_log` VALUES('458','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:12:23');
INSERT INTO `zb_log` VALUES('459','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:12:42');
INSERT INTO `zb_log` VALUES('460','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:13:16');
INSERT INTO `zb_log` VALUES('461','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:13:18');
INSERT INTO `zb_log` VALUES('462','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:13:33');
INSERT INTO `zb_log` VALUES('463','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:13:35');
INSERT INTO `zb_log` VALUES('464','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','43.246.229.178','2017-08-19 19:14:03');
INSERT INTO `zb_log` VALUES('465','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:14:29');
INSERT INTO `zb_log` VALUES('466','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:14:47');
INSERT INTO `zb_log` VALUES('467','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:14:48');
INSERT INTO `zb_log` VALUES('468','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','43.246.229.178','2017-08-19 19:14:52');
INSERT INTO `zb_log` VALUES('469','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','43.246.229.178','2017-08-19 19:14:54');
INSERT INTO `zb_log` VALUES('470','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','43.246.229.178','2017-08-19 19:14:54');
INSERT INTO `zb_log` VALUES('471','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:15:14');
INSERT INTO `zb_log` VALUES('472','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:15:17');
INSERT INTO `zb_log` VALUES('473','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','43.246.229.178','2017-08-19 19:15:18');
INSERT INTO `zb_log` VALUES('474','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-19 19:26:17');
INSERT INTO `zb_log` VALUES('475','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.226.89.119','2017-08-19 19:26:27');
INSERT INTO `zb_log` VALUES('476','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.163.2.117','2017-08-19 19:26:30');
INSERT INTO `zb_log` VALUES('477','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-19 19:28:45');
INSERT INTO `zb_log` VALUES('478','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','124.205.176.178','2017-08-22 09:33:03');
INSERT INTO `zb_log` VALUES('479','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','124.205.176.178','2017-08-22 09:33:15');
INSERT INTO `zb_log` VALUES('480','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','124.205.176.178','2017-08-22 09:33:28');
INSERT INTO `zb_log` VALUES('481','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-22 13:41:08');
INSERT INTO `zb_log` VALUES('482','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','124.205.176.178','2017-08-23 10:33:48');
INSERT INTO `zb_log` VALUES('483','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','124.205.176.178','2017-08-23 10:34:07');
INSERT INTO `zb_log` VALUES('484','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','124.205.176.178','2017-08-24 09:11:05');
INSERT INTO `zb_log` VALUES('485','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','124.205.176.178','2017-08-24 09:11:18');
INSERT INTO `zb_log` VALUES('486','','0','admin','','index','?m=admin&c=index&a=login','','0','','61.148.243.135','2017-08-24 09:12:03');
INSERT INTO `zb_log` VALUES('487','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-24 09:14:58');
INSERT INTO `zb_log` VALUES('488','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-24 09:15:09');
INSERT INTO `zb_log` VALUES('489','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','43.246.229.178','2017-08-24 09:17:34');
INSERT INTO `zb_log` VALUES('490','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','43.246.229.178','2017-08-24 09:17:42');
INSERT INTO `zb_log` VALUES('491','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','43.246.229.178','2017-08-24 09:17:43');
INSERT INTO `zb_log` VALUES('492','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','43.246.229.178','2017-08-24 09:17:44');
INSERT INTO `zb_log` VALUES('493','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:18:04');
INSERT INTO `zb_log` VALUES('494','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','43.246.229.178','2017-08-24 09:18:05');
INSERT INTO `zb_log` VALUES('495','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','124.205.176.178','2017-08-24 09:19:33');
INSERT INTO `zb_log` VALUES('496','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','124.205.176.178','2017-08-24 09:19:46');
INSERT INTO `zb_log` VALUES('497','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','124.205.176.178','2017-08-24 09:19:54');
INSERT INTO `zb_log` VALUES('498','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:20:31');
INSERT INTO `zb_log` VALUES('499','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','124.205.176.178','2017-08-24 09:23:54');
INSERT INTO `zb_log` VALUES('500','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','124.205.176.178','2017-08-24 09:24:01');
INSERT INTO `zb_log` VALUES('501','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','124.205.176.178','2017-08-24 09:25:26');
INSERT INTO `zb_log` VALUES('502','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','124.205.176.178','2017-08-24 09:26:06');
INSERT INTO `zb_log` VALUES('503','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','124.205.176.178','2017-08-24 09:27:24');
INSERT INTO `zb_log` VALUES('504','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:27:27');
INSERT INTO `zb_log` VALUES('505','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:27:42');
INSERT INTO `zb_log` VALUES('506','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','124.205.176.178','2017-08-24 09:30:10');
INSERT INTO `zb_log` VALUES('507','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=add','','1','admin','124.205.176.178','2017-08-24 09:31:02');
INSERT INTO `zb_log` VALUES('508','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:31:25');
INSERT INTO `zb_log` VALUES('509','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:31:42');
INSERT INTO `zb_log` VALUES('510','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:33:29');
INSERT INTO `zb_log` VALUES('511','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:33:31');
INSERT INTO `zb_log` VALUES('512','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.226.33.202','2017-08-24 09:33:33');
INSERT INTO `zb_log` VALUES('513','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:33:57');
INSERT INTO `zb_log` VALUES('514','','0','admin','','index','?m=admin&c=index&a=login','','0','zhaohui','124.205.176.178','2017-08-24 09:34:13');
INSERT INTO `zb_log` VALUES('515','','0','admin','','index','?m=admin&c=index&a=login','','0','zhaohui','124.205.176.178','2017-08-24 09:34:15');
INSERT INTO `zb_log` VALUES('516','','0','admin','','index','?m=admin&c=index&a=login','','0','zhaohui','124.205.176.178','2017-08-24 09:34:16');
INSERT INTO `zb_log` VALUES('517','','0','admin','','index','?m=admin&c=index&a=login','','0','zhaohui','124.205.176.178','2017-08-24 09:34:39');
INSERT INTO `zb_log` VALUES('518','','0','admin','','database','?m=admin&c=database&a=export','','3','liyu','124.205.176.178','2017-08-24 09:35:32');
INSERT INTO `zb_log` VALUES('519','','0','admin','','database','?m=admin&c=database&a=import','','3','liyu','124.205.176.178','2017-08-24 09:35:36');
INSERT INTO `zb_log` VALUES('520','','0','admin','','index','?m=admin&c=index&a=login','','0','','124.205.176.178','2017-08-24 09:36:13');
INSERT INTO `zb_log` VALUES('521','','0','admin','','database','?m=admin&c=database&a=export','','4','zhaohui','124.205.176.178','2017-08-24 10:22:16');
INSERT INTO `zb_log` VALUES('522','','0','admin','','database','?m=admin&c=database&a=import','','4','zhaohui','124.205.176.178','2017-08-24 10:22:26');
INSERT INTO `zb_log` VALUES('523','','0','admin','','database','?m=admin&c=database&a=export','','4','zhaohui','124.205.176.178','2017-08-24 10:22:29');
INSERT INTO `zb_log` VALUES('524','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-24 11:54:11');
INSERT INTO `zb_log` VALUES('525','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','43.246.229.178','2017-08-24 11:54:19');
INSERT INTO `zb_log` VALUES('526','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.151.64.201','2017-08-24 11:54:21');
INSERT INTO `zb_log` VALUES('527','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','43.246.229.178','2017-08-24 11:54:26');
INSERT INTO `zb_log` VALUES('528','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','43.246.229.178','2017-08-24 11:54:27');
INSERT INTO `zb_log` VALUES('529','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','43.246.229.178','2017-08-24 11:54:36');
INSERT INTO `zb_log` VALUES('530','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','43.246.229.178','2017-08-24 11:54:49');

DROP TABLE IF EXISTS `zb_member`;
CREATE TABLE `zb_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `zb_member` VALUES('1','1','IAPyfwJY','30af3b2d7a55974e7fdeda8cf9df2820','VJX3xM','','1502814747','1502814747','140.205.201.37','','0','IAPyfwJY@aliyun.com','2','0','0.00','0','11','0','0','0','0','1','','','');
INSERT INTO `zb_member` VALUES('2','2','gJStVHzW','072f151b853e61e331a71a43c6bc2770','2DTNE5','','1503051456','1503051456','140.205.225.187','','0','gJStVHzW@aliyun.com','2','0','0.00','0','11','0','0','0','0','1','','','');
INSERT INTO `zb_member` VALUES('3','3','xSTrsAku','abda052b04913301edc0a4208cbf7b85','kJlwzr','','1503328240','1503328240','140.205.225.201','','0','xSTrsAku@aliyun.com','2','0','0.00','0','11','0','0','0','0','1','','','');

DROP TABLE IF EXISTS `zb_member_detail`;
CREATE TABLE `zb_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_member_group`;
CREATE TABLE `zb_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `zb_member_group` VALUES('8','游客','1','0','0','0','0','0','0','1','0','0','0','0','0.00','0.00','0.00','','','','0','0');
INSERT INTO `zb_member_group` VALUES('2','新手上路','1','1','50','100','1','1','0','0','0','1','0','0','50.00','10.00','1.00','','','','2','0');
INSERT INTO `zb_member_group` VALUES('6','注册会员','1','2','100','150','0','1','0','0','1','1','0','0','300.00','30.00','1.00','','','','6','0');
INSERT INTO `zb_member_group` VALUES('4','中级会员','1','3','150','500','1','1','0','1','1','1','0','0','500.00','60.00','1.00','','','','4','0');
INSERT INTO `zb_member_group` VALUES('5','高级会员','1','5','300','999','1','1','0','1','1','1','0','0','360.00','90.00','5.00','','','','5','0');
INSERT INTO `zb_member_group` VALUES('1','禁止访问','1','0','0','0','1','1','0','1','0','0','0','0','0.00','0.00','0.00','','','0','0','0');
INSERT INTO `zb_member_group` VALUES('7','邮件认证','1','0','0','0','0','0','0','0','0','0','0','0','0.00','0.00','0.00','images/group/vip.jpg','#000000','','7','0');

DROP TABLE IF EXISTS `zb_member_menu`;
CREATE TABLE `zb_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `zb_member_menu` VALUES('1','member_init','0','member','index','init','t=0','0','1','','');
INSERT INTO `zb_member_menu` VALUES('2','account_manage','0','member','index','account_manage','t=1','0','1','','');
INSERT INTO `zb_member_menu` VALUES('3','favorite','0','member','index','favorite','t=2','0','1','','');

DROP TABLE IF EXISTS `zb_member_verify`;
CREATE TABLE `zb_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_member_vip`;
CREATE TABLE `zb_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_menu`;
CREATE TABLE `zb_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1672 DEFAULT CHARSET=utf8;

INSERT INTO `zb_menu` VALUES('1','sys_setting','0','admin','setting','init','','1','1','0','1','1','1','1');
INSERT INTO `zb_menu` VALUES('2','module','0','admin','module','init','','8','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('872','sync_release_point','873','release','index','init','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('4','content','0','content','content','init','','9','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('5','members','0','member','member','init','','5','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('6','userinterface','0','template','style','init','','6','0','0','1','1','1','1');
INSERT INTO `zb_menu` VALUES('30','correlative_setting','1','admin','admin','admin','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('31','menu_manage','977','admin','menu','init','','8','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('32','posid_manage','975','admin','position','init','','7','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('29','module_list','2','admin','module','','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('82','module_manage','2','admin','module','','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('10','panel','0','admin','index','public_main','','0','1','0','1','1','1','1');
INSERT INTO `zb_menu` VALUES('35','menu_add','31','admin','menu','add','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('826','template_manager','6','','','','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('54','admin_manage','49','admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('43','category_manage','975','admin','category','init','module=admin','4','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('42','add_category','43','admin','category','add','s=0','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('44','edit_category','43','admin','category','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('45','badword_manage','977','admin','badword','init','','10','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('46','posid_add','32','admin','position','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('49','admin_setting','1','admin','','','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('50','role_manage','49','admin','role','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('51','role_add','50','admin','role','add','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('52','category_cache','43','admin','category','public_cache','module=admin','4','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('55','manage_member','5','member','member','manage','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('58','admin_add','54','admin','admin_manage','add','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('59','model_manage','975','content','sitemodel','init','','5','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('64','site_management','30','admin','site','init','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('81','member_add','72','member','member','add','','2','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('62','add_model','59','content','sitemodel','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('65','release_point_management','30','admin','release_point','init','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('66','badword_export','45','admin','badword','export','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('67','add_site','64','admin','site','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('68','badword_import','45','admin','badword','import','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('812','member_group_manage','76','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('74','member_verify','55','member','member_verify','manage','s=0','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('76','manage_member_group','5','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('77','manage_member_model','5','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('78','member_group_add','812','member','member_group','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('79','member_model_add','813','member','member_model','add','','1','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('80','member_model_import','77','member','member_model','import','','2','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('72','member_manage','55','member','member','manage','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('813','member_model_manage','77','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('814','site_edit','64','admin','site','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('815','site_del','64','admin','site','del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('816','release_point_add','65','admin','release_point','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('817','release_point_del','65','admin','release_point','del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('818','release_point_edit','65','admin','release_point','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('821','content_publish','4','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('822','content_manage','821','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('867','linkage','977','admin','linkage','init','','13','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('827','template_style','826','template','style','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('828','import_style','827','template','style','import','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('831','template_export','827','template','style','export','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('830','template_file','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('832','template_onoff','827','template','style','disable','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('833','template_updatename','827','template','style','updatename','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('834','member_lock','72','member','member','lock','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('835','member_unlock','72','member','member','unlock','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('836','member_move','72','member','member','move','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('837','member_delete','72','member','member','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('842','verify_ignore','74','member','member_verify','manage','s=2','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('839','member_setting','55','member','member_setting','manage','','4','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('841','verify_pass','74','member','member_verify','manage','s=1','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('843','verify_delete','74','member','member_verify','manage','s=3','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('844','verify_deny','74','member','member_verify','manage','s=4','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('845','never_pass','74','member','member_verify','manage','s=5','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('846','template_file_list','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('847','template_file_edit','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('848','file_add_file','827','template','file','add_file','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('850','listorder','76','member','member_group','sort','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('852','priv_setting','50','admin','role','priv_setting','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('853','role_priv','50','admin','role','role_priv','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('857','attachment_manage','821','attachment','manage','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('868','special','821','special','special','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('869','template_editor','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('870','template_visualization','827','template','file','visualization','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('871','pc_tag_edit','827','template','file','edit_pc_tag','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('873','release_manage','4','release','html','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('874','type_manage','975','content','type_manage','init','','6','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('875','add_type','874','content','type_manage','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('876','linkageadd','867','admin','linkage','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('877','failure_list','872','release','index','failed','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('879','member_search','72','member','member','search','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('880','queue_del','872','release','index','del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('881','member_model_delete','813','member','member_model','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('882','member_model_edit','813','member','member_model','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('885','workflow','977','content','workflow','init','','15','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('888','add_workflow','885','content','workflow','add','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('889','member_modelfield_add','813','member','member_modelfield','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('890','member_modelfield_edit','813','member','member_modelfield','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('891','member_modelfield_delete','813','member','member_modelfield','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('892','member_modelfield_manage','813','member','member_modelfield','manage','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('895','sitemodel_import','59','content','sitemodel','import','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('896','pay','29','pay','payment','pay_list','s=3','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('897','payments','896','pay','payment','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('898','paylist','896','pay','payment','pay_list','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('899','add_content','822','content','content','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('900','modify_deposit','896','pay','payment','modify_deposit','s=1','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('901','check_content','822','content','content','pass','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('902','dbsource','29','dbsource','data','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('905','create_content_html','873','content','create_html','show','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('904','external_data_sources','902','dbsource','dbsource_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('906','update_urls','873','content','create_html','update_urls','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('960','node_add','957','collection','node','add','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('909','fulltext_search','29','search','search_type','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('910','manage_type','909','search','search_type','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('911','search_setting','909','search','search_admin','setting','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('912','createindex','909','search','search_admin','createindex','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('913','add_search_type','909','search','search_type','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('914','database_toos','1','admin','database','export','','6','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('915','database_export','914','admin','database','export','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('916','database_import','914','admin','database','import','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('917','dbsource_add','902','dbsource','dbsource_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('918','dbsource_edit','902','dbsource','dbsource_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('919','dbsource_del','902','dbsource','dbsource_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('920','dbsource_data_add','902','dbsource','data','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('921','dbsource_data_edit','902','dbsource','data','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('922','dbsource_data_del','902','dbsource','data','del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('926','add_special','868','special','special','add','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('927','edit_special','868','special','special','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('928','special_list','868','special','special','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('929','special_elite','868','special','special','elite','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('930','delete_special','868','special','special','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('931','badword_add','45','admin','badword','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('932','badword_edit','45','admin','badword','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('933','badword_delete','45','admin','badword','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('934','special_listorder','868','special','special','listorder','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('935','special_content_list','868','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('936','special_content_add','935','special','content','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('937','special_content_list','935','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('938','special_content_edit','935','special','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('939','special_content_delete','935','special','content','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('940','special_content_listorder','935','special','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('941','special_content_import','935','special','special','import','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('942','history_version','827','template','template_bak','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('943','restore_version','827','template','template_bak','restore','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('944','del_history_version','827','template','template_bak','del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('945','block','821','block','block_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('946','block_add','945','block','block_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('950','block_edit','945','block','block_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('951','block_del','945','block','block_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('952','block_update','945','block','block_admin','block_update','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('953','block_restore','945','block','block_admin','history_restore','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('954','history_del','945','block','block_admin','history_del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('978','urlrule_manage','977','admin','urlrule','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('957','collection_node','821','collection','node','manage','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('979','safe_config','30','admin','setting','init','&tab=2','11','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('959','basic_config','30','admin','setting','init','','10','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('961','position_edit','32','admin','position','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('962','collection_node_edit','957','collection','node','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('963','collection_node_delete','957','collection','node','del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('990','col_url_list','957','collection','node','col_url_list','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('965','collection_node_publish','957','collection','node','publist','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('966','collection_node_import','957','collection','node','node_import','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('967','collection_node_export','957','collection','node','export','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('968','collection_node_collection_content','957','collection','node','col_content','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('969','googlesitemap','977','admin','googlesitemap','set','','11','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('970','admininfo','10','admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('971','editpwd','970','admin','admin_manage','public_edit_pwd','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('972','editinfo','970','admin','admin_manage','public_edit_info','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('973','keylink','977','admin','keylink','init','','12','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('974','add_keylink','973','admin','keylink','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('975','content_settings','4','content','content_settings','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('7','extend','0','admin','extend','init_extend','','7','0','0','1','1','1','1');
INSERT INTO `zb_menu` VALUES('977','extend_all','7','admin','extend_all','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('980','sso_config','30','admin','setting','init','&tab=3','12','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('981','email_config','30','admin','setting','init','&tab=4','13','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('982','module_manage','82','admin','module','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('983','ipbanned','977','admin','ipbanned','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('984','add_ipbanned','983','admin','ipbanned','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('993','collection_content_import','957','collection','node','import','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('991','copy_node','957','collection','node','copy','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('992','content_del','957','collection','node','content_del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('989','downsites','977','admin','downservers','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('994','import_program_add','957','collection','node','import_program_add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('995','import_program_del','957','collection','node','import_program_del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('996','import_content','957','collection','node','import_content','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('997','log','977','admin','log','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('998','add_page','43','admin','category','add','s=1','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('999','add_cat_link','43','admin','category','add','s=2','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1000','count_items','43','admin','category','count_items','','5','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1001','cache_all','977','admin','cache_all','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1002','create_list_html','873','content','create_html','category','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1003','create_html_quick','10','content','create_html_opt','index','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1004','create_index','1003','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1005','scan','977','scan','index','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1006','scan_report','1005','scan','index','scan_report','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1007','md5_creat','1005','scan','index','md5_creat','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1008','album_import','868','special','album','import','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('8','phpsso','0','admin','phpsso','menu','','7','0','0','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1011','edit_content','822','content','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1012','push_to_special','822','content','push','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1023','delete_log','997','admin','log','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1024','delete_ip','983','admin','ipbanned','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1026','delete_keylink','973','admin','keylink','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1027','edit_keylink','973','admin','keylink','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1034','operation_pass','74','member','member_verify','pass','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1035','operation_delete','74','member','member_verify','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1039','operation_ignore','74','member','member_verify','ignore','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1038','settingsave','30','admin','setting','save','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1040','admin_edit','54','admin','admin_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1041','operation_reject','74','member','member_verify','reject','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1042','admin_delete','54','admin','admin_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1043','card','54','admin','admin_manage','card','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1044','creat_card','54','admin','admin_manage','creat_card','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1045','remove_card','54','admin','admin_manage','remove_card','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1049','member_group_edit','812','member','member_group','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1048','member_edit','72','member','member','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1050','role_edit','50','admin','role','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1051','member_group_delete','812','member','member_group','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1052','member_manage','50','admin','role','member_manage','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1053','role_delete','50','admin','role','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1054','member_model_export','77','member','member_model','export','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1055','member_model_sort','77','member','member_model','sort','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1056','member_model_move','77','member','member_model','move','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1057','payment_add','897','pay','payment','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1058','payment_delete','897','pay','payment','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1059','payment_edit','897','pay','payment','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1060','spend_record','896','pay','spend','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1061','pay_stat','896','pay','payment','pay_stat','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1062','fields_manage','59','content','sitemodel_field','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1063','edit_model_content','59','content','sitemodel','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1064','disabled_model','59','content','sitemodel','disabled','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1065','delete_model','59','content','sitemodel','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1066','export_model','59','content','sitemodel','export','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1067','delete','874','content','type_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1068','edit','874','content','type_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1069','add_urlrule','978','admin','urlrule','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1070','edit_urlrule','978','admin','urlrule','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1071','delete_urlrule','978','admin','urlrule','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1072','edit_menu','31','admin','menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1073','delete_menu','31','admin','menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1074','edit_workflow','885','content','workflow','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1075','delete_workflow','885','content','workflow','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1076','creat_html','868','special','special','html','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1093','connect_config','30','admin','setting','init','&tab=5','14','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1102','view_modelinfo','74','member','member_verify','modelinfo','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1202','create_special_list','868','special','special','create_special_list','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1240','view_memberlinfo','72','member','member','memberinfo','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1239','copyfrom_manage','977','admin','copyfrom','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1241','move_content','822','content','content','remove','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1242','poster_template','56','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1243','create_index','873','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1244','add_othors','822','content','content','add_othors','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1295','attachment_manager_dir','857','attachment','manage','dir','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1296','attachment_manager_db','857','attachment','manage','init','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1346','attachment_address_replace','857','attachment','address','init','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1347','attachment_address_update','857','attachment','address','update','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1348','delete_content','822','content','content','delete','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1349','member_menu_manage','977','member','member_menu','manage','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1350','member_menu_add','1349','member','member_menu','add','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1351','member_menu_edit','1349','member','member_menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1352','member_menu_delete','1349','member','member_menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1353','batch_show','822','content','create_html','batch_show','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1354','pay_delete','898','pay','payment','pay_del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1355','pay_cancel','898','pay','payment','pay_cancel','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1356','discount','898','pay','payment','discount','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1360','category_batch_edit','43','admin','category','batch_edit','','6','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1500','listorder','822','content','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1501','a_clean_data','873','content','content','clear_data','','0','1','0','0','0','0','0');
INSERT INTO `zb_menu` VALUES('1502','announce','29','announce','admin_announce','init','s=1','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1503','announce_add','1502','announce','admin_announce','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1504','edit_announce','1502','announce','admin_announce','edit','s=1','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1505','check_announce','1502','announce','admin_announce','init','s=2','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1506','overdue','1502','announce','admin_announce','init','s=3','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1507','del_announce','1502','announce','admin_announce','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1508','comment','29','comment','comment_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1509','comment_manage','821','comment','comment_admin','listinfo','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1510','comment_check','1509','comment','check','checks','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1511','comment_list','1508','comment','comment_admin','lists','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1512','link','29','link','link','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1513','add_link','1512','link','link','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1514','edit_link','1512','link','link','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1515','delete_link','1512','link','link','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1516','link_setting','1512','link','link','setting','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1517','add_type','1512','link','link','add_type','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1518','list_type','1512','link','link','list_type','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1519','check_register','1512','link','link','check_register','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1520','vote','29','vote','vote','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1521','add_vote','1520','vote','vote','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1522','edit_vote','1520','vote','vote','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1523','delete_vote','1520','vote','vote','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1524','vote_setting','1520','vote','vote','setting','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1525','statistics_vote','1520','vote','vote','statistics','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1526','statistics_userlist','1520','vote','vote','statistics_userlist','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1527','create_js','1520','vote','vote','create_js','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1528','message','29','message','message','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1529','send_one','1528','message','message','send_one','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1530','delete_message','1528','message','message','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1531','message_send','1528','message','message','message_send','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1532','message_group_manage','1528','message','message','message_group_manage','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1533','mood','29','mood','mood_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1534','mood_setting','1533','mood','mood_admin','setting','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1535','poster','29','poster','space','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1536','add_space','1535','poster','space','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1537','edit_space','1535','poster','space','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1538','del_space','1535','poster','space','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1539','poster_list','1535','poster','poster','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1540','add_poster','1535','poster','poster','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1541','edit_poster','1535','poster','poster','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1542','del_poster','1535','poster','poster','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1543','poster_stat','1535','poster','poster','stat','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1544','poster_setting','1535','poster','space','setting','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1545','create_poster_js','1535','poster','space','create_js','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1546','poster_template','1535','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1547','formguide','29','formguide','formguide','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1548','formguide_add','1547','formguide','formguide','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1549','formguide_edit','1547','formguide','formguide','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1550','form_info_list','1547','formguide','formguide_info','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1551','formguide_disabled','1547','formguide','formguide','disabled','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1552','formguide_delete','1547','formguide','formguide','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1553','formguide_stat','1547','formguide','formguide','stat','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1554','add_public_field','1547','formguide','formguide_field','add','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1555','list_public_field','1547','formguide','formguide_field','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1556','module_setting','1547','formguide','formguide','setting','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1557','wap','29','wap','wap_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1558','wap_add','1557','wap','wap_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1559','wap_edit','1557','wap','wap_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1560','wap_delete','1557','wap','wap_admin','delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1561','wap_type_manage','1557','wap','wap_admin','type_manage','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1562','wap_type_edit','1557','wap','wap_admin','type_edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1563','wap_type_delete','1557','wap','wap_admin','type_delete','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1564','upgrade','977','upgrade','index','init','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1565','checkfile','1564','upgrade','index','checkfile','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1566','tag','826','tag','tag','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1567','add_tag','1566','tag','tag','add','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1568','edit_tag','1566','tag','tag','edit','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1569','delete_tag','1566','tag','tag','del','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1570','tag_lists','1566','tag','tag','lists','','0','0','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1571','sms','29','sms','sms','init','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1572','sms_setting','1571','sms','sms','sms_setting','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1573','sms_pay_history','1571','sms','sms','sms_pay_history','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1574','sms_buy_history','1571','sms','sms','sms_buy_history','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1575','sms_api','1571','sms','sms','sms_api','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1576','sms_sent','1571','sms','sms','sms_sent','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1606','qyjj','1599','gyzb','gyzb','gyzb','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1578','education','1600','gyzb','gyzb_cxjy','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1579','addedu','1600','gyzb','gyzb_cxjy','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1581','educationdel','1600','gyzb','gyzb_cxjy','cxjy_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1582','addcourse','1601','gyzb','gyzb_fzlc','add','','4','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1583','courselist','1601','gyzb','gyzb_fzlc','fzlc','','5','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1584','coursedel','1601','gyzb','gyzb_fzlc','fzlc_hsz','','6','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1585','addpartners','1602','gyzb','gyzb_hzhb','add','','7','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1586','partnerslist','1602','gyzb','gyzb_hzhb','index','','8','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1587','partnersdel','1602','gyzb','gyzb_hzhb','hzhb_hsz','','9','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1588','addhonor','1604','gyzb','gyzb_qyry','add','','10','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1589','honorlist','1604','gyzb','gyzb_qyry','index','','11','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1590','honordel','1604','gyzb','gyzb_qyry','qyry_hsz','','12','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1591','addfb','1605','gyzb','gyzb_fb','add','','14','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1592','fblist','1605','gyzb','gyzb_fb','index','','15','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1593','fbdel','1605','gyzb','gyzb_fb','fb_hsz','','16','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1594','contactus','1605','gyzb','gyzb_fb','contactus','','13','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1595','jobs','1603','gyzb','gyzb_job','job','','17','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1596','addjob','1603','gyzb','gyzb_job','add','','18','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1597','joblist','1603','gyzb','gyzb_job','index','','19','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1598','jobdel','1603','gyzb','gyzb_job','job_hsz','','20','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1599','guanyuzhongbo','0','gyzb','gyzb','gyzb','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1600','cxjy','1599','gyzb','gyzb','gyzb','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1601','fzlc','1599','gyzb','gyzb','gyzb','','4','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1602','hzhb','1599','gyzb','gyzb','gyzb','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1603','jrzb','1599','gyzb','gyzb','gyzb','','6','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1604','qyry','1599','gyzb','gyzb','gyzb','','5','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1605','lxwm','1599','gyzb','gyzb','gyzb','','7','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1607','ywtx','0','gyzb','gyzb','gyzb','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1608','xwzx','0','gyzb','gyzb','gyzb','','4','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1609','shzr','0','gyzb','gyzb','gyzb','','5','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1610','ywtx','1607','gyzb','gyzb','gyzb','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1611','business','1610','ywtx','ywtx','ywtx','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1612','allfgs','1610','ywtx','ywtx','allfb','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1613','qydt','1608','xwzx','xwzx','xwzx','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1614','qydtadd','1613','xwzx','xwzx','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1615','qydtlist','1613','xwzx','xwzx','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1616','qydtdel','1613','xwzx','xwzx','xwzx_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1617','mtbd','1608','xwzx','xwzx_mt','xwzx','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1618','mtbdadd','1617','xwzx','xwzx_mt','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1619','mtbdlist','1617','xwzx','xwzx_mt','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1620','mtbdhsz','1617','xwzx','xwzx_mt','xwzx_mt_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1621','zyhd','1608','xwzx','xwzx','xwzx','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1622','zyhdadd','1621','xwzx','xwzx_hd','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1623','zyhdlist','1621','xwzx','xwzx_hd','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1624','zyhddel','1621','xwzx','xwzx_hd','xwzx_hd_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1625','csrjy','1609','shzr','shzr','shzr','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1626','shgy','1609','shzr','shzr','shzr','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1627','jxj','1609','shzr','shzr','shzr','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1628','shgyadd','1626','shzr','xwzx_gy','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1629','shgylist','1626','shzr','xwzx_gy','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1630','shgydel','1626','shzr','xwzx_gy','xwzx_gy_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1631','zblladd','1627','shzr','xwzx_xy','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1632','zblllist','1627','shzr','xwzx_xy','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1633','zblldel','1627','shzr','xwzx_xy','xwzx_xy_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1634','csrjyedit','1625','shzr','xwzx_gy','csrjy','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1635','jxjedit','1627','shzr','xwzx_gy','jxj','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1636','sztd','1599','gyzb','gyzb','gyzb','','8','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1637','sztdadd','1636','gyzb','gyzb_sztd','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1638','sztdlist','1636','gyzb','gyzb_sztd','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1639','sztddel','1636','gyzb','gyzb_sztd','sztd_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1640','cityadd','1610','ywtx','ywtx_city','add','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1641','citylist','1610','ywtx','ywtx_city','index','','4','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1642','citydel','1610','ywtx','ywtx_city','city_hsz','','5','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1643','gyzblm','1599','gyzb','gyzb','gyzb','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1644','gyzblmxx','1643','gyzb','gyzb_cxjy','create','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1645','ywtxlm','1607','ywtx','ywtx','ywtx','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1646','ywtxlmxx','1645','ywtx','ywtx','create','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1647','xwzxlm','1608','xwzx','xwzx','xwzx','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1648','xwzxlmxx','1647','xwzx','xwzx','create','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1649','shzrlm','1609','shzr','shzr','shzr','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1650','shzrlmxx','1649','shzr','xwzx_gy','create','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1651','zh','0','zh','zh','zh','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1652','sylbt','1651','set','set','set','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1653','sylbtadd','1652','set','set','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1654','sylbtlist','1652','set','set','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1655','sylbtdel','1652','set','set','set_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1656','zbyw','1651','zbyw','zbyw','zbyw','','4','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1657','zbywadd','1656','set','set_yw','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1658','zbywlist','1656','set','set_yw','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1659','zbywdel','1656','set','set_yw','set_yw_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1660','zbqxzgs','1651','zbqxzgs','zbqxzgs','zbqxzgs','','5','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1661','qxzgsadd','1660','set','set_zgs','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1662','qxzgslist','1660','set','set_zgs','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1663','qxzgsdel','1660','set','set_zgs','set_zgs_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1664','tzgg','1608','tzgg','tzgg','tzgg','','4','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1665','tzggadd','1664','xwzx','xwzx_gg','add','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1666','tzgglist','1664','xwzx','xwzx_gg','index','','2','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1667','tzggdel','1664','xwzx','xwzx_gg','xwzx_gg_hsz','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1668','zbll','1651','zbll','zbll','zbll','','3','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1669','sz','1651','sz','sz','sz','','1','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1670','zblllist','1668','set','set_ll','index','','0','1','1','1','1','1','1');
INSERT INTO `zb_menu` VALUES('1671','szs','1669','set','set','website','','0','1','1','1','1','1','1');

DROP TABLE IF EXISTS `zb_message`;
CREATE TABLE `zb_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_message_data`;
CREATE TABLE `zb_message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_message_group`;
CREATE TABLE `zb_message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_model`;
CREATE TABLE `zb_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO `zb_model` VALUES('1','1','文章模型','','news','','0','0','1','0','default','category','list','show','','','','','0','0');
INSERT INTO `zb_model` VALUES('2','1','下载模型','','download','','0','0','1','0','default','category_download','list_download','show_download','','','','','0','0');
INSERT INTO `zb_model` VALUES('3','1','图片模型','','picture','','0','0','1','0','default','category_picture','list_picture','show_picture','','','','','0','0');
INSERT INTO `zb_model` VALUES('10','1','普通会员','普通会员','member_detail','','0','0','1','0','','','','','','','','','0','2');
INSERT INTO `zb_model` VALUES('11','1','视频模型','','video','','0','0','1','0','default','category_video','list_video','show_video','','','','','0','0');

DROP TABLE IF EXISTS `zb_model_field`;
CREATE TABLE `zb_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

INSERT INTO `zb_model_field` VALUES('1','1','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `zb_model_field` VALUES('2','1','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `zb_model_field` VALUES('3','1','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `zb_model_field` VALUES('4','1','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `zb_model_field` VALUES('5','1','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `zb_model_field` VALUES('6','1','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `zb_model_field` VALUES('7','1','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `zb_model_field` VALUES('8','1','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `zb_model_field` VALUES('9','1','1','voteid','添加投票','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)','','','','0','0','0','1','0','0','1','0','21','0','0');
INSERT INTO `zb_model_field` VALUES('10','1','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `zb_model_field` VALUES('11','1','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `zb_model_field` VALUES('12','1','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `zb_model_field` VALUES('13','1','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `zb_model_field` VALUES('14','1','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `zb_model_field` VALUES('15','1','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `zb_model_field` VALUES('16','1','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `zb_model_field` VALUES('17','1','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `zb_model_field` VALUES('18','1','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `zb_model_field` VALUES('19','1','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `zb_model_field` VALUES('20','1','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `zb_model_field` VALUES('21','1','1','copyfrom','来源','','','0','100','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `zb_model_field` VALUES('80','1','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `zb_model_field` VALUES('22','2','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `zb_model_field` VALUES('23','2','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','1','0');
INSERT INTO `zb_model_field` VALUES('24','2','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `zb_model_field` VALUES('25','2','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `zb_model_field` VALUES('26','2','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `zb_model_field` VALUES('27','2','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `zb_model_field` VALUES('28','2','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `zb_model_field` VALUES('29','2','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `zb_model_field` VALUES('30','2','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `zb_model_field` VALUES('31','2','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','1','0');
INSERT INTO `zb_model_field` VALUES('32','2','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `zb_model_field` VALUES('33','2','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `zb_model_field` VALUES('34','2','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `zb_model_field` VALUES('35','2','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `zb_model_field` VALUES('36','2','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `zb_model_field` VALUES('37','2','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `zb_model_field` VALUES('38','2','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `zb_model_field` VALUES('39','2','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `zb_model_field` VALUES('40','2','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `zb_model_field` VALUES('41','2','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `zb_model_field` VALUES('42','2','1','downfiles','本地下载','','','0','0','','','downfiles','array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `zb_model_field` VALUES('43','2','1','downfile','镜像下载','','','0','0','','','downfile','array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','9','0','0');
INSERT INTO `zb_model_field` VALUES('44','2','1','systems','软件平台','<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>','','0','100','','','text','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','1','0','1','1','0','14','0','0');
INSERT INTO `zb_model_field` VALUES('45','2','1','copytype','软件授权形式','','','0','15','','','box','array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)','','','','0','1','0','1','0','1','0','0','12','0','0');
INSERT INTO `zb_model_field` VALUES('46','2','1','language','软件语言','','','0','16','','','box','array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)','','','','0','1','0','1','0','1','0','0','13','0','0');
INSERT INTO `zb_model_field` VALUES('47','2','1','classtype','软件类型','','','0','20','','','box','array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `zb_model_field` VALUES('48','2','1','version','版本号','','','0','20','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','13','0','0');
INSERT INTO `zb_model_field` VALUES('49','2','1','filesize','文件大小','','','0','10','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','14','0','0');
INSERT INTO `zb_model_field` VALUES('50','2','1','stars','评分等级','','','0','20','','','box','array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `zb_model_field` VALUES('51','3','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `zb_model_field` VALUES('52','3','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `zb_model_field` VALUES('53','3','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `zb_model_field` VALUES('54','3','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `zb_model_field` VALUES('55','3','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `zb_model_field` VALUES('56','3','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `zb_model_field` VALUES('57','3','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `zb_model_field` VALUES('58','3','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `zb_model_field` VALUES('59','3','1','relation','相关组图','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `zb_model_field` VALUES('60','3','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `zb_model_field` VALUES('61','3','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `zb_model_field` VALUES('62','3','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `zb_model_field` VALUES('63','3','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `zb_model_field` VALUES('64','3','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `zb_model_field` VALUES('65','3','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `zb_model_field` VALUES('66','3','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `zb_model_field` VALUES('67','3','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `zb_model_field` VALUES('68','3','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `zb_model_field` VALUES('69','3','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `zb_model_field` VALUES('70','3','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `zb_model_field` VALUES('71','3','1','pictureurls','组图','','','0','0','','','images','array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)','','','','0','0','0','1','0','1','0','0','15','0','0');
INSERT INTO `zb_model_field` VALUES('72','3','1','copyfrom','来源','','','0','0','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `zb_model_field` VALUES('73','1','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `zb_model_field` VALUES('74','2','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `zb_model_field` VALUES('75','3','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `zb_model_field` VALUES('83','10','1','birthday','生日','','','0','0','','生日格式错误','datetime','array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)','','','','0','0','0','0','0','1','1','0','0','0','0');
INSERT INTO `zb_model_field` VALUES('84','11','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `zb_model_field` VALUES('85','11','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `zb_model_field` VALUES('86','11','1','title','标题','','inputtitle','1','80','','请输入标题','title','array (\n)','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `zb_model_field` VALUES('87','11','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `zb_model_field` VALUES('88','11','1','description','摘要','','','0','255','','','textarea','array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `zb_model_field` VALUES('89','11','1','updatetime','更新时间','','','0','0','','','datetime','array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `zb_model_field` VALUES('90','11','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `zb_model_field` VALUES('91','11','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `zb_model_field` VALUES('92','11','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `zb_model_field` VALUES('93','11','1','pages','分页方式','','','0','0','','','pages','array (\n)','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `zb_model_field` VALUES('94','11','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `zb_model_field` VALUES('95','11','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `zb_model_field` VALUES('96','11','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `zb_model_field` VALUES('97','11','1','url','URL','','','0','100','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `zb_model_field` VALUES('98','11','1','listorder','排序','','','0','6','','','number','array (\n)','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `zb_model_field` VALUES('99','11','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `zb_model_field` VALUES('100','11','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `zb_model_field` VALUES('101','11','1','status','状态','','','0','2','','','box','array (\n)','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `zb_model_field` VALUES('102','11','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `zb_model_field` VALUES('103','11','1','username','用户名','','','0','20','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `zb_model_field` VALUES('104','11','1','islink','转向链接','','','0','0','','','islink','array (\n)','','','','0','1','0','1','0','1','0','0','20','0','0');
INSERT INTO `zb_model_field` VALUES('105','11','1','video','视频上传','','','0','0','','','video','array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `zb_model_field` VALUES('106','11','1','vision','画质','','','0','0','','','box','array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');
INSERT INTO `zb_model_field` VALUES('107','11','1','video_category','视频分类','','','0','0','','','box','array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');

DROP TABLE IF EXISTS `zb_module`;
CREATE TABLE `zb_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `zb_module` VALUES('admin','admin','','1','1.0','','array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)','0','0','2010-10-18','2010-10-18');
INSERT INTO `zb_module` VALUES('member','会员','','1','1.0','','array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `zb_module` VALUES('pay','支付','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `zb_module` VALUES('digg','顶一下','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `zb_module` VALUES('special','专题','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `zb_module` VALUES('content','内容模块','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `zb_module` VALUES('search','全站搜索','','0','1.0','','array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `zb_module` VALUES('scan','木马扫描','scan','0','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `zb_module` VALUES('attachment','附件','attachment','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `zb_module` VALUES('block','碎片','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `zb_module` VALUES('collection','采集模块','collection','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `zb_module` VALUES('dbsource','数据源','','1','','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `zb_module` VALUES('template','模板风格','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `zb_module` VALUES('release','发布点','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `zb_module` VALUES('video','视频库','','0','1.0','','','0','0','2012-09-28','2012-09-28');
INSERT INTO `zb_module` VALUES('announce','公告','announce/','0','1.0','公告','','0','0','2017-08-15','2017-08-15');
INSERT INTO `zb_module` VALUES('comment','评论','comment/','0','1.0','评论','','0','0','2017-08-15','2017-08-15');
INSERT INTO `zb_module` VALUES('link','友情链接','','0','1.0','','array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `zb_module` VALUES('vote','投票','','0','1.0','','array (\r\n  1 => \r\n  array (\r\n    \'default_style\' => \'default\',\r\n    \'vote_tp_template\' => \'vote_tp\',\r\n    \'allowguest\' => \'1\',\r\n    \'enabled\' => \'1\',\r\n    \'interval\' => \'1\',\r\n    \'credit\' => \'1\',\r\n  ),\r\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `zb_module` VALUES('message','短消息','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `zb_module` VALUES('mood','新闻心情','mood/','0','1.0','新闻心情','','0','0','2017-08-15','2017-08-15');
INSERT INTO `zb_module` VALUES('poster','广告模块','poster/','0','1.0','广告模块','','0','0','2017-08-15','2017-08-15');
INSERT INTO `zb_module` VALUES('formguide','表单向导','formguide/','0','1.0','formguide','array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'用户向我们提交了表单数据，赶快去看看吧。\',\n)','0','0','2010-10-20','2010-10-20');
INSERT INTO `zb_module` VALUES('wap','手机门户','wap/','0','1.0','手机门户','','0','0','2017-08-15','2017-08-15');
INSERT INTO `zb_module` VALUES('upgrade','在线升级','','0','1.0','','','0','0','2011-05-18','2011-05-18');
INSERT INTO `zb_module` VALUES('tag','标签向导','tag/','0','1.0','标签向导','','0','0','2017-08-15','2017-08-15');
INSERT INTO `zb_module` VALUES('sms','短信平台','sms/','0','1.0','短信平台','','0','0','2011-09-02','2011-09-02');

DROP TABLE IF EXISTS `zb_mood`;
CREATE TABLE `zb_mood` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `siteid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `contentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总数',
  `n1` int(10) unsigned NOT NULL DEFAULT '0',
  `n2` int(10) unsigned NOT NULL DEFAULT '0',
  `n3` int(10) unsigned NOT NULL DEFAULT '0',
  `n4` int(10) unsigned NOT NULL DEFAULT '0',
  `n5` int(10) unsigned NOT NULL DEFAULT '0',
  `n6` int(10) unsigned NOT NULL DEFAULT '0',
  `n7` int(10) unsigned NOT NULL DEFAULT '0',
  `n8` int(10) unsigned NOT NULL DEFAULT '0',
  `n9` int(10) unsigned NOT NULL DEFAULT '0',
  `n10` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `total` (`total`),
  KEY `lastupdate` (`lastupdate`),
  KEY `catid` (`catid`,`siteid`,`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_news`;
CREATE TABLE `zb_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_news_data`;
CREATE TABLE `zb_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_page`;
CREATE TABLE `zb_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_pay_account`;
CREATE TABLE `zb_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_pay_payment`;
CREATE TABLE `zb_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_pay_spend`;
CREATE TABLE `zb_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_picture`;
CREATE TABLE `zb_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_picture_data`;
CREATE TABLE `zb_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_position`;
CREATE TABLE `zb_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO `zb_position` VALUES('1','0','0','首页焦点图推荐','20','','1','1','');
INSERT INTO `zb_position` VALUES('2','0','0','首页头条推荐','20','','4','1','');
INSERT INTO `zb_position` VALUES('13','82','0','栏目页焦点图','20','','0','1','');
INSERT INTO `zb_position` VALUES('5','69','0','推荐下载','20','','0','1','');
INSERT INTO `zb_position` VALUES('8','30','54','图片频道首页焦点图','20','','0','1','');
INSERT INTO `zb_position` VALUES('9','0','0','网站顶部推荐','20','','0','1','');
INSERT INTO `zb_position` VALUES('10','0','0','栏目首页推荐','20','','0','1','');
INSERT INTO `zb_position` VALUES('12','0','0','首页图片推荐','20','','0','1','');
INSERT INTO `zb_position` VALUES('14','0','0','视频首页焦点图','20','','0','1','');
INSERT INTO `zb_position` VALUES('15','0','0','视频首页头条推荐','20','','0','1','');
INSERT INTO `zb_position` VALUES('16','0','0','视频首页每日热点','20','','0','1','');
INSERT INTO `zb_position` VALUES('17','0','0','视频栏目精彩推荐','20','','0','1','');

DROP TABLE IF EXISTS `zb_position_data`;
CREATE TABLE `zb_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_poster`;
CREATE TABLE `zb_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `zb_poster` VALUES('1','1','banner','1','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/uploadfile/poster/2.png\',\n    \'alt\' => \'\',\n  ),\n)','1285813808','1446249600','1285813833','0','1','0','0');
INSERT INTO `zb_poster` VALUES('2','1','phpcmsv9','2','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/statics/images/v9/ad_login.jpg\',\n    \'alt\' => \'phpcms专业建站系统\',\n  ),\n)','1285816298','1446249600','1285816310','0','1','0','0');
INSERT INTO `zb_poster` VALUES('3','1','phpcms下载推荐','3','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/uploadfile/poster/3.png\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1286504815','1446249600','1286504865','0','1','0','0');
INSERT INTO `zb_poster` VALUES('4','1','phpcms广告','4','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1286505141','1446249600','1286505178','0','0','0','0');
INSERT INTO `zb_poster` VALUES('5','1','phpcms下载','5','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286509363','1446249600','1286509401','0','0','0','0');
INSERT INTO `zb_poster` VALUES('6','1','phpcms下载推荐1','6','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286510183','1446249600','1286510227','0','0','0','0');
INSERT INTO `zb_poster` VALUES('7','1','phpcms下载详情','7','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286510314','1446249600','1286510341','0','0','0','0');
INSERT INTO `zb_poster` VALUES('8','1','phpcms下载页','8','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/uploadfile/poster/1.jpg\',\n    \'alt\' => \'官方站\',\n  ),\n)','1286522084','1446249600','1286522125','0','0','0','0');
INSERT INTO `zb_poster` VALUES('9','1','phpcms v9广告','9','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'\',\n  ),\n)','1287041759','1446249600','1287041804','0','0','0','0');
INSERT INTO `zb_poster` VALUES('10','1','phpcms','10','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://zb.php.xmfeel.com/uploadfile/poster/6.jpg\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1289270509','1446249600','1289270541','1','0','0','0');

DROP TABLE IF EXISTS `zb_poster_201708`;
CREATE TABLE `zb_poster_201708` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_poster_space`;
CREATE TABLE `zb_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `zb_poster_space` VALUES('1','1','顶部搜索右侧广告位','banner','poster_js/1.js','430','63','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `zb_poster_space` VALUES('2','1','会员登陆页广告','banner','poster_js/2.js','310','304','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','会员登陆页广告右侧代替外部通行证广告','1','0');
INSERT INTO `zb_poster_space` VALUES('3','1','图片频道图片排行下方','banner','poster_js/3.js','249','87','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `zb_poster_space` VALUES('4','1','新闻中心推荐链接左侧','banner','poster_js/4.js','748','91','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `zb_poster_space` VALUES('5','1','下载列表页右侧顶部','banner','poster_js/5.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `zb_poster_space` VALUES('6','1','下载详情页右侧顶部','banner','poster_js/6.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `zb_poster_space` VALUES('7','1','下载详情页右侧下部','banner','poster_js/7.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `zb_poster_space` VALUES('8','1','下载频道首页','banner','poster_js/8.js','698','80','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `zb_poster_space` VALUES('9','1','下载详情页地址列表右侧','banner','poster_js/12.js','330','50','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `zb_poster_space` VALUES('10','1','首页关注下方广告','banner','poster_js/10.js','307','60','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');

DROP TABLE IF EXISTS `zb_queue`;
CREATE TABLE `zb_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_release_point`;
CREATE TABLE `zb_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_search`;
CREATE TABLE `zb_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_search_keyword`;
CREATE TABLE `zb_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_session`;
CREATE TABLE `zb_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

INSERT INTO `zb_session` VALUES('hk2bhtnrftuld31fcc6p7khis5','0','61.151.226.202','1503546861','0','0','','','','code|s:4:\"htwe\";');
INSERT INTO `zb_session` VALUES('l3nta9m29hnap3v0gc00s1qfs4','1','124.205.176.178','1503546871','1','0','admin','index','public_session_life','code|s:0:\"\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"1xYN2t\";lock_screen|i:0;');
INSERT INTO `zb_session` VALUES('hopfcog9ljplq9d95q18phfv43','0','101.226.66.192','1503546874','0','0','admin','index','public_current_pos','');
INSERT INTO `zb_session` VALUES('mtt9gj0vice04pe50krtua4o84','2','124.205.176.178','1503546579','1','0','admin','index','public_session_life','code|s:0:\"\";userid|s:1:\"2\";roleid|s:1:\"1\";pc_hash|s:6:\"0Px1gB\";lock_screen|i:0;');
INSERT INTO `zb_session` VALUES('brjo6521ccmgvpp53nprj6r5h4','0','180.163.2.119','1503546886','0','0','admin','database','export','');
INSERT INTO `zb_session` VALUES('75gcles7fualn36kkp41uatte7','0','101.226.68.161','1503546877','0','0','admin','database','export','');
INSERT INTO `zb_session` VALUES('9mjs496ilqao34l81ivhgtgpa1','0','101.226.66.178','1503546876','0','0','admin','index','public_current_pos','');
INSERT INTO `zb_session` VALUES('6h2beoe3uugtt41386jtabc5e1','3','124.205.176.178','1503546793','1','0','admin','index','public_session_life','code|s:0:\"\";userid|s:1:\"3\";roleid|s:1:\"1\";pc_hash|s:6:\"GQdsed\";lock_screen|i:0;');
INSERT INTO `zb_session` VALUES('4d5nf7cq7ggu3uvfvkmbsnmne5','4','124.205.176.178','1503546807','1','0','admin','index','public_session_life','code|s:0:\"\";userid|s:1:\"4\";roleid|s:1:\"1\";pc_hash|s:6:\"23cNvT\";lock_screen|i:0;');
INSERT INTO `zb_session` VALUES('p3mvhaamuur8qu3rj0q95nomg0','0','123.151.64.201','1503546861','0','0','admin','index','login','');
INSERT INTO `zb_session` VALUES('8i29lbkkm8ve0eu2e85nrdcmq2','0','101.226.33.237','1503546859','0','0','admin','index','init','');
INSERT INTO `zb_session` VALUES('t924gq0v4t0qvu5mvj8vlolhe1','1','43.246.229.178','1503546876','1','0','admin','database','export','code|s:0:\"\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"c325aL\";lock_screen|i:0;');

DROP TABLE IF EXISTS `zb_set`;
CREATE TABLE `zb_set` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `jianjie` text NOT NULL,
  `tel` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel2` varchar(255) NOT NULL,
  `gywm` text NOT NULL,
  `bottomleft` varchar(255) NOT NULL,
  `bottomright` varchar(255) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_set` VALUES('1','中博教育网','中博教育','中博教育','4006-026-018','北京市海淀区北三环西路32号恒润大厦1202室','service@caicui.com','4006 - 026 - 018','经过十年的教育沉淀，北京中博新视网络教育科技发展有限\r\n        公司重磅推出财萃网(www.caicui.com)，并在2014年以全新\r\n        面貌和理念重装上线，专注于泛财经网络教育。依托于战略\r\n        合作伙伴优质的地面财经教育资源，财萃网拥有152位专业\r\n        师资，遍布全国的43个统<a href=\"#\">[详情]</a>','COPYRIGHT © 2016 财萃网 ALL RIGHTS RESERVED. 京ICP备<span>14035765号-1</span>','京公网安备11010802015492','1503126182','1');

DROP TABLE IF EXISTS `zb_shzr`;
CREATE TABLE `zb_shzr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL,
  `jianjie` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `one` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `first` text NOT NULL,
  `second` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_shzr` VALUES('1','中博教育','我们要做的事\r\n说得简单一点，中博教育要做的就是一件真正有意义的事情：深耕“具有国际视野、前瞻思维、理性务实、科学严谨的”教育事业。','创始人寄语','uploadfile/img/2017/0816/150287610125912.jpg','','<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">我们要做的事</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\"><font face=\"微软雅黑\">说得简单一点，中博教育要做的就是一件真正有意义的事情：深耕</font>&ldquo;具有国际视野、前瞻思维、理性务实、科学严谨的&rdquo;教育事业。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\"><font face=\"微软雅黑\">翻开中国五千年文明史发现一个问题：中华民族从来都不缺乏聪明人，但是那种灿若星辰的</font>&ldquo;敢为天下先&rdquo;的有勇气、敢担当、能躬行、可持久、会牺牲的人杰却是太少了。中博教育的初心是希望通过持续不断的努力，能够给中华民族贡献一些&ldquo;人杰&rdquo;。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\">&nbsp;</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">强大，从教育国际化做起</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\"><font face=\"微软雅黑\">我在新加坡学习和工作时发现，新加坡的教育行业很发达，几乎可以学到全球的商科类课程，比如</font>ACCA、CIMA、FRM、CFA及欧美澳加各个国家的学历教育类的课程。很多学校有远远高于国内培训机构的对讲师的资历、教学水平、服务水平的质量把控体系。当地的公司和企业都非常重视合同、守信誉。而我国在国际化的过程中，还是远远落后于西方世界的。在教育领域的落后，就更加明显。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">在国内大学里，学生很少能学到涉及将来的谋生技能、职业规划、生活规划、道德品质提高、软性技能提高的课程，而这些，对于学生未来的发展却至关重要。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">要使我们真正强大起来，必须包容吸收先进的国际规则、国际公认的公司治理、社会治理、国家综合治理制度和能力，而这一切，都首先要从教育国际化做起。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">这一切，正是我们做教育，做质量最好的教育机构的初衷。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\">&nbsp;</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">不敢有片刻懈怠</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\"><font face=\"微软雅黑\">任何一个事业的成功，都离不开爱的指引。从</font>2004年到2017年，整整十三年，我的妻子、公司的创始股东们、后进的董事们和同事们都对我们的事业做了很多的支持，付出了很多的心血，这一切都是因为爱，而爱让中博事业变得更加崇高，也让我不敢有片刻的懈怠。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\">&nbsp;</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">用努力换取学员们更广阔的明天</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">《向黎明致敬》</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">注目黎明！</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">它就是生命，生命中的生命。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">在它短暂的时间里，饱含着你所有的幻想与现实：</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">成长的福佑，行动的荣耀，和成功的辉煌。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">昨日如梦，明日如影，</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">但活在美好的今天，</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">能使每个昨天变成快乐的梦，</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">使每个明天都充满希望的幻影。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">好好看着这一刻吧，</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">这就是你应该对黎明的致敬。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">我们每一个人，都应该认真的、努力的、持续的把一件有意义的事情做好。中博教育只需要几十年如一日的、几百年如一日的把有价值的教育事业（中博教育认为：教人积极向上、教会学生国际化视野和前瞻性思维、辅助以能够安身立命的职业能力和事业基础所需要的基本技能和道德水准、行为习惯，就是有价值的教育事业）做好就可以了。</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\">&nbsp;</font></span></p>\r\n<p style=\"margin: 0px;\"><span style=\"margin: 0px; font-family: 微软雅黑; font-size: 10.5pt;\"><font color=\"#000000\" face=\"微软雅黑\">毛金明</font></span></p>\r\n','','','1502779544','1','1503115922','1');
INSERT INTO `zb_shzr` VALUES('2','奖学金','奖学金111','奖学金','','奖学金奖学金','截止至2017年6月，中博诚通累计为 <em class=\"tit_red\">635</em> 名优秀学员，颁发 <em class=\"tit_red\">1,492,000 </em>元中博好学生奖学金，甚至超过官方组织。','<h3 class=\"l_tit\">中博诚通<i>ACCA</i>奖学金申请条件</h3>\r\n<ol>\r\n<li><b>(1)</b>\r\n<div class=\"list_txt\">F1-F4，单科成绩90分以上者，可获得 1500元奖学金；</div>\r\n</li>\r\n<li><b>(1)</b>\r\n<div class=\"list_txt\">F1-F4，单科成绩90分以上者，可获得 1500元奖学金；</div>\r\n</li>\r\n<li><b>(1)</b>\r\n<div class=\"list_txt\">F1-F4，单科成绩90分以上者，可获得 1500元奖学金；</div>\r\n</li>\r\n<li><b>(1)</b>\r\n<div class=\"list_txt\">F1-F4，单科成绩90分以上者，可获得 1500元奖学金；可获得 1500元奖学金；可获得 1500元奖学金；</div>\r\n</li>\r\n</ol>\r\n<div class=\"l_intro\">* 以上奖励不重复发放，如学员同时符合多个条件，只发放所获得的最高奖学金一份。</div>\r\n','<h3 class=\"l_tit\">中博诚通<i>ACCA</i>奖学金申请条件</h3>\r\n<ol>\r\n<li><b>(1)</b>\r\n<div class=\"list_txt\">F1-F4，单科成绩90分以上者，可获得 1500元奖学金；</div>\r\n</li>\r\n<li><b>(1)</b>\r\n<div class=\"list_txt\">F1-F4，单科成绩90分以上者，可获得 1500元奖学金；</div>\r\n</li>\r\n<li><b>(1)</b>\r\n<div class=\"list_txt\">F1-F4，单科成绩90分以上者，可获得 1500元奖学金；</div>\r\n</li>\r\n<li><b>(1)</b>\r\n<div class=\"list_txt\">F1-F4，单科成绩90分以上者，可获得 1500元奖学金；可获得 1500元奖学金；可获得 1500元奖学金；</div>\r\n</li>\r\n</ol>\r\n<div class=\"l_intro\">* 以上奖励不重复发放，如学员同时符合多个条件，只发放所获得的最高奖学金一份。</div>\r\n','1502779544','1','1503021837','1');

DROP TABLE IF EXISTS `zb_site`;
CREATE TABLE `zb_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `zb_site` VALUES('1','默认站点','','http://zb.php.xmfeel.com/','PHPCMS演示站','PHPCMS演示站','PHPCMS演示站','','default','default','array (\n  \'upload_maxsize\' => \'2048\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\',\n  \'watermark_enable\' => \'1\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'/statics/images/water/mark.png\',\n  \'watermark_pct\' => \'85\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n)','0c41704b-8164-11e7-818a-00163e06d297');

DROP TABLE IF EXISTS `zb_sms_report`;
CREATE TABLE `zb_sms_report` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `id_code` varchar(10) NOT NULL,
  `msg` varchar(90) NOT NULL,
  `send_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `return_id` varchar(30) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`,`posttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_special`;
CREATE TABLE `zb_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_special_c_data`;
CREATE TABLE `zb_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_special_content`;
CREATE TABLE `zb_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_sphinx_counter`;
CREATE TABLE `zb_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_sso_admin`;
CREATE TABLE `zb_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `zb_sso_admin` VALUES('1','admin','a21238e7ab03f0294eb46ae6026de0ad','DUIbtc','1','0','');

DROP TABLE IF EXISTS `zb_sso_applications`;
CREATE TABLE `zb_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `zb_sso_applications` VALUES('1','phpcms_v9','phpcms v9','http://zb.php.xmfeel.com/','vhZKmIqz2Kl0FglyMSWkIfXCpye8qomV','','api.php?op=phpsso','utf-8','1');

DROP TABLE IF EXISTS `zb_sso_members`;
CREATE TABLE `zb_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `zb_sso_members` VALUES('1','IAPyfwJY','30af3b2d7a55974e7fdeda8cf9df2820','VJX3xM','IAPyfwJY@aliyun.com','140.205.201.37','1502814747','0','1502814747','phpcms v9','app','0','0');
INSERT INTO `zb_sso_members` VALUES('2','gJStVHzW','072f151b853e61e331a71a43c6bc2770','2DTNE5','gJStVHzW@aliyun.com','140.205.225.187','1503051456','0','1503051456','phpcms v9','app','0','0');
INSERT INTO `zb_sso_members` VALUES('3','xSTrsAku','abda052b04913301edc0a4208cbf7b85','kJlwzr','xSTrsAku@aliyun.com','140.205.225.201','1503328240','0','1503328240','phpcms v9','app','0','0');

DROP TABLE IF EXISTS `zb_sso_messagequeue`;
CREATE TABLE `zb_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `zb_sso_messagequeue` VALUES('1','member_add','0','1','{\"username\":\"IAPyfwJY\",\"password\":\"30af3b2d7a55974e7fdeda8cf9df2820\",\"email\":\"IAPyfwJY@aliyun.com\",\"regip\":\"140.205.201.37\",\"regdate\":\"1502814747\",\"lastdate\":\"1502814747\",\"appname\":\"phpcms v9\",\"type\":\"app\",\"random\":\"VJX3xM\",\"ucuserid\":\"0\",\"uid\":\"1\",\"action\":\"member_add\"}','1502814747','{\"1\":1}');
INSERT INTO `zb_sso_messagequeue` VALUES('2','member_add','0','1','{\"username\":\"gJStVHzW\",\"password\":\"072f151b853e61e331a71a43c6bc2770\",\"email\":\"gJStVHzW@aliyun.com\",\"regip\":\"140.205.225.187\",\"regdate\":\"1503051456\",\"lastdate\":\"1503051456\",\"appname\":\"phpcms v9\",\"type\":\"app\",\"random\":\"2DTNE5\",\"ucuserid\":\"0\",\"uid\":\"2\",\"action\":\"member_add\"}','1503051456','{\"1\":1}');
INSERT INTO `zb_sso_messagequeue` VALUES('3','member_add','0','1','{\"username\":\"xSTrsAku\",\"password\":\"abda052b04913301edc0a4208cbf7b85\",\"email\":\"xSTrsAku@aliyun.com\",\"regip\":\"140.205.225.201\",\"regdate\":\"1503328240\",\"lastdate\":\"1503328240\",\"appname\":\"phpcms v9\",\"type\":\"app\",\"random\":\"kJlwzr\",\"ucuserid\":\"0\",\"uid\":\"3\",\"action\":\"member_add\"}','1503328240','{\"1\":1}');

DROP TABLE IF EXISTS `zb_sso_session`;
CREATE TABLE `zb_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_sso_settings`;
CREATE TABLE `zb_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `zb_sso_settings` VALUES('denyemail','');
INSERT INTO `zb_sso_settings` VALUES('denyusername','');
INSERT INTO `zb_sso_settings` VALUES('creditrate','');
INSERT INTO `zb_sso_settings` VALUES('sp4','');
INSERT INTO `zb_sso_settings` VALUES('ucenter','');

DROP TABLE IF EXISTS `zb_tag`;
CREATE TABLE `zb_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_template_bak`;
CREATE TABLE `zb_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_times`;
CREATE TABLE `zb_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_type`;
CREATE TABLE `zb_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

INSERT INTO `zb_type` VALUES('52','1','search','0','专题','0','special','','','4','专题');
INSERT INTO `zb_type` VALUES('1','1','search','1','新闻','0','','','','1','新闻模型搜索');
INSERT INTO `zb_type` VALUES('2','1','search','2','下载','0','','','','3','下载模型搜索');
INSERT INTO `zb_type` VALUES('3','1','search','3','图片','0','','','','2','图片模型搜索');

DROP TABLE IF EXISTS `zb_urlrule`;
CREATE TABLE `zb_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO `zb_urlrule` VALUES('1','content','category','0','{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html','news/china/1000.html');
INSERT INTO `zb_urlrule` VALUES('6','content','category','0','index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}','index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `zb_urlrule` VALUES('11','content','show','0','{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html','2010/catdir_0720/1_2.html');
INSERT INTO `zb_urlrule` VALUES('12','content','show','0','{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html','it/product/2010/0720/1_2.html');
INSERT INTO `zb_urlrule` VALUES('16','content','show','0','index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}','index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `zb_urlrule` VALUES('17','content','show','0','show-{$catid}-{$id}-{$page}.html','show-1-2-1.html');
INSERT INTO `zb_urlrule` VALUES('18','content','show','0','content-{$catid}-{$id}-{$page}.html','content-1-2-1.html');
INSERT INTO `zb_urlrule` VALUES('30','content','category','0','list-{$catid}-{$page}.html','list-1-1.html');

DROP TABLE IF EXISTS `zb_video`;
CREATE TABLE `zb_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_video_content`;
CREATE TABLE `zb_video_content` (
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_video_data`;
CREATE TABLE `zb_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_video_store`;
CREATE TABLE `zb_video_store` (
  `videoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL DEFAULT '0',
  `userupload` tinyint(1) NOT NULL DEFAULT '0',
  `channelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`videoid`),
  KEY `videoid` (`videoid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_vote_data`;
CREATE TABLE `zb_vote_data` (
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `data` text NOT NULL,
  `userinfo` text NOT NULL,
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_vote_option`;
CREATE TABLE `zb_vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `listorder` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`optionid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_vote_subject`;
CREATE TABLE `zb_vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ischeckbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromdate` date NOT NULL DEFAULT '0000-00-00',
  `todate` date NOT NULL DEFAULT '0000-00-00',
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` char(20) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowguest` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maxval` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `minval` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `optionnumber` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `votenumber` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subjectid`),
  KEY `enabled` (`enabled`),
  KEY `fromdate` (`fromdate`,`todate`),
  KEY `todate` (`todate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_wap`;
CREATE TABLE `zb_wap` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `setting` mediumtext,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `zb_wap` VALUES('1','PHPCMS手机门户','/statics/images/wap/wlogo.gif','','array (\n  \'listnum\' => \'10\',\n  \'thumb_w\' => \'220\',\n  \'thumb_h\' => \'0\',\n  \'c_num\' => \'1000\',\n  \'index_template\' => \'index\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n)','0');

DROP TABLE IF EXISTS `zb_wap_type`;
CREATE TABLE `zb_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `zb_workflow`;
CREATE TABLE `zb_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `zb_workflow` VALUES('1','1','1','一级审核','审核一次','','0');
INSERT INTO `zb_workflow` VALUES('2','1','2','二级审核','审核两次','','0');
INSERT INTO `zb_workflow` VALUES('3','1','3','三级审核','审核三次','','0');
INSERT INTO `zb_workflow` VALUES('4','1','4','四级审核','四级审核','','0');

DROP TABLE IF EXISTS `zb_xwzx`;
CREATE TABLE `zb_xwzx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lei` varchar(50) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `jianjie` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `hits` int(6) NOT NULL DEFAULT '0',
  `summer` text NOT NULL,
  `pic` varchar(200) NOT NULL,
  `pic2` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `tui` int(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  `paixu` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_xwzx` VALUES('1','企业动态','企业动态企业动态','企业动态企业动态','企业动态企业动态','201','企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态企业动态','uploadfile/img/2017/0816/150287162860316.jpg','','<a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a><a style=\"outline:none;\">企业动态</a>','0','1502871629','1','1502871629','1','1','0');
INSERT INTO `zb_xwzx` VALUES('2','媒体报道','媒体报道','媒体报道媒体报道','媒体报道媒体报道媒体报道11','99','媒体报道媒体报道媒体报道媒体报道','uploadfile/img/2017/0816/150287237227937.jpg','','<a style=\"outline:none;\">媒体报道</a><a style=\"outline:none;\">媒体报道</a><a style=\"outline:none;\">媒体报道</a><a style=\"outline:none;\">媒体报道</a><a style=\"outline:none;\">媒体报道</a><a style=\"outline:none;\">媒体报道</a><a style=\"outline:none;\">媒体报道</a><a style=\"outline:none;\">媒体报道</a>','0','1502872376','1','1502872554','1','1','0');
INSERT INTO `zb_xwzx` VALUES('3','媒体报道','asdf','asdfa','asdfadsf','0','sdfadsf','','','adfasd','0','1502872387','1','1502872387','1','1','0');
INSERT INTO `zb_xwzx` VALUES('4','重要活动','重要活动重要活动','重要活动重要活动','重要活动重要活动','226','重要活动重要活动重要活动重要活动重要活动','','','<a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a><a style=\"outline:none;\">重要活动</a>','0','1502872717','1','1502872717','223','1','0');
INSERT INTO `zb_xwzx` VALUES('5','社会公益','社会公益','社会公益','社会公益','4','社会公益','uploadfile/img/2017/0818/150302511692540.jpg','statics/gyzb/2017/0818/20170818113933_972.jpg','<a style=\"outline:none;\">社会公益</a><a style=\"outline:none;\">社会公益</a><a style=\"outline:none;\">社会公益</a><a style=\"outline:none;\">社会公益</a>','1','1502875218','1','1503027573','1','1','0');
INSERT INTO `zb_xwzx` VALUES('6','中博力量','荣获中博CMA好学生奖学金','感谢中博所有老师们的辛勤付出，希望我们都能成为你们的骄傲！','张楠','0','','uploadfile/img/2017/0819/150312058787199.jpg','','','0','1502875338','1','1503120597','1','0','0');
INSERT INTO `zb_xwzx` VALUES('7','中博力量','荣获中博ACCA好学生奖学金','在中博的日子里，拥有你们的陪伴，拥有你们的欢笑。与其说我很喜欢这种感觉，倒不如说是享受。','孙玉婷','0','南京师范大学','uploadfile/img/2017/0819/150311969111908.jpg','','#','0','1502959412','1','1503119857','1','0','0');
INSERT INTO `zb_xwzx` VALUES('8','企业动态','123123 ','123123','123123123','123','1','uploadfile/img/2017/0817/150296184640671.jpg','','1','0','1502961855','1','1502961855','1','1','0');
INSERT INTO `zb_xwzx` VALUES('9','企业动态','2','2','22222','3','2','uploadfile/img/2017/0817/150296187538522.jpg','','2','1','1502961876','1','1502961876','1','1','0');
INSERT INTO `zb_xwzx` VALUES('10','企业动态','3333','33333','333333','3','333333','uploadfile/img/2017/0817/150296188532499.jpg','','3333333333333','1','1502961898','1','1502961898','1','1','0');
INSERT INTO `zb_xwzx` VALUES('11','社会公益','4234','2342','23423423','0','3423','uploadfile/img/2017/0818/150302526611225.jpg','','4234','0','1503025267','1','1503025267','1','1','0');
INSERT INTO `zb_xwzx` VALUES('12','社会公益','33333333333','33333333333333333333','33333','4','3333333333','uploadfile/img/2017/0818/150302554251773.jpg','','33333333333333','0','1503025543','1','1503025543','1','1','0');
INSERT INTO `zb_xwzx` VALUES('13','企业动态','中博动态','2016年12月7日周三上午10:20，广东财经大学——中博诚通FRM金融项目合作签约仪式在广东财经大学广州校区北2-342金融学院会议室举行。','广东财经大学·中博诚通FRM金融项目合作签约仪式','14','','uploadfile/img/2017/0819/150310669624953.jpg','','<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">2016年12月7日周三上午10:20，广东财经大学&mdash;&mdash;中博诚通FRM金融项目合作签约仪式在广东财经大学广州校区北2-342金融学院会议室举行。为响应广州政府要新引进和培育高端金融人才的政策，满足经济全球化大背景下对国际化金融人才的迫切需要，创新我校金融人才培养模式，金融学院决定于2016年举办FRM（金融风险管理师）金融尖子班。本次签约仪式出席的有来自中博诚通董事师韫，广州分部主管杨智浩，广州分部区域市场主管陈慧龙，校区教务主管文毅，以及金融学院副院长、代理院长&mdash;&mdash;段军山，金融学院党委副书记及&mdash;&mdash;梁希琴，林守忠，金融学院辅导员孙桃丽和王进。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu251.png\" height=\"365\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu251.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"551\" /></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><br />\r\n<img alt=\"tu252.png\" height=\"368\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu252.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"553\" /></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">伊始，由金融学院副院长、代理院长&mdash;&mdash;段军山老师进行会议主持，在介绍会议主题和特邀嘉宾身份后，本次FRM金融项目合作签约仪式正式开始。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">首先，第一位发言的是中博诚通董事师韫，她介绍了此次FRM金融项目合作的具体内容，以及金融尖子班的简介和亮点，还有中博诚通对此次的项目合作的展望和信心。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu253.png\" height=\"369\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu253.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"552\" /></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　然后，由林守忠老师进行发言，表达了本次合作项目的目的和开展相关活动的意义，以及我校与中博诚通合作工作事项，并对开办FRM金融合作项目的发展表示期待。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu254.png\" height=\"350\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu254.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"547\" /></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　接着，进行本次金融项目的合作签约。由金融学院副院长段军山老师与中博诚通的师韫进行签约,达成合作协议。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu255.png\" height=\"365\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu255.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"554\" /></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu256.png\" height=\"369\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu256.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"552\" /></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　会议的最后，对本次参与FRM金融项目合作签约仪式的与会人员合影留念。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu257.png\" height=\"367\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu257.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"554\" /></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　本次我校与中博诚通的FRM金融合作项目，共同创办高端金融人才培养计划，不仅可以提高学生的综合能力，扩展学生的前沿学术思维和就业渠道，还有利于创新我校金融人才培养模式，在校内营造更加浓厚的学术氛围！</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">中博诚通作为中国领先的金融培训机构，拥有百余位CFA、FRM、ACCA、CMA头衔的培训精英讲师团队，300余次丰富授课经验，在全面讲解的基础上强化突破重点、难点，带领您透彻掌握风险管理知识理论及体系，让您的学习视野高屋建瓴，总揽全局。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n','0','1503106853','1','1503107018','1','0','0');
INSERT INTO `zb_xwzx` VALUES('14','企业动态','中博动态','2016年12月9日，由新华网主办的主题为“回归 智享 创赢”的第七届“大国教育之声”论坛在京隆重举行。','荣耀时刻 | 中博诚通荣膺2016年度“品牌知名度教育机构”大奖','8','','uploadfile/img/2017/0819/150310735443645.jpg','','<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　2016年12月9日，由新华网主办的主题为&ldquo;回归 智享 创赢&rdquo;的第七届&ldquo;大国教育之声&rdquo;论坛在京隆重举行。<span style=\"color: rgb(255, 0, 0);\">中博诚通荣获2016年度&ldquo;品牌知名度教育机构&rdquo;奖项</span>，本次论坛聚焦回归教育本质的初心，关注各项教育事业、改革发展之成就，为&ldquo;大国教育&rdquo;聚慧发声。在大国教育之声的论坛上，业界大咖云集、重磅声音汇聚，把脉中国教育现状，前瞻行业未来发展，传递最新思想。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　自2011年创办以来，新华网&ldquo;大国教育之声&rdquo;论坛活动至今已连续举办6届，在教育领域已形成不可撼动的号召力和影响力，已成为整个<span style=\"color: rgb(255, 0, 0);\">教育行业的年度荣耀盛典，而入围的教育企业与单位，均为教育行业中的佼佼者</span>。七年来，新华网以&ldquo;中央级媒体&rdquo;的担当，肩负着&ldquo;向各界民众征集进一步贯彻落实《教育规划纲要》的意见与建议，并将这些意见建议传递给教育改革的决策者、执行者&rdquo;。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"121632.jpg\" height=\"333\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/201612/121632.jpg\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"500\" /><br />\r\n<span style=\"color: rgb(255, 0, 0);\">中博诚通凭借12年来在广大学生和家长心中的知名度和良好口碑，荣膺2016年度&ldquo;品牌知名度教育机构&rdquo;称号</span>。中博诚通在如此高标准平台下获此殊荣，倍感荣幸。这也进一步印证了中博诚通在中国高端财经培训行业的领导者地位，以及家长和学生对中博诚通多年来的信任与支持。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"121633.jpg\" height=\"331\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/201612/121633.jpg\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"500\" /><br />\r\n中博诚通一直以来极为注重教学质量及服务保障，在业内获得了良好的声誉，这也成为了中博诚通主要的成功因素之一。<span style=\"color: rgb(255, 0, 0);\">此次荣获2016年度&ldquo;品牌知名度教育机构&rdquo;可算实至名归</span>。与此同时，也奠定了中博诚通在行业中的领先地位。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　2016年度&ldquo;品牌知名度教育机构&rdquo;奖是社会和市场对中博诚通一次极大的肯定，中博诚通这十二年来，一直专注于ACCA、CMA、CFA、FRM、CIMA等国际高端财经金融证书的教育培训，以先进的知识管理体系、完善的客户服务系统、持续改善的学习型文化，赢得了学员的信赖，领跑于中国高端财经培训业。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"121634.jpg\" height=\"334\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/201612/121634.jpg\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"500\" /><br />\r\n中博诚通是中国目前唯一一家获得ACCA（英国特许公认会计师公会）10项黄金级认证的培训机构，拥有ACCA英国总部授权的39个ACCA机考考试中心。同时也是IMA美国管理会计师协会官方授权的CMA培训机构和CIMA皇家特许管理会计师公会官方授权的高级CIMA培训商。中博诚通已拥有49所统一师资、统一管理的直属分公司118个教学点，包括北京、上海、广州、深圳、天津、郑州、开封、洛阳、济南、青岛、烟台、威海、杭州、宁波、苏州、南京、无锡、徐州、镇江、贵阳、成都、重庆、哈尔滨、长春、沈阳、大连、合肥、蚌埠、芜湖、武汉、长沙、石家庄、秦皇岛、保定、唐山、太原、西安、兰州、昆明、南宁、桂林、百色、柳州、呼和浩特、海口、珠海、福州、厦门、南昌等地。现拥有非教学员工1000余人、专业精英讲师400余名，并已成为中国160余所大学、数十家知名企业的教育合作伙伴！截止至2016年11月，中博诚通已累计培训学员超过60,000+人次，在学学员30000+人次，培养出众多优秀的国际财经人才。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　从近年来教育行业的发展和目前教育国际化趋势的演化和进程，可以看出国际专业资格证书在提升中国教育国际化的规模、质量、效益等方面所扮演的重要角色，它是中国教育国际化最重要的助推器。中博诚通作为心系社会、具有高度社会责任感的教育培训机构，我们一直致力于推动中国教育国际化的进程、推动国际财经教育在中国的发展并为财智精英提供专业、优质、高效、便捷的培训服务，为帮助广大学员多、快、好、省地学习西方先进的财经文化和管理理念与方法而努力奋斗！</p>\r\n','0','1503107373','1','1503107373','1','0','0');
INSERT INTO `zb_xwzx` VALUES('15','企业动态','中博动态',' 2016年12月9日下午，中博诚通与John Wiley&Sons Inc.(约翰威立国际出版公司，以下简称Wiley)战略合作签约仪式在上海市五角场凯悦酒店举行。','中博诚通&WILEY签约仪式圆满结束','0','','uploadfile/img/2017/0819/150310789176445.png','','<span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;2016年12月9日下午，中博诚通与John Wiley&amp;Sons Inc.(约翰威立国际出版公司，以下简称Wiley)战略合作签约仪式在上海市五角场凯悦酒店举行。中博诚通执行董事、副总裁、中博金汇总经理袁长澄，中博金汇副总经理徐潇，中博金汇副总经理王沈会，Wiley国际业务发展副总裁王晓波，Wiley中国业务发展总监余菁维，Wiley中国高级业务发展经理张阳等双方高管共同出席了本次签约仪式，此外中博诚通还邀请了来自东华大学、广东财经大学、上海对外经贸大学等高校的中博诚通学员一同见证此次签约。</span>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu278.png\" height=\"425\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu278.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"640\" /><br />\r\n袁长澄先生首先对于本次合作达成表示祝贺并介绍了中博诚通的发展历史及概况，详细阐述了公司在培训领域所做出的努力，希望通过与Wiley的强强联合，能够优势互补，共谋发展，从而为中博的学员提供更专业的知识和更优质的服务。其中包括CFA原版考试教材、CFA配套学习资料、量身定制的课程、10000+页携手Wiley独家研发CFA教学讲义、6000+CFA试题库、4000+CFA练习题、300h+CFA视频课程、60+页CFA公式表等，中博诚通在为学员提供的专业知识和服务方面，都将会有质的飞跃。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu279.png\" height=\"426\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu279.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"640\" /><br />\r\n王晓波先生首先向中博诚通员工以及前来参加签约仪式的学员致以谢意并简单介绍了Wiley的基本情况，表达了对于中博诚通的认可，认为中博诚通12年的发展历程、专注的团队建设和对于教育行业认真的态度，与Wiley的追求不谋而合，这也是促成此次合作的主要原因。最后表达了对此次合作以及对中博诚通、中博学员的美好祝福。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　双方核心团队也就此次合作分别发表感言，表达了对中博诚通和Wiley今后合作的憧憬和信心。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">随后，在双方团队以及中博学员的见证下，中博诚通执行董事、副总裁、中博金汇总经理袁长澄先生同Wiley国际业务发展副总裁王晓波先生作为双方代表签订本次合作协议。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　签约仪式结束后，双方代表接受了来自各大院校中博学员的提问，袁长澄先生、王晓波先生对于此次合作的细节进行了解答。活动最后，为了感谢学员们的热情参与，现场进行了有奖竞猜，并由中博诚通代表袁长澄先生为学员送出了神秘大礼。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu281.png\" height=\"426\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu281.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"639\" /><br />\r\n&nbsp;这将是中博与Wiley一个新的开始，相信两家公司的长期合作，会携手为中博学员提供更专业的资源和更优质的教育服务。<b>中博诚通成立于2004年，十多年来专注于国际高端财经知识的传播，在ACCA、CMA、CFA、FRM、CIMA等国际高端财经金融证书的教育上，以先进的知识管理体系、完善的客户服务系统、持续改善的学习型文化，赢得了学员的信赖。</b></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><b>Wiley简介：</b></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">　　Wiley作为CFA官方教材唯一指定出版机构，创建于1807年，历经两百多年的发展，在学术研究、知识和学习领域发展成为世界领先的出版商。自1901年以来，Wiley已为四百多名诺贝尔奖得主出版了他们的著作，多次被《福布斯(Forbes)》杂志和《财富(Fortune)》杂志评选为&ldquo;40家美国最佳大公司&rdquo;和&ldquo;100家最佳雇主&rdquo;。Wiley的核心服务包括图书馆服务、期刊及图书合作出版、作者服务、版权服务、企业服务、学术交流、中文社交媒体、在线平台等多方面。</p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><img alt=\"tu280.png\" height=\"427\" src=\"http://www.china-ife.com/Cms_Data/Contents/ChinaBo/Media/1/kaoshidongtai/tu280.png\" style=\"border: none; margin: 0px auto; padding: 0px; vertical-align: middle; display: block;\" width=\"640\" /></p>\r\n<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑, Verdana, Arial, Helvetica, sans-serif; font-size: 14px;\"><br />\r\n&nbsp;</p>\r\n','0','1503107915','1','1503107915','1','0','0');
INSERT INTO `zb_xwzx` VALUES('16','媒体报道','中博名企参观播报','12月14日下午，来自各大高校的中博诚通学员齐聚在大时代证券投资有限公司，在这里开启了学员们精彩的金融文化之旅，让我们一起来看看~','【名企参观播报】小博带你走进“大时代”','5','','uploadfile/img/2017/0819/150310857178295.jpg','','<span lang=\"EN-US\" style=\"font-size: 7pt; font-family: 微软雅黑, sans-serif; color: rgb(152, 152, 152); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">12</span><span style=\"font-size: 7pt; font-family: 微软雅黑, sans-serif; color: rgb(152, 152, 152); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">月<span lang=\"EN-US\">14</span>日下午，来自各大高校的中博诚通学员齐聚在大时代证券投资有限公司，在这里开启了学员们精彩的金融文化之旅，让我们一起来看看<span lang=\"EN-US\">~</span></span><br />\r\n<br />\r\n<div style=\"text-align: center;\"><span style=\"font-size: 7pt; font-family: 微软雅黑, sans-serif; color: rgb(152, 152, 152); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\"><span lang=\"EN-US\"><strong>开场介绍</strong></span></span></div>\r\n<div style=\"text-align: center;\"><span style=\"font-size: 7pt; font-family: 微软雅黑, sans-serif; color: rgb(152, 152, 152); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\"><span lang=\"EN-US\"><strong><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819101013774.jpg\" style=\"width: 600px; height: 385px;\" /></strong>&nbsp;<br />\r\n<br />\r\n<strong>参观公司<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819101314891.png\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819101346963.png\" style=\"width: 600px; height: 385px;\" /></strong><br />\r\n<br />\r\n<strong style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif;\">公司领导发言</strong><br />\r\n<br />\r\n&nbsp;主要内容：<br />\r\n　　 （1）国内、国际金融市场发展趋势；金融名企内部介绍（业务部门，工作内容，薪资福利，晋升渠道，校招情况）；<br />\r\n　　 （2）当下金融名企的用人需求及高端人才招聘要求。（财务类和金融类两个方向）；<br />\r\n　　 （3）金融名企招聘的关注点介绍（学校背景、专业背景、英语能力、相关执照、实习经历等）。<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819101536719.png\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819101624936.png\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819101651237.png\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n<br />\r\n<strong style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif;\">通过我们的几位金融大咖给大家总结</strong></span></span></div>\r\n<div style=\"text-align: center;\"><strong>金融方面的最新讯息以及分享学习和从业经验，</strong><br />\r\n<strong>小伙伴们一定都获益匪浅！</strong><br />\r\n<strong>青春，不就应该是这样吗？</strong><br />\r\n<strong>带着昂扬的斗志去收获，</strong><br />\r\n<strong>我们虽没有指点江山的豪迈壮举</strong><br />\r\n<strong>但是这是薄发而厚积的深沉！<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819101834221.png\" style=\"width: 600px; height: 385px;\" /></strong><br />\r\n<br />\r\n<strong>关于实习，关于就业</strong></div>\r\n<div style=\"text-align: center;\"><strong>还没毕业，还没经验</strong><br />\r\n<strong>我们却总是仰望CBD的高楼</strong><br />\r\n<strong>茫茫求职人海，漫漫求职之路</strong><br />\r\n<strong>我们的简历却空白一片，</strong><br />\r\n<strong>少不更事的我们，</strong><br />\r\n<strong>该怎样刷新自己的简历，</strong><br />\r\n<strong>开拓自己的视野</strong><br />\r\n<strong>来中博</strong><br />\r\n<strong>一切都将变的明朗</strong><br />\r\n<br />\r\n<strong>关于中博诚通</strong><br />\r\n<br />\r\n<p style=\"margin-bottom: 5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\"><span style=\"font-size: 7pt; font-family: 微软雅黑, sans-serif; color: rgb(152, 152, 152); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">&nbsp;北京中博诚通国际技术培训有限责任公司，简称中博诚通，致力于提供国际财会证书培训及企业内训。<span lang=\"EN-US\">2004</span>年成立以来，中博诚通国际已经与英国、爱尔兰、美国、加拿大和澳大利亚多所大学合作建立国际化高级财经管理人才的培养模式，并且在国内与对外经济贸易大学、中山大学、暨南大学、湖北大学、北京外国语大学、中国传媒大学等近<span lang=\"EN-US\">60</span>所高校展开<span lang=\"EN-US\">ACCA/CMA/CFA/CIMA</span>等国际财经职业资格认证课程合作。成立十年以来，中博诚通一直致力于<span lang=\"EN-US\">ACCA</span>、<span lang=\"EN-US\">CMA</span>等国际财经证书培训及企业内训，已经发展成为国内最大的国际高端财会证书培训机构。<span lang=\"EN-US\"><o:p></o:p></span></span></p>\r\n</div>\r\n<br />\r\n','0','1503109217','1','1503109217','1','0','0');
INSERT INTO `zb_xwzx` VALUES('17','媒体报道','中博诚通与成都理工大学工程技术学院举办ACCA项目','中博诚通与成都理工大学工程技术学院举办ACCA项目签约仪式','中博诚通与成都理工大学工程技术学院举办ACCA项目签约仪式','1','','uploadfile/img/2017/0819/150310958652673.jpg','','2016年6月30日,为培养国际化高端财经人才,引进优质教学资源,北京中博诚通国际技术培训有限责任公司(以下简称&ldquo;中博诚通&rdquo;)与成都理工大学工程技术学院联合开展成都理工大学工程技术学院ACCA国际财经精英班，并在成都理工大学工程技术学院会议室举办签约仪式。<br />\r\n<br />\r\n出席此次签约仪式的有中博诚通董事袁长澄、西南大区经理孙洁颖、成都分部主管牟富洲、成都理工大学商学院主任杨潇和成都理工大学工程技术学院副院长张廷斌、处长李俊霞、处长郦仁、经管系主任程夏、主任陈继军、主任戴彦群等老师，签约仪式由成都理工大学工程技术学院处长郦仁主持。<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819102240777.jpg\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n<span style=\"font-size: 7pt; font-family: 微软雅黑, sans-serif; color: rgb(152, 152, 152); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">首先郦仁处长代表成都理工大学工程技术学院对中博诚通各位领导热烈欢迎和感谢，并介绍了与会的领导和嘉宾。<span style=\"font-size: 7pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">其次，成都理工大学工程技术学院副院长张廷斌发表重要讲话。张院长介绍到学院非常重视<span lang=\"EN-US\">ACCA</span>项目，以及<span lang=\"EN-US\">ACCA</span>项目对于学生的帮助很大，中博诚通为学校引进的第一家教育培训公司。<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819102342465.jpg\" style=\"width: 600px; height: 385px;\" /></span><br />\r\n<br />\r\n（成都理工大学工程技术学院副院长张廷斌发表重要讲话）<br />\r\n<br />\r\n随后，中博诚通董事袁长澄对成都理工大学工程技术学院领导的欢迎表示感谢，并介绍了中博诚通的发展情况，希望能给学生带来更多的学习资源。<br />\r\n<br />\r\n最后，成都理工大学工程技术学院程夏主任、李俊霞处长等老师围绕学生学习过程中可能出现的问题，以及学生学习完后的就业问题和中博诚通董事袁长澄、西南大区经理孙洁颖进行了讨论，充分的表现了学校领导对于ACCA项目的重视以及学生的发展。</span><br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819102535916.jpg\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n（双方正式签订ACCA国际财经精英班的合作协议）<br />\r\n<br />\r\n中博诚通成立于2004年，十二年来专注于国际高端财经知识的传播，致力于培养具备良好的社会责任意识、理性思考、不断追求进步、敢为天下先的社会精英。<br />\r\n<br />\r\n在ACCA、CMA、CFA、FRM、CIMA等国际高端财经金融证书的教育上，中博诚通以先进的知识管理体系、完善的客户服务系统、持续改善的学习型文化，赢得了学员的信赖与支持，领跑于中国高端财经培训业。历经十二年，中博诚通的培训项目已经延伸到泛财经网络教育、金融板块国际高端课程、企业内训、求职实训以及国际留学、考研等。<br />\r\n&nbsp;</div>\r\n','0','1503109612','1','1503109612','1','0','0');
INSERT INTO `zb_xwzx` VALUES('18','媒体报道','JHC大赛中博学子表现优异','由ACCA（特许公认会计师公会）举办的“全国就业力大比拼比赛”立足于搭建校企沟通展示平台，帮助在校学生提高全方位就业能力。该赛事已连续举办超过十二年。比赛在ACCA众多认可雇主的大力支持下，模拟正式工作申请流程，通过在线逻辑测试、笔试、现场面试等多元化形式营造真实商业挑战氛围，是一场全国性的校园赛事。','JHC大赛中博学子表现优异 斩获数家ACCA认可雇主offer','4','','uploadfile/img/2017/0819/150311002257344.jpg','','由ACCA（特许公认会计师公会）举办的&ldquo;全国就业力大比拼比赛&rdquo;立足于搭建校企沟通展示平台，帮助在校学生提高全方位就业能力。该赛事已连续举办超过十二年。比赛在ACCA众多认可雇主的大力支持下，模拟正式工作申请流程，通过在线逻辑测试、笔试、现场面试等多元化形式营造真实商业挑战氛围，是一场全国性的校园赛事。<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819102808597.jpg\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n　2016年JHC大赛中，中博诚通共87名优秀学员22支队伍进入复赛，通过英文案例分析报告的比拼，中博诚通共5支队伍20名学员挺进区域决赛。他们先后通过了由全球权威能力测评机构cut-e提供的全英文在线文字、数理、逻辑推理测试和英文案例分析报告两个比赛环节。</div>\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819102907463.jpg\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n区域决赛结束后，中博诚通战队有3名优秀的参赛队员获得了ACCA认可雇主现场提供的Offer，其中，上海赛区中博诚通战队的于思捷同学收到了DELPHIDE offer；杭电队伍中的崔乔韵同学收到了SANNE的offer；青岛大学队的沈冬晨同学收到了天职会计师事务所的实习offer。</div>\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819103014423.jpg\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n中博诚通代表队在比赛过程中充分展现了当代大学生的优秀风采，不仅具有专业的知识储备，同时具有良好的应变能力和优秀的礼仪，面对评委的犀利点评回答得清楚明白、落落大方。</div>\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819103118633.jpg\" style=\"width: 600px; height: 385px;\" /><br />\r\n<br />\r\n<span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">中博诚通作为</span><span lang=\"EN-US\" style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">ACCA</span><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">官方的教育合作伙伴，获得比赛现场观摩名额。中博学员怀着无比期待的心情聚集在这里，观摩此次学术盛会。赛后大家积极讨论，纷纷感叹台上学长学姐的魅力非凡，自己也要努力争取获得明年的参赛资格。<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819103206163.jpg\" style=\"width: 600px; height: 385px;\" /></span><br />\r\n<br />\r\n<span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">　中博诚通作为</span><span lang=\"EN-US\" style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">ACCA</span><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">特许公认会计师公会官方授权</span><span lang=\"EN-US\" style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">ACCA</span><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">黄金级培训机构，专注于国际高端财经知识的传播，致力于培养具备良好的社会责任意识、理性思考、不断追求进步，敢为天下先的金融全才。<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819103257730.jpg\" style=\"width: 600px; height: 385px;\" /></span><br />\r\n<br />\r\n<span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">与此同时，中博诚通作为</span><span lang=\"EN-US\" style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">ACCA</span><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, sans-serif; font-size: 7pt;\">全国就业力大比拼的教育合作伙伴，也全力专注于为企业培养和甄选未来财会金融人才，搭建人才交流的平台；努力帮助雇主更高效地为财会部门物色合适的实习生，帮助同学更高效的找到符合职业规划的工作。</span><br />\r\n<br />\r\n&nbsp;</div>\r\n','0','1503110041','1','1503110041','1','0','0');
INSERT INTO `zb_xwzx` VALUES('19','重要活动','中博诚通12周年盛典','中博诚通12周年盛典，荣耀征程，感谢有你陪伴！','中博诚通12周年盛典，荣耀征程，感谢有你陪伴！','1','','uploadfile/img/2017/0819/150311071639105.jpg','','<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819104409161.jpg\" style=\"width: 741px; height: 6419px;\" /></div>\r\n','0','1503110726','1','1503110726','1','0','0');
INSERT INTO `zb_xwzx` VALUES('20','重要活动','寻找中博新英雄','寻找中博新英雄','寻找中博新英雄','5','','uploadfile/img/2017/0819/150311132288194.jpg','','<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819104631260.jpg\" style=\"width: 743px; height: 384px;\" /><br />\r\n<br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819105011431.jpg\" style=\"width: 741px; height: 2922px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819105056949.jpg\" style=\"width: 738px; height: 248px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819105132948.jpg\" style=\"width: 741px; height: 1015px;\" /><br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819105205817.jpg\" style=\"width: 743px; height: 293px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819105231254.jpg\" style=\"width: 741px; height: 1219px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819105312488.jpg\" style=\"width: 741px; height: 638px;\" /></div>\r\n','0','1503111365','1','1503111365','1','0','0');
INSERT INTO `zb_xwzx` VALUES('21','重要活动','中博诚通“带盐人”大赛全国总决赛评选结果公布','中博诚通“带盐人”大赛全国总决赛评选结果公布','中博诚通“带盐人”大赛全国总决赛评选结果公布','4','','uploadfile/img/2017/0819/150311171474295.jpg','','<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819105930214.jpg\" style=\"width: 741px; height: 384px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819105949456.jpg\" style=\"width: 741px; height: 578px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819110004576.jpg\" style=\"width: 741px; height: 1259px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819110022100.jpg\" style=\"width: 741px; height: 679px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819110035202.jpg\" style=\"width: 741px; height: 332px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819110049658.jpg\" style=\"width: 741px; height: 461px;\" /><br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819110102859.jpg\" style=\"width: 741px; height: 447px;\" /></div>\r\n','0','1503111722','1','1503111722','1','0','0');
INSERT INTO `zb_xwzx` VALUES('22','社会公益','中博公益活动','2015年7月，爱艺文化基金发起\"告诉世界有多美\"雅安夏令营，中博教育志愿团队由中博董事、财萃网联合创始人曲悲岩带队共赴雅安，秉承十一年教育理念，将爱心传递到朝气蓬勃的土地。','践行教育传递梦想，雅安公益行','2','2015年7月，爱艺文化基金发起\"告诉世界有多美\"雅安夏令营，中博教育志愿团队由中博董事、财萃网联合创始人曲悲岩带队共赴雅安，秉承十一年教育理念，将爱心传递到朝气蓬勃的土地。','statics/gyzb/2017/0819/20170819122905_715.png','statics/gyzb/2017/0819/20170819122905_179.jpg','<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819121842274.png\" style=\"width: 703px; height: 389px;\" /><br />\r\n<br />\r\n2015年7月，爱艺文化基金发起&quot;告诉世界有多美&quot;雅安夏令营，中博教育志愿团队由中博董事、财萃网联合创始人曲悲岩带队共赴雅安，秉承十一年教育理念，将爱心传递到朝气蓬勃的土地。<br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819121939105.png\" style=\"width: 702px; height: 182px;\" /><br />\r\n<br />\r\n爱&middot;出发<br />\r\n<br />\r\n2015年7月16日，&ldquo;2015告诉世界有多美雅安夏令营&rdquo;开营。<br />\r\n开营仪式结束后小盆友们秩序井然地离开现场，准备回各自的学校参加在中里镇中心小学、张沟小学、郑湾小学、龙泉小学、联合小学分别举办的夏令营活动。<br />\r\n<br />\r\n<br />\r\n爱&middot;味道<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819122118425.png\" style=\"width: 704px; height: 529px;\" /><br />\r\n由于张湾小学和联合小学的步行路程比较远，志愿者往返步行常辛苦，因此午饭最好的办法就是送餐。为了让志愿者们吃得饱，吃得好，生活组志愿者们煞费苦心，中博教育志愿者张龙作为生活组大厨，义不容辞承担起向各学校送饭的职责。<br />\r\n<br />\r\n爱&middot;责任<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819122235949.png\" style=\"width: 702px; height: 467px;\" />&nbsp;<br />\r\n<br />\r\n有一位志愿者说：我们不仅仅因为爱在一起，而是因为爱和责任。如果仅仅是因为爱，那么所有的人都可以在一起，然而为了共同的目标相聚雅安，那么还应该有的就是&mdash;&mdash;责任。<br />\r\n&nbsp;<br />\r\n在五十多位志愿者中，有六位志愿者来自爱艺基金的&ldquo;大朋友计划&rdquo;受益者，他们都是2008年5&middot;12地震的亲历者，经过大朋友计划的资助成长，已经成为志愿者回报家乡。<br />\r\n&nbsp;<br />\r\n爱&middot;感动<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819122422767.png\" style=\"width: 704px; height: 469px;\" /><br />\r\n<br />\r\n当中博教育曲悲岩老师问大家对本次支教活动的感想是什么，大家都脱口而出提到了&ldquo;感动&rdquo;。<br />\r\n&nbsp;<br />\r\n中博教育志愿者席贝也亲身诠释着他对&ldquo;感动&rdquo;的理解。&ldquo;被营员孩子们超强的自理能力而感动，被志愿者团队的无私奉献而感动，被当地淳朴至美的人文情怀而感动！&rdquo;<br />\r\n<br />\r\n<br />\r\n爱&middot;聚集<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819122553720.png\" style=\"width: 706px; height: 468px;\" /><br />\r\n<br />\r\n本次夏令营的成功举办离不开青春洋溢的大学生志愿者们，他们分别来自中国人民大学、四川传媒大学、北京工商大学、四川农业大学和香港大学等高校。当然还有来自中博教育的志愿者团队，以及团队强大的后援团队，中博教育的全体员工。</div>\r\n带着大家的期望，带着热心公益的使命，带着对孩子们的爱与责任，中博教育志愿者团队与大学生志愿者们一起成长，与营员孩子们一起欢笑。<br />\r\n<br />\r\n<div style=\"text-align: center;\">爱&middot;格桑花<br />\r\n<br />\r\n<img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819122712195.png\" style=\"width: 704px; height: 469px;\" /><br />\r\n<br />\r\n2015年7月22日，&ldquo;告诉世界有多美&rdquo;夏令营闭幕。夏令营闭幕式活动多样，太极、合唱、歌曲、绘本剧、舞蹈、舞台剧、彩绘服装秀、手语等一个个精彩的节目，把志愿者和孩子们带入了一个童话世界。</div>\r\n&nbsp;<br />\r\n&ldquo;告诉世界有多美&rdquo;雅安夏令营的孩子们和志愿者们已经在大家心中种下一朵朵美丽的格桑花，绚丽的绽放。<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819122821994.png\" style=\"width: 704px; height: 467px;\" /><br />\r\n<br />\r\n<br />\r\n爱与责任还将延续，为丰富雅安地区学生的课余生活，让孩子们拥有更多的课外读物，中博教育又携手爱艺文化基金，发起图书募捐活动，以图书募捐的形式向雅安的学生献出爱心。</div>\r\n<br />\r\n','0','1503116945','1','1503116945','1','0','0');
INSERT INTO `zb_xwzx` VALUES('23','社会公益','中博教育公益','玉树地震：2010年，玉树地震，中博教育向青海受灾学员提供全额奖学金。','中博教育向青海受灾学员提供全额奖学金','1','玉树地震：2010年，玉树地震，中博教育向青海受灾学员提供全额奖学金。','statics/gyzb/2017/0819/20170819124856_643.png','statics/gyzb/2017/0819/20170819124856_996.jpg','<div style=\"text-align: center;\">玉树地震：2010年，玉树地震，中博教育向青海受灾学员提供全额奖学金。<br />\r\n&nbsp;</div>\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819124835468.jpg\" style=\"width: 557px; height: 256px;\" /></div>\r\n','1','1503118136','1','1503128615','1','0','0');
INSERT INTO `zb_xwzx` VALUES('24','社会公益','中博教育向少数民族提供奖学金','，中博教育向全国教学点的贫困学员和少数民族学员提供全额奖学金','中博教育向全国教学点的贫困学员和少数民族学员提供全额奖学金','0','，中博教育向全国教学点的贫困学员和少数民族学员提供全额奖学金','statics/gyzb/2017/0819/20170819125610_305.jpg','statics/gyzb/2017/0819/20170819125610_678.jpg','贫困学生&amp;少数民族：为让贫困地区和少数民族学生也有机会学习先进的国际财经知识，中博教育向全国教学点的贫困学员和少数民族学员提供全额奖学金，支持他们学习高端财经证书。<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819125552245.jpg\" style=\"width: 380px; height: 158px;\" /></div>\r\n<br />\r\n<br />\r\n','0','1503118570','1','1503118570','1','0','0');
INSERT INTO `zb_xwzx` VALUES('25','社会公益','中博公益','为支持教育事业，中博教育向甘肃省陇南市宕昌县新城子乡天职国际老树川希望小学捐助物资及现金。','中博为希望小学捐助物资及现金','0','为支持教育事业，中博教育向甘肃省陇南市宕昌县新城子乡天职国际老树川希望小学捐助物资及现金。','statics/gyzb/2017/0819/20170819130343_483.jpg','statics/gyzb/2017/0819/20170819130343_955.jpg','<div style=\"text-align: center;\">希望小学：为支持教育事业，中博教育向甘肃省陇南市宕昌县新城子乡天职国际老树川希望小学捐助物资及现金。</div>\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"http://zb.php.xmfeel.com/uploadfile/2017/0819/20170819010308387.jpg\" style=\"width: 380px; height: 158px;\" /></div>\r\n','0','1503119023','1','1503119023','1','0','0');
INSERT INTO `zb_xwzx` VALUES('26','中博力量','荣获中博ACCA好学生奖学金','一年通过ACCA8个科目，感谢中博老师的陪伴和督促。','陈婷婷','0','广州大学','uploadfile/img/2017/0819/150311993717144.jpg','','','0','1503120163','1','1503120163','1','0','0');
INSERT INTO `zb_xwzx` VALUES('27','中博力量','荣获中博CMA好学生奖学金','伴随着盛夏的来临，我的CMA学习也暂告一段落，想着自己也要从ZBG毕业了，心中油生无限不舍。回忆这一路沿途的风景，姹紫嫣红，好不精彩。','徐涵','0','郑州大学','uploadfile/img/2017/0819/150312036080994.jpg','','','0','1503120376','1','1503120376','1','0','0');
INSERT INTO `zb_xwzx` VALUES('28','通知公告','这是一条测试通知公告','这是一条测试通知公告这是一条测试通知公告','这是一条测试通知公告','8','这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告','uploadfile/img/2017/0819/150312046748387.jpg','','这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告这是一条测试通知公告','1','1503120476','1','1503120476','1','0','0');
INSERT INTO `zb_xwzx` VALUES('29','中博力量','荣获中博CFA好学生奖学金','学习的苦不比当年高考少，因为高考是一个班级，一个年级的共同奋斗，学CFA，你的同伴可能只有几个，甚至是孤军作战。','陈嘉永','0','','uploadfile/img/2017/0819/150312078168857.jpg','','','0','1503120920','1','1503120943','1','0','0');
INSERT INTO `zb_xwzx` VALUES('30','中博力量','荣获中博CFA好学生奖学金','感谢中博诚通的老师们，教会了我们很多在大学课堂学不到的东西，给了我们一个舒服的学习氛围，也有一群很好的战友!','关科洛','0','','uploadfile/img/2017/0819/150312104148870.jpg','','','0','1503121071','1','1503121071','1','0','0');
INSERT INTO `zb_xwzx` VALUES('31','中博力量','荣获中博FRM好学生奖学金','特别感谢中博的程黄维老师和虎哥，他们在我整个备考期给了我很大帮助。谢谢你们！','骆丹琳','0','','uploadfile/img/2017/0819/150312115626277.jpg','','','0','1503121215','1','1503121215','1','0','0');
INSERT INTO `zb_xwzx` VALUES('32','中博力量','荣获中博FRM好学生奖学金','我是霍铧毅，是中博诚通广州首期FRM学员，很高兴可以来中博诚通学习FRM(金融风险管理师)。','霍铧毅','0','广东金融学院','uploadfile/img/2017/0819/150312131044152.jpg','','','0','1503121345','1','1503121345','1','0','0');
INSERT INTO `zb_xwzx` VALUES('33','中博力量','荣获中博ACCA好学生奖学金','从没想过会在ACCA考试中拿到全球最高分。感谢中博老师的指导和帮助。','周婧仪','0','华南理工大学','uploadfile/img/2017/0819/150312150128927.jpg','','','0','1503121562','1','1503121562','1','0','0');
INSERT INTO `zb_xwzx` VALUES('34','中博力量','荣获中博ACCA好学生奖学金','获得P2全国第一是对自己努力的一个认可，感谢中博老师的帮助。','葛笑宇','0','','uploadfile/img/2017/0819/150312166193992.jpg','','','0','1503121763','1','1503121763','1','0','0');

DROP TABLE IF EXISTS `zb_ywtx`;
CREATE TABLE `zb_ywtx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `jianjie` text NOT NULL,
  `one` varchar(255) NOT NULL,
  `english` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `pic` varchar(200) NOT NULL,
  `pic2` varchar(200) NOT NULL,
  `pic3` varchar(200) NOT NULL,
  `pic4` varchar(200) NOT NULL,
  `pic5` varchar(200) NOT NULL,
  `pic6` varchar(200) NOT NULL,
  `pic7` varchar(200) NOT NULL,
  `pic8` varchar(200) NOT NULL,
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_ywtx` VALUES('1','业务板块业务板块','业务板块','业务板块','业务板块','BUSINESS SEGMENT','<p>管理会计的知识理念不仅可以帮助企业优化财务管理体系、</p>\r\n      <p>改进财务绩效、防范投融资风险，还可以帮助企业进行财务管理创新和战略决策，促进企业创新发展。</p>','statics/ywtx/2017/0816/20170816142015_553.jpg','statics/ywtx/2017/0816/20170816140659_631.jpg','statics/ywtx/2017/0816/20170816140659_539.jpg','statics/ywtx/2017/0816/20170816140659_118.jpg','statics/ywtx/2017/0816/20170816140659_943.jpg','statics/ywtx/2017/0816/20170816140659_734.jpg','statics/ywtx/2017/0816/20170816140659_188.jpg','statics/ywtx/2017/0816/20170816140659_761.jpg','1502853629','1','1503030967','1','0');
INSERT INTO `zb_ywtx` VALUES('2','49','118','1000+','全国分公司','NATIONAL BRANCH','<b>管理会计的知识理念不仅可以帮助企业优化财务管理体系、改进财务绩效、防范投融资风险，还可以帮助企业进行财务管理创新和战略决策，促进企业创新发展。</b>','uploadfile/img/2017/0818/150303191050288.png','十三年，49城','中博诚通有遍及全国的49家分部','100000+','','','','','1502853629','1','1503114110','1','0');

DROP TABLE IF EXISTS `zb_ywtx_city`;
CREATE TABLE `zb_ywtx_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `paixu` int(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `adduser` varchar(100) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` varchar(100) NOT NULL,
  `status_del` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_ywtx_city` VALUES('1','北京','http://www.163.com','3','1502937625','1','1502937636','1','0');

DROP TABLE IF EXISTS `zb_zbll`;
CREATE TABLE `zb_zbll` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `num` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `jianjie` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `moditime` int(11) NOT NULL,
  `modiuser` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO `zb_zbll` VALUES('1','49','49个分部149个教学点','经过十年的教育沉淀北京中博新视网络教育科技发展有限公司拥有149个教学点','#','1503539182','2');
INSERT INTO `zb_zbll` VALUES('2','41','49个分部149个教学点','经过十年的教育沉淀北京中博新视网络教育科技发展有限公司拥有149个教学点','#','1502872717','1');
INSERT INTO `zb_zbll` VALUES('3','42','49个分部149个教学点','经过十年的教育沉淀北京中博新视网络教育科技发展有限公司拥有149个教学点','#','1502872717','1');
INSERT INTO `zb_zbll` VALUES('4','43','49个分部149个教学点','经过十年的教育沉淀北京中博新视网络教育科技发展有限公司拥有149个教学点','#','1502872717','1');
INSERT INTO `zb_zbll` VALUES('5','44','49个分部149个教学点','经过十年的教育沉淀北京中博新视网络教育科技发展有限公司拥有149个教学点','#','1502872717','1');

