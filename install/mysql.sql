DROP TABLE IF EXISTS `destoon_404`;
CREATE TABLE `destoon_404` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `url` varchar(255) NOT NULL default '',
  `robot` varchar(20) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='404日志';

DROP TABLE IF EXISTS `destoon_ad`;
CREATE TABLE `destoon_ad` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `pid` int(10) unsigned NOT NULL default '0',
  `typeid` tinyint(1) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `amount` float NOT NULL default '0',
  `currency` varchar(20) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `introduce` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `fromtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `stat` tinyint(1) unsigned NOT NULL default '0',
  `note` text NOT NULL,
  `code` text NOT NULL,
  `text_name` varchar(100) NOT NULL default '',
  `text_url` varchar(255) NOT NULL default '',
  `text_title` varchar(100) NOT NULL default '',
  `text_style` varchar(50) NOT NULL default '',
  `image_src` varchar(255) NOT NULL default '',
  `image_url` varchar(255) NOT NULL default '',
  `image_alt` varchar(100) NOT NULL default '',
  `flash_src` varchar(255) NOT NULL default '',
  `flash_url` varchar(255) NOT NULL default '',
  `flash_loop` tinyint(1) unsigned NOT NULL default '1',
  `key_moduleid` smallint(6) unsigned NOT NULL default '0',
  `key_catid` smallint(6) unsigned NOT NULL default '0',
  `key_word` varchar(100) NOT NULL default '',
  `key_id` bigint(20) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  KEY `pid` (`pid`)
) TYPE=MyISAM COMMENT='广告';

INSERT INTO `destoon_ad` VALUES('1','全站横幅468x60','13','3','0','0','','http://idc.destoon.com/','','0','destoon','1306857600','destoon','1320048425','1306857600','1433174399','0','','','','','','','file/image/banner.gif','http://idc.destoon.com/','Destoon专用VPS主机','','','1','0','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('2','网站首页图片轮播1','14','5','0','0','','http://www.destoon.com','','0','destoon','1306857600','destoon','1320048450','1306857600','1433174399','0','','','','','','','file/image/player_1.jpg','http://www.destoon.com','','','','1','0','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('3','首页旗帜A1','20','3','0','0','','http://idc.destoon.com/','','0','destoon','1306857600','destoon','1320047941','1306857600','1433174399','0','','','','','','','file/image/150x60.gif','http://idc.destoon.com/','','','','1','0','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('4','首页旗帜A2','21','3','0','0','','http://idc.destoon.com/','','0','destoon','1306857600','destoon','1320047936','1306857600','1433174399','0','','','','','','','file/image/150x60.gif','http://idc.destoon.com/','','','','1','0','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('5','首页旗帜A3','22','3','0','0','','http://idc.destoon.com/','','0','destoon','1306857600','destoon','1320047947','1306857600','1433174399','0','','','','','','','file/image/150x60.gif','http://idc.destoon.com/','','','','1','0','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('6','首页旗帜A4','23','3','0','0','','http://idc.destoon.com/','','0','destoon','1306857600','destoon','1320047953','1306857600','1433174399','0','','','','','','','file/image/150x60.gif','http://idc.destoon.com/','','','','1','0','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('7','首页旗帜A5','24','3','0','0','','http://idc.destoon.com/','','0','destoon','1306857600','destoon','1320047958','1306857600','1433174399','0','','','','','','','file/image/150x60.gif','http://idc.destoon.com/','','','','1','0','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('8','首页旗帜A6','25','3','0','0','','http://idc.destoon.com/','','0','destoon','1306857600','destoon','1320047963','1306857600','1433174399','0','','','','','','','file/image/150x60.gif','http://idc.destoon.com/','','','','1','0','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('9','网站首页图片轮播2','14','5','0','0','','http://www.destoon.com','','0','destoon','1306857600','destoon','1320048454','1306857600','1433174399','0','','','','','','','file/image/player_2.jpg','http://www.destoon.com','','','','1','0','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('11','首页展会右2','6','3','0','0','','http://idc.destoon.com/','','0','destoon','1306857600','destoon','1320047862','1306857600','1433174399','0','','','','','','','file/image/150x60.gif','http://idc.destoon.com/','','','','1','7','0','','0','0','3');
INSERT INTO `destoon_ad` VALUES('10','首页展会右1','5','3','0','0','','http://idc.destoon.com/','','0','destoon','1306857600','destoon','1306857600','1306857600','1433174399','0','','','','','','','file/image/150x60.gif','http://idc.destoon.com/','','','','1','7','0','','0','0','3');

DROP TABLE IF EXISTS `destoon_ad_place`;
CREATE TABLE `destoon_ad_place` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `typeid` tinyint(1) unsigned NOT NULL default '0',
  `open` tinyint(1) unsigned NOT NULL default '1',
  `name` varchar(255) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `introduce` varchar(255) NOT NULL default '',
  `code` text NOT NULL,
  `width` smallint(5) unsigned NOT NULL default '0',
  `height` smallint(5) unsigned NOT NULL default '0',
  `price` float unsigned NOT NULL default '0',
  `ads` smallint(4) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `template` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`pid`)
) TYPE=MyISAM COMMENT='广告位';

INSERT INTO `destoon_ad_place` VALUES('1','5','6','1','供应排名','','','','','0','0','0','0','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('2','6','6','1','求购排名','','','','','0','0','0','0','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('3','16','6','1','商城排名','','','','','0','0','0','0','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('4','4','6','1','公司排名','','','','','0','0','0','0','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('5','7','3','1','首页展会右1','','','','','150','60','0','1','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('6','7','3','1','首页展会右2','','','','','150','60','0','1','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('13','0','3','1','横幅广告','','','','','468','60','0','1','0','1320042561','destoon','1320047583','');
INSERT INTO `destoon_ad_place` VALUES('14','0','5','1','首页图片轮播','','','','','400','160','0','2','0','1320042561','destoon','1320047610','');
INSERT INTO `destoon_ad_place` VALUES('15','5','7','1','供应赞助商链接','','','','','0','0','0','0','0','1320042561','destoon','1320047619','');
INSERT INTO `destoon_ad_place` VALUES('17','4','7','1','公司赞助商链接','','','','','0','0','0','0','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('18','0','7','1','求购赞助商链接','','','','','0','0','0','0','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('19','8','7','1','展会赞助商链接','','','','','0','0','0','0','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('20','0','3','1','首页旗帜A1','','','','','150','60','0','1','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('21','0','3','1','首页旗帜A2','','','','','150','60','0','1','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('22','0','3','1','首页旗帜A3','','','','','150','60','0','1','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('23','0','3','1','首页旗帜A4','','','','','150','60','0','1','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('24','0','3','1','首页旗帜A5','','','首页旗帜A5','','150','60','0','1','0','1320042561','destoon','1320042561','');
INSERT INTO `destoon_ad_place` VALUES('25','0','3','1','首页旗帜A6','','','','','150','60','0','1','0','1320042561','destoon','1320042561','');

DROP TABLE IF EXISTS `destoon_address`;
CREATE TABLE `destoon_address` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `truename` varchar(30) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `postcode` varchar(10) NOT NULL default '',
  `telephone` varchar(30) NOT NULL default '',
  `mobile` varchar(30) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='收货地址';

DROP TABLE IF EXISTS `destoon_admin`;
CREATE TABLE `destoon_admin` (
  `adminid` smallint(6) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `title` varchar(30) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `moduleid` smallint(6) NOT NULL default '0',
  `file` varchar(20) NOT NULL default '',
  `action` varchar(255) NOT NULL default '',
  `catid` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`adminid`)
) TYPE=MyISAM COMMENT='管理员';

INSERT INTO `destoon_admin` VALUES (1, 1, 0, '生成首页', '?action=html', '', 0, '', '', '');
INSERT INTO `destoon_admin` VALUES (2, 1, 0, '更新缓存', '?action=cache', '', 0, '', '', '');
INSERT INTO `destoon_admin` VALUES (3, 1, 0, '网站设置', '?file=setting', '', 0, '', '', '');
INSERT INTO `destoon_admin` VALUES (4, 1, 0, '模块管理', '?file=module', '', 0, '', '', '');
INSERT INTO `destoon_admin` VALUES (5, 1, 0, '数据维护', '?file=database', '', 0, '', '', '');
INSERT INTO `destoon_admin` VALUES (6, 1, 0, '模板管理', '?file=template', '', 0, '', '', '');
INSERT INTO `destoon_admin` VALUES (7, 1, 0, '会员管理', '?moduleid=2', '', 0, '', '', '');
INSERT INTO `destoon_admin` VALUES (8, 1, 0, '单页管理', '?moduleid=3&file=webpage', '', 0, '', '', '');
INSERT INTO `destoon_admin` VALUES (9, 1, 0, '排名推广', '?moduleid=3&file=spread', '', 0, '', '', '');
INSERT INTO `destoon_admin` VALUES (10, 1, 0, '广告管理', '?moduleid=3&file=ad', '', 0, '', '', '');

DROP TABLE IF EXISTS `destoon_admin_log`;
CREATE TABLE `destoon_admin_log` (
  `logid` int(10) unsigned NOT NULL auto_increment,
  `qstring` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  `logtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`logid`)
) TYPE=MyISAM COMMENT='管理日志';

