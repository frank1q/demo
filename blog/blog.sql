-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 06 月 15 日 03:35
-- 服务器版本: 5.5.16
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `blog_admin`
--

CREATE TABLE IF NOT EXISTS `blog_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` tinyint(4) NOT NULL DEFAULT '1',
  `username` char(10) NOT NULL,
  `realname` char(15) NOT NULL,
  `password` char(32) NOT NULL,
  `lastlogin_time` int(10) unsigned NOT NULL,
  `lastlogin_ip` char(15) NOT NULL,
  `iflock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortpower` text NOT NULL,
  `extendpower` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usename` (`username`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员信息表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `blog_admin`
--

INSERT INTO `blog_admin` (`id`, `groupid`, `username`, `realname`, `password`, `lastlogin_time`, `lastlogin_ip`, `iflock`, `sortpower`, `extendpower`) VALUES
(1, 1, 'admin', 'YX', '168a73655bfecefdb15b14984dd2ad60', 1402802262, '127.0.0.1', 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `blog_extend`
--

CREATE TABLE IF NOT EXISTS `blog_extend` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0',
  `tableinfo` varchar(255) DEFAULT NULL,
  `type` int(4) DEFAULT '0',
  `defvalue` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ifsearch` tinyint(1) NOT NULL DEFAULT '0',
  `norder` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `blog_extend`
--

