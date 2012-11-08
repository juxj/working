/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : fund

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-11-07 13:44:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fund_company`
-- ----------------------------
DROP TABLE IF EXISTS `fund_company`;
CREATE TABLE `fund_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(64) DEFAULT NULL COMMENT '简称',
  `full_name` varchar(256) DEFAULT NULL COMMENT '全称',
  `web_site` varchar(128) DEFAULT NULL COMMENT '新闻,公告部分要用到',
  `config_file` varchar(64) DEFAULT NULL COMMENT '配置文件名,默认路径为config目录下的文件',
  `status` varchar(1) DEFAULT NULL COMMENT '状态,值为1时为需要抓取',
  `last_updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `tabs` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_company
-- ----------------------------
INSERT INTO `fund_company` VALUES ('1', '华夏', '华夏基金管理有限公司', null, '001.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('2', '嘉实', '嘉实基金管理有限公司', null, '002.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('3', '南方', '南方基金管理有限公司', null, '003.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('4', '易方达', '易方达基金管理有限公司', null, '004.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('5', '博时', '博时基金管理有限公司', 'www.bosera.com', '005.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('6', '广发', '广发基金管理有限公司', null, '006.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('7', '银华', '银华基金管理有限公司', null, '007.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('8', '工银瑞信', '工银瑞信基金管理有限公司', 'www.ubssdic.com', '008.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('9', '富国', '富国基金管理有限公司', null, '009.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('10', '华安', '华安基金管理有限公司', 'www.huaan.com.cn', '010.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('11', '大成', '大成基金管理有限公司', null, '011.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('12', '汇添富', '汇添富基金管理有限公司', 'www.htffund.com', '012.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('13', '招商', '招商基金管理有限公司', 'www.cmfchina.com', '013.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('14', '中银', '中银基金管理有限公司', null, '014.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('15', '建信', '建信基金管理有限公司', null, '015.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('16', '鹏华', '鹏华基金管理有限公司', null, '016.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('17', '上投摩根', '上投摩根基金管理有限公司', 'www.51fund.com', '017.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('18', '诺安', '诺安基金管理有限公司', null, '018.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('19', '交银施罗德', '交银施罗德基金管理有限公司', null, '019.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('20', '融通', '融通基金管理有限公司', null, '020.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('21', '长盛', '长盛基金管理有限公司', null, '021.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('22', '国泰', '国泰基金管理有限公司', null, '022.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('23', '景顺长城', '景顺长城基金管理有限公司', null, '023.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('24', '国投瑞银', '国投瑞银基金管理有限公司', null, '024.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('25', '华宝兴业', '华宝兴业基金管理有限公司', null, '025.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('26', '华泰柏瑞', '华泰柏瑞基金管理有限公司', null, '026.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('27', '兴业全球', '兴业全球基金管理有限公司', null, '027.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('28', '长城', '长城基金管理有限公司', null, '028.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('29', '光大保德信', '光大保德信基金管理有限公司', null, '029.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('30', '万家', '万家基金管理有限公司', null, '030.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('31', '海富通', '海富通基金管理有限公司', null, '031.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('32', '泰达宏利', '泰达宏利基金管理有限公司', null, '032.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('33', '华商', '华商基金管理有限公司', null, '033.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('34', '申万菱信', '申万菱信基金管理有限公司', null, '034.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('35', '国联安', '国联安基金管理有限公司', null, '035.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('36', '中邮创业', '中邮创业基金管理有限公司', null, '036.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('37', '长信', '长信基金管理有限公司', null, '037.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('38', '信诚', '信诚基金管理有限公司', null, '038.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('39', '天弘', '天弘基金管理有限公司', null, '039.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('40', '银河', '银河基金管理有限公司', null, '040.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('41', '国海富兰克林', '国海富兰克林基金管理有限公司', null, '041.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('42', '农银汇理', '农银汇理基金管理有限公司', null, '042.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('43', '摩根士丹利华鑫', '摩根士丹利华鑫基金管理有限公司', null, '043.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('44', '中海', '中海基金管理有限公司', null, '044.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('45', '东吴', '东吴基金管理有限公司', null, '045.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('46', '宝盈', '宝盈基金管理有限公司', null, '046.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('47', '东方', '东方基金管理有限公司', null, '047.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('48', '汇丰晋信', '汇丰晋信基金管理有限公司', null, '048.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('49', '华富', '华富基金管理有限公司', null, '049.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('50', '泰信', '泰信基金管理有限公司', null, '050.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('51', '中欧', '中欧基金管理有限公司', null, '051.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('52', '新华', '新华基金管理有限公司', null, '052.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('53', '民生加银', '民生加银基金管理有限公司', null, '053.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('54', '信达澳银', '信达澳银基金管理有限公司', null, '054.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('55', '金鹰', '金鹰基金管理有限公司', null, '055.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('56', '浦银安盛', '浦银安盛基金管理有限公司', null, '056.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('57', '益民', '益民基金管理有限公司', null, '057.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('58', '天治', '天治基金管理有限公司', null, '058.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('59', '诺德', '诺德基金管理有限公司', null, '059.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('60', '财通', '财通基金管理有限公司', null, '060.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('61', '平安大华', '平安大华基金管理有限公司', 'fund.pingan.com', '061.ini', '1', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('62', '安信', '安信基金管理有限公司', null, '062.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('63', '纽银', '纽银基金管理有限公司', null, '063.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('64', '浙商', '浙商基金管理有限公司', null, '064.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('65', '金元惠理', '金元惠理基金管理有限公司', null, '065.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('66', '富安达', '富安达基金管理有限公司', null, '066.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('67', '德邦', '德邦基金管理有限公司', null, '067.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('68', '长安', '长安基金管理有限公司', null, '068.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('69', '国金通用', '国金通用基金管理有限公司', null, '069.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('70', '方正富邦', '方正富邦基金管理有限公司', null, '070.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('71', '英大', '英大基金管理有限公司', null, '071.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('72', '红塔红土', '红塔红土基金管理有限公司', null, '072.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('73', '华宸未来', '华宸未来基金管理有限公司', null, '073.ini', '0', '2012-11-01 10:59:18', null);