DROP TABLE IF EXISTS `destoon_admin_online`;
CREATE TABLE `destoon_admin_online` (
  `sid` varchar(32) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  `moduleid` int(10) unsigned NOT NULL default '0',
  `qstring` varchar(255) NOT NULL default '',
  `lasttime` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `sid` (`sid`)
) TYPE=HEAP COMMENT='在线管理员';

DROP TABLE IF EXISTS `destoon_alert`;
CREATE TABLE `destoon_alert` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `mid` smallint(6) unsigned NOT NULL default '0',
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `word` varchar(100) NOT NULL default '',
  `rate` smallint(4) unsigned NOT NULL default '0',
  `email` varchar(50) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '0',
  `edittime` int(10) unsigned NOT NULL default '0',
  `sendtime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='贸易提醒';

DROP TABLE IF EXISTS `destoon_announce`;
CREATE TABLE `destoon_announce` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `typeid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `content` text NOT NULL,
  `hits` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `fromtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `template` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `addtime` (`addtime`)
) TYPE=MyISAM COMMENT='公告';

DROP TABLE IF EXISTS `destoon_area`;
CREATE TABLE `destoon_area` (
  `areaid` int(10) unsigned NOT NULL auto_increment,
  `areaname` varchar(50) NOT NULL default '',
  `parentid` int(10) unsigned NOT NULL default '0',
  `arrparentid` varchar(255) NOT NULL default '',
  `child` tinyint(1) NOT NULL default '0',
  `arrchildid` text NOT NULL,
  `listorder` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`areaid`)
) TYPE=MyISAM COMMENT='地区';

INSERT INTO `destoon_area` VALUES('1','默认地区','0','0','0','1','1');

DROP TABLE IF EXISTS `destoon_article_21`;
CREATE TABLE `destoon_article_21` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `subtitle` text NOT NULL,
  `introduce` varchar(255) NOT NULL default '',
  `tag` varchar(100) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `author` varchar(50) NOT NULL default '',
  `copyfrom` varchar(30) NOT NULL default '',
  `fromurl` varchar(255) NOT NULL default '',
  `voteid` varchar(100) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='资讯';

DROP TABLE IF EXISTS `destoon_article_data_21`;
CREATE TABLE `destoon_article_data_21` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` longtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='资讯内容';

DROP TABLE IF EXISTS `destoon_ask`;
CREATE TABLE `destoon_ask` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `typeid` int(10) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `content` text NOT NULL,
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `admin` varchar(30) NOT NULL default '',
  `admintime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `reply` text NOT NULL,
  `star` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='客服中心';

DROP TABLE IF EXISTS `destoon_banip`;
CREATE TABLE `destoon_banip` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `ip` varchar(50) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='IP禁止';

DROP TABLE IF EXISTS `destoon_banword`;
CREATE TABLE `destoon_banword` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `replacefrom` varchar(255) NOT NULL default '',
  `replaceto` varchar(255) NOT NULL default '',
  `deny` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`bid`)
) TYPE=MyISAM COMMENT='词语过滤';

DROP TABLE IF EXISTS `destoon_brand`;
CREATE TABLE `destoon_brand` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `homepage` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `adddate` date NOT NULL default '0000-00-00',
  `totime` int(10) unsigned NOT NULL default '0',
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `validated` tinyint(1) unsigned NOT NULL default '0',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `fax` varchar(50) NOT NULL default '',
  `mobile` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `introduce` varchar(255) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `editdate` date NOT NULL default '0000-00-00',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`),
  KEY `edittime` (`edittime`),
  KEY `editdate` (`editdate`,`vip`,`edittime`)
) TYPE=MyISAM COMMENT='品牌';

DROP TABLE IF EXISTS `destoon_brand_data`;
CREATE TABLE `destoon_brand_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='品牌内容';

DROP TABLE IF EXISTS `destoon_buy`;
CREATE TABLE `destoon_buy` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `typeid` smallint(2) unsigned NOT NULL default '0',
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `amount` varchar(10) NOT NULL default '',
  `price` varchar(10) NOT NULL default '',
  `standard` varchar(20) NOT NULL default '',
  `pack` varchar(20) NOT NULL default '',
  `days` smallint(3) unsigned NOT NULL default '0',
  `tag` varchar(100) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `thumb1` varchar(255) NOT NULL default '',
  `thumb2` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `validated` tinyint(1) unsigned NOT NULL default '0',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `mobile` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `totime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `editdate` date NOT NULL default '0000-00-00',
  `addtime` int(10) unsigned NOT NULL default '0',
  `adddate` date NOT NULL default '0000-00-00',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `editdate` (`editdate`,`vip`,`edittime`),
  KEY `edittime` (`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) TYPE=MyISAM COMMENT='求购';

DROP TABLE IF EXISTS `destoon_buy_data`;
CREATE TABLE `destoon_buy_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='求购内容';

DROP TABLE IF EXISTS `destoon_cache`;
CREATE TABLE `destoon_cache` (
  `cacheid` varchar(32) NOT NULL default '',
  `totime` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `cacheid` (`cacheid`)
) TYPE=HEAP COMMENT='文件缓存';

DROP TABLE IF EXISTS `destoon_category`;
CREATE TABLE `destoon_category` (
  `catid` int(10) unsigned NOT NULL auto_increment,
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `catname` varchar(50) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `catdir` varchar(255) NOT NULL default '',
  `linkurl` varchar(255) NOT NULL default '',
  `letter` varchar(4) NOT NULL default '',
  `level` tinyint(1) unsigned NOT NULL default '1',
  `item` bigint(20) unsigned NOT NULL default '0',
  `property` smallint(6) unsigned NOT NULL default '0',
  `parentid` int(10) unsigned NOT NULL default '0',
  `arrparentid` varchar(255) NOT NULL default '',
  `child` tinyint(1) NOT NULL default '0',
  `arrchildid` text NOT NULL,
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `template` varchar(30) NOT NULL default '',
  `show_template` varchar(30) NOT NULL default '',
  `seo_title` varchar(255) NOT NULL default '',
  `seo_keywords` varchar(255) NOT NULL default '',
  `seo_description` varchar(255) NOT NULL default '',
  `group_list` varchar(255) NOT NULL default '',
  `group_show` varchar(255) NOT NULL default '',
  `group_add` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`catid`)
) TYPE=MyISAM COMMENT='栏目分类';

INSERT INTO `destoon_category` VALUES 
(1, 5, '供应默认分类', '', '1', 'list.php?catid=1', '', 1, 0, 0, 0, '0', 0, '', 1, '', '', '', '', '', '', '', '');
INSERT INTO `destoon_category` VALUES 
(2, 6, '求购默认分类', '', '1', 'list.php?catid=2', '', 1, 0, 0, 0, '0', 0, '', 1, '', '', '', '', '', '', '', '');
INSERT INTO `destoon_category` VALUES 
(3, 4, '公司默认分类', '', '1', 'list.php?catid=3', '', 1, 0, 0, 0, '0', 0, '', 1, '', '', '', '', '', '', '', '');

