-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-08-10 18:06:24
-- 服务器版本： 5.5.53-log
-- PHP Version: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `blog_addons`
--

CREATE TABLE `blog_addons` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台列表'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件表';

--
-- 转存表中的数据 `blog_addons`
--

INSERT INTO `blog_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(28, 'Picture', '上传图片', '上传图片功能插件', 1, 'a:1:{s:8:\"fileExts\";a:1:{s:5:\"value\";s:3:\"0,1\";}}', '', '', 1461574487, 0),
(31, 'PictureMulti', '上传多张图片', '上传多张图片功能插件', 1, 'a:1:{s:8:\"fileExts\";a:1:{s:5:\"value\";s:5:\"0,1,2\";}}', '', '', 1461745826, 0),
(34, 'Attachment', '上传附件', '上传单个附件的功能插件', 1, 'a:1:{s:8:\"fileExts\";a:1:{s:5:\"value\";s:11:\"0,1,2,3,4,5\";}}', '', '', 1461753300, 0),
(35, 'AttachmentMulti', '上传多个附件', '上传多个附件的功能插件', 1, 'a:1:{s:8:\"fileExts\";a:1:{s:5:\"value\";s:5:\"0,1,2\";}}', '', '', 1461753318, 0),
(36, 'DatePicker', '日期选择器', '日期选择功能的插件', 1, NULL, '', '', 1461813000, 0),
(37, 'Alipay', '支付宝', '支付宝功能插件', 1, 'a:1:{s:5:\"title\";a:1:{s:5:\"value\";s:9:\"支付宝\";}}', '', '', 1461911091, 0),
(38, 'Polyv', '上传视频', '上传视频的插件', 1, 'a:4:{s:6:\"userid\";a:1:{s:5:\"value\";s:0:\"\";}s:10:\"writetoken\";a:1:{s:5:\"value\";s:0:\"\";}s:9:\"readtoken\";a:1:{s:5:\"value\";s:0:\"\";}s:9:\"secretkey\";a:1:{s:5:\"value\";s:0:\"\";}}', '', '', 1462246169, 0),
(39, 'EditorForAdmin', '后台编辑器', '后台富文本编辑器', 1, 'a:1:{s:6:\"random\";a:1:{s:5:\"value\";s:1:\"1\";}}', '', '', 1463371254, 0),
(47, 'SystemInfo', '环境信息', '用于后台首页的服务器环境信息', 1, 'a:8:{s:9:\"sys_title\";a:1:{s:5:\"value\";s:12:\"系统信息\";}s:8:\"sys_move\";a:1:{s:5:\"value\";s:1:\"0\";}s:9:\"sys_width\";a:1:{s:5:\"value\";s:2:\"11\";}s:11:\"sys_display\";a:1:{s:5:\"value\";s:1:\"1\";}s:10:\"data_title\";a:1:{s:5:\"value\";s:12:\"数据信息\";}s:9:\"data_move\";a:1:{s:5:\"value\";s:1:\"0\";}s:10:\"data_width\";a:1:{s:5:\"value\";s:2:\"11\";}s:12:\"data_display\";a:1:{s:5:\"value\";s:1:\"1\";}}', '', '', 1463473229, 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_article`
--

CREATE TABLE `blog_article` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` int(10) UNSIGNED NOT NULL,
  `cover` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '信息状态',
  `description` varchar(255) NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `keywords` varchar(255) NOT NULL COMMENT '关键词'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `blog_article`
--

INSERT INTO `blog_article` (`id`, `title`, `name`, `content`, `cover`, `create_time`, `category_id`, `views`, `status`, `description`, `sort`, `uid`, `keywords`) VALUES
(1, '常用外贸专业术语', 'a1', 1, 38, 1465740200, 4, 24, 1, '常用外贸专业术语', 0, 1, ''),
(2, '单证制作', 'a2', 2, 37, 1463740320, 4, 9, 1, '单证制作', 0, 1, ''),
(3, '单证制作', 'a2', 2, 37, 1463740320, 4, 18, 1, '单证制作', 0, 3, ''),
(5, 'ceshi', 'ceshi', 23, 0, 1464597420, 2, 8, 1, '', 0, 3, ''),
(6, '老外贸SOHO给新人的点点忠告', 't2', 24, 0, 1464680400, 2, 5, 1, '外贸', 0, 4, '外贸'),
(7, '外贸术语-外贸业务中常用的术语', NULL, 25, 0, 1464830160, 4, 8, 1, '外贸业务中常用的术语', 0, 4, '外贸术语');

-- --------------------------------------------------------

--
-- 表的结构 `blog_attachment`
--

CREATE TABLE `blog_attachment` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- --------------------------------------------------------

--
-- 表的结构 `blog_avatar`
--

CREATE TABLE `blog_avatar` (
  `id` int(11) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `md5` char(32) NOT NULL DEFAULT '',
  `sha1` char(40) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_avatar`
--

INSERT INTO `blog_avatar` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/upload/avatar/2016-05-31/574d5141b7057.jpg', '', '6a6fb131cbbd99633705434485015505', '0ea244b6a9ff55323a2434b7286a508b3c47ab74', 0, 1464684865),
(2, '/upload/avatar/2016-05-31/574d52a41ba00.jpg', '', 'ca404a34aea231c84b75f9071125c510', 'f2fb2be09c25e927ba0416d30e1fdd6ac9f0508b', 0, 1464685220),
(3, '/upload/avatar/2016-06-02/574f9f584f757.jpg', '', '6a6fb131cbbd99633705434485015505', '0ea244b6a9ff55323a2434b7286a508b3c47ab74', 0, 1464835928),
(4, '/upload/avatar/2016-06-02/5750115bc8d59.jpg', '', 'c4623b1c270adcfe3b8109bd86843be9', '362d834a3f0b60265dfb6739eb9ef868dbefc9eb', 0, 1464865115),
(5, '/upload/avatar/2016-06-02/5750116ed4819.jpg', '', 'c4623b1c270adcfe3b8109bd86843be9', '362d834a3f0b60265dfb6739eb9ef868dbefc9eb', 0, 1464865134),
(6, '/upload/avatar/2016-06-02/57501182f3048.jpg', '', 'c4623b1c270adcfe3b8109bd86843be9', '362d834a3f0b60265dfb6739eb9ef868dbefc9eb', 0, 1464865154);

-- --------------------------------------------------------

--
-- 表的结构 `blog_category`
--

CREATE TABLE `blog_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类标识',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属用户id',
  `up_uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上一位分享用户id',
  `origin_uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '原始的用户id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级id',
  `tid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '顶级大类id',
  `allow_publish` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-不允许 1-仅后台 2-前后台',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核 0-不需要 1-需要',
  `model` smallint(4) NOT NULL DEFAULT '0' COMMENT '选择模型',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '分类图标',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-不可见 1-所有人可见  2-管理员可见',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '字段排序',
  `list_row` int(11) NOT NULL DEFAULT '10' COMMENT '列表行数',
  `meta_title` varchar(255) NOT NULL DEFAULT '' COMMENT '网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(900) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(255) NOT NULL DEFAULT '' COMMENT '频道模板',
  `template_lists` varchar(255) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '详情模板',
  `template_edit` varchar(255) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cataid` char(30) NOT NULL DEFAULT '1' COMMENT '保利威视的id',
  `cover` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类封面'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_category`
--

