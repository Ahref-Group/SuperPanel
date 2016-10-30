-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2016-10-30 18:27:52
-- 服务器版本： 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superpanel`
--
CREATE DATABASE IF NOT EXISTS `superpanel` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `superpanel`;

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `uid` int(11) NOT NULL,
  `permission` set('user','admin','node','group','invite','ticket','announcement','config') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `admin`:
--   `uid`
--       `user` -> `uid`
--

-- --------------------------------------------------------

--
-- 表的结构 `alipay`
--

DROP TABLE IF EXISTS `alipay`;
CREATE TABLE `alipay` (
  `out_trade_no` int(11) NOT NULL COMMENT '支付号',
  `uid` int(11) NOT NULL,
  `money` int(11) NOT NULL COMMENT '付款金额',
  `real_money` float NOT NULL COMMENT '真实付款金额',
  `notify_id` varchar(32) DEFAULT NULL COMMENT 'spay订单号',
  `status` varchar(32) NOT NULL,
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `finish_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `alipay`:
--

-- --------------------------------------------------------

--
-- 表的结构 `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `item` varchar(16) NOT NULL,
  `introduction` varchar(64) NOT NULL,
  `text` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `announcement`:
--

--
-- 转存表中的数据 `announcement`
--

INSERT INTO `announcement` (`item`, `introduction`, `text`) VALUES
('common_node', '普通节点公告', '<h4>SSR混淆更改为http_simple 请在客户端更改 协议仍为auth_sha1</h4>\n<h5>请勿在任何地方公开节点任何信息！</h5>\n<p><small>Sharing Node imformation is Inhibited!</small></p>'),
('footer', '底部通知', '(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/(●´ω`●)/'),
('head', '顶部公告', '这里是萌萌哒的顶部公告哦(ฅ´ω`ฅ) '),
('home', '首页公告', '<p>&nbsp;&lt;?php phpinfo(); ?&gt;</p>\n<p>A Shadowsocks Provider</p>\n<p><a href="http://ahref.me/" target="_blank">Ahref Group&trade;</a> Present</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>'),
('index', '首页公告', NULL),
('invite_code', '邀请码页面公告', '<h1 style="text-align: center;">公共邀请码，请自取。</h1>\n<h2 style="text-align: center;"><strong>严禁刷小号！一旦发现，全部删除+黑名单！</strong></h2>\n'),
('special_node', '高级节点公告', 'lalala'),
('TOS', 'TOS', '<h3>隐私</h3>\n<p><{$site_name}></p>\n<ul>\n<li>用户注册时候需要提供邮箱以及密码，并自行保管。邮箱为用户的唯一凭证。</li>\n<li>本站会加密存储用户密码，尽量保证数据安全，但并不保证这些信息的绝对安全。</li>\n</ul>\n<p>&nbsp;</p>\n<h3>使用条款</h3>\n<p>&nbsp;</p>\n<ul>\n<li>禁止使用本站服务进行任何违法恶意活动。</li>\n<li>使用任何节点，需遵循节点所属国家的相关法律以及中国法律。</li>\n<li>禁止滥用本站提供的服务。</li>\n<li>对于免费用户，我们有权在不通知的情况下删除账户。</li>\n<li>任何违法使用条款的用户，我们将会删除违规账户并没收使用本站服务的权利。</li>\n</ul>\n<p>&nbsp;</p>\n<h3>其它</h3>\n<p>&nbsp;</p>\n<ul>\n<li>本站仅限人类及猫注册使用。</li>\n<li>TOS更新时用户需要遵守最新TOS。</li>\n</ul>'),
('user_home', '用户中心公告', '<p>&nbsp;&lt;?php phpinfo(); ?&gt;</p>'),
('user_invite', '用户邀请码公告', '<p>用户注册48小时后，才可以生成邀请码。</p>\n<p>邀请码暂时无法购买，请珍惜。</p>\n<p>公共页面不定期发放邀请码，如果用完邀请码可以关注公共邀请。</p>\n<p>邀请码请给认识的需要的人。</p>\n<p>邀请有记录，若被邀请的人违反用户协议，您将会有连带责任。</p>');

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `config`:
--

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'SITE_NAME', 'SuperPanel-demo'),
(2, 'PUBLIC_KEY', 'ABB9559AE54190D0A74AE032D31F728638BE40C7009C93CF6D4E41CDDEC2899ED28E7F98B662BCE2310AD1ADBDC63FEBF8441C9E2595077A4AD88ABA226A4D5A02BD6D5D16AA25B1EE8A6E10F66056961DD2C2CAC864522CDEFB696DC2D6E451F7040C6CFF71F04506D1A9586C70ABAEE02EB16B71D330E5506197C1A586D381077171F9530A55EAAEEC42180397A9F9B2DCF1820E64F59420F208EC2752E155F890415346393E87C78F46C2F2D255E46C7235AF15EBCA2AFF746CA23EF346E9881DA23CA60A03995FFBFA72B8BEC98576A14E473831F1F77C37E83DD8BA6D100902CDC1E56DF972BEC088C03C3799C0C79DC61CA24064FD1E33467F8FFACF61'),
(3, 'SALT', 'superpanel'),
(4, 'REQUIRE_INVITE_CODE', '1'),
(5, 'ENCRYPTION_METHOD', 'sha256'),
(6, 'DEFAULT_MONEY', '0'),
(8, 'DEFAULT_TRANSFER', '1048576'),
(10, 'DEFAULT_INVITE_AMOUNT', '2'),
(11, 'DEFAULT_GROUP', '1'),
(12, 'DEFAULT_EXPIRATION', '86400'),
(13, 'PROMO_CODE', '233'),
(14, 'PROMO_CODE_VALUE', '-10'),
(15, 'PROMO_CODE_REQUIRE', '5'),
(16, 'PORT_BEGIN', '10'),
(17, 'POET_END', '65535'),
(18, 'PORT_RESERVE', '21,22,80'),
(19, 'DEFAULT_METHOD', 'rc4-md5'),
(20, 'DEFAULT_PROTOCOL', 'origin'),
(21, 'DEFAULT_OBFS', 'plain'),
(22, 'IP_MODE', 'taobao'),
(23, 'IPIP_TOKEN', ''),
(24, 'SPAY_ID', ''),
(25, 'SPAY_CODE', ''),
(26, 'SITE_URL', '请修改为你的网站url'),
(27, 'MIN_GIFT_MONEY', '0.1'),
(28, 'MAX_GIFT_MONEY', '1');