DROP TABLE IF EXISTS `destoon_category_option`;
CREATE TABLE `destoon_category_option` (
  `oid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `required` tinyint(1) unsigned NOT NULL default '0',
  `search` tinyint(1) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `value` text NOT NULL,
  `extend` text NOT NULL,
  `listorder` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`oid`),
  KEY `catid` (`catid`)
) TYPE=MyISAM COMMENT='分类属性';

DROP TABLE IF EXISTS `destoon_category_value`;
CREATE TABLE `destoon_category_value` (
  `oid` bigint(20) unsigned NOT NULL default '0',
  `moduleid` smallint(6) NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  KEY `moduleid` (`moduleid`,`itemid`)
) TYPE=MyISAM COMMENT='分类属性值';

DROP TABLE IF EXISTS `destoon_chat`;
CREATE TABLE `destoon_chat` (
  `chatid` char(32) NOT NULL default '',
  `browerid` char(6) NOT NULL default '',
  `fromuser` char(50) NOT NULL default '',
  `touser` char(50) NOT NULL default '',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `unload` tinyint(1) unsigned NOT NULL default '0',
  `unloader` char(50) NOT NULL default '',
  `unloadtime` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `forward` char(255) NOT NULL default '',
  UNIQUE KEY `chatid` (`chatid`)
) TYPE=HEAP COMMENT='在线聊天';


DROP TABLE IF EXISTS `destoon_city`;
CREATE TABLE `destoon_city` (
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `iparea` text NOT NULL,
  `domain` varchar(255) NOT NULL default '',
  `letter` varchar(4) NOT NULL default '',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `template` varchar(50) NOT NULL default '',
  `seo_title` varchar(255) NOT NULL default '',
  `seo_keywords` varchar(255) NOT NULL default '',
  `seo_description` varchar(255) NOT NULL default '',
  UNIQUE KEY `areaid` (`areaid`),
  KEY `domain` (`domain`)
) TYPE=MyISAM COMMENT='城市分站';

DROP TABLE IF EXISTS `destoon_comment`;
CREATE TABLE `destoon_comment` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `item_mid` smallint(6) NOT NULL default '0',
  `item_id` bigint(20) unsigned NOT NULL default '0',
  `item_title` varchar(255) NOT NULL default '',
  `item_linkurl` varchar(255) NOT NULL default '',
  `item_username` varchar(30) NOT NULL default '',
  `star` tinyint(1) NOT NULL default '0',
  `content` text NOT NULL,
  `qid` bigint(20) unsigned NOT NULL default '0',
  `quotation` text NOT NULL,
  `username` varchar(30) NOT NULL default '',
  `hidden` tinyint(1) NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `reply` text NOT NULL,
  `editor` varchar(30) NOT NULL default '',
  `replyer` varchar(30) NOT NULL default '',
  `replytime` int(10) unsigned NOT NULL default '0',
  `agree` int(10) unsigned NOT NULL default '0',
  `against` int(10) unsigned NOT NULL default '0',
  `quote` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `item_mid` (`item_mid`),
  KEY `item_id` (`item_id`)
) TYPE=MyISAM COMMENT='评论';

DROP TABLE IF EXISTS `destoon_comment_ban`;
CREATE TABLE `destoon_comment_ban` (
  `bid` bigint(20) unsigned NOT NULL auto_increment,
  `moduleid` smallint(6) NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`bid`)
) TYPE=MyISAM COMMENT='评论禁止';


DROP TABLE IF EXISTS `destoon_comment_stat`;
CREATE TABLE `destoon_comment_stat` (
  `sid` bigint(20) unsigned NOT NULL auto_increment,
  `moduleid` smallint(6) NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `comment` int(10) unsigned NOT NULL default '0',
  `star1` int(10) unsigned NOT NULL default '0',
  `star2` int(10) unsigned NOT NULL default '0',
  `star3` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`sid`)
) TYPE=MyISAM COMMENT='评论统计';

DROP TABLE IF EXISTS `destoon_company`;
CREATE TABLE `destoon_company` (
  `userid` bigint(20) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `validated` tinyint(1) unsigned NOT NULL default '0',
  `validator` varchar(100) NOT NULL default '',
  `validtime` int(10) unsigned NOT NULL default '0',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `vipt` smallint(2) unsigned NOT NULL default '0',
  `vipr` smallint(2) NOT NULL default '0',
  `type` varchar(100) NOT NULL default '',
  `catid` varchar(100) NOT NULL default '',
  `catids` varchar(100) NOT NULL default '',
  `areaid` int(10) unsigned NOT NULL default '0',
  `mode` varchar(100) NOT NULL default '',
  `capital` float unsigned NOT NULL default '0',
  `regunit` varchar(15) NOT NULL default '',
  `size` varchar(100) NOT NULL default '',
  `regyear` varchar(4) NOT NULL default '',
  `regcity` varchar(30) NOT NULL default '',
  `sell` varchar(255) NOT NULL default '',
  `buy` varchar(255) NOT NULL default '',
  `business` varchar(255) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `fax` varchar(50) NOT NULL default '',
  `mail` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `postcode` varchar(20) NOT NULL default '',
  `homepage` varchar(255) NOT NULL default '',
  `fromtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `styletime` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `introduce` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `keyword` varchar(255) NOT NULL default '',
  `template` varchar(30) NOT NULL default '',
  `skin` varchar(30) NOT NULL default '',
  `domain` varchar(100) NOT NULL default '',
  `icp` varchar(100) NOT NULL default '',
  `linkurl` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`userid`),
  KEY `domain` (`domain`),
  KEY `vip` (`vip`),
  KEY `areaid` (`areaid`),
  KEY `groupid` (`groupid`)
) TYPE=MyISAM COMMENT='公司';

INSERT INTO `destoon_company` VALUES('1','destoon','1','Destoon B2B网站管理系统','0','0','','0','0','0','0','企业单位','','','0','','0','人民币','','','','','','','','','','','','','0','0','0','','','0','','','','','','http://www.destoon.com/');

DROP TABLE IF EXISTS `destoon_company_catid`;
CREATE TABLE `destoon_company_catid` (
  `userid` bigint(20) unsigned NOT NULL default '0',
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `vip` smallint(2) unsigned NOT NULL default '0',
  KEY `userid` (`userid`),
  KEY `catid` (`catid`)
) TYPE=MyISAM COMMENT='公司分类';

DROP TABLE IF EXISTS `destoon_company_data`;
CREATE TABLE `destoon_company_data` (
  `userid` bigint(20) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  PRIMARY KEY  (`userid`)
) TYPE=MyISAM COMMENT='公司内容';

INSERT INTO `destoon_company_data` VALUES('1','');

DROP TABLE IF EXISTS `destoon_company_setting`;
CREATE TABLE `destoon_company_setting` (
  `userid` bigint(20) unsigned NOT NULL default '0',
  `item_key` varchar(100) NOT NULL default '',
  `item_value` text NOT NULL,
  KEY `userid` (`userid`)
) TYPE=MyISAM COMMENT='公司设置';

DROP TABLE IF EXISTS `destoon_down`;
CREATE TABLE `destoon_down` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `tag` varchar(255) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `download` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `fileurl` varchar(255) NOT NULL default '',
  `fileext` varchar(10) NOT NULL default '',
  `filesize` float NOT NULL default '0',
  `unit` varchar(10) NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`)
) TYPE=MyISAM COMMENT='下载';

DROP TABLE IF EXISTS `destoon_down_data`;
CREATE TABLE `destoon_down_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='下载内容';

DROP TABLE IF EXISTS `destoon_exhibit`;
CREATE TABLE `destoon_exhibit` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `fromtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `city` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `postcode` varchar(20) NOT NULL default '',
  `homepage` varchar(255) NOT NULL default '',
  `hallname` varchar(100) NOT NULL default '',
  `sponsor` varchar(100) NOT NULL default '',
  `undertaker` varchar(100) NOT NULL default '',
  `truename` varchar(30) NOT NULL default '',
  `addr` varchar(255) NOT NULL default '',
  `telephone` varchar(100) NOT NULL default '',
  `mobile` varchar(20) NOT NULL default '',
  `fax` varchar(20) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `remark` text NOT NULL,
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='展会';

DROP TABLE IF EXISTS `destoon_exhibit_data`;
CREATE TABLE `destoon_exhibit_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='展会内容';

DROP TABLE IF EXISTS `destoon_favorite`;
CREATE TABLE `destoon_favorite` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `userid` bigint(20) unsigned NOT NULL default '0',
  `typeid` bigint(20) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `userid` (`userid`)
) TYPE=MyISAM COMMENT='商机收藏';

DROP TABLE IF EXISTS `destoon_fetch`;
CREATE TABLE `destoon_fetch` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `sitename` varchar(100) NOT NULL default '',
  `domain` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `encode` varchar(30) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='单页采集';

DROP TABLE IF EXISTS `destoon_fields`;
CREATE TABLE `destoon_fields` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `tb` varchar(30) NOT NULL default '',
  `name` varchar(50) NOT NULL default '',
  `title` varchar(100) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  `type` varchar(20) NOT NULL default '',
  `length` smallint(4) unsigned NOT NULL default '0',
  `html` varchar(30) NOT NULL default '',
  `default_value` text NOT NULL,
  `option_value` text NOT NULL,
  `width` smallint(4) unsigned NOT NULL default '0',
  `height` smallint(4) unsigned NOT NULL default '0',
  `input_limit` varchar(255) NOT NULL default '',
  `addition` varchar(255) NOT NULL default '',
  `display` tinyint(1) unsigned NOT NULL default '0',
  `front` tinyint(1) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `tablename` (`tb`)
) TYPE=MyISAM COMMENT='自定义字段';