INSERT INTO `blog_category` (`id`, `name`, `title`, `uid`, `up_uid`, `origin_uid`, `pid`, `tid`, `allow_publish`, `check`, `model`, `icon`, `display`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `status`, `cataid`, `cover`) VALUES
(1, 'video', '外贸视频', 21, 0, 21, 0, 0, 0, 0, 3, '', 1, 0, 10, '', '', '外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯外贸资讯', '', '', '', '', 1, '0', 0),
(2, 'trade', '外贸干货', 21, 0, 21, 0, 0, 1, 0, 2, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(3, 'facebook', 'SNS社交营销', 21, 0, 21, 1, 1, 0, 0, 3, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '1464148380099', 0),
(4, 'base', '基础知识', 21, 0, 21, 2, 2, 1, 0, 2, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(5, 'single', '单页管理', 21, 0, 21, 0, 0, 1, 0, 4, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(6, 'us', '关于我们', 21, 0, 21, 5, 5, 1, 0, 4, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(7, 'facebook', 'facebook', 21, 0, 21, 3, 1, 1, 0, 3, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '1462242870498', 41),
(8, 'twitter', 'Twitter', 21, 0, 21, 3, 1, 1, 0, 3, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 42),
(9, 'linkedin', 'Linkedin', 21, 0, 21, 3, 1, 1, 0, 3, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 43),
(10, 'pinterest', 'Pinterest', 21, 0, 21, 3, 1, 1, 0, 3, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(11, 'google', 'Google+', 21, 0, 21, 3, 1, 1, 0, 3, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(12, ' custom', '成功客户回访', 21, 0, 21, 1, 1, 0, 0, 3, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '1464148417324', 0),
(13, 'plant-extracts', '植物提取物行业', 21, 0, 21, 12, 1, 1, 0, 3, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '1464148436335', 44),
(14, 'medical', '医药生物行业', 21, 0, 21, 12, 1, 1, 0, 3, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 45),
(15, 'news', '外贸资讯', 21, 0, 21, 0, 0, 1, 0, 6, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(16, 'policy', '外贸政策', 21, 0, 21, 15, 15, 1, 0, 6, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(17, 'china', '国内新闻', 21, 0, 21, 15, 15, 1, 0, 6, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(18, 'abroad', '国外新闻', 21, 0, 21, 15, 15, 1, 0, 6, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(19, 'customer', '客户开发', 21, 0, 21, 2, 2, 1, 0, 2, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0),
(20, 'faq', '常见问题', 21, 0, 21, 5, 5, 1, 0, 4, '', 1, 0, 10, '', '', '', '', '', '', '', 1, '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_config`
--

CREATE TABLE `blog_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `ckey` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `group` varchar(255) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `eid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvalue` text NOT NULL,
  `remark` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_config`
--

INSERT INTO `blog_config` (`id`, `ckey`, `title`, `sort`, `group`, `type`, `eid`, `cvalue`, `remark`) VALUES
(1, 'WEB_SITE_TITLE', '网站标题', 0, '6', 44, 0, '索镁卖光盘平台', '网站标题前台显示标题2'),
(2, 'WEB_SITE_DESCRIPTION', '网站描述', 2, '6', 47, 0, '索镁卖光盘平台', '网站搜索引擎描述'),
(3, 'WEB_SITE_CLOSE', '关闭站点', 0, '9', 49, 35, '46', '站点关闭后其他用户不能访问，管理员可以正常访问'),
(4, 'WEB_SITE_KEYWORD', '网站关键字', 0, '6', 44, 0, '索镁,光盘网站', '网站搜索引擎关键字'),
(5, 'WEB_SITE_ICP', '网站备案号', 0, '6', 44, 0, '陕ICP备10110108', '设置在网站底部显示的备案号'),
(6, 'USER_ALLOW_REGISTER', '是否允许用户注册', 0, '8', 49, 54, '56', '是否开放用户注册'),
(7, 'DEVELOP_MODE', '开启开发者模式', 0, '9', 49, 98, '99', '是否开启开发者模式');

-- --------------------------------------------------------

--
-- 表的结构 `blog_content`
--

CREATE TABLE `blog_content` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档ID',
  `parse` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '收藏数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容表';

--
-- 转存表中的数据 `blog_content`
--

INSERT INTO `blog_content` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(1, 0, '<div class=\"article-title\" style=\"font-family: arial; font-size: 12px; white-space: normal;\"><h2 style=\"margin: 0px; padding: 0px; font-size: 28px; line-height: 40px; font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, 宋体;\">微博发布2017年二季度财报：净利润逆天 市值突破200亿</h2></div><div class=\"article-source\" style=\"margin-top: 5px; font-family: arial; font-size: 12px; white-space: normal;\"><span class=\"source\" style=\"font-size: 13px; line-height: 2; color: rgb(153, 153, 153); padding-right: 10px; border-right: 1px solid rgb(242, 242, 242);\">全网资讯</span>&nbsp;<span class=\"date\" style=\"font-size: 13px; line-height: 2; color: rgb(153, 153, 153); margin: 0px 9px 0px 6px;\">08-10</span>&nbsp;<span class=\"time\" style=\"font-size: 13px; line-height: 2; color: rgb(153, 153, 153);\">10:22</span></div><div class=\"article-content\" style=\"margin-top: 17px; font-family: arial; font-size: 12px; white-space: normal;\"><div class=\"img-container\" style=\"margin-top: 30px;\"><img class=\"large\" src=\"/upload/ueditor/remote/20170810/1502345067427087.jpeg\"/></div><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">昨日，新浪微博公布了2017年第二季度财报，根据财报显示，微博在Q2季度净营收为2.534亿美元(约17.3亿人民币)，对比去年同期增长72%;净利润为7350万美元，同比增长184%，远远高于华尔街预期。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">此外，截止2017年6月，微博月活跃用户规模增长到3.61亿，移动端月活跃用户占比达92%，创下历史新高。从微博财报来看，微博在今年第二季度表现可以说是相当不错，超出分析师预期，值得一提的是，微博高速增长的主要业绩来源于广告业务。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">微博公布财报之前，截止8月8日收盘，微博股价报收于86.26美元，较年初上涨超过100%;并且昨日受到财报业绩良好影响，8月9日盘前微博股价再度攀升，市值首次突破200亿美元大关，创下历史新高。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">微博在第二季度增长了许多新的用户，主要来源是与版权方合作带来独家内容，通过和主流电视台及视频网站合作，为影视剧和综艺节目提供推广平台。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">从长远来看，随着用户对于视频消费的习惯，视频广告也成为了微博营收的重要构成部分。第二季度，微博视频广告客户数较上季度仍保持两位数比例的增长，视频广告营收占比也有所提升。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">对此，微博预计，随着用户规模的持续增长和商业化的稳步推进，第三季度的营收有望达到3亿美元，超过华尔街分析师平均预期的2.77亿美元。</p></div><p><br/></p>', '', 0),
(2, 0, '<div class=\"col-md-2 col-sm-2 col-xs-2 answer__info--author-avatar\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-left: 15px; padding-right: 0px; float: left; width: 131.656px; text-align: right; line-height: 32px; color: rgb(51, 51, 51); font-family: -apple-system, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><a class=\"mr10\" href=\"https://segmentfault.com/u/sushengbuhuo\" style=\"box-sizing: border-box; background: transparent; color: rgb(0, 154, 97); text-decoration: none; outline: 0px; margin-right: 10px !important;\"><img class=\"avatar-32 \" src=\"https://sfault-avatar.b0.upaiyun.com/175/934/175934663-572d654c6f521_big64\" alt=\"\"/></a></div><div class=\"col-md-2 col-sm-2 hidden-xs answer__info--author\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-left: 0px; padding-right: 15px; float: left; width: 131.656px; line-height: 32px; color: rgb(51, 51, 51); font-family: -apple-system, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><div class=\" answer__info--author-warp\" style=\"box-sizing: border-box; display: inline-block; line-height: 1; vertical-align: middle;\"><a class=\"answer__info--author-name\" title=\"苏生不惑\" href=\"https://segmentfault.com/u/sushengbuhuo\" style=\"box-sizing: border-box; background: transparent; color: rgb(0, 154, 97); text-decoration: none; outline: 0px; max-width: 8em; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: block; margin-bottom: 2px; line-height: 16px;\">苏生不惑</a><span class=\"answer__info--author-rank\" style=\"box-sizing: border-box; color: rgb(153, 153, 153);\">14.6k 声望</span></div></div><p><br/></p>', '', 0),
(3, 0, '<p>西安索镁企业文化传播有限公司（以下简称“西安索镁”）是西安一家专业致力于外贸网站企业营销推广综合解决方案的公司，是欧洲康帕斯国际信息集团在中国西北地区的独家授权经销商，同时也是美国托马斯国际工业传媒集团和巴西NEI工业传媒集团在陕西地区的授权经销商。<br/>&nbsp;&nbsp;西安索镁结合当前的海外营销推广趋势，倡导外贸全网营销的\\r\\n概念，目的是协助出口企业以高转化率的对外营销网站为载体，辐射国际主流搜索引擎Google,&nbsp;Yahoo,&nbsp;Bing和海外主流社交媒体\\r\\nFacebook,&nbsp;Google+,Twitter,&nbsp;Pinterest等多渠道英文网站营销推广，引流曝光，提升品牌影响力，升华线上形象。并通过专业的外贸推广培训，让外贸企业掌握互联网引流和转化的技巧，针对企业自身情况，开展卓有成效的主动营销和被动精准营销；另外，我们聘请了具有深圳平面设计师协会会员资格的高级设计师，操刀企业的VI形象设计。通过与专业影像摄制团队合作，打造企业完美视频形象，为塑造国际化形象，打造国际化品牌奠定优厚基础。<p>\\r\\n	索镁理念：发现美，塑造美，传播美；</p><p>\\r\\n	服务指南：培训，设计，推广；</p><p>\\r\\n	索镁使命：服务全球10000家国际化企业，成为海外营销推广的专业品牌；服务对象：外向型生产企业和贸易公司；</p><p>\\r\\n	外贸全网营销服务内容：<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 《被动精准营销》<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 多语言外贸营销型网站（企业自主B2B平台）设计与建设；<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 国际搜索引擎与社交媒体推广；<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 《主动营销》<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 康帕斯境外广告；</p><p>\\r\\n	进出口数据+行业数据+邮件营销系统；<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 《形象设计》<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 企业VI形象设计；<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 企业视频宣传片和推广专题片摄制；<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 企业微信开发与推广；</p></p>', '', 0),
(18, 0, '<article class=\"article-content\"><p><strong>马士基航运公告</strong></p><p>马士基航运宣布，自2016年5月1日起，由中国内地，香港，印度尼西亚，缅甸，韩国，马来西亚，菲律宾，新加坡，泰国，越南，柬埔寨，台湾 \\r\\n出口至波多黎各，多米尼加，海地牙买加，委内瑞拉，特立尼达和多巴哥，巴拿马，哥伦比亚航线运价上调GRI(综合费率上涨附加费)，具体如下：</p><p>USD 700/1000/1000 per 20&#39;/40&#39;/40&#39; high cube dry</p><p>700美金/20英尺干货柜</p><p>1000美金/40英尺干货柜、40英尺干货高柜</p><p>USD 1000 per 40&#39;/40&#39; high cube reefer</p><p>1000美金/40英尺冷冻柜、40英尺冷冻高柜</p><p>40 Non-operating reefers (NOR): USD 1000</p><p>1000美金/40英尺干冻柜</p><p><strong>达飞轮船公告</strong></p><p>达飞轮船宣布，自2016年5月1日(以提单日为准)起，由亚洲(包含韩国，台湾，日本，东南亚和孟加拉)出口至东非(肯尼亚，坦桑尼亚和莫桑比克)航线所有货物上调综合费率GRR，具体如下：</p><p>USD 300 per 20&#39;</p><p>300美金/20英尺标准货柜</p><p>USD 600 per 40&#39;</p><p>600美金/40英尺标准货柜</p><p><strong>汉堡南美航运公告</strong></p><p>汉堡南美航运宣布，自2016年5月1日起，由亚洲出口至北欧航线运价上调GRI(综合费率上涨附加费)，具体如下：</p><p>USD 800 per 20&#39; standard container</p><p>800美金/20英尺标准货柜</p><p>USD 1600 per 40&#39; standard and high cube container</p><p>1600美金/40英尺标准货柜和40英尺高柜</p><p>USD 1600 per 40&#39; non-operated reefer container (NOR)</p><p>1600美金/40英尺干冻柜</p><p>USD 1600 per 40&#39; reefer container</p><p>1600美金/40英尺冷冻柜</p><p><strong>赫伯罗特航运公告</strong></p><p>赫伯罗特航运宣布，自2016年4月30日起，由东北亚出口至澳大利亚航线所有货物调整燃油附加费BAF，具体如下：</p><p>USD 125 per TEU</p><p>125美金/20英尺标准货柜</p><p>赫伯罗特航运宣布，自2016年5月1日起，由东亚出口至墨西哥、中美洲西岸和南美西岸航线所有货物运价上调GRI(综合费率上涨附加费)，具体如下：</p><p>USD 500 per 20&#39; Container</p><p>500美金/20英尺标准货柜</p><p>USD 1000 per 40&#39; Container</p><p>1000美金/40英尺标准货柜</p><p><strong>阿联酋航运公告</strong></p><p>阿联酋航运宣布，自2016年5月1日起至31日止(以收货日为准)，往返远东至东南亚航线所有货物调整燃油附加费FAF(燃油调整附加费)，具体如下：</p><p>USD 30 per 20ft container (including reefer)</p><p>30美金/20英尺标准货柜(包含冷冻柜)</p><p>USD 60 per 40ft container/40ft hi cube container (including reefer)</p><p>60美金/40英尺标准货柜和40英尺高柜(包含冷冻柜)</p> \\r\\n	</article><p><br/></p>', '', 0),
(19, 0, '<article class=\"article-content\"><p><br/></p><p>5月10日消息，获悉，日前，国务院《关于促进外贸回稳向好的若干意见》(以下简称《意见》)，提出多种措施来促进外贸回稳向好。</p><p>其中，针对跨境电商行业，该《意见》中表示，将总结中国(杭州)跨境电子商务综合试验区和市场采购贸易方式的经验，扩大试点范围，对试点地区符合监管条件的出口企业，如不能提供进项税发票，按规定实行增值税免征不退政策，并在发展中逐步规范和完善。</p><p>与此同时，该《意见》也要求加快建立与外贸综合服务企业发展相适应的管理模式，抓紧完善外贸综合服务企业退(免)税分类管理办法。</p><p>此外，该《意见》指出将开展并扩大跨境电子商务、市场采购贸易方式和外贸综合服务企业试点。支持企业建设一批出口产品“海外仓”和海外运营中心。</p><p>海外仓的基础建设一直为中国企业建立零售品牌的基础，而《意见》中对中国企业建立自主品牌也做出了相应的促进措施。</p><p>“要鼓励外贸企业创立自主品牌，提升出口质量。建立品牌商品出口统计制度。提高非商业性境外办展质量，培育一批重点行业专业性境外品牌展。加强自主\\r\\n品牌对外宣传，利用高层访问、国际会议、广交会等多渠道加大中国品牌推介力度。利用外经贸发展等专项资金支持品牌、专利等方面境外并购和国际营销体系建\\r\\n设。在风险可控前提下对外贸企业收购境外品牌、营销体系等加大信贷支持。”该《意见》中明确说道。</p><p>以下为《关于促进外贸回稳向好的若干意见》原文：</p><p>国务院关于促进外贸回稳向好的若干意见</p><p>国发〔2016〕27号</p><p>各省、自治区、直辖市人民政府，国务院各部委、各直属机构：</p><p>外贸是国民经济重要组成部分和重要推动力量。当前，外贸形势复杂严峻，不确定不稳定因素增多，下行压力不断加大。促进外贸回稳向好，对经济平稳运行和升级发展具有重要意义。为此，提出以下意见：</p><p>一、充分发挥出口信用保险作用</p><p>进一步降低短期出口信用保险费率。对大型成套设备出口融资应保尽保，在风险可控的前提下，抓紧评估和支持一批中长期险项目。</p><p>二、大力支持外贸企业融资</p><p>通过差别准备金、利率、再贷款、再贴现等政策，引导金融机构加大对小微企业的支持力度。鼓励和支持金融机构对有订单、有效益的外贸企业贷款。加强银贸合作，鼓励和支持金融机构进一步扩大出口信用保险保单融资和出口退税账户质押融资规模。</p><p>三、进一步提高贸易便利化水平</p><p>积极改善通关便利化的技术条件，提高机检比例，进一步降低海关出口平均查验率，加强分类指导，对信用好的出口企业降低查验率，对信用差的出口企业加\\r\\n大查验力度。2016年年底前将国际贸易“单一窗口”建设从沿海地区推广到有条件的中西部地区，建立标准体系，落实主体责任。全面推进通关作业无纸化。</p><p>四、调整完善出口退税政策</p><p>优化出口退税率结构，对照相机、摄影机、内燃发动机等部分机电产品按征多少退多少的原则退税，确保及时足额退税，严厉打击骗取退税。完善出口退税分类管理办法，逐步提高出口退税一类企业比例，发挥好一类企业的示范带动作用。</p><p>五、减免规范部分涉企收费</p><p>落实收费目录清单制度和《港口收费计费办法》，加快推进市场化改革，着重打破垄断，加强和创新收费监管，建立打击违规收费机制。加大对电子政务平台\\r\\n收费查处力度，对海关、出入境检验检疫、税务、商务等部门电子政务平台开展全面检查。合理规范港口、保险、运输、银行等收费，支持实体经济发展。加快将货\\r\\n物港务费并入港口建设费。电器电子产品出口符合政策条件的，可按规定免征废弃电器电子产品处理基金。</p><p>六、进一步完善加工贸易政策</p><p>综合运用财政、土地、金融政策，支持加工贸易向中西部地区转移。中西部地区要加大加工贸易产业用地保障力度，优先纳入供地计划并优先供应，东部地区\\r\\n加工贸易梯度转移腾退用地经批准可转变为商业、旅游、养老等用途。加工贸易企业依法取得的工业用地可按合同约定分期缴纳土地出让价款，对各省(区、市)确\\r\\n定的优先发展产业且用地集约的工业项目可按不低于相关标准的70%确定土地出让底价。鼓励转移到中西部地区的加工贸易企业参与电力直接交易。抓紧做好阶段\\r\\n性降低社会保险费率政策落实工作。优化财政支出结构，支持中西部地区加工贸易发展。鼓励金融机构为加工贸易梯度转移项目提供金融支持。</p><p>在全国范围内取消加工贸易业务审批，建立健全事中事后监管机制。在符合条件的海关特殊监管区域积极探索货物状态分类监管试点，在税负公平、风险可控\\r\\n的前提下，赋予具备条件的企业增值税一般纳税人资格。在自贸试验区的海关特殊监管区域积极推进选择性征收关税政策先行先试，及时总结评估，在公平税负原则\\r\\n下适时研究扩大试点。</p><p>七、支持边境贸易发展</p><p>将边贸政策与扶贫政策、民族政策相结合。加大中央财政对边境地区转移支付力度，继续支持边境小额贸易企业发展能力建设，并督促地方规范资金使用，确保将资金落实到基层一线地区，大力促进边境小额贸易企业发展。</p><p>八、实行积极的进口政策</p><p>完善进口贴息政策，调整《鼓励进口技术和产品目录》，重点支持先进设备、先进技术进口，鼓励企业引进消化吸收再创新。完善现行汽车品牌销售管理办法，切实推进汽车平行进口。赋予符合条件的原油加工企业原油使用和进口资质。降低部分日用消费品关税，引导境外消费回流。</p><p>九、加大对外贸新业态的支持力度</p><p>开展并扩大跨境电子商务、市场采购贸易方式和外贸综合服务企业试点。支持企业建设一批出口产品“海外仓”和海外运营中心。总结中国(杭州)跨境电子\\r\\n商务综合试验区和市场采购贸易方式的经验，扩大试点范围，对试点地区符合监管条件的出口企业，如不能提供进项税发票，按规定实行增值税免征不退政策，并在\\r\\n发展中逐步规范和完善。加快建立与外贸综合服务企业发展相适应的管理模式，抓紧完善外贸综合服务企业退(免)税分类管理办法。</p><p>十、加快国际营销服务体系建设</p><p>支持企业建立国际营销网络体系，建设一批境外展示中心、分拨中心、批发市场和零售网点等。鼓励企业建立境外服务保障体系，支持重点企业建设汽车、机\\r\\n床、工程机械、通信、轨道交通、航空、船舶和海洋工程等境外售后维修服务中心及备件生产基地和培训中心。鼓励中国出口信用保险公司、进出口银行、开发银行\\r\\n对企业建设国际营销和售后服务网络提供信保和融资支持。鼓励各类金融机构与企业合作，在重点市场为国际营销服务体系建设提供融资和消费信贷支持。</p><p>十一、加快培育外贸自主品牌</p><p>鼓励外贸企业创立自主品牌，提升出口质量。建立品牌商品出口统计制度。提高非商业性境外办展质量，培育一批重点行业专业性境外品牌展。加强自主品牌\\r\\n对外宣传，利用高层访问、国际会议、广交会等多渠道加大中国品牌推介力度。利用外经贸发展等专项资金支持品牌、专利等方面境外并购和国际营销体系建设。在\\r\\n风险可控前提下对外贸企业收购境外品牌、营销体系等加大信贷支持。</p><p>十二、发挥双向投资对贸易的促进作用</p><p>提高国家级经济技术开发区和各类园区的发展水平，加大招商引资力度，稳定外商投资规模和速度，提高引进外资质量。积极引导外资投向新兴产业、高新技\\r\\n术、节能环保等领域。进一步改善投资环境，大力引进国际人才，推动中关村国家自主创新示范区有关人才政策尽快在全国复制推广。促进引资和引智相结合，培育\\r\\n新的外贸经营主体。推动对外投资合作和贸易相结合。大力推进“一带一路”建设和国际产能合作，带动我国产品、技术、标准、服务出口。加大磋商协调力度，推\\r\\n动解决企业“走出去”面临的签证申办难点和普遍性问题。</p><p>十三、加强外贸知识产权保护</p><p>持续开展外贸领域打击侵权假冒专项行动，依法打击有关违法行为。支持企业开展商标、专利注册保护，加强境外知识产权争端解决和维权援助机制建设。健\\r\\n全多双边知识产权交流和执法协作机制，切实支持进出口企业应对境外知识产权纠纷，有效遏止境外恶意注册、恶意诉讼等行为。加强指导和帮助，提高外贸企业防\\r\\n范和应对国际技术性贸易壁垒的能力和水平。加强外贸领域诚信体系建设，探索建立外贸企业信用评价体系。</p><p>十四、加强组织实施</p><p>各地区、各部门要进一步提高认识，更加重视外贸工作，加强协调，形成合力。要加大政策落实力度，早部署、早落实，加强督促检查。各地区要提高政策的\\r\\n精准度，借鉴有益经验做法，根据形势需要和本地区实际，出台有针对性的配套措施。各部门要明确责任分工，抓紧制定实施细则。要多措并举，促进外贸创新发\\r\\n展，千方百计稳增长，坚定不移调结构，努力实现外贸回稳向好。</p> \\r\\n	</article>', '', 0),
(20, 0, '<p>常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题<br/></p>', '', 0),
(21, 0, '<p>常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题<br/></p>', '', 0),
(22, 0, '<p>常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题常见问题<br/></p>', '', 0),
(23, 0, '<div class=\"article-title\" style=\"font-family: arial; font-size: 12px; white-space: normal;\"><h2 style=\"margin: 0px; padding: 0px; font-size: 28px; line-height: 40px; font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, 宋体;\">苹果公司的研发预算是巨大的但效率惊人</h2></div><div class=\"article-source\" style=\"margin-top: 5px; font-family: arial; font-size: 12px; white-space: normal;\"><span class=\"source\" style=\"font-size: 13px; line-height: 2; color: rgb(153, 153, 153); padding-right: 10px; border-right: 1px solid rgb(242, 242, 242);\">TechWeb</span>&nbsp;<span class=\"date\" style=\"font-size: 13px; line-height: 2; color: rgb(153, 153, 153); margin: 0px 9px 0px 6px;\">08-10</span>&nbsp;<span class=\"time\" style=\"font-size: 13px; line-height: 2; color: rgb(153, 153, 153);\">09:15</span></div><div class=\"article-content\" style=\"margin-top: 17px; font-family: arial; font-size: 12px; white-space: normal;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">这就叫做好钢用到好刃上~&nbsp;</p><pre class=\"brush:php;toolbar:false\">&lt;?php\\n\\nclass&nbsp;test{\\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;$test;\\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;function(){\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;__CLASS__.&#39;==&#39;.__FUNCTION__;\\n&nbsp;&nbsp;&nbsp;&nbsp;}\\n}\\n\\necho&nbsp;111;\\nexit;</pre><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">基本上苹果的研发资金一直都在不断的增加，但是其实结合苹果过去的战略来看，其实苹果在使用研发资金方面，是非常有效率的。</p><div class=\"img-container\" style=\"margin-top: 30px;\"><img class=\"normal\" width=\"320px\" src=\"/upload/ueditor/remote/20170810/1502331711148879.jpeg\"/></div><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">研究和开发一直都是苹果公司的战略基础，从另外一方面来说，苹果的研发预算多年来一直处于上升趋势，这也是与苹果公司节节攀升的收入有关。</p><div class=\"img-container\" style=\"margin-top: 30px;\"><img class=\"normal\" width=\"320px\" src=\"/upload/ueditor/remote/20170810/1502331712757770.jpeg\"/></div><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">以季度为基础来看，过去五年，苹果公司的收入变化很大，这主要也是与发布周期和季节性有关，而苹果的研究预算则随着时间的推移呈线性增长。</p><div class=\"img-container\" style=\"margin-top: 30px;\"><img class=\"normal\" width=\"320px\" src=\"/upload/ueditor/remote/20170810/1502331713621954.jpeg\"/></div><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">事实上，随着苹果营收的增长，自 2009 年以来，苹果在研发方面的营收占比一直处于相对平稳的轨道上。这其实表明，苹果并没有刻意去追求任何具体的目标或激进的扩张，他们也没有必要将研发预算与公司的增长保持一定的比例。</p><div class=\"img-container\" style=\"margin-top: 30px;\"><img class=\"normal\" width=\"320px\" src=\"/upload/ueditor/remote/20170810/1502331714365185.jpeg\"/></div><div class=\"img-container\" style=\"margin-top: 30px;\"><img class=\"normal\" width=\"320px\" src=\"/upload/ueditor/remote/20170810/1502331715793510.jpeg\"/></div><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">但是很多朋友都喜欢描绘苹果会与竞争对手展开致命搏斗，他们都希望看到一场场针锋相对的战斗一次又一次的爆发。传统的观点认为，除了提高供应链的效率以外，苹果还需要挤出最大利润和带来精彩的广告和营销争夺消费者的心，在这场战斗中，第三个主要的战线就是研发支出，苹果需要制造消费者想要购买的东西。</p><div class=\"img-container\" style=\"margin-top: 30px;\"><img class=\"normal\" width=\"320px\" src=\"/upload/ueditor/remote/20170810/1502331716832556.jpeg\"/></div><div class=\"img-container\" style=\"margin-top: 30px;\"><img class=\"normal\" width=\"320px\" src=\"/upload/ueditor/remote/20170810/1502331717611843.jpeg\"/></div><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">事实是，苹果在研发方面的投入与竞争对手相比，差距很大。苹果每年在研发上的花费比三星少 20 亿美元，而且每年的收入超过了 460 亿美元。谷歌的研发支出远远超过了苹果，但是苹果的年收入则甩了谷歌好几条街。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">主流媒体的传统观点认为，即使是在今天，苹果也会在研发上投入更多的资金，以赶上竞争对手。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">当然了，如果苹果想的话，苹果完全可以集结这些力量。目前，苹果的现金储备要比谷歌以及 Facebook 等多得多，因此苹果在扩大研发方面存在非常大的回旋余地。所以说为什么蒂姆·库克和他的公司应该对所有研究空白而感到愤怒呢？他们现在可以通过合理应用自己的研发资金，为公司和股东赢得了比所有竞争对手更多的好处。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">战斗并不总是以压倒性的数量取胜的。正确地使用自己的力量，往往是胜利的原因，用我们的话来说，就是好钢用到好刃上，苹果就是这样做的。</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\">欢迎关注威锋网官方微信：威锋网（weiphone_2007) 汇聚最新Apple动态，精选最热科技资讯。</p></div><p><br/></p>', '', 0),
(24, 0, '<h4 style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; line-height: 1.8; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">运行一般声明<a href=\"http://d.laravel-china.org/docs/5.4/database#运行一般声明\" class=\"anchorific\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(224, 124, 121); text-decoration: none; padding-left: 4px; font-weight: 100; display: inline-block; position: relative;\">#</a></h4><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">有些数据库没有返回值， 对于这种类型的操作，可以使用&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">DB</code>&nbsp;facade 的&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">statement</code>&nbsp;方法。</p><pre class=\" language-php\" style=\"box-sizing: border-box; overflow: auto; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; font-size: 15px; padding: 1em; line-height: 1.5; word-break: normal; word-wrap: normal; background-color: rgb(249, 250, 250); border: 1px solid rgb(228, 228, 228); border-radius: 3px; text-shadow: none; tab-size: 4; hyphens: none;\">DB::statement(&#39;drop&nbsp;table&nbsp;users&#39;);</pre><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a style=\"box-sizing: border-box; background-color: transparent; color: rgb(224, 124, 121); position: relative;\"></a></p><h3 style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-weight: 400; line-height: 1.8; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">监听查询事件<a href=\"http://d.laravel-china.org/docs/5.4/database#监听查询事件\" class=\"anchorific\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(224, 124, 121); text-decoration: none; padding-left: 4px; display: inline-block; position: relative;\">#</a></h3><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">如果你希望能够监控到程序执行的每一条 SQL 语句，那么你可以使用&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">listen</code>&nbsp;方法。 该方法对查询日志和调试非常有用，你可以在&nbsp;<a href=\"http://d.laravel-china.org/docs/5.4/providers\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(224, 124, 121); text-decoration: none; position: relative;\">服务容器</a>&nbsp;中注册该方法：</p><pre class=\" language-php\" style=\"box-sizing: border-box; overflow: auto; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; font-size: 15px; padding: 1em; line-height: 1.5; word-break: normal; word-wrap: normal; background-color: rgb(249, 250, 250); border: 1px solid rgb(228, 228, 228); border-radius: 3px; text-shadow: none; tab-size: 4; hyphens: none;\">&lt;?phpnamespace&nbsp;App\\Providers;use&nbsp;Illuminate\\Support\\Facades\\DB;use&nbsp;Illuminate\\Support\\ServiceProvider;class&nbsp;AppServiceProvider&nbsp;extends&nbsp;ServiceProvider{\\n&nbsp;&nbsp;&nbsp;&nbsp;/**\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;启动应用服务。\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;@return&nbsp;void\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/\\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;function&nbsp;boot()\\n&nbsp;&nbsp;&nbsp;&nbsp;{\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DB::listen(function&nbsp;($query)&nbsp;{\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;$query-&gt;sql&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;$query-&gt;bindings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;$query-&gt;time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\\n&nbsp;&nbsp;&nbsp;&nbsp;}\\n\\n&nbsp;&nbsp;&nbsp;&nbsp;/**\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;注册服务提供者。\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;@return&nbsp;void\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/\\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;function&nbsp;register()\\n&nbsp;&nbsp;&nbsp;&nbsp;{\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;&nbsp;}}</pre><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a style=\"box-sizing: border-box; background-color: transparent; color: rgb(224, 124, 121); position: relative;\"></a></p><h2 style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-weight: 400; line-height: 1.8; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 36px; position: relative; border-bottom: 2px solid rgb(238, 238, 238); white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://d.laravel-china.org/docs/5.4/database#database-transactions\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(82, 82, 82); text-decoration: none; position: relative;\">数据库事务</a><a href=\"http://d.laravel-china.org/docs/5.4/database#数据库事务\" class=\"anchorific\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(82, 82, 82); text-decoration: none; padding-left: 4px; display: inline-block; position: relative;\">#</a></h2><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">想要在一个数据库事务中运行一连串操作，可以使用&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">DB</code>&nbsp;facade 的&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">transaction</code>&nbsp;方法。如果在事务的&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">Closure</code>中抛出了异常，那么事务会自动的执行回滚操作。如果&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">Closure</code>&nbsp;成功的执行，那么事务就会自动的进行提交操作。你不需要在使用&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">transaction</code>&nbsp;方法时考虑手动执行回滚或者提交操作：</p><pre class=\" language-php\" style=\"box-sizing: border-box; overflow: auto; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; font-size: 15px; padding: 1em; line-height: 1.5; word-break: normal; word-wrap: normal; background-color: rgb(249, 250, 250); border: 1px solid rgb(228, 228, 228); border-radius: 3px; text-shadow: none; tab-size: 4; hyphens: none;\">DB::transaction(function&nbsp;()&nbsp;{\\n&nbsp;&nbsp;&nbsp;&nbsp;DB::table(&#39;users&#39;)-&gt;update([&#39;votes&#39;&nbsp;=&gt;&nbsp;1]);\\n\\n&nbsp;&nbsp;&nbsp;&nbsp;DB::table(&#39;posts&#39;)-&gt;delete();});</pre><h4 style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; line-height: 1.8; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">处理死锁<a href=\"http://d.laravel-china.org/docs/5.4/database#处理死锁\" class=\"anchorific\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(224, 124, 121); text-decoration: none; padding-left: 4px; font-weight: 100; display: inline-block; position: relative;\">#</a></h4><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">transaction</code>方法参数列表的第二位接收一个可选的参数，这个参数定义了在发生死锁时，事务会重试的次数。如果重试结束还没有成功执行，将会抛出一个异常：</p><pre class=\" language-php\" style=\"box-sizing: border-box; overflow: auto; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; font-size: 15px; padding: 1em; line-height: 1.5; word-break: normal; word-wrap: normal; background-color: rgb(249, 250, 250); border: 1px solid rgb(228, 228, 228); border-radius: 3px; text-shadow: none; tab-size: 4; hyphens: none;\">DB::transaction(function&nbsp;()&nbsp;{\\n&nbsp;&nbsp;&nbsp;&nbsp;DB::table(&#39;users&#39;)-&gt;update([&#39;votes&#39;&nbsp;=&gt;&nbsp;1]);\\n\\n&nbsp;&nbsp;&nbsp;&nbsp;DB::table(&#39;posts&#39;)-&gt;delete();},&nbsp;5);</pre><h4 style=\"box-sizing: border-box; -webkit-font-smoothing: antialiased; font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; line-height: 1.8; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">手动操作事务<a href=\"http://d.laravel-china.org/docs/5.4/database#手动操作事务\" class=\"anchorific\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(224, 124, 121); text-decoration: none; padding-left: 4px; font-weight: 100; display: inline-block; position: relative;\">#</a></h4><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">如果你想要手动开始一个事务的回滚和提交操作，你可以使用&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">DB</code>&nbsp;facade 的&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">beginTransaction</code>&nbsp;方法。</p><pre class=\" language-php\" style=\"box-sizing: border-box; overflow: auto; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; font-size: 15px; padding: 1em; line-height: 1.5; word-break: normal; word-wrap: normal; background-color: rgb(249, 250, 250); border: 1px solid rgb(228, 228, 228); border-radius: 3px; text-shadow: none; tab-size: 4; hyphens: none;\">DB::beginTransaction();</pre><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">你也可以通过&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">rollBack</code>&nbsp;方法来回滚事务：</p><pre class=\" language-php\" style=\"box-sizing: border-box; overflow: auto; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; font-size: 15px; padding: 1em; line-height: 1.5; word-break: normal; word-wrap: normal; background-color: rgb(249, 250, 250); border: 1px solid rgb(228, 228, 228); border-radius: 3px; text-shadow: none; tab-size: 4; hyphens: none;\">DB::rollBack();</pre><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">最后，可以通过&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: rgb(117, 111, 111); background: rgb(249, 250, 250); border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">commit</code>&nbsp;方法来提交这个事务：</p><pre class=\" language-php\" style=\"box-sizing: border-box; overflow: auto; font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; font-size: 15px; padding: 1em; line-height: 1.5; word-break: normal; word-wrap: normal; background-color: rgb(249, 250, 250); border: 1px solid rgb(228, 228, 228); border-radius: 3px; text-shadow: none; tab-size: 4; hyphens: none;\">DB::commit();</pre><blockquote class=\"has-icon tip\" style=\"box-sizing: border-box; background: rgb(100, 181, 246); color: rgb(236, 238, 241); border-radius: 3px; margin: 15px 0px; padding: 9px 17px 4px 20px; border: 1px solid rgb(238, 238, 238); quotes: &quot;“&quot; &quot;”&quot; &quot;‘&quot; &quot;’&quot;; position: relative; line-height: 1.45; font-family: &quot;Lato Regular&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; white-space: normal;\"><p style=\"box-sizing: border-box; line-height: 30px; margin-top: 0px; margin-bottom: 10px; padding-left: 40px;\"><br/></p><div class=\"flag\" style=\"box-sizing: border-box; position: absolute; width: 30px; left: 15px; top: 10px;\"><span class=\"svg\" style=\"box-sizing: border-box;\"></span></div>使用&nbsp;<code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 0.9em; padding: 3px 6px; color: inherit; background: inherit; border-radius: 3px; margin: 5px; max-width: 740px; overflow-x: auto; border: 1px solid rgb(222, 217, 217);\">DB</code>&nbsp;facade 的事务方法也适用于&nbsp;<a href=\"http://d.laravel-china.org/docs/5.4/queries\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(255, 255, 255) !important; text-decoration: none; font-weight: bold; position: relative;\">查询语句构造器</a>&nbsp;和&nbsp;<a href=\"http://d.laravel-china.org/docs/5.4/eloquent\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(255, 255, 255) !important; text-decoration: none; font-weight: bold; position: relative;\">Eloquent ORM</a>&nbsp;。<p><br/></p></blockquote><p><br/></p>', '', 0),
(25, 0, '<p><span style=\"color: rgb(23, 54, 93);\">一：基本短语</span></p><p><br/></p><p><span style=\"color: rgb(23, 54, 93);\">　　Time to volume 及时大量生产<br/>　　Time to money 及时大量交货<br/>　　FOUR CONTROL YSTEM 四大管制系统<br/>　　Engineering control system 工程管制系统<br/>　　Quality control system质量管理系统<br/>　　Manufacturing control system生产管制系统<br/>　　Management control system经营管制系统<br/>　　Classification整理(sorting, organization)-seiri<br/>　　Regulation整顿(arrangement, tidiness)-seiton<br/>　　Cleanliness清扫(sweeping, purity)-seiso<br/>　　Conservation清洁(cleaning, cleanliness)-seiktsu<br/>　　Culture教养(discipline)-shitsuke<br/>　　Save 节约<br/>　　Safety安全<br/><br/>　　二：英文缩写<br/><br/>　　质量人员名称类<br/><br/>　　QC quality control 品质管理人员<br/>　　FQC final quality control 终点质量管理人员<br/>　　IPQC in process quality control 制程中的质量管理人员<br/>　　OQC output quality control 最终出货质量管理人员<br/>　　IQC incoming quality control 进料质量管理人员<br/>　　TQC total quality control 全面质量管理<br/>　　POC passage quality control 段检人员<br/>　　QA quality assurance 质量保证人员<br/>　　OQA output quality assurance 出货质量保证人员<br/>　　QE quality engineering 质量工程人员<br/><br/>　　质量保证类<br/><br/>　　FAI first article inspection 新品首件检查<br/>　　FAA first article assurance 首件确认<br/>　　CP capability index 能力指数<br/>　　CPK capability process index 模具制程能力参数<br/>　　SSQA standardized supplier quality audit 合格供货商质量评估<br/>　　FMEA failure model effectiveness analysis 失效模式分析</span></p><p><br/><span style=\"color: rgb(23, 54, 93);\">　　FQC运作类<br/><br/>　　AQL Acceptable Quality Level 运作类允收质量水平<br/>　　S/S Sample size 抽样检验样本大小<br/>　　ACC Accept 允收<br/>　　REE Reject 拒收<br/>　　CR Critical 极严重的<br/>　　MAJ Major 主要的<br/>　　MIN Minor 轻微的<br/>　　Q/R/S Quality/Reliability/Service 质量/可靠度/服务<br/>　　P/N Part Number 料号<br/>　　L/N Lot Number 批号<br/>　　AOD Accept On Deviation 特采<br/>　　UAI Use As It 特采<br/>　　FPIR First Piece Inspection Report 首件检查报告<br/>　　PPM Percent Per Million 百万分之一</span></p>', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_course`
--

CREATE TABLE `blog_course` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `intro` varchar(255) NOT NULL COMMENT '一句话介绍',
  `cover` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `vids` int(10) UNSIGNED NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '课程状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '同类下课程排序',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '课程内容描述',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `teacher` varchar(255) NOT NULL COMMENT '课程讲师介绍'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `blog_course`
--

INSERT INTO `blog_course` (`id`, `title`, `name`, `intro`, `cover`, `vids`, `create_time`, `category_id`, `status`, `sort`, `keywords`, `description`, `uid`, `teacher`) VALUES
(1, '全新的Facebook', '', '本节课程讲述facebook的新版介绍', 46, 0, 1464061929, 7, 1, 0, '', '本节课程讲述facebook的新版介绍本节课程讲述facebook的新版介绍本节课程讲述facebook的新版介绍本节课程讲述facebook的新版介绍本节课程讲述facebook的新版介绍本节课程讲述facebook的新版介绍', 1, '社交网路服务网站Facebook的首席运营官，杂志记者称她是富有经验的梦想家，最终将带领Facebook实现盈利并走得更远。'),
(2, '你是否真的需要一个Facebook Page', '', '你是否真的需要一个Facebook Page', 47, 0, 1464062220, 7, 1, 0, '', '你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page你是否真的需要一个Facebook Page', 0, ''),
(3, '丰足生物', '', '丰足生物', 48, 0, 1464068460, 13, 1, 0, '', '丰足生物丰足生物丰足生物丰足生物丰足生物丰足生物丰足生物丰足生物丰足生物丰足生物丰足生物丰足生物丰足生物', 0, ''),
(4, 'my facebook', NULL, 'my facebook', 0, 0, 1464662880, 7, 1, 1, 'my facebook', 'my facebook', 3, '');

-- --------------------------------------------------------

--
-- 表的结构 `blog_enum`
--

CREATE TABLE `blog_enum` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tid` int(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `issystem` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `remark` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_enum`
--

INSERT INTO `blog_enum` (`id`, `title`, `sort`, `pid`, `tid`, `name`, `value`, `issystem`, `remark`) VALUES
(1, '网站设置', 1, 0, 0, 'webset', '', 1, ''),
(6, '基本', 1, 101, 1, 'base', '', 1, ''),
(7, '内容', 0, 101, 1, 'con', '', 1, ''),
(8, '用户', 0, 101, 1, 'user', '', 1, ''),
(9, '系统', 0, 101, 1, 'sys', '', 1, ''),
(35, '关闭站点', 0, 1, 1, 'web_site_close', '', 1, ''),
(41, '开启', 0, 35, 1, 'open', '', 1, ''),
(42, '配置类型', 0, 1, 1, 'config_type_list', '', 1, '主要用于数据解析和页面表单的生成'),
(43, '数字', 0, 42, 1, 'number', '', 1, ''),
(44, '字符', 0, 42, 1, 'char', '', 1, ''),
(46, '关闭', 0, 35, 1, 'close', '', 1, '站点关闭后其他用户不能访问，管理员可以正常访问'),
(47, '文本', 0, 42, 1, 'text', '', 1, ''),
(48, '数组', 0, 42, 1, 'array', '', 1, ''),
(49, '枚举', 0, 42, 1, 'enum', '', 1, ''),
(50, '字段编辑页选项卡', 0, 80, 80, 'field_edit', '', 1, ''),
(51, '基础', 0, 50, 80, 'base', '', 1, ''),
(52, '高级', 0, 50, 80, 'advance', '', 1, ''),
(53, '字段类型', 0, 80, 80, 'field_type', '', 1, ''),
(54, '是否允许用户注册', 0, 1, 1, 'user_allow_register', '', 1, '是否开放用户注册'),
(55, '关闭注册', 0, 54, 1, 'closereg', '', 1, ''),
(56, '允许注册', 0, 54, 1, 'allowreg', '', 1, ''),
(57, '数字', 0, 53, 80, 'num', 'int(10) UNSIGNED NOT NULL', 1, ''),
(58, '字符串', 0, 53, 80, 'string', 'varchar(255) NOT NULL', 1, ''),
(59, '文本框', 0, 53, 80, 'area', 'text NOT NULL', 1, ''),
(60, '日期', 0, 53, 80, 'date', 'int(10) NOT NULL', 1, ''),
(61, '时间', 0, 53, 80, 'time', 'int(10) NOT NULL', 1, ''),
(62, '布尔', 0, 53, 80, 'bool', 'tinyint(2) NOT NULL', 1, ''),
(63, '枚举', 0, 53, 80, 'enum', 'varchar(255) NOT NULL', 1, ''),
(64, '单选', 0, 53, 80, 'radio', 'varchar(255) NOT NULL', 1, ''),
(65, '多选', 0, 53, 80, 'checkbox', 'varchar(255) NOT NULL', 1, ''),
(66, '编辑器', 0, 53, 80, 'editor', 'int(10) UNSIGNED NOT NULL', 1, ''),
(67, '编辑器（简单）', 0, 53, 80, 'simple_editor', 'text NOT NULL', 1, ''),
(68, '上传图片', 0, 53, 80, 'picture', 'int(10) UNSIGNED NOT NULL', 1, ''),
(69, '上传图片（多图）', 0, 53, 80, 'picture_multi', 'text NOT NULL', 1, ''),
(70, '上传附件', 0, 53, 80, 'attachment', 'int(10) UNSIGNED NOT NULL', 1, ''),
(71, '上传附件（多图）', 0, 53, 80, 'attachment_multi', 'text NOT NULL', 1, ''),
(72, '字段分组', 0, 80, 80, 'field_group', '', 1, ''),
(73, '基础', 0, 72, 80, 'base', '', 1, ''),
(74, '扩展', 0, 72, 80, 'extend', '', 1, ''),
(75, '字段是否显示', 0, 80, 80, 'is_show', '', 1, ''),
(76, '始终显示', 0, 75, 80, 'always', '', 1, ''),
(77, '新增显示', 0, 75, 80, 'add', '', 1, ''),
(78, '编辑显示', 0, 75, 80, 'edit', '', 1, ''),
(79, '不显示', 0, 75, 80, 'display', '', 1, ''),
(80, '模型字段', 0, 0, 0, 'model_field', '', 1, ''),
(81, '验证方式', 0, 80, 80, 'validate_type', '', 1, ''),
(82, '始终显示', 0, 81, 80, 'always', '', 1, ''),
(83, '新增显示', 0, 81, 80, 'add', '', 1, ''),
(84, '编辑显示', 0, 81, 80, 'edit', '', 1, ''),
(85, '不显示', 0, 81, 80, 'display', '', 1, ''),
(86, '验证时间', 0, 80, 80, 'validate_time', '', 1, ''),
(87, '始终', 0, 86, 80, 'always', '', 1, ''),
(88, '新增', 0, 86, 80, 'add', '', 1, ''),
(89, '编辑', 0, 86, 80, 'edit', '', 1, ''),
(90, '自动完成方式', 0, 80, 80, 'auto_type', '', 1, ''),
(91, '函数', 0, 90, 80, 'function', '', 1, ''),
(92, '字段', 0, 90, 80, 'field', '', 1, ''),
(93, '字符串', 0, 90, 80, 'string', '', 1, ''),
(94, '自动完成时间', 0, 80, 80, 'auto_time', '', 1, ''),
(95, '始终', 0, 94, 80, 'always', '', 1, ''),
(96, '新增', 0, 94, 80, 'add', '', 1, ''),
(97, '编辑', 0, 94, 80, 'edit', '', 1, ''),
(98, '开启开发者模式', 0, 1, 1, 'develop_mode', '', 1, '是否开启开发者模式'),
(99, '关闭', 0, 98, 1, 'close', '', 1, ''),
(100, '开启', 0, 98, 1, 'open', '', 1, ''),
(101, '设置分组', 0, 1, 1, 'group', '', 1, '网站分组设置'),
(102, '字段是否必填', 0, 80, 80, 'is_must', '', 1, ''),
(103, '是', 0, 102, 80, 'yes', '', 1, ''),
(104, '否', 0, 102, 80, 'no', '', 1, ''),
(108, '模型引擎', 0, 80, 80, 'engine_type', '', 1, ''),
(109, 'InnoDB', 0, 108, 80, 'InnoDB', 'InnoDB', 1, ''),
(110, 'MyISAM', 0, 108, 80, 'MyISAM', 'MyISAM', 1, ''),
(111, '是否需要主键', 0, 80, 80, 'need_pk', '', 1, ''),
(112, '是', 0, 111, 80, 'yes', '', 1, ''),
(113, '否', 0, 111, 80, 'no', '', 1, ''),
(114, '用户信息', 0, 0, 0, 'user_info', '', 1, ''),
(122, '扩展设置', 0, 0, 0, 'addons', '', 1, ''),
(123, '钩子类型', 0, 122, 122, 'type', '', 1, '钩子视图、控制器类型'),
(124, '视图', 0, 123, 122, 'view', '', 1, ''),
(125, '控制器', 0, 123, 122, 'control', '', 1, ''),
(127, '菜单管理', 0, 0, 0, 'menu', '', 1, ''),
(128, '分组', 0, 127, 127, 'group', '', 1, ''),
(129, '后台顶部按钮', 0, 128, 127, 'top', '1', 1, ''),
(130, '后台左侧按钮', 0, 128, 127, 'left', '2', 1, ''),
(131, '后台右顶部按钮', 0, 128, 127, 'right_top', '3', 1, ''),
(132, '后台右操作按钮', 0, 128, 127, 'right_handle', '4', 1, ''),
(133, '其他按钮', 0, 128, 127, 'other', '-1', 1, ''),
(134, '后台表单页按钮', 0, 128, 127, 'form_detail', '5', 1, ''),
(135, '视频', 0, 53, 80, 'video', 'varchar(255) NOT NULL', 1, ''),
(136, '数字(有符号)', 0, 53, 80, 'num2', 'int(10) NOT NULL', 1, ''),
(137, '字符串（文本域）', 0, 53, 80, 'stringText', 'varchar(255) NOT NULL', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `blog_hooks`
--

CREATE TABLE `blog_hooks` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_hooks`
--

INSERT INTO `blog_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'picture', '显示上传单张图片的钩子', 124, 1378982734, 'Picture', 1),
(2, 'pictureMulti', '显示上传多张图片的钩子', 124, 1382596073, 'PictureMulti', 1),
(3, 'attachment', '挂载单个附件的钩子', 124, 0, 'Attachment', 1),
(4, 'attachmentMulti', '挂载多个附件的钩子', 124, 0, 'AttachmentMulti', 1),
(5, 'datePicker', '日期控件钩子', 124, 0, 'DatePicker', 1),
(6, 'alipay', '支付宝插件挂载点', 124, 0, 'Alipay', 1),
(7, 'adminArticleEdit', '后台文本编辑器', 124, 0, 'EditorForAdmin', 1),
(8, 'polyv', '视频表单钩子', 124, 0, 'Polyv', 1),
(9, 'systemInfo', '用于服务器环境信息', 124, 0, 'SystemInfo', 1);

-- --------------------------------------------------------

--
-- 表的结构 `blog_log`
--

CREATE TABLE `blog_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '操作',
  `querystring` varchar(255) NOT NULL DEFAULT '' COMMENT 'URL',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP',
  `date` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：登陆失败; 1：操作成功；2：无权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `blog_menu`
--

CREATE TABLE `blog_menu` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` smallint(4) NOT NULL DEFAULT '0' COMMENT '-1-待定 0-默认状态 1-顶部 2-左侧 3-右侧顶部 4-右侧操作',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `auth_group` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `get_param` text,
  `ajax_param` text,
  `is_dev` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_menu`
--

INSERT INTO `blog_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `icon`, `auth_group`, `get_param`, `ajax_param`, `is_dev`, `status`) VALUES
(28, '首页', 0, 0, 'index/getSider', 0, '', 1, 'icon-home', 28, '', '', 0, 0),
(29, '快捷操作', 28, 0, '', 0, '', 2, 'icon-bookmark-o', 28, '', '', 0, 0),
(30, '用户信息', 29, 0, 'user/info', 0, '', 2, '', 28, '', '', 0, 0),
(31, 'ceshi3', 30, 0, '', 0, '', 0, '', 28, NULL, '', 0, 0),
(32, '用户组管理', 29, 0, 'user/group', 0, '', 0, '', 28, '', '', 0, 0),
(33, '服务器', 28, 0, '', 0, '', 2, 'icon-globe', 28, NULL, '', 0, 0),
(34, '环境信息', 33, 0, 'index/info', 0, '', 2, '', 28, NULL, '', 0, 0),
(35, '系统', 0, 0, 'config/getSider', 0, '', 1, 'icon-cog', 35, NULL, '', 0, 0),
(36, '系统设置', 35, 0, '', 0, '', 2, 'icon-gears', 35, NULL, '', 0, 0),
(37, '网站设置', 36, 0, 'config/set', 0, '', 2, '', 35, NULL, '', 0, 0),
(38, '分类设置', 36, 0, 'category/index', 0, '', 2, '', 35, NULL, '', 0, 0),
(39, '配置管理', 36, 0, 'config/index', 0, '', 2, '', 35, NULL, '', 0, 0),
(40, '菜单管理', 36, 0, 'menu/index', 0, '', 2, '', 35, NULL, '', 0, 0),
(41, '导航管理', 36, 0, 'nav/index', 0, '', 2, '', 35, NULL, '', 0, 0),
(42, '模型管理', 36, 0, 'model/info', 0, '', 2, '', 35, NULL, '', 0, 0),
(43, '枚举管理', 36, 0, 'enum/index', 0, '', 2, '', 35, NULL, '', 0, 0),
(44, '数据备份', 35, 0, '', 0, '', 2, 'icon-hdd-o', 35, NULL, '', 0, 0),
(45, '备份数据库', 44, 0, 'database/exportInfo', 0, '', 2, '', 35, NULL, '', 0, 0),
(46, '还原数据库', 44, 0, 'database/importInfo', 0, '', 2, '', 35, NULL, '', 0, 0),
(47, '内容', 0, 0, 'article/getSider', 0, '', 1, 'icon-edit', 47, NULL, '', 0, 0),
(48, '个人中心', 47, 0, '', 0, '', 2, 'icon-male', 47, NULL, '', 0, 0),
(49, '草稿箱', 48, 0, 'article/draftbox', 0, '', 2, '', 47, NULL, '', 0, 0),
(50, '待审核', 48, 0, 'article/examine', 0, '', 2, '', 47, NULL, '', 0, 0),
(51, '回收站', 47, 0, '', 0, '', 2, 'icon-trash-o', 47, NULL, '', 0, 0),
(52, '回收站', 51, 0, 'article/recycle', 0, '', 2, '', 47, NULL, '', 0, 0),
(53, '新增', 42, 0, 'model/infoAdd', 0, '', 3, '', 35, NULL, '', 0, 0),
(54, '用户', 0, 0, 'user/getSider', 0, '', 1, 'icon-users', 54, NULL, '', 0, 0),
(55, '用户管理', 54, 0, '', 0, '', 2, 'icon-user', 54, NULL, '', 0, 0),
(56, '用户信息', 55, 0, 'user/info', 0, '', 2, '', 54, NULL, '', 0, 0),
(57, '用户组管理', 55, 0, 'user/group', 0, '', 2, '', 54, NULL, '', 0, 0),
(58, '行为管理', 54, 0, '', 0, '', 2, 'icon-user-md', 54, NULL, '', 0, 0),
(59, '用户行为', 58, 0, 'user/action', 0, '', 2, '', 54, NULL, '', 0, 0),
(60, '行为日志', 58, 0, 'user/actionLog', 0, '', 2, '', 54, NULL, '', 0, 0),
(61, '扩展', 0, 0, 'addons/getSider', 0, '', 1, 'icon-cubes', 61, NULL, '', 0, 0),
(62, '扩展管理', 61, 0, '', 0, '', 2, 'icon-wrench', 61, NULL, '', 0, 0),
(63, '插件管理', 62, 0, 'addons/index', 0, '', 2, '', 61, NULL, '', 0, 0),
(64, '钩子管理', 62, 0, 'hooks/index', 0, '', 2, '', 61, NULL, '', 0, 0),
(65, '已装插件', 61, 0, '', 0, '', 2, 'icon-puzzle-piece', 61, NULL, '', 0, 0),
(66, '编辑', 40, 0, 'edit', 0, '', 4, '', 35, 'id', '', 0, 0),
(67, '删除', 40, 0, 'del', 0, '', 4, '', 35, 'id', '{ask:0,layer:{title:\'操作提示\',content:\'确定要执行该操作吗？\',btn: [\'确定\', \'取消\']}}', 0, 0),
(68, '新增', 40, 0, 'add', 0, '', 3, '', 35, 'pid', '', 0, 0),
(69, '删除', 40, 0, 'del', 0, '', 3, '', 35, '', '{ask:0,form:\'ids\',type:\'post\',layer:{ btn:[\'确定\',\'取消\'],content:\'确定删除吗？\'}}', 0, 0),
(70, '内容管理', 47, 0, '', 0, '', 2, 'icon-list-alt', 47, '', '', 0, 0),
(71, '新增', 70, 0, 'add', 0, '', 3, '', 47, 'model,tid', '', 0, 0),
(72, '删除', 70, 0, 'remove', 0, '', 3, '', 47, 'model', '{ask:0,type:\'post\',form:\'form-small\',layer:{title:\'操作提示\',content:\'确定要执行该操作吗？\',btn: [\'确定\', \'取消\']}}', 0, 0),
(73, '编辑', 70, 0, 'edit', 0, '', 4, '', 47, 'model,tid,id', '', 0, 0),
(74, '删除', 70, 0, 'remove', 0, '', 4, '', 47, 'model,id', '{ask:0,layer:{title:\'操作提示\',content:\'确定要执行该操作吗？\',btn: [\'确定\', \'取消\']}}', 0, 0),
(75, '评论管理', 70, 0, 'comment', 0, '', 3, '', 47, '', '', 0, 0),
(76, '启用', 70, 0, 'enable', 0, '', 3, '', 47, 'model', '{type:\'post\',form:\'form-small\'}', 0, 0),
(77, '禁用', 70, 0, 'disable', 0, '', 3, '', 47, 'model', '{type:\'post\',form:\'form-small\'}', 0, 0),
(78, '清空', 52, 0, 'del', 0, '清空回收站', 3, '', 47, '', '{type:\'post\',form:\'form-small\'}', 0, 0),
(79, '还原', 52, 0, 'restore', 0, '还原内容', 3, '', 47, '', '{type:\'post\',form:\'form-small\'}', 0, 0),
(80, '还原', 52, 0, 'restore', 0, '', 4, '', 47, 'id,model', '', 0, 0),
(81, '课程管理', 47, 0, '', 0, '', 2, 'icon-book', 47, '', '', 0, 0),
(82, '课程列表', 81, 0, 'article/course', 0, '', 2, '', 47, '', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_model`
--

CREATE TABLE `blog_model` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '模型名称',
  `engine_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '1-MyISAM 2-InooDB 3-MEMORY',
  `need_pk` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `field_sort` varchar(12000) NOT NULL DEFAULT '',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-禁用  1-正常'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_model`
--

INSERT INTO `blog_model` (`id`, `name`, `title`, `engine_type`, `need_pk`, `field_sort`, `create_time`, `status`) VALUES
(1, 'base', '基础模型', 109, 112, '', 1459847012, 1),
(2, 'article', '文章', 110, 112, '15,16,77,37,17,18,19,32,47,29,62,33', 1461652519, 1),
(3, 'video', '视频', 109, 112, '21,78,26,23,31,50,24,27,25,60,30,61,48,34', 1462330002, 1),
(4, 'single', '单页', 110, 112, '38,39,76,42,40,41,43,44,45,49,46,75', 1463729195, 1),
(5, 'course', '课程', 109, 112, '51,52,79,53,80,54,56,57,55,59,58,83,84', 1463995113, 1),
(6, 'news', '新闻', 109, 112, '64,65,66,67,68,69,70,72,74,71,63,73', 1464225733, 1);

-- --------------------------------------------------------

--
-- 表的结构 `blog_model_field`
--

CREATE TABLE `blog_model_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `model_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '字段标题',
  `field_type` varchar(255) NOT NULL DEFAULT '' COMMENT '表单类型',
  `field_define` varchar(255) NOT NULL DEFAULT '' COMMENT '字段定义',
  `param` varchar(12000) NOT NULL DEFAULT '' COMMENT '参数',
  `field_default` varchar(255) NOT NULL DEFAULT '' COMMENT '默认值',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '字段备注',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1 不显示 1 始终显示 2 新增显示 3 编辑显示',
  `is_must` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-非必填 1-必填',
  `field_group` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-基础  2-扩展',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `validate_type` varchar(255) NOT NULL DEFAULT '' COMMENT '验证方式',
  `validate_rule` varchar(255) NOT NULL DEFAULT '' COMMENT '验证规则',
  `error_info` varchar(255) NOT NULL DEFAULT '' COMMENT '出错提示',
  `validate_time` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1-新增   2-编辑   3-始终',
  `auto_type` varchar(255) NOT NULL DEFAULT 'function' COMMENT '自动完成方式',
  `auto_rule` varchar(255) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1-新增 2-编辑 3-始终'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_model_field`
--

INSERT INTO `blog_model_field` (`id`, `model_id`, `name`, `title`, `field_type`, `field_define`, `param`, `field_default`, `remark`, `is_show`, `is_must`, `field_group`, `create_time`, `update_time`, `validate_type`, `validate_rule`, `error_info`, `validate_time`, `auto_type`, `auto_rule`, `auto_time`) VALUES
(1, 1, 'title', '标题', '58', 'varchar(255) NOT NULL', '', '', '', 76, 103, 73, 1460452046, 1460452046, '82', '', '', 87, '91', '', 95),
(2, 1, 'name', '标识', '58', 'varchar(255)', '', '', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(13, 1, 'content', '内容', '66', 'int(10) UNSIGNED NOT NULL', '', '', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(14, 1, 'cover', '封面', '68', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(15, 2, 'title', '标题', '58', 'varchar(255) NOT NULL', '', '', '', 76, 103, 73, 1460452046, 1460452046, '82', '', '', 87, '91', '', 95),
(16, 2, 'name', '标识', '58', 'varchar(255) ', '', '', '', 79, 104, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(17, 2, 'content', '内容', '66', 'int(10) UNSIGNED NOT NULL', '', '', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(18, 2, 'cover', '封面', '68', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(19, 2, 'create_time', '创建日期', '60', 'int(10) NOT NULL', '', '0', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(21, 3, 'title', '标题', '58', 'varchar(255) NOT NULL', '', '', '视频标题', 76, 103, 73, 1460452046, 1460452046, '82', '', '', 87, '91', '', 95),
(23, 3, 'description', '视频描述', '59', 'text NOT NULL', '', '', '视频描述', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(24, 3, 'views', '播放次数', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '视频播放次数', 79, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(25, 3, 'duration', '时长', '58', 'varchar(255) NOT NULL', '', '', '视频时长', 79, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(26, 3, 'tag', '视频标签', '58', 'varchar(255) NOT NULL', '', '', '视频标签，以英文逗号隔开', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(27, 3, 'create_time', '上传时间', '60', 'int(10) NOT NULL', '', '', '视频上传时间', 79, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(29, 2, 'category_id', '所属分类', '57', 'int(10) UNSIGNED NOT NULL', '', '', '', 79, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(30, 3, 'category_id', '所属分类', '57', 'int(10) UNSIGNED NOT NULL', '', '', '所属分类', 79, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(31, 3, 'cover', '封面', '68', 'int(10) UNSIGNED NOT NULL', '', '', '上传视频封面', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(32, 2, 'views', '浏览次数', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '浏览次数', 78, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(33, 2, 'status', '状态', '136', 'int(10) NOT NULL', '', '1', '信息状态', 79, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(34, 3, 'status', '状态', '136', 'int(10) NOT NULL', '', '1', '视频状态', 79, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(37, 2, 'description', '描述', '137', 'varchar(255) NOT NULL', '', '', '', 76, 104, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(38, 4, 'title', '标题', '58', 'varchar(255) NOT NULL', '', '', '', 76, 103, 73, 1460452046, 1460452046, '82', '', '', 87, '91', '', 95),
(39, 4, 'name', '标识', '58', 'varchar(255) NOT NULL', '', '', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(40, 4, 'content', '内容', '66', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(41, 4, 'cover', '封面', '68', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(42, 4, 'description', '描述', '137', 'varchar(255) NOT NULL', '', '', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(43, 4, 'create_time', '创建日期', '60', 'int(10) NOT NULL', '', '0', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(44, 4, 'category_id', '所属分类', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '', 79, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(45, 4, 'views', '浏览次数', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(46, 4, 'status', '状态', '136', 'int(10) NOT NULL', '', '1', '', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(47, 2, 'sort', '排序', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(48, 3, 'sort', '排序', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(49, 4, 'sort', '排序', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(50, 3, 'vid', '上传视频', '135', 'varchar(255) NOT NULL', '', '', '上传视频', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(51, 5, 'title', '标题', '58', 'varchar(255) NOT NULL', '', '', '', 76, 103, 73, 1460452046, 1460452046, '82', '', '', 87, '91', '', 95),
(52, 5, 'name', '标识', '58', 'varchar(255)', '', '', '', 79, 104, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(53, 5, 'intro', '介绍', '58', 'varchar(255) NOT NULL', '', '', '一句话介绍', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(54, 5, 'cover', '封面', '68', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(55, 5, 'vids', '视频', '57', 'int(10) UNSIGNED NOT NULL', '', '', '', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(56, 5, 'create_time', '创建时间', '57', 'int(10) UNSIGNED NOT NULL', '', '', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(57, 5, 'category_id', '所属分类', '57', 'int(10) UNSIGNED NOT NULL', '', '', '', 79, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(58, 5, 'status', '状态', '136', 'int(10) NOT NULL', '', '1', '课程状态', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(59, 5, 'sort', '排序', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '同类下课程排序', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(60, 3, 'cid', '所属课程id', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '视频所属课程', 79, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(61, 3, 'uid', '用户ID', '57', 'int(10) UNSIGNED NOT NULL', '', '', '用户ID', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(62, 2, 'uid', '用户ID', '57', 'int(10) UNSIGNED NOT NULL', '', '', '用户ID', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(63, 6, 'uid', '用户ID', '57', 'int(10) UNSIGNED NOT NULL', '', '', '用户ID', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(64, 6, 'title', '标题', '58', 'varchar(255) NOT NULL', '', '', '新闻标题', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(65, 6, 'name', '标识', '58', 'varchar(255)', '', '', '只能为英文', 79, 104, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(66, 6, 'keywords', '关键词', '58', 'varchar(255) NOT NULL', '', '', '新闻关键词', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(67, 6, 'description', '描述', '137', 'varchar(255) NOT NULL', '', '', '新闻描述', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(68, 6, 'content', '内容', '66', 'int(10) UNSIGNED NOT NULL', '', '', '新闻内容', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(69, 6, 'cover', '封面', '68', 'int(10) UNSIGNED NOT NULL', '', '0', '新闻封面图片', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(70, 6, 'create_time', '创建日期', '60', 'int(10) NOT NULL', '', '0', '', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(71, 6, 'category_id', '所属分类', '57', 'int(10) UNSIGNED NOT NULL', '', '', '所属分类', 79, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(72, 6, 'views', '浏览次数', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '浏览次数', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(73, 6, 'status', '状态', '136', 'int(10) NOT NULL', '', '1', '', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(74, 6, 'sort', '排序', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(75, 4, 'uid', '用户ID', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '用户ID', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(76, 4, 'keywords', '关键词', '58', 'varchar(255) NOT NULL', '', '', '关键词', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(77, 2, 'keywords', '关键词', '58', 'varchar(255) NOT NULL', '', '', '关键词', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(78, 3, 'keywords', '关键词', '58', 'varchar(255) NOT NULL', '', '', '关键词', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(79, 5, 'keywords', '关键词', '58', 'varchar(255) NOT NULL', '', '', '关键词', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(80, 5, 'description', '描述', '137', 'varchar(255) NOT NULL', '', '', '课程内容描述', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(81, 1, 'keywords', '关键词', '58', 'varchar(255) NOT NULL', '', '', '关键词', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(82, 1, 'description', '描述', '137', 'varchar(255) NOT NULL', '', '', '描述', 76, 103, 73, 0, 0, '82', '', '', 87, '91', '', 95),
(83, 5, 'uid', '所属用户', '57', 'int(10) UNSIGNED NOT NULL', '', '0', '', 79, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95),
(84, 5, 'teacher', '讲师介绍', '137', 'varchar(255) NOT NULL', '', '', '课程讲师介绍', 76, 103, 74, 0, 0, '82', '', '', 87, '91', '', 95);

-- --------------------------------------------------------

--
-- 表的结构 `blog_nav`
--

CREATE TABLE `blog_nav` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '导航标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '导航链接',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-否 1-是 2-外部链接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '导航排序',
  `cid` int(10) NOT NULL DEFAULT '-1' COMMENT '分类id',
  `color` varchar(255) NOT NULL DEFAULT '' COMMENT '导航分类颜色',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1- 启用 0-禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_nav`
--

INSERT INTO `blog_nav` (`id`, `title`, `url`, `target`, `sort`, `cid`, `color`, `icon`, `status`) VALUES
(1, '网站首页', '', 0, 1, 0, '', '', 1),
(2, '分享达人', 'nbsharer', 0, 2, 0, '', '', 1),
(3, '外贸视频', 'course', 0, 4, 1, '', '', 1),
(4, '外贸干货', 'trade', 0, 5, 2, '', '', 1),
(5, '关于我们', 'about/us', 0, 6, 6, '', '', 1),
(6, '外贸资讯', 'news', 0, 3, 0, '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `blog_news`
--

CREATE TABLE `blog_news` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `title` varchar(255) NOT NULL COMMENT '新闻标题',
  `name` varchar(255) DEFAULT NULL COMMENT '只能为英文',
  `keywords` varchar(255) NOT NULL COMMENT '新闻关键词',
  `description` varchar(255) NOT NULL COMMENT '新闻描述',
  `content` int(10) UNSIGNED NOT NULL COMMENT '新闻内容',
  `cover` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '新闻封面图片',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT '所属分类',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `status` int(10) NOT NULL DEFAULT '1',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `blog_news`
--

INSERT INTO `blog_news` (`id`, `uid`, `title`, `name`, `keywords`, `description`, `content`, `cover`, `create_time`, `category_id`, `views`, `status`, `sort`) VALUES
(1, 1, '5月1日起，这些船公司的附加费用要做调整啦！', 'n1', '外贸', '马士基航运宣布，自2016年5月1日起，由中国内地，香港，印度尼西亚，缅甸，韩国，马来西亚，菲律宾，新加坡，泰国，越南，柬埔寨，台湾 出口至波多黎各，多米尼加，海地牙买加，委内瑞拉，特立尼达和多巴哥，巴拿马，哥伦比亚航线运价上调GRI(综合费率上涨附加费)', 18, 50, 1464231420, 17, 21, 1, 0),
(2, 1, '外贸新政：部分企业出口增值税可免征不退', 'n2', '增值税', '针对跨境电商行业，该《意见》中表示，将总结中国(杭州)跨境电子商务综合试验区和市场采购贸易方式的经验，扩大试点范围，对试点地区符合监管条件的出口企业，如不能提供进项税发票，按规定实行增值税免征不退政策，并在发展中逐步规范和完善。', 19, 0, 1464248100, 16, 22, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_note`
--

CREATE TABLE `blog_note` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `up_uid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `origin_uid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `content` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `cover` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `views` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '信息状态',
  `description` varchar(1800) NOT NULL DEFAULT '',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `blog_note`
--

INSERT INTO `blog_note` (`id`, `uid`, `up_uid`, `origin_uid`, `category_id`, `title`, `name`, `content`, `cover`, `views`, `status`, `description`, `sort`, `keywords`, `create_time`, `update_time`) VALUES
(1, 21, 0, 0, 4, '常用外贸专业术语', 'a1', 1, 38, 24, 1, '常用外贸专业术语', 0, '', 1465740200, 0),
(2, 21, 0, 0, 4, '单证制作1', 'a2', 2, 37, 9, 1, '单证制作', 0, '', 1463740320, 1502357285),
(3, 21, 0, 0, 4, '单证制作', 'a2', 2, 37, 18, 1, '单证制作', 0, '', 1463740320, 0),
(5, 21, 0, 0, 2, '苹果公司的研发预算是巨大的但效率惊人', 'ceshi', 23, 0, 8, 1, '', 0, '', 1464597420, 1502352885),
(6, 21, 0, 0, 2, 'laravel文档', 't2', 24, 0, 5, 1, '外贸', 0, '外贸', 1464680400, 1502352797),
(7, 21, 0, 0, 4, '外贸术语-外贸业务中常用的术语', '', 25, 0, 8, 1, '外贸业务中常用的术语', 0, '外贸术语', 1464830160, 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_picture`
--

CREATE TABLE `blog_picture` (
  `id` int(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `md5` char(32) NOT NULL DEFAULT '',
  `sha1` char(40) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_picture`
--

INSERT INTO `blog_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '2', '', '', '', 0, 0),
(2, '/upload/picture/2016-05-05/572b2dcb37b4f.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462447563),
(3, '/upload/picture/2016-05-06/572be8d9d94bb.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462495449),
(4, '/upload/picture/2016-05-06/572bf1cfc25d0.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462497743),
(5, '/upload/picture/2016-05-06/572bf1de9aad6.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462497758),
(6, '/upload/picture/2016-05-06/572bf21e2202d.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462497822),
(7, '/upload/picture/2016-05-06/572bf2cf09e3b.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462497999),
(8, '/upload/picture/2016-05-06/572c0052e56e2.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462501458),
(9, '/upload/picture/2016-05-06/572c00ba10886.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462501562),
(10, '/upload/picture/2016-05-06/572c015798f17.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462501719),
(11, '/upload/picture/2016-05-06/572c040207823.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462502402),
(12, '/upload/picture/2016-05-06/572c0513189b1.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462502675),
(13, '/upload/picture/2016-05-06/572c05d6a3ad8.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462502870),
(14, '/upload/picture/2016-05-06/572c0730f3ecb.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462503216),
(15, '/upload/picture/2016-05-06/572c0775b774f.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462503285),
(16, '/upload/picture/2016-05-06/572c085aa7066.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462503514),
(17, '/upload/picture/2016-05-06/572c08f340623.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462503667),
(18, '/upload/picture/2016-05-06/572c09e280703.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462503906),
(19, '/upload/picture/2016-05-06/572c0a899873e.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462504073),
(20, '/upload/picture/2016-05-06/572c0d5772f80.jpg', '', 'df913c1e89c167085fa6eb4fa827a2c4', 'e89ee14df08c4aae1b1af4479e0b3b0ea664ae21', 0, 1462504791),
(21, '/upload/picture/2016-05-06/572c0ed8da662.jpg', '', 'df913c1e89c167085fa6eb4fa827a2c4', 'e89ee14df08c4aae1b1af4479e0b3b0ea664ae21', 0, 1462505176),
(22, '/upload/picture/2016-05-06/572c36616d076.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462515297),
(23, '/upload/picture/2016-05-06/572c3d9715be2.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462517143),
(24, '/upload/picture/2016-05-06/572c53d495fdf.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462522836),
(25, '/upload/picture/2016-05-06/572c5c9857339.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462525080),
(26, '/upload/picture/2016-05-06/572c6b678495c.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462528871),
(27, '/upload/picture/2016-05-06/572c6f2a6026b.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462529834),
(28, '/upload/picture/2016-05-06/572c71ed5aba2.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462530541),
(29, '/upload/picture/2016-05-06/572c735697a09.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462530902),
(30, '/upload/picture/2016-05-06/572c79d67ff7a.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1462532566),
(31, '/upload/picture/2016-05-10/573149ffcfb86.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462847999),
(32, '/upload/picture/2016-05-11/5732e98ccca0c.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462954380),
(33, '/upload/picture/2016-05-11/5732ea01b101f.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1462954497),
(34, '/upload/picture/2016-05-12/57341b409339d.jpg', '', 'd7cb99dcba4ffa56f485f7cb458c47f6', '7bc62d1a5cbb82654bf8100ff632814ba5e063f3', 0, 1463032640),
(35, '/upload/picture/2016-05-12/57342e6cb7b50.jpg', '', 'd7cb99dcba4ffa56f485f7cb458c47f6', '7bc62d1a5cbb82654bf8100ff632814ba5e063f3', 0, 1463037548),
(36, '/upload/picture/2016-05-19/573d17b7d817b.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1463621559),
(37, '/upload/picture/2016-05-21/574004d127568.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1463813329),
(38, '/upload/picture/2016-05-21/57400dde0c6e7.jpg', '', '89ea98d3da9a07211f8e828d4042883e', 'b1e49f07a40eeef203b9f05df3a827d2907c7ab8', 0, 1463815646),
(39, '/upload/picture/2016-05-21/57400fd3df3fc.jpg', '', 'c5f4b9e68ab978686d962629f84af282', '10736ef87edc3de970cf8ccf0f3a4c9d08b4c0a1', 0, 1463816147),
(40, '/upload/picture/2016-05-21/57401046156b2.jpg', '', '56f444551ea87912629ff9ff91982912', '0aa68105e3ffc7e0b340ba863019ada84d52835d', 0, 1463816262),
(41, '/upload/picture/2016-05-23/5742b71cc0788.jpg', '', '0210c0a5d89b582f03e99e6a87474d0a', 'ee859a762b46c896f7423f200fd8be86420703ae', 0, 1463990044),
(42, '/upload/picture/2016-05-23/5742b7de6f8b1.jpg', '', '49a0b538c23c8b12c9a0e5d528f6ee41', '98631799911b8d0be108254049e5b0fea6d74ae3', 0, 1463990238),
(43, '/upload/picture/2016-05-23/5742b8be6d805.jpg', '', '9b0eac75c8549628eec14c9459c9c282', '6abd87ae3d519473987ab5b1be87bd78f4d982f1', 0, 1463990462),
(44, '/upload/picture/2016-05-23/5742b96a42ac7.jpg', '', '1b05a7402a1d61d5088e10b51c05c2cb', 'ff22d46371d8a43b1a518bc2035c5d8f7001ca1d', 0, 1463990634),
(45, '/upload/picture/2016-05-23/5742b9ac14a41.jpg', '', '82fdddeb0dbdf1c73c7bb868ec348cc4', '40113fa3c76a7a6d23b0c9ed0aa7bd640d4fa291', 0, 1463990700),
(46, '/upload/picture/2016-05-24/5743cdee8bae7.jpg', '', 'a3f7e476461b1cb559ee760f8f891970', '23204bdf4f340918652ba9cd9aca6f3d05fb0597', 0, 1464061422),
(47, '/upload/picture/2016-05-24/5743d14707ea8.jpg', '', '7bfe5a6c0c5bd681ab15c59353a222ad', 'bb6df1d53887a2047ae6ea3f82dd27c382ba9e8d', 0, 1464062279),
(48, '/upload/picture/2016-05-24/5743eb1e8041a.jpg', '', 'a010bc3a20ecbfcae9410d5bb9eb763c', 'c34dcdbe6547f95f77bdeb1913a99a9c9e6c794f', 0, 1464068894),
(49, '/upload/picture/2016-05-25/574522fd752f3.jpg', '', 'd66b3ea671f5a97677309f6b3db62511', 'a33c10e739cf630f3bb956f81cd57c0f2870083c', 0, 1464148733),
(50, '/upload/picture/2016-05-26/574666a6f0da0.jpg', '', 'f48366562ceeb87cfac37fb6a9c33117', '9aa695bf81b712f7960062ff3ad9c1023d2ca1f8', 0, 1464231591),
(51, '/upload/picture/2016-05-31/574cfc412b8ad.jpg', '', '8d74fb34f0ac2368f065ef9001e016b5', '3e723755882e494dc8870d9aaabbc454aa7434b9', 0, 1464663105),
(52, '/upload/picture/2016-05-31/574d00d2ab597.jpg', '', '8d74fb34f0ac2368f065ef9001e016b5', '3e723755882e494dc8870d9aaabbc454aa7434b9', 0, 1464664274),
(53, '/upload/picture/2016-05-31/574d01b02d27b.jpg', '', '8d74fb34f0ac2368f065ef9001e016b5', '3e723755882e494dc8870d9aaabbc454aa7434b9', 0, 1464664496),
(54, '/upload/picture/2016-05-31/574d0298199bd.jpg', '', '8d74fb34f0ac2368f065ef9001e016b5', '3e723755882e494dc8870d9aaabbc454aa7434b9', 0, 1464664728),
(55, '/upload/picture/2016-06-01/574e3ed65476c.jpg', '', '8d74fb34f0ac2368f065ef9001e016b5', '3e723755882e494dc8870d9aaabbc454aa7434b9', 0, 1464745686);

-- --------------------------------------------------------

--
-- 表的结构 `blog_session`
--

CREATE TABLE `blog_session` (
  `id` bigint(64) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `data_key` varchar(255) NOT NULL,
  `login_flag` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `notify_flag` smallint(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_session`
--

INSERT INTO `blog_session` (`id`, `uid`, `session_id`, `session_expire`, `data_key`, `login_flag`, `notify_flag`) VALUES
(435, 21, 'MVKaOVuiFzENgyqsx6HEJc1V2JHY2DPHBvra8JkA', 1501905132, 'indexUid', 0, 0),
(440, 21, 'BaTdFdu3e8KyLrmVX9KZJCOpzzG2H4fT1JxJhGkH', 1502950418, 'indexUid', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_single`
--

CREATE TABLE `blog_single` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cover` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '1',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `keywords` varchar(255) NOT NULL COMMENT '关键词'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `blog_single`
--

INSERT INTO `blog_single` (`id`, `title`, `name`, `content`, `cover`, `description`, `create_time`, `category_id`, `views`, `status`, `sort`, `uid`, `keywords`) VALUES
(1, '关于我们', 'us', 3, 0, '', 1464311340, 6, 117, 1, 0, 0, ''),
(2, '常见问题', 'faq', 22, 0, '常见问题', 1464312960, 20, 18, 1, 0, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `blog_user`
--

CREATE TABLE `blog_user` (
  `uid` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `groupid` smallint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '-1 禁止登陆 0-游客 1-超级管理员  2-管理员 3-代理商 4-客服 5-主账户 6-子账户 7-试用帐号',
  `package_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `support_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `agency_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `administrator_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `realname` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '固定电话',
  `password` varchar(255) NOT NULL DEFAULT '',
  `salt` char(4) NOT NULL DEFAULT 'abcd',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1-已删除用户  0-待审核 1-审核通过 2-已审核未通过  ',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-男 1-女',
  `regtime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `begin_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `end_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_user`
--

INSERT INTO `blog_user` (`uid`, `pid`, `groupid`, `package_id`, `support_id`, `agency_id`, `admin_id`, `administrator_id`, `name`, `realname`, `email`, `mobile`, `tel`, `password`, `salt`, `status`, `sex`, `regtime`, `begin_time`, `end_time`, `update_time`) VALUES
(1, 0, 1, 0, 0, 0, 0, 0, 'admin', '', '', '', '', '2051a11af6858fc4b4cca7c55a70d565', 'abcd', 1, 0, 0, 0, 2519660800, 0),
(2, 0, 5, 1, 14, 12, 11, 1, 'xbcdcl', '', '8888888@qq.com', '13288888888', '029-68686809', '95a4fc972fd45bcf21e51568bd212c4a', 'yMS7', 1, 1, 1475977402, 0, 0, 0),
(3, 0, 5, 0, 14, 12, 11, 1, 'xayntrq', '', '8888888@qq.com', '13288888888', '029-68686809', 'be0c6a0105003ff4ca84eff2bd5127db', 'BZx8', 1, 0, 1475977491, 0, 0, 0),
(7, 0, 5, 0, 14, 12, 11, 1, 'Wstitanium', '', 'Guohong223@126.com', '15091520899', '862986514515', '77453922703e7200557f9b401c2c5a97', 'gInp', 1, 1, 1487243009, 0, 0, 0),
(10, 0, 5, 5, 15, 12, 11, 1, 'Victarbio', '', '2853100187@qq.com', '18729069629', '862968643155', '4e1d6296dbce13d85eade960ffe01db0', 'ZqJS', 1, 1, 1487411633, 1481990400, 1513526400, 0),
(11, 0, 2, 0, 0, 0, 0, 1, 'somy1', '', '222222@qq.com', '', '', '13b5d1ee464af8b01fa41772814faa56', '-XXR', 1, 0, 1488178416, 0, 2519654400, 0),
(12, 0, 3, 0, 0, 0, 11, 1, 'somy', '', '34234223@qq.com', '', '', 'e148082083ba22f890f1197af0c1d8ca', 'Qzwn', 1, 0, 1488181596, 0, 2519654400, 0),
(13, 0, 3, 0, 0, 0, 11, 1, 'dev', '', '342342342@qq.com', '', '', '6f74dc80f9f018dd685b815332a345e6', 'y#SI', 1, 0, 1488181645, 0, 2519660800, 0),
(14, 0, 4, 0, 0, 12, 11, 1, 'zhangc', '', '2041952447@qq.com', '', '', 'e57f6c9f1a3a2afb384e78d0594556d9', 'WgjZ', 1, 1, 1488188091, 1482854400, 1809187200, 0),
(15, 0, 4, 0, 0, 12, 11, 1, 'sherr', '', '3401482395@qq.com', '', '', 'b2d17d608641c46024e1e973f070f4af', 'QxsK', 1, 1, 1488188184, 1488297600, 1798819200, 0),
(16, 0, 4, 0, 0, 12, 11, 1, 'liuyr', '', 'sddcsd@qq.com', '', '', '311b6d52be4ddec6358e7b33bfd290e7', 'kzcc', 1, 0, 1488188216, 1489334400, 1804867200, 0),
(17, 0, 4, 0, 0, 12, 11, 1, 'liut', '', 'dddddd@qq.com', '', '', '9e2162545b25d01e5a665ed5285d8d63', 'NPli', 1, 0, 1488188276, 1489334400, 1804867200, 0),
(18, 0, 4, 0, 0, 12, 11, 1, 'zhouyp', '', 'kpojoj@qq.com', '', '', '8497c625796b661f828f5e278ea6e342', 'hyNp', 1, 0, 1488188305, 1489334400, 1804867200, 0),
(19, 0, 4, 0, 0, 13, 11, 1, 'sam', '', '9999@qq.com', '', '', '0b5a7e86bc22d88343889afd5c3a61b3', 'BJMX', 1, 0, 1488190097, 1488124800, 1803657600, 0),
(20, 0, 5, 1, 19, 13, 11, 1, 'icebr', '', '9877665@qq.com', '13287653452', '029-87654323', '563c2c579365346da7f7a6c03859a894', '4zkr', 1, 0, 1488190390, 1488124800, 1519660800, 0),
(21, 20, 6, 0, 19, 13, 11, 1, 'vellw', '', '444444@qq.com', '13227634598', '029-87654323', '38788a3315c9bcccd173ae47081db010', 'lnBm', 1, 0, 1488190686, 1488124800, 1519660800, 0),
(46, 0, 5, 1, 15, 12, 11, 1, 'seven', '', '461112563@qq.com', '15319798138', '029-68686809', 'b5dafdcb02ff83beeaee117113608eb3', 'WHCC', 1, 1, 1488445764, 1488297600, 1496160000, 0),
(49, 46, 6, 0, 15, 12, 11, 1, 'JingSeven', '', '461112563@qq.com', '15319798138', '029-68686809', 'b5dafdcb02ff83beeaee117113608eb3', 'WHCC', 1, 0, 1488445823, 1488297600, 1496160000, 0),
(51, 0, 5, 4, 15, 12, 11, 1, 'SomyshareTest', '', 'vellw1002@gmail.com', '15319798138', '029-68686809', '6b3fbffdc11be83916954638ea988a2f', 'yOib', 1, 1, 1488602239, 1488556800, 1522771200, 0),
(54, 0, 5, 6, 15, 12, 11, 1, 'SomyshareTest2', '', '3401482395@qq.com', '18700412040', '029-68686809', '874f6a6860d470746a298547d9d716c8', '4LoA', 1, 1, 1488603067, 1488297600, 1496246400, 0),
(57, 54, 6, 0, 15, 12, 11, 1, 'somyemp1', '', 'vellw1002@gmail.com', '15319798138', '029-68686809', 'da43c469349cdf6221a1888d617aa544', 'i57d', 1, 0, 1488603275, 1488297600, 1496246400, 0),
(60, 54, 6, 0, 15, 12, 11, 1, 'somyemp2', '', 'vellw1002@gmail.com', '15319798138', '029-68686809', '09d2e234a874def41205162d792e7497', 'Z6mF', 1, 0, 1488603328, 1488297600, 1496246400, 0),
(63, 54, 6, 0, 15, 12, 11, 1, 'somyemp3', '', 'vellw1002@gmail.com', '15319798138', '029-68686809', '1a74499094ed5035c2ad33ca5d278917', 'T-ib', 1, 0, 1488603370, 1488297600, 1496246400, 0),
(66, 54, 6, 0, 15, 12, 11, 1, 'somyemp4', '', '3401482395@qq.com', '18700412040', '029-68686809', '53fbab5a527079ade387050be1ddc22a', '#lzj', 1, 1, 1488781840, 1488297600, 1496246400, 0),
(69, 10, 6, 0, 15, 12, 11, 1, 'Shirley', '', '3401482395@qq.com', '18700412040', '862968643155', '9676272085223d05ea1c9ee9b9c7898e', 'OLd#', 1, 1, 1488781984, 1481990400, 1513526400, 0),
(73, 0, 5, 1, 18, 12, 11, 1, 'xltitanium', '', 'xltitanium365@gmail.com', '18392715539', '0917-3388263', '26290d60c745274d27cda37a68b786b2', '5uda', 1, 1, 1490240572, 1489939200, 1497888000, 0),
(76, 73, 6, 0, 18, 12, 11, 1, '宝鸡鑫联钛业', '', 'xltitanium365@gmail.com', '13571186580', '0917-3388263', '84caff070fcf933aa8fd97f6e57553ae', '0f71', 1, 1, 1490240701, 1489939200, 1497888000, 0),
(79, 0, 4, 0, 0, 12, 11, 1, 'samkf', '', '2648684244@qq.com', '', '', 'd43172e1560ebf1109012d16fc87e487', 'TSyg', 1, 0, 1494474625, 1494432000, 1525968000, 0),
(82, 0, 5, 6, 79, 12, 11, 1, 'sam1', '', '2648684244@qq.com', '13228016321', '029-68686809', '76b6443d46c197dfa70a610e0997d86b', 'J#3J', 1, 0, 1494474793, 1494432000, 1525968000, 0),
(85, 82, 6, 0, 79, 12, 11, 1, 'sam2', '', '2648684244@qq.com', '13228016321', '029-68686809', '011485a20103540cf45eea8bd6fc6924', 'WxE4', 1, 0, 1494474847, 1494432000, 1525968000, 0),
(103, 0, 7, 0, 0, 0, 0, 0, 'song40188', '', '3121734052@qq.com', '13572924205', '', '71c8827a1d790f82a93c8909221bee49', 'NuHL', 1, 0, 1495418677, 1495418677, 1524585600, 1499421204);

-- --------------------------------------------------------

--
-- 表的结构 `blog_user_group`
--

CREATE TABLE `blog_user_group` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `group_name` varchar(255) NOT NULL DEFAULT '',
  `group_remark` varchar(255) NOT NULL DEFAULT '',
  `group_auth` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-禁用 1-正常'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_user_group`
--

INSERT INTO `blog_user_group` (`id`, `group_name`, `group_remark`, `group_auth`, `status`) VALUES
(1, '超级管理员', '拥有最高权限', 'a:5:{i:28;a:6:{i:29;i:0;i:30;i:1;i:31;i:2;i:32;i:3;i:33;i:4;i:34;i:5;}i:35;a:16:{i:36;i:0;i:37;i:1;i:38;i:2;i:39;i:3;i:40;i:4;i:66;i:5;i:67;i:6;i:68;i:7;i:69;i:8;i:41;i:9;i:42;i:10;i:53;i:11;i:43;i:12;i:44;i:13;i:45;i:14;i:46;i:15;}i:47;a:20:{i:48;i:0;i:49;i:1;i:50;i:2;i:51;i:3;i:52;i:4;i:78;i:5;i:79;i:6;i:80;i:7;i:70;i:8;i:71;i:9;i:72;i:10;i:73;i:11;i:74;i:12;i:75;i:13;i:76;i:14;i:77;i:15;i:81;i:16;i:82;i:17;s:5:\"cate1\";i:18;s:5:\"cate3\";i:19;}i:54;a:6:{i:55;i:0;i:56;i:1;i:57;i:2;i:58;i:3;i:59;i:4;i:60;i:5;}i:61;a:4:{i:62;i:0;i:63;i:1;i:64;i:2;i:65;i:3;}}', 1),
(2, '管理员', '管理员角色', 'a:5:{i:28;a:6:{i:29;i:0;i:30;i:1;i:31;i:2;i:32;i:3;i:33;i:4;i:34;i:5;}i:35;a:16:{i:36;i:0;i:37;i:1;i:38;i:2;i:39;i:3;i:40;i:4;i:66;i:5;i:67;i:6;i:68;i:7;i:69;i:8;i:41;i:9;i:42;i:10;i:53;i:11;i:43;i:12;i:44;i:13;i:45;i:14;i:46;i:15;}i:47;a:18:{i:48;i:0;i:49;i:1;i:50;i:2;i:51;i:3;i:52;i:4;i:78;i:5;i:79;i:6;i:80;i:7;i:70;i:8;i:71;i:9;i:72;i:10;i:73;i:11;i:74;i:12;i:75;i:13;i:76;i:14;i:77;i:15;s:7:\"cate130\";i:16;s:7:\"cate134\";i:17;}i:54;a:6:{i:55;i:0;i:56;i:1;i:57;i:2;i:58;i:3;i:59;i:4;i:60;i:5;}i:61;a:4:{i:62;i:0;i:63;i:1;i:64;i:2;i:65;i:3;}}', 1),
(3, '代理商', '代理商角色', '0', 1),
(4, '客服', '客服角色', '0', 1),
(5, '主账户', '公司账户', '0', 1),
(6, '子账户', '隶属主账号', '0', 1),
(7, '试用帐号', '无隶属关系', '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `blog_user_info`
--

CREATE TABLE `blog_user_info` (
  `uid` int(11) UNSIGNED NOT NULL,
  `scale` smallint(4) NOT NULL DEFAULT '2' COMMENT '公司规模',
  `trade` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `money` decimal(9,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `money_freeze` decimal(9,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `money_pwd` varchar(255) NOT NULL DEFAULT '',
  `lastvist` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(255) NOT NULL DEFAULT '',
  `linkman` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `company` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `message_number` int(11) NOT NULL DEFAULT '0',
  `comment_number` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `content_number` int(11) NOT NULL DEFAULT '0',
  `analytics_table` varchar(255) NOT NULL DEFAULT '' COMMENT '用户分析数据所在表',
  `last_analytics_update` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后获取动态时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_user_info`
--

INSERT INTO `blog_user_info` (`uid`, `scale`, `trade`, `avatar`, `money`, `money_freeze`, `money_pwd`, `lastvist`, `lastip`, `linkman`, `company`, `address`, `message_number`, `comment_number`, `content_number`, `analytics_table`, `last_analytics_update`) VALUES
(1, 3, 'ceshi', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(2, 1, '材料', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(3, 0, '制造', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(7, 2, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(10, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(11, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(12, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(13, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(14, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(15, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(16, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(17, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(18, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(19, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(20, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(21, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(46, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(49, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(51, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(54, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(57, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(60, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(63, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(66, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(69, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(73, 5, '金属', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(76, 5, '金属', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(79, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(82, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(85, 0, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(88, 2, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(91, 2, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(94, 2, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(97, 2, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(100, 2, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(103, 2, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0),
(109, 2, '', '', '0.00', '0.00', '', 0, '', '', '', '', 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `blog_video`
--

CREATE TABLE `blog_video` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '视频标题',
  `description` text NOT NULL COMMENT '视频描述',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '视频播放次数',
  `duration` varchar(255) NOT NULL COMMENT '视频时长',
  `tag` varchar(255) NOT NULL COMMENT '视频标签，以英文逗号隔开',
  `create_time` int(10) NOT NULL COMMENT '视频上传时间',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT '所属分类',
  `cover` int(10) UNSIGNED NOT NULL COMMENT '上传视频封面',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '视频状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `vid` varchar(255) NOT NULL COMMENT '上传视频',
  `cid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '视频所属课程',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `keywords` varchar(255) NOT NULL COMMENT '关键词'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `blog_video`
--

INSERT INTO `blog_video` (`id`, `title`, `description`, `views`, `duration`, `tag`, `create_time`, `category_id`, `cover`, `status`, `sort`, `vid`, `cid`, `uid`, `keywords`) VALUES
(1, '第一讲 测试视频', '测试视频描述', 28, '00:02:22', '视频,测试', 1463740440, 7, 39, 1, 0, 'e903a467c8f0862bb6b707d3a622b5ab_e', 1, 1, ''),
(2, '第二讲 测试分类视频', '分类视频描述', 11, '00:02:22', '视频,go', 1463740800, 7, 40, 1, 0, 'e903a467c81ff500a0fd9fcb9a24d814_e', 1, 1, ''),
(3, '丰足生物客户回访', '丰足生物客户回访视频', 8, '00:01:20', '丰足生物', 1464148753, 13, 49, 1, 0, 'e903a467c88c305601fec6b7ba7c56dd_e', 3, 1, ''),
(4, '第二讲 测试分类视频', '分类视频描述', 18, '00:02:22', '视频,go', 1463740800, 7, 40, 1, 0, 'e903a467c81ff500a0fd9fcb9a24d814_e', 1, 3, ''),
(5, 'ceshi', 'ceshi2', 12, '00:02:22', 'ceshi', 1464664740, 7, 54, 1, 0, 'e903a467c8870b00c5980608f4a43c80_e', 4, 3, 'ceshi'),
(6, 'ceshi2', 'ceshi2', 0, '00:02:22', 'ceshi2', 1464745724, 7, 55, 0, 0, 'e903a467c88b2523a42615963deeab2c_e', 4, 3, 'ceshi2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_addons`
--
ALTER TABLE `blog_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_article`
--
ALTER TABLE `blog_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_attachment`
--
ALTER TABLE `blog_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_md5` (`md5`);

--
-- Indexes for table `blog_avatar`
--
ALTER TABLE `blog_avatar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_config`
--
ALTER TABLE `blog_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_content`
--
ALTER TABLE `blog_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_course`
--
ALTER TABLE `blog_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_enum`
--
ALTER TABLE `blog_enum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_hooks`
--
ALTER TABLE `blog_hooks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `blog_log`
--
ALTER TABLE `blog_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_menu`
--
ALTER TABLE `blog_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `blog_model`
--
ALTER TABLE `blog_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_model_field`
--
ALTER TABLE `blog_model_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_nav`
--
ALTER TABLE `blog_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_news`
--
ALTER TABLE `blog_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_note`
--
ALTER TABLE `blog_note`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_picture`
--
ALTER TABLE `blog_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_session`
--
ALTER TABLE `blog_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_single`
--
ALTER TABLE `blog_single`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_user`
--
ALTER TABLE `blog_user`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `blog_user_group`
--
ALTER TABLE `blog_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_user_info`
--
ALTER TABLE `blog_user_info`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `blog_video`
--
ALTER TABLE `blog_video`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `blog_addons`
--
ALTER TABLE `blog_addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=48;
--
-- 使用表AUTO_INCREMENT `blog_article`
--
ALTER TABLE `blog_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `blog_attachment`
--
ALTER TABLE `blog_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件ID';
--
-- 使用表AUTO_INCREMENT `blog_avatar`
--
ALTER TABLE `blog_avatar`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `blog_config`
--
ALTER TABLE `blog_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `blog_content`
--
ALTER TABLE `blog_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID', AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `blog_course`
--
ALTER TABLE `blog_course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `blog_enum`
--
ALTER TABLE `blog_enum`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- 使用表AUTO_INCREMENT `blog_hooks`
--
ALTER TABLE `blog_hooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `blog_log`
--
ALTER TABLE `blog_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `blog_menu`
--
ALTER TABLE `blog_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID', AUTO_INCREMENT=83;
--
-- 使用表AUTO_INCREMENT `blog_model`
--
ALTER TABLE `blog_model`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `blog_model_field`
--
ALTER TABLE `blog_model_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- 使用表AUTO_INCREMENT `blog_nav`
--
ALTER TABLE `blog_nav`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `blog_news`
--
ALTER TABLE `blog_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `blog_note`
--
ALTER TABLE `blog_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `blog_picture`
--
ALTER TABLE `blog_picture`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- 使用表AUTO_INCREMENT `blog_session`
--
ALTER TABLE `blog_session`
  MODIFY `id` bigint(64) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;
--
-- 使用表AUTO_INCREMENT `blog_single`
--
ALTER TABLE `blog_single`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `blog_user`
--
ALTER TABLE `blog_user`
  MODIFY `uid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- 使用表AUTO_INCREMENT `blog_user_group`
--
ALTER TABLE `blog_user_group`
  MODIFY `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `blog_video`
--
ALTER TABLE `blog_video`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
