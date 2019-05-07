/*
Navicat MySQL Data Transfer

Source Server         : Movie
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : movie

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-05-07 12:16:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(32) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '情感');
INSERT INTO `category` VALUES ('172934bd636d485c98fd2d3d9cccd409', '科幻');
INSERT INTO `category` VALUES ('2', '悬疑');
INSERT INTO `category` VALUES ('86D5A892DE0F4E3EB417799BDA1DE99E', '老师好');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_0001` (`pid`),
  KEY `fk_0002` (`oid`),
  CONSTRAINT `fk_0001` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `fk_0002` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('11B35FFE39444C929E45FE54097C5400', '1', '39', 'A95CF11ABC8B477BBB4CCEBB5D9F8F95', '067D44FFD6E8444C964171C21A05BF8E');
INSERT INTO `orderitem` VALUES ('2F7A664003E645DEA39083CBFFC21644', '1', '1398', '7', 'E53A15992FD342E3BE945426037FE8FD');
INSERT INTO `orderitem` VALUES ('3A0BC3D624584BE79ADE30DD33C275AD', '1', '4288', '15', 'AD7C4B85A1684779AC5D7A93E0D3FCC0');
INSERT INTO `orderitem` VALUES ('407E1815CCDA46DEB4EFB093C6353C83', '1', '39', '11', '7BEAD67238534A919F01014437AEBD6E');
INSERT INTO `orderitem` VALUES ('4F9C6AFE3A384C8CA5F1BBD888EE0984', '1', '1699', '23', 'D3CDB24B99574B12B2BA63F8BD7B8600');
INSERT INTO `orderitem` VALUES ('51C32F00FB97453EA590F1427D99E6A8', '1', '2499', '13', '2089A7541AE6477E926B3EAC19AB3CF3');
INSERT INTO `orderitem` VALUES ('64EC4F5F29364720824C51B1955524EF', '1', '1398', '7', '5C7EC33E89CA4DE9A228F1F5A19FE85B');
INSERT INTO `orderitem` VALUES ('76EC518CA8014C2080806B1EBFA7277B', '1', '2499', '13', '6937CBF561B440DEAEB248507D79AA2E');
INSERT INTO `orderitem` VALUES ('A28D3CFC8C5647ADAA314CA3E76F45CB', '1', '39', 'A95CF11ABC8B477BBB4CCEBB5D9F8F95', 'DD47EA756BA1447794FBEEE21D5F1B84');
INSERT INTO `orderitem` VALUES ('ADE8DBC3351847D58E4B8024667ED7E9', '1', '2298', '11', '6F13BE630C164C1699A295CD0B4BEE58');
INSERT INTO `orderitem` VALUES ('B1AC3B414A1C49CEBBDD344DA8C639F3', '1', '1398', '7', '50185B1E1EBB453C948DA08B47CDECAF');
INSERT INTO `orderitem` VALUES ('D5F068EF7C3B4C17B90DD349882F4494', '1', '1398', '7', '0D6C7921998C4793B0EF30D3BC1706DD');
INSERT INTO `orderitem` VALUES ('EF10A24429C640629A2BA3634E04E151', '2', '78', 'A95CF11ABC8B477BBB4CCEBB5D9F8F95', '1CA7FD5E4A674409A6A70B93A821B7AC');
INSERT INTO `orderitem` VALUES ('F703E8DF478F4FB98A80078C6B989E88', '1', '1398', '7', 'A5A4976287D74BB5BF872D587B293D19');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `ordertime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('067D44FFD6E8444C964171C21A05BF8E', '2019-05-04 23:23:45', '39', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('0D6C7921998C4793B0EF30D3BC1706DD', '2019-05-03 22:17:03', '1398', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('1CA7FD5E4A674409A6A70B93A821B7AC', '2019-05-04 12:35:20', '78', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('2089A7541AE6477E926B3EAC19AB3CF3', '2019-04-30 15:34:37', '2499', '0', '', '', '', '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('2E07C7DBDE9C4CC9A5A541FA5194B0B0', '2019-05-04 23:23:12', '0', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('50185B1E1EBB453C948DA08B47CDECAF', null, '1398', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('5331C9080D5E4650A6526F5148448349', '2019-05-04 23:23:02', '0', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('5C7EC33E89CA4DE9A228F1F5A19FE85B', null, '1398', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('6937CBF561B440DEAEB248507D79AA2E', null, '2499', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('6F13BE630C164C1699A295CD0B4BEE58', '2019-05-04 20:40:03', '2298', '0', '', '', '', '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('7BEAD67238534A919F01014437AEBD6E', '2019-05-04 23:20:28', '39', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('A5A4976287D74BB5BF872D587B293D19', null, '1398', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('AD7C4B85A1684779AC5D7A93E0D3FCC0', '2019-04-29 20:30:17', '4288', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('D3CDB24B99574B12B2BA63F8BD7B8600', '2019-05-03 00:40:45', '1699', '0', '阿萨德', '孙伟建', '', '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('DD47EA756BA1447794FBEEE21D5F1B84', '2019-05-05 11:05:50', '39', '0', '呼和特', '傻', '18847138020', '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('DD62AECF50BE4A2DA9B8E8FC4170032E', '2019-05-04 23:23:11', '0', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');
INSERT INTO `orders` VALUES ('E53A15992FD342E3BE945426037FE8FD', '2019-04-29 15:36:52', '1398', '0', null, null, null, '1D10035DC32C43CBBD58F72DC1810C38');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `pimage` varchar(200) DEFAULT NULL,
  `pdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_hot` int(11) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `pflag` int(11) DEFAULT NULL,
  `cid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `sfk_0001` (`cid`),
  CONSTRAINT `sfk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('11', '何以为家', '44', '39', 'products/1/1.jpg', '2019-05-04 22:30:54', '1', '法庭上，十二岁的男孩赞恩（赞恩·阿尔·拉菲亚 饰）向法官状告他的亲生父母，原因是，他们给了他生命。是什么样的经历让一个孩子做出如此不可思议的举动？故事中，赞恩的父母在无力抚养和教育的状况下依然不停生育，作为家中的长子赞恩，弱小的肩膀承担了无数生活的重压。当妹妹被强行卖给商贩为妻时，赞恩愤怒离家，之后遇到一对没有合法身份的母子，相互扶持勉强生活。然而生活并没有眷顾赞恩，重重磨难迫使他做出了令人震惊的举动……', '0', '1');
INSERT INTO `product` VALUES ('13', '大侦探皮卡丘', '60.9', '59.9', 'products/1/3.jpg', '2019-05-04 22:36:55', '1', '蒂姆·古德曼（贾斯提斯·史密斯 饰） 为寻找下落不明的父亲来到莱姆市，意外与父亲的前宝可梦搭档大侦探皮卡丘相遇，并惊讶地发现自己是唯一能听懂皮卡丘说话的人类，他们决定组队踏上揭开真相的刺激冒险之路。探案过程中他们邂逅了各式各样的宝可梦，并意外发现了一个足以毁灭整个宝可梦宇宙的惊天阴谋。', '0', '172934bd636d485c98fd2d3d9cccd409');
INSERT INTO `product` VALUES ('15', '下一任:前任', '55', '44', 'products/1/22.jpg', '2019-05-04 22:50:33', '1', '林心恬（郭采洁 饰）的爱情路一直不顺，总是不能在对的时间遇到对的人。正当她心灰意冷时，缘份使她邂逅了多情暖男吾川（郑恺 饰），吾川对心恬展开狂热追求，最终心恬被打动。然而意料之外的是，心恬自学生时期就暗恋的学霸男神黄克群（李东学 饰）又出现了。是该选择近在眼前的幸福，还是多年前梦寐以求的白马王子？当心恬做出决定后才发现，原来爱情在冥冥中早已注定！', '0', '1');
INSERT INTO `product` VALUES ('23', '哥斯拉2', '44', '39', 'products/1/2.jpg', '2019-05-04 22:47:43', '1', '随着《哥斯拉》和《金刚：骷髅岛》在全球范围内的成功，华纳兄弟影片公司和传奇影业联手开启了怪兽宇宙系列电影的新篇章—一部史诗级动作冒险巨制。在这部电影中，哥斯拉将和众多大家在流行文化中所熟知的怪兽展开较量。全新故事中，研究神秘动物学的机构“帝王组织”成员将勇敢直面巨型怪兽，其中强大的哥斯拉也将和魔斯拉、拉顿和它的死对头——三头王基多拉展开激烈对抗。当这些只存在于传说里的超级生物再度崛起时，它们将展开王者争霸，人类的命运岌岌可危……', '0', '172934bd636d485c98fd2d3d9cccd409');
INSERT INTO `product` VALUES ('51', '雪暴', '49', '39', 'products/1/6.jpg', '2019-05-04 22:48:17', '1', '在一座极北的边陲小镇，一伙穷凶极恶、作案手法老到的悍匪为抢夺黄金，打劫运金车，并借助大雪掩盖了所有犯罪痕迹。为了探求真相，警察王康浩（张震 饰）暗地里搜集证据，熟悉地形，终于在一场灾难级的暴雪降临时，与谋财害命的悍匪发生了惊心动魄的正面对决……', '0', '172934bd636d485c98fd2d3d9cccd409');
INSERT INTO `product` VALUES ('66', '唐人街探案3', '100', '99', 'products/1/12.jpg', '2019-05-04 22:52:40', '0', '敬请期待', null, '2');
INSERT INTO `product` VALUES ('7', '调音师', '57', '37', 'products/1/7.jpg', '2019-05-04 22:50:20', '0', '影片讲述了一直假装盲人的钢琴调音师阿卡什（阿尤斯曼·库拉纳 饰），在意外成为一起凶杀案的“目击证人”后，所遭遇的种种出其不意的经历。', '0', '2');
INSERT INTO `product` VALUES ('A95CF11ABC8B477BBB4CCEBB5D9F8F95', '复仇者联盟4:终结之战', '45', '39', 'products/1/c_0051.jpg', '2019-05-04 22:52:25', '1', '终局之战', '0', '172934bd636d485c98fd2d3d9cccd409');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0D94F9190E544F2B98E0AC3B7218DD83', 'Tom', '123', '孙伟建', 'tom@store.com', null, '2018-11-13', '1', '0', 'AF53EF1DAB544A2FAE7712056EBF0B11');
INSERT INTO `user` VALUES ('1455E05415174D6C82B705B3138DDEAF', '2015110476811', '123', '孙伟建', 'tom@store.com', null, '2019-04-26', '0', '1', null);
INSERT INTO `user` VALUES ('1D10035DC32C43CBBD58F72DC1810C38', '张智超', '123', '傻', 'tom@store.com', null, '2019-04-08', '0', '1', null);