DROP TABLE IF EXISTS `destoon_finance_card`;
CREATE TABLE `destoon_finance_card` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `number` varchar(30) NOT NULL default '',
  `password` varchar(30) NOT NULL default '',
  `amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `editor` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  UNIQUE KEY `number` (`number`)
) TYPE=MyISAM COMMENT='充值卡';

DROP TABLE IF EXISTS `destoon_finance_cash`;
CREATE TABLE `destoon_finance_cash` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `bank` varchar(50) NOT NULL default '',
  `account` varchar(30) NOT NULL default '',
  `truename` varchar(30) NOT NULL default '',
  `amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `fee` decimal(10,2) unsigned NOT NULL default '0.00',
  `addtime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `note` varchar(255) NOT NULL default '',
  `status` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='申请提现';

DROP TABLE IF EXISTS `destoon_finance_charge`;
CREATE TABLE `destoon_finance_charge` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `bank` varchar(20) NOT NULL default '',
  `amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `fee` decimal(10,2) unsigned NOT NULL default '0.00',
  `money` decimal(10,2) unsigned NOT NULL default '0.00',
  `sendtime` int(10) unsigned NOT NULL default '0',
  `receivetime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='在线充值';

DROP TABLE IF EXISTS `destoon_finance_credit`;
CREATE TABLE `destoon_finance_credit` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `amount` int(10) NOT NULL default '0',
  `balance` int(10) NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `reason` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='积分流水';

DROP TABLE IF EXISTS `destoon_finance_pay`;
CREATE TABLE `destoon_finance_pay` (
  `pid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `fee` float unsigned NOT NULL default '0',
  `currency` varchar(20) NOT NULL default '',
  `paytime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `moduleid` smallint(6) NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='支付记录';

DROP TABLE IF EXISTS `destoon_finance_promo`;
CREATE TABLE `destoon_finance_promo` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `number` varchar(30) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `amount` float NOT NULL default '0',
  `reuse` tinyint(1) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  UNIQUE KEY `number` (`number`)
) TYPE=MyISAM COMMENT='优惠码';

DROP TABLE IF EXISTS `destoon_finance_record`;
CREATE TABLE `destoon_finance_record` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `bank` varchar(30) NOT NULL default '',
  `amount` decimal(10,2) NOT NULL default '0.00',
  `balance` decimal(10,2) NOT NULL default '0.00',
  `addtime` int(10) unsigned NOT NULL default '0',
  `reason` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='财务流水';

DROP TABLE IF EXISTS `destoon_finance_sms`;
CREATE TABLE `destoon_finance_sms` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `amount` int(10) NOT NULL default '0',
  `balance` int(10) NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `reason` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='短信增减';

DROP TABLE IF EXISTS `destoon_friend`;
CREATE TABLE `destoon_friend` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `userid` bigint(20) unsigned NOT NULL default '0',
  `typeid` bigint(20) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `truename` varchar(20) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `company` varchar(100) NOT NULL default '',
  `career` varchar(20) NOT NULL default '',
  `telephone` varchar(20) NOT NULL default '',
  `mobile` varchar(20) NOT NULL default '',
  `homepage` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `userid` (`userid`)
) TYPE=MyISAM COMMENT='我的商友';

DROP TABLE IF EXISTS `destoon_gift`;
CREATE TABLE `destoon_gift` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `typeid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `credit` int(10) unsigned NOT NULL default '0',
  `amount` int(10) unsigned NOT NULL default '0',
  `groupid` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `orders` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `fromtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='积分换礼';

DROP TABLE IF EXISTS `destoon_gift_order`;
CREATE TABLE `destoon_gift_order` (
  `oid` bigint(20) unsigned NOT NULL auto_increment,
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `credit` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `status` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`oid`),
  KEY `itemid` (`itemid`)
) TYPE=MyISAM COMMENT='积分换礼订单';

DROP TABLE IF EXISTS `destoon_group`;
CREATE TABLE `destoon_group` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `price` decimal(10,2) unsigned NOT NULL default '0.00',
  `marketprice` decimal(10,2) unsigned NOT NULL default '0.00',
  `savemoney` decimal(10,2) unsigned NOT NULL default '0.00',
  `discount` float unsigned NOT NULL default '0',
  `minamount` int(10) unsigned NOT NULL default '0',
  `amount` int(10) unsigned NOT NULL default '0',
  `logistic` tinyint(1) unsigned NOT NULL default '0',
  `tag` varchar(100) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `orders` int(10) unsigned NOT NULL default '0',
  `sales` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `validated` tinyint(1) unsigned NOT NULL default '0',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `mobile` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `totime` int(10) unsigned NOT NULL default '0',
  `endtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `process` tinyint(1) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) TYPE=MyISAM COMMENT='团购';

DROP TABLE IF EXISTS `destoon_group_data`;
CREATE TABLE `destoon_group_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='团购内容';

DROP TABLE IF EXISTS `destoon_group_order`;
CREATE TABLE `destoon_group_order` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `gid` bigint(20) unsigned NOT NULL default '0',
  `buyer` varchar(30) NOT NULL default '',
  `seller` varchar(30) NOT NULL default '',
  `title` varchar(100) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `linkurl` varchar(255) NOT NULL default '',
  `price` decimal(10,2) unsigned NOT NULL default '0.00',
  `number` int(10) unsigned NOT NULL default '0',
  `amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `logistic` tinyint(1) unsigned NOT NULL default '0',
  `password` varchar(6) NOT NULL default '',
  `buyer_name` varchar(30) NOT NULL default '',
  `buyer_address` varchar(255) NOT NULL default '',
  `buyer_postcode` varchar(10) NOT NULL default '',
  `buyer_phone` varchar(30) NOT NULL default '',
  `buyer_mobile` varchar(30) NOT NULL default '',
  `buyer_receive` varchar(50) NOT NULL default '',
  `send_type` varchar(50) NOT NULL default '',
  `send_no` varchar(50) NOT NULL default '',
  `send_time` varchar(20) NOT NULL default '',
  `send_days` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  `status` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `buyer` (`buyer`),
  KEY `seller` (`seller`)
) TYPE=MyISAM COMMENT='团购订单';

DROP TABLE IF EXISTS `destoon_guestbook`;
CREATE TABLE `destoon_guestbook` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `areaid` int(10) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `content` text NOT NULL,
  `reply` text NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL default '0',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `qq` varchar(30) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='留言本';

DROP TABLE IF EXISTS `destoon_honor`;
CREATE TABLE `destoon_honor` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `content` text NOT NULL,
  `authority` varchar(100) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `fromtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`)
) TYPE=MyISAM COMMENT='荣誉资质';

DROP TABLE IF EXISTS `destoon_info_22`;
CREATE TABLE `destoon_info_22` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `thumb1` varchar(255) NOT NULL default '',
  `thumb2` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `adddate` date NOT NULL default '0000-00-00',
  `totime` int(10) unsigned NOT NULL default '0',
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `validated` tinyint(1) unsigned NOT NULL default '0',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `fax` varchar(50) NOT NULL default '',
  `mobile` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `introduce` varchar(255) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `editdate` date NOT NULL default '0000-00-00',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `edittime` (`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`),
  KEY `editdate` (`editdate`,`vip`,`edittime`)
) TYPE=MyISAM COMMENT='招商';

DROP TABLE IF EXISTS `destoon_info_data_22`;
CREATE TABLE `destoon_info_data_22` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='招商内容';

DROP TABLE IF EXISTS `destoon_job`;
CREATE TABLE `destoon_job` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `department` varchar(100) NOT NULL default '',
  `total` smallint(4) unsigned NOT NULL default '0',
  `minsalary` int(10) unsigned NOT NULL default '0',
  `maxsalary` int(10) unsigned NOT NULL default '0',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `gender` tinyint(1) unsigned NOT NULL default '0',
  `marriage` tinyint(1) unsigned NOT NULL default '0',
  `education` smallint(2) unsigned NOT NULL default '0',
  `experience` smallint(2) unsigned NOT NULL default '0',
  `minage` smallint(2) unsigned NOT NULL default '0',
  `maxage` smallint(2) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `apply` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `validated` tinyint(1) unsigned NOT NULL default '0',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `mobile` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `sex` tinyint(1) unsigned NOT NULL default '1',
  `totime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `editdate` date NOT NULL default '0000-00-00',
  `addtime` int(10) unsigned NOT NULL default '0',
  `adddate` date NOT NULL default '0000-00-00',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `editdate` (`editdate`,`vip`,`edittime`),
  KEY `edittime` (`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) TYPE=MyISAM COMMENT='招聘';