-- --------------------------------------------------------

--
-- 表的结构 `exchange_code`
--

DROP TABLE IF EXISTS `exchange_code`;
CREATE TABLE `exchange_code` (
  `code` varchar(64) NOT NULL,
  `money` float NOT NULL,
  `expiration` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `exchange_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `exchange_code`:
--

-- --------------------------------------------------------

--
-- 表的结构 `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `gid` int(11) NOT NULL COMMENT '组序数',
  `order` int(11) NOT NULL,
  `group_name` varchar(64) NOT NULL,
  `node` varchar(1024) NOT NULL COMMENT '属于此组的nid',
  `type` enum('traffic','expiration','funding','') NOT NULL COMMENT '该分组的类型',
  `group_info` varchar(1024) NOT NULL COMMENT '节点信息',
  `style` varchar(16) NOT NULL DEFAULT 'primary' COMMENT '节点颜色',
  `config` varchar(1024) NOT NULL COMMENT '配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `group`:
--

-- --------------------------------------------------------

--
-- 表的结构 `invite_code`
--

DROP TABLE IF EXISTS `invite_code`;
CREATE TABLE `invite_code` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `code` char(64) NOT NULL,
  `money` float NOT NULL DEFAULT '0',
  `group` varchar(1024) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `invite_code`:
--   `uid`
--       `user` -> `uid`
--

-- --------------------------------------------------------

--
-- 表的结构 `ip`
--

DROP TABLE IF EXISTS `ip`;
CREATE TABLE `ip` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `ip` varchar(64) NOT NULL COMMENT '预留对ipv6的支持',
  `location` varchar(64) NOT NULL,
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作发生时间',
  `operation` varchar(64) NOT NULL COMMENT '操作'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `ip`:
--   `uid`
--       `user` -> `uid`
--

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `uid` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(256) NOT NULL,
  `message` mediumtext NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `message`:
--

-- --------------------------------------------------------

--
-- 表的结构 `node`
--

DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `nid` int(11) NOT NULL,
  `node_name` varchar(64) NOT NULL COMMENT '名称',
  `address` varchar(64) NOT NULL COMMENT '地址',
  `node_info` mediumtext NOT NULL COMMENT '介绍',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `visible` tinyint(1) NOT NULL COMMENT '是否可见'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `node`:
--

-- --------------------------------------------------------

--
-- 表的结构 `node_info`
--

DROP TABLE IF EXISTS `node_info`;
CREATE TABLE `node_info` (
  `id` int(11) NOT NULL,
  `nid` int(11) NOT NULL COMMENT '节点id',
  `load` varchar(32) NOT NULL,
  `cpu` varchar(8) NOT NULL,
  `upload` int(11) NOT NULL COMMENT '上传',
  `download` int(11) NOT NULL COMMENT '下载',
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `node_info`:
--

-- --------------------------------------------------------

--
-- 表的结构 `node_online_log`
--

DROP TABLE IF EXISTS `node_online_log`;
CREATE TABLE `node_online_log` (
  `id` int(11) NOT NULL,
  `nid` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `node_online_log`:
--

-- --------------------------------------------------------

--
-- 表的结构 `purchase_log`
--

DROP TABLE IF EXISTS `purchase_log`;
CREATE TABLE `purchase_log` (
  `uid` mediumint(9) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `item_title` varchar(64) NOT NULL,
  `spent` float NOT NULL,
  `balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `purchase_log`:
--

-- --------------------------------------------------------

--
-- 表的结构 `salt`
--

DROP TABLE IF EXISTS `salt`;
CREATE TABLE `salt` (
  `uid` int(11) NOT NULL,
  `salt` char(128) NOT NULL,
  `google2factor` char(16) NOT NULL COMMENT 'google2步验证密钥'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `salt`:
--   `uid`
--       `user` -> `uid`
--

-- --------------------------------------------------------

--
-- 表的结构 `shop_item`
--

DROP TABLE IF EXISTS `shop_item`;
CREATE TABLE `shop_item` (
  `iid` int(11) NOT NULL COMMENT 'item id',
  `title` varchar(64) NOT NULL COMMENT '项目名',
  `introduction` mediumtext NOT NULL COMMENT '项目介绍',
  `prices` float NOT NULL COMMENT '价格',
  `amount` varchar(6) NOT NULL DEFAULT 'INF',
  `commands` mediumtext NOT NULL COMMENT '命令'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `shop_item`:
--

-- --------------------------------------------------------

--
-- 表的结构 `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  `message` mediumtext NOT NULL,
  `status` enum('updated','replied','closed') NOT NULL DEFAULT 'updated',
  `open_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `ticket`:
--   `uid`
--       `user` -> `uid`
--

-- --------------------------------------------------------

--
-- 表的结构 `ticket_reply`
--

DROP TABLE IF EXISTS `ticket_reply`;
CREATE TABLE `ticket_reply` (
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `message` mediumtext NOT NULL,
  `reply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `ticket_reply`:
--   `tid`
--       `ticket` -> `tid`
--   `uid`
--       `user` -> `uid`
--

-- --------------------------------------------------------

--
-- 表的结构 `token`
--

DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `token` char(32) NOT NULL COMMENT 'md4的token长度',
  `expiration` int(11) NOT NULL,
  `operation` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `token`:
--

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `username` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户名',
  `email` varchar(32) NOT NULL COMMENT '用户邮箱',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `password` char(128) NOT NULL COMMENT '密码',
  `passwd` varchar(16) NOT NULL COMMENT 'ss密码',
  `port` smallint(5) UNSIGNED NOT NULL COMMENT '端口，用small int就足够了',
  `t` int(11) NOT NULL DEFAULT '0' COMMENT '最后使用时间',
  `u` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传流量',
  `d` bigint(20) NOT NULL DEFAULT '0' COMMENT '下载流量',
  `real_transfer` bigint(20) NOT NULL,
  `plan` varchar(26) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户所处的计划',
  `enable` tinyint(1) NOT NULL,
  `transfer_enable` bigint(20) NOT NULL COMMENT '可用流量',
  `method` varchar(50) NOT NULL,
  `protocol` varchar(50) NOT NULL,
  `obfs` varchar(50) NOT NULL,
  `status` enum('deleted','normal') NOT NULL DEFAULT 'normal' COMMENT '用户状态',
  `last_check_in_time` int(11) NOT NULL DEFAULT '0' COMMENT '上次签到时间',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `invite_code_amount` int(8) NOT NULL COMMENT '剩余邀请码数量',
  `money` float NOT NULL COMMENT '账户余额',
  `invited_by` int(11) NOT NULL COMMENT '邀请人，0为系统',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `enable_google2factor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `user`:
--

-- --------------------------------------------------------

--
-- 表的结构 `user_group`
--

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `uid` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `expiration` int(11) NOT NULL,
  `transfer_enable` bigint(20) UNSIGNED NOT NULL,
  `transfer` bigint(20) UNSIGNED NOT NULL,
  `real_transfer` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `user_group`:
--   `uid`
--       `user` -> `uid`
--

-- --------------------------------------------------------

--
-- 表的结构 `user_traffic_log`
--

DROP TABLE IF EXISTS `user_traffic_log`;
CREATE TABLE `user_traffic_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `nid` int(11) NOT NULL,
  `upload` int(11) NOT NULL,
  `download` int(11) NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `user_traffic_log`:
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `alipay`
--
ALTER TABLE `alipay`
  ADD PRIMARY KEY (`out_trade_no`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`item`),
  ADD UNIQUE KEY `item_2` (`item`),
  ADD KEY `item` (`item`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `exchange_code`
--
ALTER TABLE `exchange_code`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `invite_code`
--
ALTER TABLE `invite_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ip`
--
ALTER TABLE `ip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `node`
--
ALTER TABLE `node`
  ADD PRIMARY KEY (`nid`),
  ADD UNIQUE KEY `uid` (`nid`);

--
-- Indexes for table `salt`
--
ALTER TABLE `salt`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `shop_item`
--
ALTER TABLE `shop_item`
  ADD UNIQUE KEY `iid` (`iid`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `tid` (`tid`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD KEY `uid` (`uid`),
  ADD KEY `tid` (`tid`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD KEY `uid` (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- 使用表AUTO_INCREMENT `group`
--
ALTER TABLE `group`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '组序数', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `invite_code`
--
ALTER TABLE `invite_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- 使用表AUTO_INCREMENT `ip`
--
ALTER TABLE `ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- 使用表AUTO_INCREMENT `node`
--
ALTER TABLE `node`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- 使用表AUTO_INCREMENT `shop_item`
--
ALTER TABLE `shop_item`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'item id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `ticket`
--
ALTER TABLE `ticket`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- 使用表AUTO_INCREMENT `token`
--
ALTER TABLE `token`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=85;
--
-- 限制导出的表
--

--
-- 限制表 `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `invite_code`
--
ALTER TABLE `invite_code`
  ADD CONSTRAINT `invite_code_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `ip`
--
ALTER TABLE `ip`
  ADD CONSTRAINT `ip的uid限制` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `salt`
--
ALTER TABLE `salt`
  ADD CONSTRAINT `salt_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `对uid的约束` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD CONSTRAINT `ticket_reply_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `ticket` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_reply_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
