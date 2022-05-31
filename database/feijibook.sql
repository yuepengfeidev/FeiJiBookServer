/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : feijibook

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2022-05-31 17:25:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_info`
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
  `name` varchar(5) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
INSERT INTO `admin_info` VALUES ('1', '1');
INSERT INTO `admin_info` VALUES ('admin', '123456');

-- ----------------------------
-- Table structure for `data_model`
-- ----------------------------
DROP TABLE IF EXISTS `data_model`;
CREATE TABLE `data_model` (
  `catering` int(11) NOT NULL,
  `shopping` int(11) NOT NULL,
  `traffic` int(11) NOT NULL,
  `daily` int(11) NOT NULL,
  `amusement` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_model
-- ----------------------------
INSERT INTO `data_model` VALUES ('918', '180', '263', '166', '217', '1');

-- ----------------------------
-- Table structure for `detail_record`
-- ----------------------------
DROP TABLE IF EXISTS `detail_record`;
CREATE TABLE `detail_record` (
  `id` char(64) NOT NULL,
  `account` varchar(32) NOT NULL,
  `year` char(10) NOT NULL,
  `month` char(10) NOT NULL,
  `day` char(10) NOT NULL,
  `week` char(10) NOT NULL COMMENT '星期几',
  `woy` char(10) NOT NULL COMMENT 'WeekOfYear,一年的第几周”2019-41“',
  `ioe` char(10) NOT NULL COMMENT 'IncomeOrExpend,是”支出“还是”收入“',
  `icon_url` int(32) NOT NULL,
  `detail_type` varchar(10) NOT NULL,
  `money` varchar(32) NOT NULL,
  `remark` varchar(32) NOT NULL,
  `img_url` varchar(256) DEFAULT NULL,
  `is_img_upload` bit(1) NOT NULL DEFAULT b'0' COMMENT '默认为false，因为添加记录不会上传照片',
  `video_url` varchar(128) DEFAULT NULL,
  `record_order` int(32) NOT NULL COMMENT '用于排序同一天的记录，数字越大，表示该记录是该天最后编辑过的',
  `is_video_upload` bit(1) NOT NULL DEFAULT b'0' COMMENT '默认还没有上传',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detail_record
-- ----------------------------
INSERT INTO `detail_record` VALUES ('00b7cd27-c616-4b19-aa55-6d7bf763fa05', '12345678', '2022', '05', '19', '星期四', '21', '支出', '2131230879', '餐饮', '11', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('01d54aef-bbb3-4973-89e0-15714dac9baa', '12345678', '2022', '04', '23', '星期六', '17', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('01f0b001-b914-4fa3-ac88-cd1a9cdf6853', '12345678', '2022', '02', '19', '星期六', '08', '支出', '2131230891', '通信', '90', '通信', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('042f6de5-72b8-40a5-bfd3-629f722b890f', '12345678', '2022', '05', '08', '星期日', '19', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('0432994b-8f26-4bde-b04e-3279fcf6bdff', '12345678', '2022', '04', '20', '星期三', '17', '支出', '2131230871', '书籍', '12.9', '书籍', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('07573af4-c0ea-42c0-8b10-f466ec06ed97', '12345678', '2022', '05', '04', '星期三', '19', '支出', '2131230879', '餐饮', '12', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('0b66038b-4ed5-400a-a334-f6c17cf7e2f5', '12345678', '2022', '05', '03', '星期二', '19', '支出', '2131231051', '饮品', '6', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('0bef0ce3-f998-47eb-a3de-0cc906cce717', '12345678', '2022', '04', '20', '星期三', '17', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('0ccf3083-308c-402b-a0fb-ef7e5fc74cbb', '12345678', '2022', '05', '20', '星期五', '21', '支出', '2131230879', '餐饮', '13.8', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('0f9ed661-12ed-42ed-b05e-c869d80e481b', '12345678', '2022', '04', '10', '星期日', '15', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('11fdac23-f819-4e3a-bb0f-2834f7d5a4a6', '12345678', '2022', '04', '20', '星期三', '17', '支出', '2131230891', '通信', '29', '通信', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('1214a677-985d-4e77-a6c5-703ea2e1a23e', '12345678', '2022', '05', '11', '星期三', '20', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('1456d99a-535b-43ad-8649-9941becf1a6d', '12345678', '2022', '04', '17', '星期日', '16', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('14fc7f50-3c47-4e71-a7d2-f4d1caf59740', '12345678', '2022', '04', '04', '星期一', '15', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('158077f2-943b-4221-b0a9-d829295228c8', '12345678', '2022', '04', '09', '星期六', '15', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('158b7038-813b-4b0d-8910-fc4c6baed024', '12345678', '2022', '05', '15', '星期日', '20', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('160ac8fb-ac8f-4e2d-b893-2ef5c7de82c8', '12345678', '2022', '04', '13', '星期三', '16', '支出', '2131231051', '饮品', '7', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('16460a7f-16e4-4ea5-9192-2e52b89a6ea4', '12345678', '2022', '05', '18', '星期三', '21', '支出', '2131230879', '餐饮', '15', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('17cfcca6-1840-442a-a508-f9d335d01072', '12345678', '2022', '05', '02', '星期一', '19', '支出', '2131230879', '餐饮', '1', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('1897cf06-d0b2-4e67-b577-4f5686026440', '12345678', '2022', '04', '09', '星期六', '15', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('1a99e780-a951-44ed-9756-6f9c15ec3bdf', '12345678', '2022', '05', '19', '星期四', '21', '支出', '2131231051', '饮品', '5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('1aa0c082-ff49-44aa-aa0b-7e6b10620c3e', '12345678', '2022', '04', '01', '星期五', '14', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('1b45b015-90a6-4abc-b0bd-f84345b907b4', '12345678', '2022', '05', '02', '星期一', '19', '支出', '2131230983', '学习', '25.4', '查重', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('1bb930b5-bda4-40a8-b72c-21ce2530d7b6', '12345678', '2022', '05', '05', '星期四', '19', '支出', '2131230879', '餐饮', '12.3', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('1d78f424-c165-49dd-9e1a-009599cc8209', '12345678', '2022', '04', '19', '星期二', '17', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '4', '');
INSERT INTO `detail_record` VALUES ('209d71a9-9feb-46ea-984a-43990e627db1', '12345678', '2022', '05', '08', '星期日', '19', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('21580d18-3e3c-4645-a328-732ac3621a3d', '12345678', '2022', '05', '20', '星期五', '21', '支出', '2131230879', '餐饮', '17', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('22046c79-2b52-442d-b987-414ff1ad8ba2', '12345678', '2022', '03', '19', '星期六', '12', '支出', '2131230963', '购物', '850', '购物', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('230f3e90-c807-4846-8400-91a6a2122b9f', '12345678', '2022', '04', '02', '星期六', '14', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('237b9c1d-6874-4981-9a92-005bfaa15306', '12345678', '2022', '04', '02', '星期六', '14', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('24a997a6-ee0a-4afb-a022-4db8f117d102', '12345678', '2022', '04', '15', '星期五', '16', '支出', '2131231051', '饮品', '23.5', '饮品', null, '', null, '4', '');
INSERT INTO `detail_record` VALUES ('25e948bc-0a10-48ee-8142-f48680f7f2c3', '12345678', '2022', '05', '13', '星期五', '20', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('278cd312-705e-4f4d-8919-7eaa23161b9f', '12345678', '2022', '05', '01', '星期日', '18', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('2a28b55a-f1fa-4025-9265-7e7db8fdb463', '12345678', '2022', '04', '08', '星期五', '15', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('2aaa7b45-c1d5-4d13-89a4-a8bd23de4b13', '12345678', '2022', '04', '10', '星期日', '15', '支出', '2131231051', '饮品', '7', '饮品', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('2ad980de-68ce-436e-bebc-79efbe839f2a', '12345678', '2022', '04', '15', '星期五', '16', '支出', '2131230879', '餐饮', '14.2', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('2ddac68e-1ae2-4253-8c07-111f296fb7d4', '12345678', '2022', '04', '22', '星期五', '17', '支出', '2131230879', '餐饮', '16', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('2de74ecf-6701-4998-9134-2c52f3654062', '12345678', '2022', '05', '17', '星期二', '21', '支出', '2131230879', '餐饮', '8.5', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('2ed2eb92-9006-4a83-b7fd-5b17614d47fb', '12345678', '2022', '04', '18', '星期一', '17', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('2eea5806-b863-44fe-b653-c706bdae50d5', '12345678', '2022', '04', '17', '星期日', '16', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('3007267f-ed9e-48ed-b751-7b4e688d1fb5', '12345678', '2022', '04', '26', '星期二', '18', '支出', '2131230923', '水果', '6', '水果', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('3265319b-0bba-490d-b10a-7a58ac65898b', '12345678', '2022', '04', '08', '星期五', '15', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('369da84e-5ade-4bf5-9904-b68d0e2e7afc', '12345678', '2022', '04', '30', '星期六', '18', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('380dc16b-9b83-4a68-8515-6cae030521c7', '12345678', '2022', '04', '11', '星期一', '16', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('3a88e017-77b4-4285-9664-3bfa37741f77', '12345678', '2022', '04', '28', '星期四', '18', '支出', '2131230879', '餐饮', '3', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('3ba7a71b-662c-4b70-86b1-a1d2fcb234f4', '12345678', '2022', '05', '06', '星期五', '19', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('3e2e0290-ed96-4307-a26b-cf25516515e2', '12345678', '2022', '05', '06', '星期五', '19', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('3f106c28-4679-4ab5-af91-de43c070374a', '12345678', '2022', '05', '10', '星期二', '20', '支出', '2131230987', '交通', '1.5', '交通', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('40373068-96a9-40a3-a5c4-dbbef1c7908d', '12345678', '2022', '04', '15', '星期五', '16', '支出', '2131230879', '餐饮', '11', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('40a31c91-2ac3-4867-ab71-3cce9112411b', '12345678', '2022', '04', '27', '星期三', '18', '支出', '2131230983', '学习', '1.3', '打印', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('41e54422-514c-4c49-8130-caef039c3b1d', '12345678', '2022', '04', '14', '星期四', '16', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('428f06b4-c813-4aa6-9405-c94139186f4a', '12345678', '2022', '04', '16', '星期六', '16', '支出', '2131230963', '购物', '28', 'kindle保护壳', null, '', null, '4', '');
INSERT INTO `detail_record` VALUES ('4462675e-eebd-4c4e-9c69-1cea9640914b', '12345678', '2022', '04', '15', '星期五', '16', '支出', '2131230987', '交通', '1.5', '交通', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('44b080b2-0037-4cb7-96ef-a2b357ac7fec', '12345678', '2022', '04', '29', '星期五', '18', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('45e33f93-6bf5-46ac-bc3f-576d740b8c85', '12345678', '2022', '04', '19', '星期二', '17', '支出', '2131231051', '饮品', '9.5', '饮品', null, '', null, '5', '');
INSERT INTO `detail_record` VALUES ('463b3469-f530-4aca-917e-f01642ffb4e1', '12345678', '2022', '05', '12', '星期四', '20', '支出', '2131230987', '交通', '1.5', '交通', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('47905867-6e94-4bf2-a098-95c4d6d595bb', '12345678', '2022', '04', '07', '星期四', '15', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('48356270-8609-4416-8e5d-8a1e0f02fefa', '12345678', '2022', '01', '19', '星期三', '04', '支出', '2131230891', '通信', '125', '通信', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('48afc5d8-a25a-46b4-8d9c-731c47d8a1bb', '12345678', '2022', '04', '06', '星期三', '15', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('48f7d7cf-0672-4ead-94eb-958caebf960e', '12345678', '2022', '04', '28', '星期四', '18', '支出', '2131230891', '通信', '150', '通信', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('4abe6ce2-f1c3-4f36-83d0-b2c760ec3743', '12345678', '2022', '05', '07', '星期六', '19', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('4ba87d69-54a7-46af-81d2-607afa39b622', '12345678', '2022', '04', '04', '星期一', '15', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('4c8641fe-6f4b-49d0-8a62-984a10acc8ac', '12345678', '2022', '04', '01', '星期五', '14', '支出', '2131230879', '餐饮', '12', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('4d94ae50-9291-4af3-a119-3ea54cefa383', '12345678', '2022', '05', '18', '星期三', '21', '支出', '2131230987', '交通', '3', '交通', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('4d970b03-b5fb-42f7-ac0d-6958d09d93e7', '12345678', '2022', '04', '13', '星期三', '16', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('4e842b74-093e-4feb-a8b1-306d5f7dcac6', '12345678', '2022', '01', '17', '星期一', '04', '支出', '2131230879', '餐饮', '700', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('4f9a5d6f-0812-4425-9bb8-dd20ce6657a9', '12345678', '2022', '05', '15', '星期日', '20', '支出', '2131230879', '餐饮', '12', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('4ffc2081-e4df-4d42-9de1-ff758860e9ae', '12345678', '2022', '04', '13', '星期三', '16', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('50a5a738-7666-405f-ac18-026a6ce34e7f', '12345678', '2022', '04', '14', '星期四', '16', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('537b36b6-d4fc-47ad-9d74-91cd5f3fc2c9', '12345678', '2022', '04', '24', '星期日', '17', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('54a194d7-23fd-4dcf-a645-cf9fec95f553', '12345678', '2022', '05', '10', '星期二', '20', '支出', '2131230879', '餐饮', '9.5', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('58ea99cb-1360-48cc-a8cf-d1de9414b1da', '12345678', '2022', '05', '14', '星期六', '20', '支出', '2131230923', '水果', '6', '水果', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('59cee6c6-f4b2-4fcd-8a2e-be0f0013d225', '12345678', '2022', '05', '07', '星期六', '19', '支出', '2131230879', '餐饮', '2.9', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('5acd25a0-2dc3-433e-ab65-af82c4f83a6e', '12345678', '2022', '05', '02', '星期一', '19', '支出', '2131231051', '饮品', '7', '饮品', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('602a5528-446b-4202-aa9f-d61c9b503ecf', '12345678', '2022', '05', '05', '星期四', '19', '支出', '2131231067', '零食', '3', '零食', null, '', null, '5', '');
INSERT INTO `detail_record` VALUES ('60dd20c7-9b6c-408b-a8f0-a616d2b40c3d', '12345678', '2022', '04', '21', '星期四', '17', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('61f037c0-e971-429e-87ce-a94f19d5cbcc', '12345678', '2022', '04', '22', '星期五', '17', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('636829b2-cd74-4288-85af-7198dd201079', '12345678', '2022', '04', '05', '星期二', '15', '支出', '2131230879', '餐饮', '7', '餐饮', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('679c0f8c-5749-409a-9432-59dd5c4f95ef', '12345678', '2022', '04', '05', '星期二', '15', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('6be3e7c3-d626-40e1-bb87-1b1b5e2556a1', '12345678', '2022', '04', '03', '星期日', '14', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('6c2ebafc-0f68-4b6c-8d03-bcb7bd0a2fbc', '12345678', '2022', '04', '20', '星期三', '17', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '4', '');
INSERT INTO `detail_record` VALUES ('6e29920f-a697-4a6d-85bd-b5ce6c3bfa66', '12345678', '2022', '04', '19', '星期二', '17', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('6f8cb34b-1878-4339-bb1a-b78095f64bb9', '12345678', '2022', '04', '01', '星期五', '14', '支出', '2131230879', '餐饮', '10.5', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('720be82a-7a87-4b15-8671-cfc0c8559d03', '12345678', '2022', '02', '19', '星期六', '08', '支出', '2131230963', '购物', '150', '购物', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('7524a670-bf28-43ae-a9d0-c3448e5fcad6', '12345678', '2022', '05', '10', '星期二', '20', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('769e88dd-ddf7-40eb-a21a-152614edae52', '12345678', '2022', '05', '01', '星期日', '18', '支出', '2131230879', '餐饮', '3.5', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('775d3dee-dd7d-4b57-8b8a-6fcf7f984bdd', '12345678', '2022', '04', '21', '星期四', '17', '支出', '2131230923', '水果', '6', '水果', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('778da9f4-5174-497a-a2c3-d990206d4528', '12345678', '2022', '04', '11', '星期一', '16', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('7ddc7692-e332-4cf6-a160-907a67d3cf25', '12345678', '2022', '05', '05', '星期四', '19', '支出', '2131231051', '饮品', '12', '饮品', null, '', null, '4', '');
INSERT INTO `detail_record` VALUES ('7ed3a9ad-6e98-4abc-8779-7e190034486d', '12345678', '2022', '04', '03', '星期日', '14', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('7eea39bf-c24e-4e2a-b57c-5d955b4b142a', '12345678', '2022', '05', '12', '星期四', '20', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('7fbc4f65-0357-4e3a-a367-a5de6fc25fb3', '12345678', '2022', '04', '30', '星期六', '18', '支出', '2131230879', '餐饮', '12', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('7ffe2530-7668-4853-9f76-ca0d5f8df28e', '12345678', '2022', '01', '19', '星期三', '04', '支出', '2131230963', '购物', '900', '购物', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('81312d90-fd56-415a-935f-377158b97232', '12345678', '2022', '05', '01', '星期日', '18', '支出', '2131230891', '通信', '100', '通信', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('81b3ba83-2e6e-42ea-be0a-cd5f45a26fa8', '12345678', '2022', '05', '05', '星期四', '19', '支出', '2131231051', '饮品', '3', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('8294253a-7785-4fc2-a901-54dec537179e', '12345678', '2022', '05', '16', '星期一', '21', '支出', '2131230923', '水果', '12', '水果', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('83b5d4a4-c632-4387-9663-beba68f19e1c', '12345678', '2022', '04', '21', '星期四', '17', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('83ffbfea-35f0-4151-a88c-9402787a22c8', '12345678', '2022', '04', '16', '星期六', '16', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('8607b91b-f760-42f0-becd-81fe2b7c8547', '12345678', '2022', '04', '07', '星期四', '15', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('89569d71-a4ce-4c03-951a-323e03cd7133', '12345678', '2022', '04', '25', '星期一', '18', '支出', '2131230879', '餐饮', '11.5', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('8b2d1598-9a38-47da-9057-c0c99a2daaa3', '12345678', '2022', '01', '19', '星期三', '04', '支出', '2131230963', '购物', '300', '购物', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('8b3cd440-f107-4d2e-a040-3e30e069242e', '12345678', '2022', '04', '10', '星期日', '15', '支出', '2131230879', '餐饮', '8', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('8ed0a452-d02d-449d-82af-9546db0efad9', '12345678', '2022', '04', '19', '星期二', '17', '支出', '2131230963', '购物', '10', '购物', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('920be5c4-7299-431e-a423-74639897639d', '12345678', '2022', '04', '19', '星期二', '17', '支出', '2131231319', '洗衣服', '2', '洗衣服', null, '', null, '6', '');
INSERT INTO `detail_record` VALUES ('9607fc59-7f10-499e-a809-79b6c74812eb', '12345678', '2022', '05', '07', '星期六', '19', '支出', '2131231067', '零食', '71.1', '零食', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('9a1b3e48-af85-443b-a9c8-fccecdecd079', '12345678', '2022', '05', '03', '星期二', '19', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('9ee38923-1223-4d88-bff9-15b4aca91029', '12345678', '2022', '05', '09', '星期一', '20', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('a0905f73-4d13-4757-b349-df6104329d3c', '12345678', '2022', '04', '26', '星期二', '18', '支出', '2131230887', '日用', '36.6', '日用', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('a109b7a8-d7d2-4904-b444-1621075b89d6', '12345678', '2022', '05', '18', '星期三', '21', '支出', '2131230879', '餐饮', '16', '餐饮', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('a53edbbf-adf8-47ec-b596-368b64d7ef13', '12345678', '2022', '05', '11', '星期三', '20', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('a545a781-d84e-4635-bfac-cdaecf915c09', '12345678', '2022', '04', '06', '星期三', '15', '支出', '2131230879', '餐饮', '10.5', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('a5a3edbb-3011-49d9-a0c8-306bc0da98c0', '12345678', '2022', '04', '15', '星期五', '16', '支出', '2131230887', '日用', '35', '洗衣液', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('a7b06ba7-8ffa-4457-9d50-289ed1f64888', '12345678', '2022', '04', '05', '星期二', '15', '支出', '2131230987', '交通', '2.5', '交通', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('a7e15145-b64e-43e2-92db-56734d1c57b8', '12345678', '2022', '04', '16', '星期六', '16', '支出', '2131230963', '购物', '998', 'Kindle paperwhite5', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('a92f4db9-df25-4c95-b42e-ac690ba74aec', '12345678', '2022', '04', '25', '星期一', '18', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('a989e7a0-5242-4107-abb8-542df38fddba', '12345678', '2022', '05', '14', '星期六', '20', '支出', '2131230879', '餐饮', '14', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('adac99ab-9e38-49d2-b9e3-501bb8cfa0bc', '12345678', '2022', '05', '09', '星期一', '20', '支出', '2131230879', '餐饮', '11.5', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('b15139da-ea2f-4bf6-a86d-5033877e5354', '12345678', '2022', '04', '10', '星期日', '15', '支出', '2131230879', '餐饮', '4.2', '餐饮', null, '', null, '4', '');
INSERT INTO `detail_record` VALUES ('b1fbfeba-b485-4c1a-848a-71f9ba82db21', '12345678', '2022', '05', '01', '星期日', '18', '支出', '2131230879', '餐饮', '12.7', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('b2edde4a-fc08-48c8-9f9f-c500397717f8', '12345678', '2022', '05', '13', '星期五', '20', '支出', '2131230879', '餐饮', '14', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('b3aa0275-b9cc-4140-8881-25d6618e1575', '12345678', '2022', '04', '17', '星期日', '16', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('b3d1eb29-be67-47c8-a423-479e39dd7a67', '12345678', '2022', '05', '13', '星期五', '20', '支出', '2131230887', '日用', '16', '日用', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('b5164575-98ae-4f8e-878a-260409b6a25f', '12345678', '2022', '04', '27', '星期三', '18', '支出', '2131231271', '洗澡', '30', '洗澡', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('b5a85fa7-7915-482d-bbd6-baa9ff693f98', '12345678', '2022', '04', '12', '星期二', '16', '支出', '2131230879', '餐饮', '10.7', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('b6a54b02-2ccb-42af-94b6-006aef3cb9d3', '12345678', '2022', '02', '19', '星期六', '08', '支出', '2131230963', '购物', '800', '购物', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('ba41a60d-8067-4f5f-b594-7d6d28a675c0', '12345678', '2022', '05', '11', '星期三', '20', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('bb000118-8184-419f-9df0-9f83b3c25535', '12345678', '2022', '04', '10', '星期日', '15', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('bb4c22f9-f7cf-49f6-be25-47f7394e7a5e', '12345678', '2022', '04', '18', '星期一', '17', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('bd30494b-92d4-4404-a45e-28c3bc4360a1', '12345678', '2022', '05', '03', '星期二', '19', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('befd463c-98a6-486e-826c-0db119e05c2a', '12345678', '2022', '04', '18', '星期一', '17', '支出', '2131231051', '饮品', '9', '饮品', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('c0abde8b-bca7-4a83-9bf9-7f171f575751', '12345678', '2022', '04', '18', '星期一', '17', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('c15b44c1-9785-4c42-b68c-55cbf57f941f', '12345678', '2022', '05', '15', '星期日', '20', '支出', '2131230923', '水果', '14.6', '西瓜', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('c24bed82-cbe8-43aa-aa85-33c1e7cd56e6', '12345678', '2022', '04', '29', '星期五', '18', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('c3f1da49-0be3-4c09-a104-eb95f02dd878', '12345678', '2022', '04', '11', '星期一', '16', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('c601a097-baf0-4c7c-a82f-f5edebaa1ac4', '12345678', '2022', '05', '18', '星期三', '21', '支出', '2131230943', '医疗', '12.8', '西瓜霜', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('c6829579-f22d-47f3-8c77-50f9560a5e0b', '12345678', '2022', '03', '19', '星期六', '12', '支出', '2131230879', '餐饮', '697.2', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('c6872414-d38b-42b5-bb71-f67e6c3b2cf9', '12345678', '2022', '04', '25', '星期一', '18', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('c6fce9e4-fc3e-4e85-81d6-9b042d9c6205', '12345678', '2022', '04', '14', '星期四', '16', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('c77520dc-282c-440e-ac4c-22238dc225a5', '12345678', '2022', '04', '12', '星期二', '16', '支出', '2131231051', '饮品', '7', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('c8302708-881c-49bd-a719-e980fb0b54a5', '12345678', '2022', '04', '22', '星期五', '17', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('c9208202-6c92-4089-97c2-2694591195f7', '12345678', '2022', '02', '19', '星期六', '08', '支出', '2131230879', '餐饮', '650', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('cb5ca010-4dbc-4148-88cb-69998105abde', '12345678', '2022', '05', '14', '星期六', '20', '支出', '2131230963', '购物', '93.9', '洗面奶', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('cbc64ee9-baa5-44ef-a37d-623aadbf4bbd', '12345678', '2022', '04', '05', '星期二', '15', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('cca42dcd-66ee-4f64-86a9-2bd85ed9ceaa', '12345678', '2022', '05', '02', '星期一', '19', '支出', '2131230879', '餐饮', '9.61', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('cd79dccf-2f29-4f8c-b000-c7afeca4711f', '12345678', '2022', '04', '19', '星期二', '17', '支出', '2131230963', '购物', '60', '充电宝', '20220419155330photo.jpg|20220419155651photo.jpg|', '', null, '2', '');
INSERT INTO `detail_record` VALUES ('cdac6ac0-eb20-404c-88ac-80e9e0d1ef1a', '12345678', '2022', '04', '24', '星期日', '17', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('cf1ffe8c-435a-4b81-acf4-4e5e9ae6cc1e', '12345678', '2022', '04', '26', '星期二', '18', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('cf71f97c-40ed-4e6a-9c4c-347f84301f9b', '12345678', '2022', '04', '16', '星期六', '16', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('d302856e-579c-4ae2-9f3d-93e852859692', '12345678', '2022', '05', '08', '星期日', '19', '支出', '2131230879', '餐饮', '16', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('d78ab852-e900-4e19-9b8d-a902da757c3b', '12345678', '2022', '04', '07', '星期四', '15', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('d7c62075-52f9-415f-9746-fca5a254f85d', '12345678', '2022', '04', '08', '星期五', '15', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('d9071f78-0199-43e9-8694-fc661d951ca7', '12345678', '2022', '04', '22', '星期五', '17', '支出', '2131230987', '交通', '1.5', '交通', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('d97592e0-dcb8-4c77-ab34-591d72dca2b5', '12345678', '2022', '05', '16', '星期一', '21', '支出', '2131230879', '餐饮', '16', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('d9b51f85-5130-4785-9a76-b3dff49497c2', '12345678', '2022', '03', '19', '星期六', '12', '支出', '2131230963', '购物', '112', '购物', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('de177f6e-8eb8-481f-a334-9a2a4250764d', '12345678', '2022', '04', '07', '星期四', '15', '支出', '2131230983', '学习', '24.8', '文献下载', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('e0bf3432-69a2-4599-a88a-56d8ce48312b', '12345678', '2022', '04', '29', '星期五', '18', '支出', '2131230879', '餐饮', '14', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('e15ee9d8-ee76-4588-ba7b-78233c5725a1', '12345678', '2022', '04', '04', '星期一', '15', '支出', '2131230879', '餐饮', '10.5', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('e3985a27-d6c7-4497-b7b8-3a05a10f9504', '12345678', '2022', '05', '05', '星期四', '19', '支出', '2131230923', '水果', '13.7', '水果', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('e40e4a3f-4dc3-4479-b109-79eb3e66b203', '12345678', '2022', '04', '12', '星期二', '16', '支出', '2131230879', '餐饮', '14.9', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('e431c0be-a792-46df-aa0e-ca33ffd58df2', '12345678', '2022', '05', '07', '星期六', '19', '支出', '2131230983', '学习', '29.8', '文献', null, '', null, '4', '');
INSERT INTO `detail_record` VALUES ('e45ee6cf-cff5-4a72-8e62-3ab2b36cd9e8', '12345678', '2022', '05', '17', '星期二', '21', '支出', '2131230879', '餐饮', '12.5', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('e7d24d04-5a12-40e2-81cb-adb62eaafade', '12345678', '2022', '04', '28', '星期四', '18', '支出', '2131230879', '餐饮', '15.5', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('e7d6bad1-f4a1-4a3d-8dc9-68cad34396b7', '12345678', '2022', '05', '07', '星期六', '19', '支出', '2131230879', '餐饮', '11', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('e89acb92-9780-4b7a-b9ca-b31c6297de7d', '12345678', '2022', '05', '05', '星期四', '19', '支出', '2131230879', '餐饮', '8.59', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('e996a2b4-5c48-426b-b844-f5ced025fb49', '12345678', '2022', '04', '24', '星期日', '17', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('e9fcc31e-faaf-4a17-a47b-32d455759685', '12345678', '2022', '04', '03', '星期日', '14', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('eab3fbc9-b4fd-4cdf-8ffd-8ec69b693fc0', '12345678', '2022', '05', '04', '星期三', '19', '支出', '2131230879', '餐饮', '12', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('ef3b2fc5-19a6-4da4-8c13-d7a1713ac71a', '12345678', '2022', '05', '12', '星期四', '20', '支出', '2131230879', '餐饮', '11.5', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('f3e2f0ca-e596-4a7d-8798-55c8e6201e51', '12345678', '2022', '04', '17', '星期日', '16', '支出', '2131230923', '水果', '16.3', '水果', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('f4722df0-4278-4a32-ac3a-8e40cf0ac3db', '12345678', '2022', '05', '17', '星期二', '21', '支出', '2131231051', '饮品', '2', '饮品', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('f4b5df12-2f10-4bc8-9c9e-185e92fbf255', '12345678', '2022', '04', '09', '星期六', '15', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('f4f39694-3c12-4d1d-9949-4f6ce2ef4473', '12345678', '2022', '05', '16', '星期一', '21', '支出', '2131230879', '餐饮', '13', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('f501e798-f19f-4a0d-aa74-b2d4489c901e', '12345678', '2022', '05', '14', '星期六', '20', '支出', '2131230879', '餐饮', '21', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('f577cf4e-9a0b-40f3-bf6d-95c02956f29e', '12345678', '2022', '04', '02', '星期六', '14', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '0', '');
INSERT INTO `detail_record` VALUES ('f639aaee-013d-4e3a-9709-794466120560', '12345678', '2022', '04', '20', '星期三', '17', '支出', '2131230879', '餐饮', '10', '餐饮', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('f861bdb3-322c-40cb-86ca-88cd72aca144', '12345678', '2022', '05', '19', '星期四', '21', '支出', '2131230879', '餐饮', '12', '餐饮', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('f87136fa-ba8a-4239-9cd7-98acfa639365', '12345678', '2022', '03', '19', '星期六', '12', '支出', '2131230891', '通信', '120', '通信', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('fa53bd26-69b8-410f-a5f4-2df01f49881b', '12345678', '2022', '04', '06', '星期三', '15', '支出', '2131230879', '餐饮', '9', '餐饮', null, '', null, '1', '');
INSERT INTO `detail_record` VALUES ('fd163116-4624-4226-990f-ad725c32241b', '12345678', '2022', '04', '23', '星期六', '17', '支出', '2131230987', '交通', '32', '交通', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('fd6d4900-8407-4664-97ae-a486b5b2f857', '12345678', '2022', '04', '21', '星期四', '17', '支出', '2131230963', '购物', '17', '购物', null, '', null, '3', '');
INSERT INTO `detail_record` VALUES ('fe449314-c4df-48b7-a9ab-188bef5812de', '12345678', '2022', '04', '24', '星期日', '17', '支出', '2131231319', '洗衣服', '2', '洗衣服', null, '', null, '2', '');
INSERT INTO `detail_record` VALUES ('ff2c9681-b000-47db-ab7c-1be12879f827', '12345678', '2022', '04', '16', '星期六', '16', '支出', '2131231051', '饮品', '3.5', '饮品', null, '', null, '3', '');

-- ----------------------------
-- Table structure for `month_main_expend`
-- ----------------------------
DROP TABLE IF EXISTS `month_main_expend`;
CREATE TABLE `month_main_expend` (
  `month` int(4) NOT NULL,
  `account` varchar(30) NOT NULL,
  `type` char(10) NOT NULL,
  `money` decimal(10,0) NOT NULL,
  `year` int(4) NOT NULL,
  PRIMARY KEY (`month`,`account`,`type`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of month_main_expend
-- ----------------------------
INSERT INTO `month_main_expend` VALUES ('1', '12345678', '购物', '1200', '2022');
INSERT INTO `month_main_expend` VALUES ('1', '12345678', '通信', '125', '2022');
INSERT INTO `month_main_expend` VALUES ('1', '12345678', '餐饮', '700', '2022');
INSERT INTO `month_main_expend` VALUES ('2', '12345678', '购物', '950', '2022');
INSERT INTO `month_main_expend` VALUES ('2', '12345678', '通信', '90', '2022');
INSERT INTO `month_main_expend` VALUES ('2', '12345678', '餐饮', '650', '2022');
INSERT INTO `month_main_expend` VALUES ('3', '12345678', '购物', '962', '2022');
INSERT INTO `month_main_expend` VALUES ('3', '12345678', '通信', '120', '2022');
INSERT INTO `month_main_expend` VALUES ('3', '12345678', '餐饮', '697', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '书籍', '13', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '交通', '39', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '学习', '26', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '日用', '72', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '水果', '28', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '洗澡', '30', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '洗衣服', '4', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '购物', '1113', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '通信', '179', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '餐饮', '594', '2022');
INSERT INTO `month_main_expend` VALUES ('4', '12345678', '饮品', '144', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '交通', '7', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '医疗', '13', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '学习', '55', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '日用', '16', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '水果', '47', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '购物', '94', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '通信', '100', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '零食', '74', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '餐饮', '483', '2022');
INSERT INTO `month_main_expend` VALUES ('5', '12345678', '饮品', '47', '2022');

-- ----------------------------
-- Table structure for `record_type`
-- ----------------------------
DROP TABLE IF EXISTS `record_type`;
CREATE TABLE `record_type` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL,
  `ooa` varchar(16) NOT NULL COMMENT 'OptionalOrAdditive, “optional” “addible” 可选和可添加两种类型',
  `ioe` varchar(16) NOT NULL COMMENT 'IncomeOrExpend，是”支出“还是”收入“',
  `detail_type` varchar(16) NOT NULL,
  `icon_url` int(32) NOT NULL,
  `custom_type_name` varchar(16) DEFAULT '' COMMENT '自定义类型名称',
  `doc` varchar(7) NOT NULL DEFAULT '' COMMENT ' defaults custom两种(但值就是 d c)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_type
-- ----------------------------
INSERT INTO `record_type` VALUES ('116', '12345678', 'optional', '支出', '餐饮', '2131230877', null, 'd');
INSERT INTO `record_type` VALUES ('117', '12345678', 'optional', '支出', '日用', '2131230885', null, 'd');
INSERT INTO `record_type` VALUES ('118', '12345678', 'optional', '支出', '交通', '2131230985', null, 'd');
INSERT INTO `record_type` VALUES ('119', '12345678', 'optional', '支出', '饮食', '2131231053', '饮品', 'c');
INSERT INTO `record_type` VALUES ('120', '12345678', 'optional', '支出', '服饰', '2131230901', null, 'd');
INSERT INTO `record_type` VALUES ('121', '12345678', 'optional', '支出', '家居', '2131231321', '洗衣服', 'c');
INSERT INTO `record_type` VALUES ('122', '12345678', 'optional', '支出', '娱乐', '2131230909', null, 'd');
INSERT INTO `record_type` VALUES ('123', '12345678', 'optional', '支出', '购物', '2131230961', null, 'd');
INSERT INTO `record_type` VALUES ('124', '12345678', 'optional', '支出', '汽车', '2131230873', null, 'd');
INSERT INTO `record_type` VALUES ('125', '12345678', 'optional', '支出', '家居', '2131230929', null, 'd');
INSERT INTO `record_type` VALUES ('126', '12345678', 'optional', '支出', '长辈', '2131230905', null, 'd');
INSERT INTO `record_type` VALUES ('127', '12345678', 'optional', '支出', '住房', '2131230933', null, 'd');
INSERT INTO `record_type` VALUES ('128', '12345678', 'optional', '支出', '通信', '2131230889', null, 'd');
INSERT INTO `record_type` VALUES ('129', '12345678', 'optional', '支出', '蔬菜', '2131230993', null, 'd');
INSERT INTO `record_type` VALUES ('130', '12345678', 'optional', '支出', '水果', '2131230921', null, 'd');
INSERT INTO `record_type` VALUES ('131', '12345678', 'optional', '支出', '旅行', '2131230989', null, 'd');
INSERT INTO `record_type` VALUES ('132', '12345678', 'optional', '支出', '书籍', '2131230869', null, 'd');
INSERT INTO `record_type` VALUES ('133', '12345678', 'optional', '支出', '美容', '2131230865', null, 'd');
INSERT INTO `record_type` VALUES ('134', '12345678', 'optional', '支出', '孩子', '2131230881', null, 'd');
INSERT INTO `record_type` VALUES ('135', '12345678', 'optional', '支出', '数码', '2131230893', null, 'd');
INSERT INTO `record_type` VALUES ('136', '12345678', 'optional', '支出', '学习', '2131230981', null, 'd');
INSERT INTO `record_type` VALUES ('137', '12345678', 'optional', '支出', '烟酒', '2131230965', null, 'd');
INSERT INTO `record_type` VALUES ('138', '12345678', 'optional', '支出', '医疗', '2131230941', null, 'd');
INSERT INTO `record_type` VALUES ('139', '12345678', 'optional', '支出', '社交', '2131230973', null, 'd');
INSERT INTO `record_type` VALUES ('140', '12345678', 'optional', '支出', '快递', '2131230913', null, 'd');
INSERT INTO `record_type` VALUES ('141', '12345678', 'optional', '支出', '礼物', '2131230925', null, 'd');
INSERT INTO `record_type` VALUES ('142', '12345678', 'optional', '支出', '办公', '2131230949', null, 'd');
INSERT INTO `record_type` VALUES ('143', '12345678', 'optional', '支出', '宠物', '2131230953', null, 'd');
INSERT INTO `record_type` VALUES ('144', '12345678', 'optional', '支出', '运动', '2131230977', null, 'd');
INSERT INTO `record_type` VALUES ('145', '12345678', 'optional', '支出', '生活', '2131231273', '洗澡', 'c');
INSERT INTO `record_type` VALUES ('146', '12345678', 'optional', '支出', '饮食', '2131231069', '零食', 'c');
INSERT INTO `record_type` VALUES ('147', '12345678', 'optional', '收入', '工资', '2131230997', null, 'd');
INSERT INTO `record_type` VALUES ('148', '12345678', 'optional', '收入', '礼金', '2131230945', null, 'd');
INSERT INTO `record_type` VALUES ('149', '12345678', 'optional', '收入', '兼职', '2131231009', null, 'd');
INSERT INTO `record_type` VALUES ('150', '12345678', 'optional', '收入', '理财', '2131230997', null, 'd');
INSERT INTO `record_type` VALUES ('151', '12345678', 'optional', '收入', '其他', '2131231005', null, 'd');
INSERT INTO `record_type` VALUES ('152', '12345678', 'addible', '支出', '维修', '2131230957', null, 'd');
INSERT INTO `record_type` VALUES ('153', '12345678', 'addible', '支出', '捐赠', '2131230897', null, 'd');
INSERT INTO `record_type` VALUES ('154', '12345678', 'addible', '支出', '零食', '2131230969', null, 'd');
INSERT INTO `record_type` VALUES ('155', '12345678', 'addible', '支出', '彩票', '2131230937', null, 'd');
INSERT INTO `record_type` VALUES ('156', '12345678', 'addible', '支出', '朋友', '2131230917', null, 'd');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `portrait` varchar(128) DEFAULT NULL,
  `sex` char(1) NOT NULL DEFAULT '男',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('3', '12345678', null, '1', null, '男');

-- ----------------------------
-- Table structure for `year_main_expend`
-- ----------------------------
DROP TABLE IF EXISTS `year_main_expend`;
CREATE TABLE `year_main_expend` (
  `year` int(4) NOT NULL,
  `account` varchar(32) NOT NULL,
  `type` char(10) NOT NULL,
  `money` decimal(10,0) NOT NULL,
  PRIMARY KEY (`year`,`account`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of year_main_expend
-- ----------------------------
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '书籍', '13');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '交通', '46');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '医疗', '13');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '学习', '81');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '日用', '88');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '水果', '75');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '洗澡', '30');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '洗衣服', '4');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '购物', '4319');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '通信', '614');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '零食', '74');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '餐饮', '3124');
INSERT INTO `year_main_expend` VALUES ('2022', '12345678', '饮品', '191');

-- ----------------------------
-- View structure for `user_info2`
-- ----------------------------
DROP VIEW IF EXISTS `user_info2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_info2` AS select `detail_record`.`account` AS `account`,`detail_record`.`year` AS `year`,`detail_record`.`detail_type` AS `detail_type`,sum(`detail_record`.`money`) AS `money` from `detail_record` group by `detail_record`.`account`,`detail_record`.`year`,`detail_record`.`detail_type` ;