DROP TABLE IF EXISTS `destoon_job_apply`;
CREATE TABLE `destoon_job_apply` (
  `applyid` bigint(20) unsigned NOT NULL auto_increment,
  `jobid` bigint(20) unsigned NOT NULL default '0',
  `resumeid` bigint(20) unsigned NOT NULL default '0',
  `job_username` varchar(30) NOT NULL default '',
  `apply_username` varchar(30) NOT NULL default '',
  `applytime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`applyid`),
  KEY `job_username` (`job_username`),
  KEY `apply_username` (`apply_username`)
) TYPE=MyISAM COMMENT='应聘工作';

DROP TABLE IF EXISTS `destoon_job_data`;
CREATE TABLE `destoon_job_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='招聘内容';

DROP TABLE IF EXISTS `destoon_job_talent`;
CREATE TABLE `destoon_job_talent` (
  `talentid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `resumeid` bigint(20) unsigned NOT NULL default '0',
  `jointime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`talentid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='人才库';

DROP TABLE IF EXISTS `destoon_keylink`;
CREATE TABLE `destoon_keylink` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `item` varchar(20) NOT NULL default '',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='关联链接';

DROP TABLE IF EXISTS `destoon_keyword`;
CREATE TABLE `destoon_keyword` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `moduleid` smallint(6) NOT NULL default '0',
  `word` varchar(255) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `letter` varchar(255) NOT NULL default '',
  `items` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `total_search` int(10) unsigned NOT NULL default '0',
  `month_search` int(10) unsigned NOT NULL default '0',
  `week_search` int(10) unsigned NOT NULL default '0',
  `today_search` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '3',
  PRIMARY KEY  (`itemid`),
  KEY `moduleid` (`moduleid`),
  KEY `word` (`word`),
  KEY `letter` (`letter`),
  KEY `keyword` (`keyword`)
) TYPE=MyISAM COMMENT='关键词';

DROP TABLE IF EXISTS `destoon_know`;
CREATE TABLE `destoon_know` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `credit` int(10) unsigned NOT NULL default '0',
  `aid` bigint(20) unsigned NOT NULL default '0',
  `hidden` tinyint(1) unsigned NOT NULL default '0',
  `process` tinyint(1) unsigned NOT NULL default '0',
  `message` tinyint(1) unsigned NOT NULL default '0',
  `addition` text NOT NULL,
  `comment` text NOT NULL,
  `introduce` varchar(255) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `raise` int(10) unsigned NOT NULL default '0',
  `agree` int(10) unsigned NOT NULL default '0',
  `against` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `answer` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='知道';

DROP TABLE IF EXISTS `destoon_know_answer`;
CREATE TABLE `destoon_know_answer` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `qid` bigint(20) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `vote` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `hidden` tinyint(1) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `qid` (`qid`)
) TYPE=MyISAM COMMENT='知道回答';

DROP TABLE IF EXISTS `destoon_know_data`;
CREATE TABLE `destoon_know_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` longtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='知道内容';

DROP TABLE IF EXISTS `destoon_know_vote`;
CREATE TABLE `destoon_know_vote` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `qid` bigint(20) unsigned NOT NULL default '0',
  `aid` bigint(20) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='知道投票';

DROP TABLE IF EXISTS `destoon_link`;
CREATE TABLE `destoon_link` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `typeid` bigint(20) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `introduce` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `listorder` smallint(4) NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `listorder` (`listorder`)
) TYPE=MyISAM COMMENT='友情链接';

INSERT INTO `destoon_link` VALUES 
(1, 0, 0, 'Destoon B2B', '', 'http://static.destoon.com/logo.gif', 'Destoon B2B网站管理系统', '', 1320045233, 'destoon', 1320045287, 0, 1, 3, 'http://www.destoon.com/');


DROP TABLE IF EXISTS `destoon_login`;
CREATE TABLE `destoon_login` (
  `logid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `admin` tinyint(1) unsigned NOT NULL default '0',
  `loginip` varchar(50) NOT NULL default '',
  `logintime` int(10) unsigned NOT NULL default '0',
  `message` varchar(255) NOT NULL default '',
  `agent` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`logid`)
) TYPE=MyISAM COMMENT='登录日志';


DROP TABLE IF EXISTS `destoon_mail`;
CREATE TABLE `destoon_mail` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `typeid` bigint(20) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `sendtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='邮件订阅';

DROP TABLE IF EXISTS `destoon_mail_list`;
CREATE TABLE `destoon_mail_list` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `typeids` varchar(255) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `edittime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  UNIQUE KEY `username` (`username`)
) TYPE=MyISAM COMMENT='订阅列表';

DROP TABLE IF EXISTS `destoon_mail_log`;
CREATE TABLE `destoon_mail_log` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `email` varchar(50) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='邮件记录';