INSERT INTO `blog_extend` (`id`, `pid`, `tableinfo`, `type`, `defvalue`, `name`, `ifsearch`, `norder`) VALUES
(7, 0, 'extend_conment', 1, '', '内容评论', 0, 0),
(8, 7, 'aid', 1, '0', '资讯id', 0, 4),
(9, 7, 'comby', 1, '', '评论者', 0, 2),
(10, 7, 'comcontent', 3, '', '评论内容', 0, 1),
(11, 7, 'type', 1, '0', '类型', 0, 3),
(12, 0, 'extend_guestbook', 1, '', '留言本', 0, 0),
(13, 12, 'tname', 1, '', '姓名', 0, 0),
(14, 12, 'tel', 1, '', '电话', 0, 0),
(15, 12, 'qq', 1, '', 'QQ', 0, 0),
(16, 12, 'content', 3, '', '留言内容', 0, 0),
(17, 12, 'reply', 2, '', '回复内容', 0, 0),
(18, 0, 'extend_placelist', 1, NULL, '地址列表', 0, 0),
(19, 18, 'name', 1, '', '地址名称', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_extend_conment`
--

CREATE TABLE IF NOT EXISTS `blog_extend_conment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `ispass` tinyint(1) NOT NULL,
  `aid` varchar(250) NOT NULL,
  `comby` varchar(250) NOT NULL,
  `comcontent` text NOT NULL,
  `type` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `blog_extend_guestbook`
--

CREATE TABLE IF NOT EXISTS `blog_extend_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `ispass` tinyint(1) NOT NULL,
  `tname` varchar(250) NOT NULL,
  `tel` varchar(250) NOT NULL,
  `qq` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `reply` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `blog_extend_placelist`
--

CREATE TABLE IF NOT EXISTS `blog_extend_placelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `ispass` tinyint(1) NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `blog_extend_placelist`
--

INSERT INTO `blog_extend_placelist` (`id`, `addtime`, `ip`, `ispass`, `name`) VALUES
(1, 1402803293, '127.0.0.1', 1, '中国'),
(2, 1402803299, '127.0.0.1', 1, '美国'),
(3, 1402803306, '127.0.0.1', 1, '英国');

-- --------------------------------------------------------

--
-- 表的结构 `blog_fragment`
--

CREATE TABLE IF NOT EXISTS `blog_fragment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `sign` varchar(255) NOT NULL COMMENT '前台调用标记',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `blog_group`
--

CREATE TABLE IF NOT EXISTS `blog_group` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `power` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `blog_group`
--

INSERT INTO `blog_group` (`id`, `name`, `power`) VALUES
(1, '超级管理员', '-1'),
(2, '网站编辑', '283,1,228,10,11,12,13,14,15,16,157,158,174,268,288,317,22,23,24,25,26,27,150,151,152,153,154,155,156,159,160,269,289,290,291,318,188,189,190,191,192,229,238,239,240,241,243,244,308,309,310,311,312,313');

-- --------------------------------------------------------

--
-- 表的结构 `blog_link`
--

CREATE TABLE IF NOT EXISTS `blog_link` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '类型',
  `norder` int(5) NOT NULL COMMENT '排序',
  `name` varchar(30) NOT NULL COMMENT '站点名',
  `url` varchar(40) NOT NULL COMMENT '站点地址',
  `picture` varchar(30) NOT NULL COMMENT '本地logo',
  `logourl` varchar(50) NOT NULL COMMENT '远程logo',
  `siteowner` varchar(30) NOT NULL COMMENT '站点所有者',
  `info` varchar(300) NOT NULL COMMENT '介绍',
  `ispass` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `blog_members`
--

CREATE TABLE IF NOT EXISTS `blog_members` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `groupid` int(3) NOT NULL,
  `account` varchar(30) NOT NULL,
  `openid` varchar(32) NOT NULL,
  `password` varchar(60) NOT NULL,
  `rmb` int(8) NOT NULL DEFAULT '0',
  `crmb` int(8) NOT NULL DEFAULT '0',
  `nickname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `headpic` varchar(80) NOT NULL,
  `regtime` int(11) NOT NULL,
  `regip` varchar(16) NOT NULL,
  `lasttime` int(11) NOT NULL,
  `lastip` varchar(16) NOT NULL,
  `islock` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `blog_member_group`
--

CREATE TABLE IF NOT EXISTS `blog_member_group` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `notallow` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `blog_member_group`
--

INSERT INTO `blog_member_group` (`id`, `name`, `notallow`) VALUES
(1, '未登录', 'member/infor|member/order|member/news|member/photo'),
(2, '普通会员', '');

-- --------------------------------------------------------

--
-- 表的结构 `blog_method`
--

CREATE TABLE IF NOT EXISTS `blog_method` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rootid` int(10) unsigned NOT NULL,
  `pid` float unsigned NOT NULL,
  `operate` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ifmenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否菜单显示',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=332 ;

--
-- 转存表中的数据 `blog_method`
--

INSERT INTO `blog_method` (`id`, `rootid`, `pid`, `operate`, `name`, `ifmenu`) VALUES
(1, 1, 0, 'admin', '后台登陆管理', 1),
(2, 1, 1, 'index', '管理员管理', 1),
(4, 1, 1, 'admindel', '管理员删除', 0),
(5, 1, 1, 'adminedit', '管理员编辑', 0),
(6, 1, 1, 'adminlock', '管理员锁定', 0),
(7, 1, 1, 'group', '权限管理', 1),
(8, 1, 1, 'groupedit', '管理组编辑', 0),
(9, 1, 1, 'groupdel', '管理组删除', 0),
(10, 10, 0, 'news', '资讯管理', 1),
(11, 10, 10, 'index', '已有资讯', 1),
(12, 10, 10, 'add', '添加资讯', 1),
(13, 10, 10, 'edit', '资讯编辑', 0),
(14, 10, 10, 'del', '资讯删除', 0),
(15, 10, 10, 'lock', '资讯锁定', 0),
(16, 10, 10, 'recmd', '资讯推荐', 0),
(17, 17, 0, 'dbback', '数据库管理', 1),
(18, 17, 17, 'index', '数据库备份', 1),
(19, 17, 17, 'recover', '备份恢复', 0),
(20, 17, 17, 'detail', '备份详细', 0),
(21, 17, 17, 'del', '备份删除', 0),
(22, 22, 0, 'index', '后台面板', 0),
(23, 22, 22, 'index', '后台首页', 0),
(24, 22, 22, 'login', '登陆', 0),
(25, 22, 22, 'logout', '退出登陆', 0),
(26, 22, 22, 'verify', '验证码', 0),
(27, 22, 22, 'welcome', '服务器环境', 0),
(28, 28, 0, 'set', '全局设置', 1),
(29, 28, 28, 'index', '网站设置', 1),
(30, 30, 0, 'sort', '分类管理', 1),
(31, 30, 30, 'index', '栏目列表', 1),
(32, 30, 30, 'edit', '分类编辑', 0),
(33, 30, 30, 'del', '分类删除', 0),
(160, 150, 150, 'delpic', '图集单张图删除', 0),
(277, 0, 0, 'appmanage', '应用管理', 1),
(85, 28, 28, 'menuname', '后台功能', 1),
(159, 150, 150, 'images_upload', '图片批量上传', 0),
(158, 10, 10, 'FileManagerJson', '编辑器上传管理', 0),
(157, 10, 10, 'UploadJson', '编辑器上传', 0),
(150, 150, 0, 'photo', '图集管理', 1),
(151, 150, 150, 'index', '已有图集', 1),
(152, 150, 150, 'add', '添加图集', 1),
(153, 150, 150, 'edit', '图集编辑', 0),
(154, 150, 150, 'del', '图集删除', 0),
(155, 150, 150, 'lock', '图集锁定', 0),
(156, 150, 150, 'recmd', '图集推荐', 0),
(174, 10, 10, 'cutcover', '封面图剪切', 0),
(236, 30, 30, 'PageUploadJson', '单页上传', 0),
(235, 30, 30, 'pageedit', '单页编辑', 0),
(234, 30, 30, 'pageadd', '添加单页栏目', 0),
(233, 30, 30, 'photoedit', '图集栏目编辑', 0),
(232, 30, 30, 'photoadd', '添加图集栏目', 0),
(231, 30, 30, 'newsedit', '文章栏目编辑', 0),
(230, 30, 30, 'newsadd', '添加文章栏目', 0),
(182, 28, 28, 'clear', '网站缓存', 1),
(188, 188, 0, 'link', '友情链接', 1),
(189, 188, 188, 'index', '链接列表', 1),
(190, 188, 188, 'add', '添加链接', 1),
(191, 188, 188, 'edit', '链接编辑', 0),
(192, 188, 188, 'del', '链接删除', 0),
(228, 1, 1, 'adminnow', '账户管理', 1),
(229, 188, 188, 'lock', '锁定', 0),
(237, 30, 30, 'PageFileManagerJson', '单页上传管理', 0),
(238, 238, 0, 'fragment', '碎片管理', 1),
(239, 238, 238, 'index', '碎片列表', 1),
(240, 238, 238, 'add', '碎片添加', 1),
(241, 238, 238, 'edit', '碎片编辑', 0),
(242, 238, 238, 'del', '碎片删除', 0),
(243, 238, 238, 'UploadJson', '编辑器上传', 0),
(244, 238, 238, 'FileManagerJson', '编辑器上传管理', 0),
(245, 28, 28, 'tpchange', '前台模板', 1),
(251, 30, 30, 'pluginadd', '添加应用栏目', 0),
(252, 30, 30, 'pluginedit', '应用栏目编辑', 0),
(258, 258, 0, 'extendfield', '自定义表', 1),
(259, 258, 258, 'index', '自定义表列表', 1),
(260, 258, 258, 'tableadd', '添加自定义表', 1),
(261, 258, 258, 'tableedit', '拓展表编辑', 0),
(262, 258, 258, 'tabledel', '拓展表删除', 0),
(263, 258, 258, 'fieldlist', '字段列表', 0),
(264, 258, 258, 'fieldadd', '添加字段', 0),
(265, 258, 258, 'fieldedit', '编辑字段', 0),
(266, 258, 258, 'fielddel', '字段删除', 0),
(267, 258, 258, 'file', '文件上传', 0),
(268, 10, 10, 'ex_field', '字段拓展', 0),
(269, 150, 150, 'ex_field', '字段拓展', 0),
(270, 30, 30, 'linkadd', '添加自定义栏目', 0),
(271, 30, 30, 'linkedit', '自定义栏目编辑', 0),
(283, 0, 0, 'member', '会员管理(应用)', 1),
(288, 10, 10, 'colchange', '资讯转移栏目', 0),
(289, 150, 150, 'colchange', '图集转移栏目', 0),
(290, 150, 150, 'UploadJson', '图集编辑器上传', 0),
(291, 150, 150, 'FileManagerJson', '图集编辑器上传管理', 0),
(292, 28, 28, 'tplist', '模板文件列表', 0),
(293, 28, 28, 'tpadd', '模板文件添加', 0),
(294, 28, 28, 'tpedit', '模板文件编辑', 0),
(295, 28, 28, 'tpdel', '删除模板文件', 0),
(296, 28, 28, 'tpgetcode', '获取模板内容', 0),
(297, 258, 258, 'meslist', '自定义表信息', 0),
(298, 258, 258, 'mesedit', '自定义表信息添加', 0),
(299, 258, 258, 'mesedit', '自定义表信息编辑', 0),
(300, 258, 258, 'mesdel', '自定义表信息删除', 0),
(331, 258, 258, 'meslock', '自定义表信息审核', 0),
(301, 30, 30, 'add', '添加栏目', 1),
(302, 30, 30, 'extendadd', '添加表单栏目', 0),
(303, 30, 30, 'extendedit', '表单栏目编辑', 0),
(304, 30, 30, 'placelist', '内容定位列表', 1),
(305, 30, 30, 'placeadd', '添加内容定位', 1),
(306, 30, 30, 'placeedit', '定位编辑', 0),
(307, 30, 30, 'placedel', '定位删除', 0),
(308, 308, 0, 'tags', 'TAG标签', 1),
(309, 308, 308, 'index', '标签列表', 1),
(310, 308, 308, 'del', '删除标签', 0),
(311, 308, 308, 'hits', '编辑点击量', 0),
(312, 308, 308, 'add', '生成标签', 1),
(313, 308, 308, 'mesup', '文档数量更新', 0),
(314, 314, 0, 'files', '附件管理', 1),
(315, 314, 314, 'index', '上传文件管理', 1),
(316, 314, 314, 'del', '删除文件', 0),
(317, 10, 10, 'orderchange', '列表ajax排序', 0),
(318, 150, 150, 'orderchange', '列表ajax排序', 0),
(319, 30, 30, 'orderchange', '列表ajax排序', 0),
(320, 17, 17, 'sqlrun', 'SQL执行', 1),
(321, 30, 30, 'cutcover', '栏目封面剪切', 0),
(322, 238, 238, 'saveimage', '图片本地化', 0),
(323, 10, 10, 'saveimage', '图片本地化', 0),
(324, 10, 10, 'delcover', '删除封面图', 0),
(325, 30, 30, 'delcover', '删除封面图', 0),
(326, 30, 30, 'pagesaveimage', '图片本地化', 0),
(328, 30, 30, 'sortsmove', '栏目批量移动', 0),
(329, 30, 30, 'sortsedit', '栏目批量编辑', 0),
(330, 30, 30, 'ifmenu', '栏目设置隐藏', 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_news`
--

CREATE TABLE IF NOT EXISTS `blog_news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `sort` varchar(350) NOT NULL COMMENT '类别',
  `exsort` varchar(350) NOT NULL,
  `account` char(15) NOT NULL COMMENT '发布者账户',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `places` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL COMMENT '标题颜色',
  `picture` varchar(80) NOT NULL,
  `keywords` varchar(300) NOT NULL COMMENT '关键字',
  `description` varchar(600) NOT NULL,
  `content` text NOT NULL COMMENT '内容',
  `method` varchar(100) NOT NULL COMMENT '方法',
  `tpcontent` varchar(100) NOT NULL COMMENT '模板',
  `norder` int(4) NOT NULL COMMENT '排序',
  `recmd` tinyint(1) NOT NULL COMMENT '推荐',
  `hits` int(10) NOT NULL COMMENT '点击量',
  `ispass` tinyint(1) NOT NULL,
  `origin` varchar(30) NOT NULL COMMENT '来源',
  `addtime` int(11) NOT NULL,
  `releids` varchar(255) NOT NULL,
  `extfield` int(10) NOT NULL DEFAULT '0' COMMENT '拓展字段',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `blog_news`
--

INSERT INTO `blog_news` (`id`, `sort`, `exsort`, `account`, `title`, `places`, `color`, `picture`, `keywords`, `description`, `content`, `method`, `tpcontent`, `norder`, `recmd`, `hits`, `ispass`, `origin`, `addtime`, `releids`, `extfield`) VALUES
(4, ',000000,100004', '', 'admin', '博客部头图片', '', '', '20140613/thumb_1402650073.jpg', '图片,博客', '', '', 'default/column/content', 'news_content', 0, 0, 30, 1, '原创', 1402650043, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_orders`
--

CREATE TABLE IF NOT EXISTS `blog_orders` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `ordersubject` varchar(90) NOT NULL COMMENT '订单名称',
  `ordernum` varchar(20) NOT NULL COMMENT ' 订单号',
  `tradenum` varchar(32) NOT NULL COMMENT '支付平台订单号',
  `account` varchar(30) NOT NULL COMMENT '账户',
  `total` float NOT NULL COMMENT '总价',
  `freight` float NOT NULL COMMENT '运费',
  `freighttype` varchar(20) NOT NULL COMMENT '邮寄方式',
  `freightpayment` varchar(10) NOT NULL COMMENT '邮费支付方',
  `freightnum` varchar(32) NOT NULL COMMENT '物流订单号',
  `freightname` varchar(90) NOT NULL COMMENT '物流公司',
  `receivename` varchar(30) NOT NULL COMMENT '收货人',
  `receiveaddress` varchar(255) NOT NULL COMMENT '收货地址',
  `receivezip` varchar(20) NOT NULL COMMENT '邮编',
  `receivephone` varchar(30) NOT NULL COMMENT '电话',
  `receivemobile` varchar(30) NOT NULL COMMENT '手机',
  `ordertime` int(11) NOT NULL COMMENT '订单时间',
  `state` tinyint(1) NOT NULL COMMENT '订单状态',
  `mess` text NOT NULL COMMENT '订单信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `blog_order_detail`
--

CREATE TABLE IF NOT EXISTS `blog_order_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '商品编号',
  `ordernum` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `num` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `blog_page`
--

CREATE TABLE IF NOT EXISTS `blog_page` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sort` varchar(350) NOT NULL,
  `content` text NOT NULL,
  `edittime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `blog_photo`
--

CREATE TABLE IF NOT EXISTS `blog_photo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `sort` varchar(350) NOT NULL COMMENT '类别',
  `exsort` varchar(350) NOT NULL,
  `account` char(15) NOT NULL COMMENT '发布者账户',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `places` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL COMMENT '标题颜色',
  `picture` varchar(80) NOT NULL COMMENT '封面图',
  `keywords` varchar(300) NOT NULL COMMENT '关键字',
  `description` varchar(600) NOT NULL,
  `photolist` text NOT NULL COMMENT '图片集',
  `conlist` text NOT NULL COMMENT '图片说明',
  `content` text NOT NULL COMMENT '内容',
  `method` varchar(100) NOT NULL COMMENT '方法',
  `tpcontent` varchar(100) NOT NULL COMMENT '模板',
  `norder` int(4) NOT NULL COMMENT '排序',
  `recmd` tinyint(1) NOT NULL COMMENT '推荐',
  `hits` int(10) NOT NULL COMMENT '点击量',
  `ispass` tinyint(1) NOT NULL,
  `addtime` int(11) NOT NULL,
  `releids` varchar(255) NOT NULL,
  `extfield` int(10) NOT NULL DEFAULT '0' COMMENT '拓展字段',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `blog_photo`
--

INSERT INTO `blog_photo` (`id`, `sort`, `exsort`, `account`, `title`, `places`, `color`, `picture`, `keywords`, `description`, `photolist`, `conlist`, `content`, `method`, `tpcontent`, `norder`, `recmd`, `hits`, `ispass`, `addtime`, `releids`, `extfield`) VALUES
(1, ',000000,100005', '', 'admin', '好吧好吧', '', '', '140613055607951179271.png ', '', '', '1406130556062057453817.png ,1406130556071583656748.png , ,140613055607735638937.png ,140613055607480882747.jpg ,140613055607951179271.png ,14061305560752389835.png ', ',,,,,,', '', 'default/column/content', 'news_content', 0, 0, 30, 1, 1402653342, '', 0),
(2, ',000000,100005', '100012,100013,100014', 'admin', '测试副栏目', '', '', '', '栏目,测试', '测试副栏目测试副栏目', '', '', '测试副栏目测试副栏目', 'default/column/content', 'news_content', 0, 0, 30, 1, 1402716076, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_place`
--

CREATE TABLE IF NOT EXISTS `blog_place` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `norder` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

-- --------------------------------------------------------

--
-- 表的结构 `blog_sort`
--

CREATE TABLE IF NOT EXISTS `blog_sort` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '模型类别',
  `path` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ename` varchar(100) NOT NULL,
  `picture` varchar(80) NOT NULL,
  `deep` int(5) unsigned NOT NULL DEFAULT '1' COMMENT '深度',
  `norder` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `ifmenu` tinyint(1) NOT NULL COMMENT '是否前台显示',
  `method` varchar(100) NOT NULL COMMENT '模型方法',
  `tplist` varchar(100) NOT NULL COMMENT '列表模板',
  `keywords` varchar(255) NOT NULL COMMENT '描述',
  `description` varchar(300) NOT NULL COMMENT '描述',
  `url` varchar(255) NOT NULL COMMENT '外部链接',
  `extendid` int(10) NOT NULL COMMENT '拓展表id',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `path` (`path`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100017 ;

--
-- 转存表中的数据 `blog_sort`
--

INSERT INTO `blog_sort` (`id`, `type`, `path`, `name`, `ename`, `picture`, `deep`, `norder`, `ifmenu`, `method`, `tplist`, `keywords`, `description`, `url`, `extendid`) VALUES
(100005, 2, ',000000', '日志', '100005', '', 1, 0, 1, 'photo/index', 'news_content,news_content', '', '', '10', 0),
(100004, 1, ',000000', '主页内容', '1', '', 1, 0, 1, 'news/index', 'news_content,news_content', '', '', '10', 0),
(100007, 2, ',000000', '相册', '100006', '', 1, 0, 1, 'photo/index', 'news_content,news_content', '', '', '10', 0),
(100015, 1, ',000000,100004', '留言薄', '100015', '', 2, 0, 1, 'news/index', 'news_content,news_content', '', '', '10', 0),
(100016, 1, ',000000,100004', '每天心情', '100016', '', 2, 0, 1, 'news/index', 'news_content,news_content', '', '', '10', 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_tags`
--

CREATE TABLE IF NOT EXISTS `blog_tags` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '0',
  `mesnum` int(10) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