DROP TABLE IF EXISTS `destoon_mall`;
CREATE TABLE `destoon_mall` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `mycatid` bigint(20) unsigned NOT NULL default '0',
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `elite` tinyint(1) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `brand` varchar(100) NOT NULL default '',
  `price` decimal(10,2) unsigned NOT NULL default '0.00',
  `amount` int(10) unsigned NOT NULL default '0',
  `tag` varchar(100) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `orders` int(10) unsigned NOT NULL default '0',
  `sales` int(10) unsigned NOT NULL default '0',
  `comments` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `thumb1` varchar(255) NOT NULL default '',
  `thumb2` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `validated` tinyint(1) unsigned NOT NULL default '0',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `mobile` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `editdate` date NOT NULL default '0000-00-00',
  `addtime` int(10) unsigned NOT NULL default '0',
  `adddate` date NOT NULL default '0000-00-00',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `editdate` (`editdate`,`vip`,`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) TYPE=MyISAM COMMENT='商城';

DROP TABLE IF EXISTS `destoon_mall_comment`;
CREATE TABLE `destoon_mall_comment` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `mallid` bigint(20) unsigned NOT NULL default '0',
  `buyer` varchar(30) NOT NULL default '',
  `seller` varchar(30) NOT NULL default '',
  `buyer_star` tinyint(1) unsigned NOT NULL default '0',
  `buyer_comment` text NOT NULL,
  `buyer_ctime` int(10) unsigned NOT NULL default '0',
  `buyer_reply` text NOT NULL,
  `buyer_rtime` int(10) unsigned NOT NULL default '0',
  `seller_star` tinyint(1) unsigned NOT NULL default '0',
  `seller_comment` text NOT NULL,
  `seller_ctime` int(10) unsigned NOT NULL default '0',
  `seller_reply` text NOT NULL,
  `seller_rtime` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `itemid` (`itemid`),
  KEY `buyer` (`buyer`),
  KEY `seller` (`seller`)
) TYPE=MyISAM COMMENT='订单评论';

DROP TABLE IF EXISTS `destoon_mall_data`;
CREATE TABLE `destoon_mall_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='商城内容';

DROP TABLE IF EXISTS `destoon_mall_order`;
CREATE TABLE `destoon_mall_order` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `mallid` bigint(20) unsigned NOT NULL default '0',
  `buyer` varchar(30) NOT NULL default '',
  `seller` varchar(30) NOT NULL default '',
  `title` varchar(100) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `linkurl` varchar(255) NOT NULL default '',
  `price` decimal(10,2) unsigned NOT NULL default '0.00',
  `number` int(10) unsigned NOT NULL default '0',
  `amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `fee` decimal(10,2) NOT NULL default '0.00',
  `fee_name` varchar(30) NOT NULL default '',
  `buyer_name` varchar(30) NOT NULL default '',
  `buyer_address` varchar(255) NOT NULL default '',
  `buyer_postcode` varchar(10) NOT NULL default '',
  `buyer_phone` varchar(30) NOT NULL default '',
  `buyer_mobile` varchar(30) NOT NULL default '',
  `buyer_receive` varchar(50) NOT NULL default '',
  `buyer_star` tinyint(1) unsigned NOT NULL default '0',
  `seller_star` tinyint(1) unsigned NOT NULL default '0',
  `send_type` varchar(50) NOT NULL default '',
  `send_no` varchar(50) NOT NULL default '',
  `send_time` varchar(20) NOT NULL default '',
  `send_days` int(10) unsigned NOT NULL default '0',
  `trade_no` varchar(50) NOT NULL default '',
  `add_time` smallint(6) NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `buyer_reason` text NOT NULL,
  `refund_reason` text NOT NULL,
  `note` varchar(255) NOT NULL default '',
  `status` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `buyer` (`buyer`),
  KEY `seller` (`seller`)
) TYPE=MyISAM COMMENT='商城订单';

DROP TABLE IF EXISTS `destoon_mall_stat`;
CREATE TABLE `destoon_mall_stat` (
  `mallid` bigint(20) unsigned NOT NULL default '0',
  `seller` varchar(30) NOT NULL default '',
  `scomment` int(10) unsigned NOT NULL default '0',
  `s1` int(10) unsigned NOT NULL default '0',
  `s2` int(10) unsigned NOT NULL default '0',
  `s3` int(10) unsigned NOT NULL default '0',
  `buyer` varchar(30) NOT NULL default '',
  `bcomment` int(10) unsigned NOT NULL default '0',
  `b1` int(10) unsigned NOT NULL default '0',
  `b2` int(10) unsigned NOT NULL default '0',
  `b3` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `mallid` (`mallid`)
) TYPE=MyISAM COMMENT='评分统计';

DROP TABLE IF EXISTS `destoon_member`;
CREATE TABLE `destoon_member` (
  `userid` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `passport` varchar(30) NOT NULL default '',
  `company` varchar(100) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `payword` varchar(32) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `message` smallint(6) unsigned NOT NULL default '0',
  `chat` smallint(6) unsigned NOT NULL default '0',
  `sound` tinyint(1) unsigned NOT NULL default '1',
  `online` tinyint(1) unsigned NOT NULL default '1',
  `gender` tinyint(1) unsigned NOT NULL default '1',
  `truename` varchar(20) NOT NULL default '',
  `mobile` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `department` varchar(30) NOT NULL default '',
  `career` varchar(30) NOT NULL default '',
  `admin` tinyint(1) unsigned NOT NULL default '0',
  `role` varchar(255) NOT NULL default '',
  `aid` int(10) unsigned NOT NULL default '0',
  `groupid` smallint(4) unsigned NOT NULL default '4',
  `regid` smallint(4) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `sms` int(10) NOT NULL default '0',
  `credit` int(10) NOT NULL default '0',
  `money` decimal(10,2) NOT NULL default '0.00',
  `locking` decimal(10,2) unsigned NOT NULL default '0.00',
  `bank` varchar(30) NOT NULL default '',
  `account` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `regip` varchar(50) NOT NULL default '',
  `regtime` int(10) unsigned NOT NULL default '0',
  `loginip` varchar(50) NOT NULL default '',
  `logintime` int(10) unsigned NOT NULL default '0',
  `logintimes` int(10) unsigned NOT NULL default '1',
  `black` varchar(255) NOT NULL default '',
  `send` tinyint(1) unsigned NOT NULL default '1',
  `auth` varchar(32) NOT NULL default '',
  `authvalue` varchar(100) NOT NULL default '',
  `authtime` int(10) unsigned NOT NULL default '0',
  `vemail` tinyint(1) unsigned NOT NULL default '0',
  `vmobile` tinyint(1) unsigned NOT NULL default '0',
  `vtruename` tinyint(1) unsigned NOT NULL default '0',
  `vbank` tinyint(1) unsigned NOT NULL default '0',
  `vcompany` tinyint(1) unsigned NOT NULL default '0',
  `vtrade` tinyint(1) unsigned NOT NULL default '0',
  `trade` varchar(50) NOT NULL default '',
  `support` varchar(50) NOT NULL default '',
  `inviter` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `passport` (`passport`),
  KEY `groupid` (`groupid`)
) TYPE=MyISAM COMMENT='会员';

INSERT INTO `destoon_member` VALUES('1','destoon','destoon','Destoon B2B网站管理系统','14e1b600b1fd579f47433b88e8d85291','14e1b600b1fd579f47433b88e8d85291','admin@admin.com','0','0','1','1','1','嘉客','','','','','','','','1','创始人','0','1','6','0','0','0','0.00','0.00','','','0','','0','','0','0','','1','','','0','0','0','0','0','0','0','','','');

DROP TABLE IF EXISTS `destoon_member_group`;
CREATE TABLE `destoon_member_group` (
  `groupid` smallint(4) unsigned NOT NULL auto_increment,
  `groupname` varchar(50) NOT NULL default '',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`groupid`)
) TYPE=MyISAM COMMENT='会员组';

INSERT INTO `destoon_member_group` VALUES('1','管理员','0','1');
INSERT INTO `destoon_member_group` VALUES('2','禁止访问','0','2');
INSERT INTO `destoon_member_group` VALUES('3','游客','0','3');
INSERT INTO `destoon_member_group` VALUES('4','待审核会员','0','4');
INSERT INTO `destoon_member_group` VALUES('5','个人会员','0','5');
INSERT INTO `destoon_member_group` VALUES('6','企业会员','0','6');
INSERT INTO `destoon_member_group` VALUES('7','VIP会员','1','7');

DROP TABLE IF EXISTS `destoon_message`;
CREATE TABLE `destoon_message` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `typeid` tinyint(1) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  `fromuser` varchar(30) NOT NULL default '',
  `touser` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `isread` tinyint(1) unsigned NOT NULL default '0',
  `issend` tinyint(1) unsigned NOT NULL default '0',
  `feedback` tinyint(1) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `groupids` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `touser` (`touser`)
) TYPE=MyISAM COMMENT='站内信件';

DROP TABLE IF EXISTS `destoon_module`;
CREATE TABLE `destoon_module` (
  `moduleid` smallint(6) unsigned NOT NULL auto_increment,
  `module` varchar(20) NOT NULL default '',
  `name` varchar(20) NOT NULL default '',
  `moduledir` varchar(20) NOT NULL default '',
  `domain` varchar(255) NOT NULL default '',
  `linkurl` varchar(255) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `ismenu` tinyint(1) unsigned NOT NULL default '0',
  `isblank` tinyint(1) unsigned NOT NULL default '0',
  `logo` tinyint(1) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  `installtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`moduleid`)
) TYPE=MyISAM COMMENT='模型';

INSERT INTO `destoon_module` VALUES('1','destoon','核心','','http://www.destoon.com/','http://www.destoon.com/','','1','0','0','0','0','0','0');
INSERT INTO `destoon_module` VALUES('2','member','会员','member','','http://www.destoon.com/member/','','2','0','0','0','0','0','0');
INSERT INTO `destoon_module` VALUES('3','extend','扩展','extend','','http://www.destoon.com/extend/','','0','0','0','0','0','0','1221828889');
INSERT INTO `destoon_module` VALUES('4','company','公司','company','','http://www.destoon.com/company/','','7','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('5','sell','供应','sell','','http://www.destoon.com/sell/','','5','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('6','buy','求购','buy','','http://www.destoon.com/buy/','','6','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('7','quote','行情','quote','','http://www.destoon.com/quote/','','9','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('8','exhibit','展会','exhibit','','http://www.destoon.com/exhibit/','','10','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('9','job','人才','job','','http://www.destoon.com/job/','','14','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('10','know','知道','know','','http://www.destoon.com/know/','','15','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('11','special','专题','special','','http://www.destoon.com/special/','','16','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('12','photo','图库','photo','','http://www.destoon.com/photo/','','17','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('13','brand','品牌','brand','','http://www.destoon.com/brand/','','13','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('14','video','视频','video','','http://www.destoon.com/video/','','18','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('15','down','下载','down','','http://www.destoon.com/down/','','19','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('16','mall','商城','mall','','http://www.destoon.com/mall/','','4','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('17','group','团购','group','','http://www.destoon.com/group/','','8','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('21','article','资讯','news','','http://www.destoon.com/news/','','11','0','1','0','0','0','1205992896');
INSERT INTO `destoon_module` VALUES('22','info','招商','invest','','http://www.destoon.com/invest/','','12','0','1','0','0','0','1223991464');

DROP TABLE IF EXISTS `destoon_news`;
CREATE TABLE `destoon_news` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `typeid` bigint(20) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`)
) TYPE=MyISAM COMMENT='公司新闻';

DROP TABLE IF EXISTS `destoon_news_data`;
CREATE TABLE `destoon_news_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='公司新闻内容';

DROP TABLE IF EXISTS `destoon_oauth`;
CREATE TABLE `destoon_oauth` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `site` varchar(30) NOT NULL default '',
  `openid` varchar(255) NOT NULL default '',
  `nickname` varchar(255) NOT NULL default '',
  `avatar` varchar(255) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `logintimes` int(10) unsigned NOT NULL default '0',
  `logintime` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `site` (`site`,`openid`)
) TYPE=MyISAM COMMENT='一键登录';

DROP TABLE IF EXISTS `destoon_online`;
CREATE TABLE `destoon_online` (
  `userid` bigint(20) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  `moduleid` int(10) unsigned NOT NULL default '0',
  `online` tinyint(1) unsigned NOT NULL default '1',
  `lasttime` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `userid` (`userid`)
) TYPE=HEAP COMMENT='在线会员';

DROP TABLE IF EXISTS `destoon_page`;
CREATE TABLE `destoon_page` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`)
) TYPE=MyISAM COMMENT='公司单页';

DROP TABLE IF EXISTS `destoon_page_data`;
CREATE TABLE `destoon_page_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='公司单页内容';

DROP TABLE IF EXISTS `destoon_photo`;
CREATE TABLE `destoon_photo` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `items` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `open` tinyint(1) unsigned NOT NULL default '3',
  `password` varchar(30) NOT NULL default '',
  `question` varchar(30) NOT NULL default '',
  `answer` varchar(30) NOT NULL default '',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='图库';

DROP TABLE IF EXISTS `destoon_photo_data`;
CREATE TABLE `destoon_photo_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` longtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='图库内容';

DROP TABLE IF EXISTS `destoon_photo_item`;
CREATE TABLE `destoon_photo_item` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `item` bigint(20) unsigned NOT NULL default '0',
  `introduce` text NOT NULL,
  `thumb` varchar(255) NOT NULL default '',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `listorder` (`listorder`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='图库图片';

DROP TABLE IF EXISTS `destoon_poll`;
CREATE TABLE `destoon_poll` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `typeid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `content` text NOT NULL,
  `seo_title` varchar(255) NOT NULL default '',
  `seo_keywords` varchar(255) NOT NULL default '',
  `seo_description` varchar(255) NOT NULL default '',
  `thumb_width` smallint(6) unsigned NOT NULL default '0',
  `thumb_height` smallint(6) unsigned NOT NULL default '0',
  `poll_max` smallint(6) unsigned NOT NULL default '0',
  `poll_page` smallint(6) unsigned NOT NULL default '0',
  `poll_cols` smallint(6) unsigned NOT NULL default '0',
  `poll_order` smallint(6) unsigned NOT NULL default '0',
  `polls` int(10) unsigned NOT NULL default '0',
  `items` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `fromtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `template_poll` varchar(30) NOT NULL default '',
  `template` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `addtime` (`addtime`)
) TYPE=MyISAM COMMENT='票选';

DROP TABLE IF EXISTS `destoon_poll_item`;
CREATE TABLE `destoon_poll_item` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `pollid` bigint(20) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `introduce` varchar(255) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `linkurl` varchar(255) NOT NULL default '',
  `polls` int(10) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `pollid` (`pollid`)
) TYPE=MyISAM COMMENT='票选选项';

DROP TABLE IF EXISTS `destoon_poll_record`;
CREATE TABLE `destoon_poll_record` (
  `rid` bigint(20) unsigned NOT NULL auto_increment,
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `pollid` bigint(20) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  `polltime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rid`)
) TYPE=MyISAM COMMENT='票选记录';

DROP TABLE IF EXISTS `destoon_question`;
CREATE TABLE `destoon_question` (
  `qid` int(10) unsigned NOT NULL auto_increment,
  `question` varchar(255) NOT NULL default '',
  `answer` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`qid`)
) TYPE=MyISAM COMMENT='验证问题';

INSERT INTO `destoon_question` VALUES (1, '5+6=?', '11');
INSERT INTO `destoon_question` VALUES (2, '7+8=?', '15');
INSERT INTO `destoon_question` VALUES (3, '11*11=?', '121');
INSERT INTO `destoon_question` VALUES (4, '12-5=?', '7');
INSERT INTO `destoon_question` VALUES (5, '21-9=?', '12');

DROP TABLE IF EXISTS `destoon_quote`;
CREATE TABLE `destoon_quote` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `pid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `tag` varchar(100) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `adddate` date NOT NULL default '0000-00-00',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`),
  KEY `pid` (`pid`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='行情';

DROP TABLE IF EXISTS `destoon_quote_data`;
CREATE TABLE `destoon_quote_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` longtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='行情内容';

DROP TABLE IF EXISTS `destoon_quote_product`;
CREATE TABLE `destoon_quote_product` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `catid` smallint(6) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pid`)
) TYPE=MyISAM COMMENT='行情产品';

DROP TABLE IF EXISTS `destoon_resume`;
CREATE TABLE `destoon_resume` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `truename` varchar(30) NOT NULL default '',
  `gender` tinyint(1) unsigned NOT NULL default '0',
  `birthday` date NOT NULL default '0000-00-00',
  `age` smallint(2) unsigned NOT NULL default '0',
  `marriage` tinyint(1) unsigned NOT NULL default '0',
  `height` smallint(2) unsigned NOT NULL default '0',
  `weight` smallint(2) unsigned NOT NULL default '0',
  `education` smallint(2) unsigned NOT NULL default '0',
  `school` varchar(100) NOT NULL default '',
  `major` varchar(100) NOT NULL default '',
  `skill` varchar(255) NOT NULL default '',
  `language` varchar(255) NOT NULL default '',
  `minsalary` int(10) unsigned NOT NULL default '0',
  `maxsalary` int(10) unsigned NOT NULL default '0',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `experience` smallint(2) unsigned NOT NULL default '0',
  `mobile` varchar(50) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `situation` tinyint(1) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `open` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `edittime` (`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) TYPE=MyISAM COMMENT='简历';

DROP TABLE IF EXISTS `destoon_resume_data`;
CREATE TABLE `destoon_resume_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='简历内容';

DROP TABLE IF EXISTS `destoon_sell`;
CREATE TABLE `destoon_sell` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `mycatid` bigint(20) unsigned NOT NULL default '0',
  `typeid` smallint(2) unsigned NOT NULL default '0',
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `elite` tinyint(1) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `model` varchar(100) NOT NULL default '',
  `standard` varchar(100) NOT NULL default '',
  `brand` varchar(100) NOT NULL default '',
  `unit` varchar(10) NOT NULL default '',
  `price` decimal(10,2) unsigned NOT NULL default '0.00',
  `minamount` float unsigned NOT NULL default '0',
  `amount` float unsigned NOT NULL default '0',
  `days` smallint(3) unsigned NOT NULL default '0',
  `tag` varchar(100) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `thumb1` varchar(255) NOT NULL default '',
  `thumb2` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `validated` tinyint(1) unsigned NOT NULL default '0',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `mobile` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `totime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `editdate` date NOT NULL default '0000-00-00',
  `addtime` int(10) unsigned NOT NULL default '0',
  `adddate` date NOT NULL default '0000-00-00',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `editdate` (`editdate`,`vip`,`edittime`),
  KEY `edittime` (`edittime`),
  KEY `catid` (`catid`),
  KEY `mycatid` (`mycatid`),
  KEY `areaid` (`areaid`)
) TYPE=MyISAM COMMENT='供应';

DROP TABLE IF EXISTS `destoon_sell_data`;
CREATE TABLE `destoon_sell_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='供应内容';

DROP TABLE IF EXISTS `destoon_sell_search`;
CREATE TABLE `destoon_sell_search` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` smallint(6) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `sorttime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `catid` (`catid`)
) TYPE=MyISAM COMMENT='供应搜索';

DROP TABLE IF EXISTS `destoon_session`;
CREATE TABLE `destoon_session` (
  `sessionid` varchar(32) NOT NULL default '',
  `data` text NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `sessionid` (`sessionid`)
) TYPE=MyISAM COMMENT='SESSION';


DROP TABLE IF EXISTS `destoon_setting`;
CREATE TABLE `destoon_setting` (
  `item` varchar(30) NOT NULL default '',
  `item_key` varchar(100) NOT NULL default '',
  `item_value` text NOT NULL,
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='网站设置';

DROP TABLE IF EXISTS `destoon_sms`;
CREATE TABLE `destoon_sms` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `mobile` varchar(30) NOT NULL default '',
  `message` text NOT NULL,
  `word` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `sendtime` int(10) unsigned NOT NULL default '0',
  `code` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='短信记录';

DROP TABLE IF EXISTS `destoon_special`;
CREATE TABLE `destoon_special` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `introduce` varchar(255) NOT NULL default '',
  `tag` varchar(100) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `items` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `banner` varchar(255) NOT NULL default '',
  `cfg_photo` smallint(4) unsigned NOT NULL default '0',
  `cfg_video` smallint(4) unsigned NOT NULL default '0',
  `cfg_type` smallint(4) unsigned NOT NULL default '0',
  `seo_title` varchar(255) NOT NULL default '',
  `seo_keywords` varchar(255) NOT NULL default '',
  `seo_description` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `domain` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`)
) TYPE=MyISAM COMMENT='专题';

DROP TABLE IF EXISTS `destoon_special_data`;
CREATE TABLE `destoon_special_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` longtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='专题内容';

DROP TABLE IF EXISTS `destoon_special_item`;
CREATE TABLE `destoon_special_item` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `specialid` bigint(20) unsigned NOT NULL default '0',
  `typeid` bigint(20) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `introduce` varchar(255) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `linkurl` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `addtime` (`addtime`),
  KEY `specialid` (`specialid`)
) TYPE=MyISAM COMMENT='专题信息';

DROP TABLE IF EXISTS `destoon_sphinx`;
CREATE TABLE `destoon_sphinx` (
  `moduleid` int(10) unsigned NOT NULL default '0',
  `maxid` bigint(20) unsigned NOT NULL default '0',
  UNIQUE KEY `moduleid` (`moduleid`)
) TYPE=MyISAM COMMENT='Sphinx';


DROP TABLE IF EXISTS `destoon_spread`;
CREATE TABLE `destoon_spread` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `mid` smallint(6) unsigned NOT NULL default '0',
  `tid` bigint(20) unsigned NOT NULL default '0',
  `word` varchar(50) NOT NULL default '',
  `price` float NOT NULL default '0',
  `currency` varchar(30) NOT NULL default '',
  `company` varchar(100) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `fromtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='排名推广';

DROP TABLE IF EXISTS `destoon_spread_price`;
CREATE TABLE `destoon_spread_price` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `word` varchar(50) NOT NULL default '',
  `sell_price` float NOT NULL default '0',
  `buy_price` float NOT NULL default '0',
  `company_price` float NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='排名起价';


DROP TABLE IF EXISTS `destoon_style`;
CREATE TABLE `destoon_style` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `typeid` bigint(20) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `skin` varchar(50) NOT NULL default '',
  `template` varchar(50) NOT NULL default '',
  `author` varchar(30) NOT NULL default '',
  `groupid` varchar(30) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `currency` varchar(20) NOT NULL default '',
  `money` float NOT NULL default '0',
  `credit` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='公司主页模板';

INSERT INTO `destoon_style` VALUES('1','0','深蓝模板','blue','homepage','Destoon.COM',',6,7,','0','credit','0','0','0','1221742594','destoon','1256865140','0');
INSERT INTO `destoon_style` VALUES('2','0','绿色模板','green','homepage','Destoon.COM',',6,7,','0','credit','0','0','0','1221742745','destoon','1256865136','0');
INSERT INTO `destoon_style` VALUES('3','0','紫色模板','purple','homepage','Destoon.COM',',6,7,','0','credit','0','0','0','1221742783','destoon','1319971971','0');
INSERT INTO `destoon_style` VALUES('4','0','橙色模板','orange','homepage','Destoon.COM',',6,7,','0','credit','0','0','0','1221742811','destoon','1319971979','0');
INSERT INTO `destoon_style` VALUES('5','0','默认模板','default','homepage','Destoon.COM',',6,7,','0','credit','0','0','0','1284090844','destoon','1303869612','0');

DROP TABLE IF EXISTS `destoon_type`;
CREATE TABLE `destoon_type` (
  `typeid` bigint(20) unsigned NOT NULL auto_increment,
  `listorder` smallint(4) NOT NULL default '0',
  `typename` varchar(255) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `item` varchar(20) NOT NULL default '',
  `cache` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`typeid`),
  KEY `listorder` (`listorder`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='分类';

DROP TABLE IF EXISTS `destoon_upgrade`;
CREATE TABLE `destoon_upgrade` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `userid` bigint(20) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `amount` float NOT NULL default '0',
  `message` tinyint(1) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(30) NOT NULL default '',
  `mobile` varchar(30) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(30) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `promo_code` varchar(30) NOT NULL default '',
  `promo_type` tinyint(1) unsigned NOT NULL default '0',
  `promo_amount` float NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `note` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='会员升级';

DROP TABLE IF EXISTS `destoon_upload_0`;
CREATE TABLE `destoon_upload_0` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录0';

DROP TABLE IF EXISTS `destoon_upload_1`;
CREATE TABLE `destoon_upload_1` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录1';

DROP TABLE IF EXISTS `destoon_upload_2`;
CREATE TABLE `destoon_upload_2` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录2';

DROP TABLE IF EXISTS `destoon_upload_3`;
CREATE TABLE `destoon_upload_3` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录3';

DROP TABLE IF EXISTS `destoon_upload_4`;
CREATE TABLE `destoon_upload_4` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录4';

DROP TABLE IF EXISTS `destoon_upload_5`;
CREATE TABLE `destoon_upload_5` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录5';

DROP TABLE IF EXISTS `destoon_upload_6`;
CREATE TABLE `destoon_upload_6` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录6';

DROP TABLE IF EXISTS `destoon_upload_7`;
CREATE TABLE `destoon_upload_7` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录7';

DROP TABLE IF EXISTS `destoon_upload_8`;
CREATE TABLE `destoon_upload_8` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录8';

DROP TABLE IF EXISTS `destoon_upload_9`;
CREATE TABLE `destoon_upload_9` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(32) NOT NULL default '',
  `moduleid` smallint(6) unsigned NOT NULL default '0',
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `fileurl` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` varchar(10) NOT NULL default '',
  `upfrom` varchar(10) NOT NULL default '',
  `width` int(10) unsigned NOT NULL default '0',
  `height` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `item` (`item`)
) TYPE=MyISAM COMMENT='上传记录9';

DROP TABLE IF EXISTS `destoon_validate`;
CREATE TABLE `destoon_validate` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `type` varchar(30) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `thumb1` varchar(255) NOT NULL default '',
  `thumb2` varchar(255) NOT NULL default '',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `status` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='资料认证';

DROP TABLE IF EXISTS `destoon_video`;
CREATE TABLE `destoon_video` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `tag` varchar(255) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `video` varchar(255) NOT NULL default '',
  `width` smallint(4) unsigned NOT NULL default '0',
  `height` smallint(4) unsigned NOT NULL default '0',
  `player` tinyint(1) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `addtime` (`addtime`),
  KEY `catid` (`catid`)
) TYPE=MyISAM COMMENT='视频';

DROP TABLE IF EXISTS `destoon_video_data`;
CREATE TABLE `destoon_video_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='视频内容';

DROP TABLE IF EXISTS `destoon_vote`;
CREATE TABLE `destoon_vote` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `typeid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `content` text NOT NULL,
  `choose` tinyint(1) unsigned NOT NULL default '0',
  `vote_min` smallint(2) unsigned NOT NULL default '0',
  `vote_max` smallint(2) unsigned NOT NULL default '0',
  `votes` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `fromtime` int(10) unsigned NOT NULL default '0',
  `totime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `linkto` varchar(255) NOT NULL default '',
  `linkurl` varchar(255) NOT NULL default '',
  `template_vote` varchar(30) NOT NULL default '',
  `template` varchar(30) NOT NULL default '',
  `s1` varchar(255) NOT NULL default '',
  `s2` varchar(255) NOT NULL default '',
  `s3` varchar(255) NOT NULL default '',
  `s4` varchar(255) NOT NULL default '',
  `s5` varchar(255) NOT NULL default '',
  `s6` varchar(255) NOT NULL default '',
  `s7` varchar(255) NOT NULL default '',
  `s8` varchar(255) NOT NULL default '',
  `s9` varchar(255) NOT NULL default '',
  `s10` varchar(255) NOT NULL default '',
  `v1` int(10) unsigned NOT NULL default '0',
  `v2` int(10) unsigned NOT NULL default '0',
  `v3` int(10) unsigned NOT NULL default '0',
  `v4` int(10) unsigned NOT NULL default '0',
  `v5` int(10) unsigned NOT NULL default '0',
  `v6` int(10) unsigned NOT NULL default '0',
  `v7` int(10) unsigned NOT NULL default '0',
  `v8` int(10) unsigned NOT NULL default '0',
  `v9` int(10) unsigned NOT NULL default '0',
  `v10` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='投票';

DROP TABLE IF EXISTS `destoon_vote_record`;
CREATE TABLE `destoon_vote_record` (
  `rid` bigint(20) unsigned NOT NULL auto_increment,
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `ip` varchar(50) NOT NULL default '',
  `votetime` int(10) unsigned NOT NULL default '0',
  `votes` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  KEY `itemid` (`itemid`)
) TYPE=MyISAM COMMENT='投票记录';

DROP TABLE IF EXISTS `destoon_webpage`;
CREATE TABLE `destoon_webpage` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(30) NOT NULL default '',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `content` mediumtext NOT NULL,
  `seo_title` varchar(255) NOT NULL default '',
  `seo_keywords` varchar(255) NOT NULL default '',
  `seo_description` varchar(255) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `listorder` smallint(4) NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `domain` varchar(255) NOT NULL default '',
  `template` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='单网页';

INSERT INTO `destoon_webpage` VALUES('1','1','0','0','关于我们','','关于我们','','','','destoon','1319006891','4','0','0','about/index.html','','');
INSERT INTO `destoon_webpage` VALUES('2','1','0','0','联系方式','','联系方式','','','','destoon','1310696453','3','0','0','about/contact.html','','');
INSERT INTO `destoon_webpage` VALUES('3','1','0','0','使用协议','','使用协议','','','','destoon','1310696460','2','0','0','about/agreement.html','','');
INSERT INTO `destoon_webpage` VALUES('4','1','0','0','版权隐私','','版权隐私','','','','destoon','1310696468','1','0','0','about/copyright.html','','');