/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : localhost:3306
 Source Schema         : houserent

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : 65001

 Date: 25/02/2022 12:52:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈标题',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈内容',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `status` int(1) NULL DEFAULT NULL COMMENT '处理状态：0待处理 1已处理',
  `reply` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反馈表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES (2, '2022-01-05 17:52:23', '测试1', '测试1', 3, 0, NULL, 'adminuser', 'admin@qq.com');
INSERT INTO `t_feedback` VALUES (3, '2022-01-05 17:52:29', '测试2', '测试2', 3, 1, '我们已经进行处理，请耐心等待。', 'adminuser', 'admin@gmail.com');

-- ----------------------------
-- Table structure for t_giftcard
-- ----------------------------
DROP TABLE IF EXISTS `t_giftcard`;
CREATE TABLE `t_giftcard`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `series` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兑换卡序列号',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态，1未使用 -1已使用 0已过期',
  `value` decimal(20, 2) NULL DEFAULT NULL COMMENT '礼品卡价值余额',
  `create_date` datetime NULL DEFAULT NULL COMMENT '生产日期',
  `end_date` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `used_date` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `used_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_giftcard
-- ----------------------------
INSERT INTO `t_giftcard` VALUES (1, 'luBgNP6Axd', '-1', 100.00, '2022-01-25 15:34:21', '2022-01-26 16:42:31', '2022-01-26 13:42:23', 'admin');
INSERT INTO `t_giftcard` VALUES (2, 'QJV6CpFCNu', '-1', 500.00, '2022-01-25 15:34:55', '2022-01-30 17:06:15', '2022-01-26 13:44:58', 'admin');
INSERT INTO `t_giftcard` VALUES (3, 'CEBiKdHTMM', '-1', 0.55, '2022-01-25 15:35:10', '2022-01-30 17:06:20', '2022-01-26 13:46:19', 'admin');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '房东用户id',
  `rent_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出租类型：整租whole/合租/share',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋名称',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细描述',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址，具体到门牌号',
  `thumbnail_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图URL',
  `slide_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图URL',
  `month_rent` decimal(11, 2) NULL DEFAULT NULL COMMENT '月租金',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态：0未租出/1已租出/-1下架/-2待审核/-3审核不通过',
  `certificate_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房产证号',
  `toilet_num` int(2) NULL DEFAULT NULL COMMENT '卫生间数量',
  `kitchen_num` int(2) NULL DEFAULT NULL COMMENT '厨房数量',
  `living_room_num` int(2) NULL DEFAULT NULL COMMENT '客厅数量',
  `bedroom_num` int(2) NULL DEFAULT NULL COMMENT '卧室数量',
  `has_air_conditioner` int(2) NULL DEFAULT NULL COMMENT '是否有空调 1有 0无',
  `area` decimal(10, 2) NULL DEFAULT NULL COMMENT '面积',
  `floor` int(3) NULL DEFAULT NULL COMMENT '当前所有楼层数',
  `max_floor` int(3) NULL DEFAULT NULL COMMENT '房字最大楼层数',
  `has_elevator` int(1) NULL DEFAULT NULL COMMENT '是否有电梯 1有 0无',
  `build_year` int(4) NULL DEFAULT NULL COMMENT '建成年份',
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '朝向',
  `last_order_start_time` datetime NULL DEFAULT NULL COMMENT '上次开始入住时间',
  `last_order_end_time` datetime NULL DEFAULT NULL COMMENT '上次结束入住时间',
  `longitude_latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房屋表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES (1, '2021-12-17 17:40:23', 3, 'share', '【九院&田子坊】轻奢中式情调，旅途中也请给自己多一份关爱&带烘干/浴缸品质一居 近新天地/世博馆', '中国, 上海市, 汇景天地\r\n【周边】步行可达新天地田子坊，20分钟地铁至南京路步行街，30分钟地铁至城隍庙。\r\n小区隔壁就是汇景天地商场，有永辉超市-一点点，各类生活店铺，生活非常便利。小区绿化非常好，保安24小时服务，尽职尽责。\r\n\r\n出行信息\r\n【交通】 咱们的小家就在地铁四号线鲁班路/十三号线世博会博物馆地铁站附近的汇景天地小区，步行至四号线鲁班路地铁站大约2分钟。乘坐地铁到虹桥大约45分钟，到浦东机场大约1小时\r\n如果您选择自驾出行，您可以将您的爱车停在距离小区大门口边上的停车场，每小时8元 ，封顶大约64元', '上海', '中国, 上海市, 汇景天地', '/uploads/1867898c63fe436d9accb3b209057fab.jpg', '[\"/uploads/1867898c63fe436d9accb3b209057fab.jpg\",\"/uploads/31580da8d055442091aa56568e134e23.jpg\",\"/uploads/c9b99fe8e7a44c0c8735c1370a8ed55e.jpg\",\"/uploads/4855e48b0ccc4af6a118b0f3f78c4a90.jpg\",\"/uploads/0ea1999026174457b4cbb85590edcdd5.jpg\",\"/uploads/483718420eb04682bfbebb7045e69572.jpg\",\"/uploads/36fd0029bef443b69f704f2f7231070e.jpg\",\"/uploads/8c182e1ba6824433813cb86390cd590d.jpg\"]', 11250.00, 1, 'CHN202011564879900', 1, 1, 1, 1, 1, 123.00, 15, 19, 1, 2020, '西方', '2022-01-02 14:29:40', '2022-01-04 00:00:00', '121.484387,31.204161', '李四', '12345678999');
INSERT INTO `t_house` VALUES (2, '2022-01-08 15:31:03', 2, 'whole', '重庆解放碑/洪崖洞/来福士/全智能家居/巨幕投影', '中国, 重庆市, 渝中区, 中兴路228号熊猫公馆\r\n【位置】：此套房源位于渝中区解放碑核心地段,坐拥繁华,枕星揽空,下楼步行1分钟就是“山城步道”和“十八梯景区”,步行10分钟即可到解放碑中心,附近景点包含:洪崖洞,朝天门,长江索道,罗汉寺,湖广会馆等,均在打车起步价范围内.附近小吃街步行8分钟可达,例如:八一路好吃街/较场口夜市/得意世界美食城……\r\n\r\n【交通】:双地铁，步行2分钟即可达到地铁1/2号线交汇站——较场口站. 楼下就是公交车站“中兴路”站。\r\n\r\n【服务】:从入住到离店,专职管家24小时服务，为您的旅程提供贴心舒适的服务!!!楼栋24小时严密安保,为您的旅行保驾护航.', '重庆', '中国重庆市渝中区中兴路228号熊猫公馆', '/uploads/30839e269b4341a8acafc765ec6e712d.jpeg', '[\"/uploads/30839e269b4341a8acafc765ec6e712d.jpeg\",\"/uploads/580d8b211f0c45c694610adf6bc146b4.jpeg\",\"/uploads/b0d969bf2a9d4474bd729140128c8fb2.jpeg\"]', 4200.00, 0, 'CHN202011564800000', 1, 1, 1, 1, 1, 123.00, 16, 25, 1, 2020, '西方', '2022-01-27 15:12:02', '2022-01-27 15:12:51', '106.575784,29.557017', '李四', '12345678999');
INSERT INTO `t_house` VALUES (20, '2022-01-11 16:04:13', 2, 'whole', '重庆解放碑脚下，朝天门来福士 洪崖洞 长江索道 好吃街超近，位置风景超好。小彭民宿：温馨木房', '房间已经全面消毒，门口也有专门的酒精洗手液。\r\n小彭民宿位于解放碑中心最近的商务楼时代豪苑，30楼高层的26平米房间。走到解放碑碑脚下只需2分钟。具体位置重庆市渝中区解放碑青年路3号时代豪苑a座30楼4号。\r\n超宽落地窗可见解放碑碑顶，整个解放碑装入房间。\r\n楼下出门20米正对2号线轻轨临江门站(风景最棒的线路)。\r\n1米7米双人浴缸(配有免费的一次性浴缸套)。中央空调冷热十足。\r\n90寸幕布寸极米新一代z6x影仪，手机投屏清晰度超高。\r\n房间装有厚的遮光帘和透光窗帘，一睡到中午，也方便白天一样当电影院。\r\n入住时间是下午2点，亲可以提前到把行李放在走廊，有门禁系统和云摄像头。\r\n支持免费的洗衣服务，每天有阿姨来做清洁，可以让阿姨拿到储物室洗衣后烘干再给亲。\r\n房间有一次性牙刷牙膏 一次性浴帽 一次性拖鞋 橡胶拖鞋 一次性梳子 一次性香皂 洗手液 洗发水 沐浴露 护发素 放大led化妆镜 红酒杯 吹风 挂式熨斗 开瓶器 烧水壶 三线合一连接线 小冰箱 小米电子秤 一次性浴缸套。\r\n\r\n详情\r\n木房，给人最温馨的感觉。26平米一室一厅一厕，超大面积落地窗。交通方便，位置优越，窗外见解放碑碑顶，出门看见风景最好的轻轨2号线临江门站。距离各个景点好吃的超近。晚上近距离感受重庆灯红酒绿。', '重庆', '中国重庆市渝中区解放碑碑为中心', '/uploads/1759dc27fc6740eab8e1b62709552d35.jpeg', '[\"/uploads/1759dc27fc6740eab8e1b62709552d35.jpeg\",\"/uploads/0dd9575fece743d588d892b6e22fcb67.jpeg\",\"/uploads/002dd03050c44596aa6b71e38808787f.jpeg\",\"/uploads/c50129f0d8a047bda6d17edb3e0bbc09.jpeg\",\"/uploads/2e04aafa3bcd4822ba8cf3cb8dd0324a.jpeg\"]', 4500.00, 0, 'CHN44587954120', 2, 1, 1, 2, 1, 60.00, 12, 18, 1, 2021, '西方', '2022-02-11 15:08:15', '2022-02-11 15:11:20', '106.584554,29.564835', '李四', '12345678999');
INSERT INTO `t_house` VALUES (21, '2022-01-14 16:58:15', 2, 'whole', '[醒家民宿]上海3048衡复文化区/大使馆区老公寓/近地铁大一居套房', '在家中醒来,我们想提供给你的是你旅途中的一个家.而我们想成为你旅途中的亲人和朋友.\r\n\r\n1:衡复文化区西段雅静使馆区大院特色老洋房公寓,西班牙风情建筑,宽大明亮楼道,一楼大花园和内天井,百年老树和斑驳院墙,回味过往辉煌灿烂的岁月,见证老上海发展和变迁,是个不错的上海民宿体验选择\r\n2:房子在三楼楼道第三间,一房带一个明亮大气的卫生淋浴间,开放厨房,提供卧室一个床铺及床品可住两人,正常入住两人最为舒适,如需加床,则沙发可睡一个人。\r\n3:提供24小时自助入住,行李寄放等入住服务,并全天候在线咨询接待.服务方便每一个客人;\r\n4:房子在淮海中路地铁枢纽带,临近1/7号线常熟路站7号口,10号线上海图书馆站1号口,比邻伊朗大使馆,乌鲁木齐五原路特色街,近音乐学院,聂耳广场,宋庆龄故居,华山医院、交通大学,武康大楼等。\r\n周边500米内有:超市、菜市场、提款机、药店、餐厅、泳池、儿童乐园\r\n\r\n详情\r\n除了给你的旅途提供舒适,干净,温馨的居住空间外,我们还提供很多特有的便利。 1,自助入住,入住时间无约束,智能密码锁密码一客一换。 2,24小时热水,免费高速wifi。 3,行李寄存。 4,提供餐具,锅具,电饭煲,调味品(油盐酱醋糖),为你的旅途做顿大餐。 5,提供沐浴用品、毛巾、浴巾,牙刷牙膏和吹风机。', '上海', '中国上海市徐汇区衡复文化区西段雅静使馆区大院', '/uploads/daf3938dd8a24584a2725f50125ebe30.jpg', '[\"/uploads/daf3938dd8a24584a2725f50125ebe30.jpg\",\"/uploads/ba7344939a42498e9e14bc82a070cb76.jpg\",\"/uploads/b0e8be758d9f4e63bbfed946739bb99e.jpg\",\"/uploads/4bd9db03e35e4a7583128885222cbb91.jpg\"]', 9000.00, 0, 'CHN202011564014521', 3, 1, 1, 3, 1, 90.00, 1, 2, 0, 2020, '北方', NULL, NULL, '121.442597,31.140789', '李四', '12345678999');
INSERT INTO `t_house` VALUES (22, '2022-01-14 17:20:15', 2, 'share', '超清投影&红星路地铁站&成都339&舒适一居室&可住2人-A卧', '（无摆件）Hello，你所浏览的房源是一套一室一卫的精装公寓我们有一张1.8x2m大床，可供2人居住；\r\n这是一套以精致简约的现代装修风格为主的温馨小屋，\r\n在这里，享受高速WIFI带给您的一路畅通无阻。\r\n房源地理位置非常优越：\r\n我们的房子紧靠「红星桥」地铁站，\r\n位于猛追湾商圈 紧邻成都339 享受成都夜生活\r\n周围紧邻活水公园 成华公园\r\n离「春熙路」地铁2个站，\r\n可方便快捷的到达各个景点。\r\n房间设备：\r\n『投影仪、高速WIFI、空调、电梯、电热水器、门禁、电热水壶、沙发、衣架』\r\n卫浴配置：\r\n『手纸、淋浴、盥洗池、一次性牙刷、毛巾、浴巾、浴帽、电吹风、洗发水、沐浴露、漱口杯、凉拖』\r\n房门配有智能密码锁，方便您进出；\r\n苛刻的卫生标准是我们一直以来所强调的，在这里，我们会有专业的保洁阿姨为房间提供【清洁】及【消毒】，您可以安心入住。\r\n我们的房子麻雀虽小五脏俱全，希望能让您感受到家的温暖和舒适。\r\n详情\r\n房间面积50平米左右，有个极米的高清大投影，有冰箱洗衣机\r\n\r\n详情\r\n房源介绍\r\n概要\r\n\r\nHello，你所浏览的房源是一套一室一卫的精装公寓我们有一张1.8x2m大床，可供2人居住；\r\n这是一套以精致简约的现代装修风格为主的温馨小屋，\r\n在这里，享受高速WIFI带给您的一路畅通无阻。\r\n房源地理位置非常优越：\r\n我们的房子紧靠「红星桥」地铁站', '四川', '中国四川省成都市锦江区在水一方小区(东城拐下街)', '/uploads/3bdca9128b144a76afc707218167b551.jpeg', '[\"/uploads/3bdca9128b144a76afc707218167b551.jpeg\",\"/uploads/6787c6c6ba8d4487a434037ac45e6ec6.jpeg\",\"/uploads/3c83150d74124697a5aaddaa4b3d521d.jpeg\",\"/uploads/f2f948a29a6746f4ad098739945d8b92.jpeg\",\"/uploads/ba6fa3c69e8147d7b9651973b5b86994.jpeg\"]', 4800.00, 0, 'CHN102458740', 2, 1, 1, 2, 1, 120.00, 3, 18, 1, 2019, '西南方', NULL, NULL, '104.098008,30.673442', '李四', '12345678999');
INSERT INTO `t_house` VALUES (23, '2022-01-14 17:21:38', 2, 'share', '超清投影&红星路地铁站&成都339&舒适一居室&可住2人-B卧', '<p></p><p>（无摆件）Hello，你所浏览的房源是一套一室一卫的精装公寓我们有一张1.8x2m大床，可供2人居住；</p><p>&nbsp;这是一套以精致简约的现代装修风格为主的温馨小屋，\r\n在这里，享受高速WIFI带给您的一路畅通无阻。&nbsp;</p><p>房源地理位置非常优越：&nbsp;</p><p>我们的房子紧靠「红星桥」地铁站，\r\n位于猛追湾商圈 紧邻成都339 享受成都夜生活\r\n周围紧邻活水公园 成华公园\r\n离「春熙路」地铁2个站，\r\n可方便快捷的到达各个景点。&nbsp;</p><p>房间设备：\r\n『投影仪、高速WIFI、空调、电梯、电热水器、门禁、电热水壶、沙发、衣架』</p><p>&nbsp;卫浴配置：\r\n『手纸、淋浴、盥洗池、一次性牙刷、毛巾、浴巾、浴帽、电吹风、洗发水、沐浴露、漱口杯、凉拖』</p><p>房门配有智能密码锁，方便您进出；&nbsp;</p><p>苛刻的卫生标准是我们一直以来所强调的，在这里，我们会有专业的保洁阿姨为房间提供【清洁】及【消毒】，您可以安心入住。&nbsp;</p><p>我们的房子麻雀虽小五脏俱全，希望能让您感受到家的温暖和舒适。</p><p>房间面积50平米左右，有个极米的高清大投影，有冰箱洗衣机\r\n\r\n详情\r\n房源介绍\r\n概要\r\n\r\nHello，你所浏览的房源是一套一室一卫的精装公寓我们有一张1.8x2m大床，可供2人居住；\r\n这是一套以精致简约的现代装修风格为主的温馨小屋，\r\n在这里，享受高速WIFI带给您的一路畅通无阻。\r\n房源地理位置非常优越：\r\n我们的房子紧靠「红星桥」地铁站</p><p><br></p><p></p><p><br></p>', '四川', '中国四川省成都市锦江区在水一方小区(东城拐下街)', '/uploads/e0698e6c5c4e4f81a598be4d7f93ecc4.jpeg', '[\"/uploads/e0698e6c5c4e4f81a598be4d7f93ecc4.jpeg\",\"/uploads/69775ac8e0f4458397f907b2016d3b6c.jpeg\",\"/uploads/da3eab78674b4b8a82e2d4571c2d74d3.jpeg\",\"/uploads/7e8bcddd38554cc2988e9ba576eb26ae.jpeg\",\"/uploads/7df34b5f79e04bc5869906a4227b340f.jpeg\"]', 4800.00, 0, 'CHN102458740', 2, 1, 1, 2, 1, 120.00, 3, 18, 1, 2019, '西南方', NULL, NULL, '104.098008,30.673442', '李四', '12345678999');
INSERT INTO `t_house` VALUES (25, '2022-02-14 18:53:06', 2, 'whole', '', '<p></p><p><br></p>', '北京', '', '/uploads/934274177bb3480b9e4fd569c76034db.jpeg', '[\"/uploads/934274177bb3480b9e4fd569c76034db.jpeg\"]', NULL, -2, '', 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, NULL, '', NULL, NULL, '', '', '');

-- ----------------------------
-- Table structure for t_mark
-- ----------------------------
DROP TABLE IF EXISTS `t_mark`;
CREATE TABLE `t_mark`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  `user_id` int(20) NULL DEFAULT NULL COMMENT '用户ID',
  `house_id` int(11) NULL DEFAULT NULL COMMENT '房屋ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_mark
-- ----------------------------
INSERT INTO `t_mark` VALUES (1, '2022-01-15 16:42:14', 2, 20);
INSERT INTO `t_mark` VALUES (2, '2022-01-15 16:42:16', 2, 2);

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `summary` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES (2, '2022-01-05 13:33:28', '管理员', 'G214：当唐蕃古道遇见滇藏线，终点皆为拉萨', 'G214：当唐蕃古道遇见滇藏线，终点皆为拉萨\r\n说起 滇藏线 ，大多数户外旅行的朋友都知道，甚至于我最初对于214国道的了解也只局限于 滇藏线 上，而忽略了将近3千公里的214国道北段还有一大段 青海 至 西藏 的公路，相对较少人走过，尤其是“唐蕃古道”名气虽大，却游客甚少，多数人的认知都只存在于历史地理课本中。\r\n唐蕃古道和 滇藏线 ，看似两条不相邻的进藏线路，其中大部分线路都源自G214。\r\n套用度娘的官方介绍：G214国道经过 青海 、 西藏 和 云南 3个省份，有着丰富的自然与历史文化，独特的宗教和少数民族风情，被称为“ 中国 景观最丰富的国道”。\r\n当我在一年内特意分两次走过唐蕃古道', 'G214：当唐蕃古道遇见滇藏线，终点皆为拉萨\r\n说起 滇藏线 ，大多数户外旅行的朋友都知道，甚至于我最初对于214国道的了解也只局限于 滇藏线 上，而忽略了将近3千公里的214国道北段还有一大段 青海 至 西藏 的公路，相对较少人走过，尤其是“唐蕃古道”名气虽大，却游客甚少，多数人的认知都只存在于历史地理课本中。\r\n唐蕃古道和 滇藏线 ，看似两条不相邻的进藏线路，其中大部分线路都源自G214。\r\n套用度娘的官方介绍：G214国道经过 青海 、 西藏 和 云南 3个省份，有着丰富的自然与历史文化，独特的宗教和少数民族风情，被称为“ 中国 景观最丰富的国道”。\r\n当我在一年内特意分两次走过唐蕃古道和 滇藏线 后，在地图上留下了“┫”型的线路。而 拉萨 ，虽不在214国道上，但无论南北哪一段路程，千百年来朝圣的人们最终的目的地依旧是圣城 拉萨 。\r\n于是，便有了这篇游记的标题：当唐蕃古道遇见 滇藏线 ，终点皆为 拉萨 。');
INSERT INTO `t_news` VALUES (3, '2022-01-05 14:23:48', '管理员', '地上长了云，天上都是羊，自驾内蒙6天的那些事儿', '每年十一长假来临的节点，我都会患上选择困难症，能休息7天对于一个上班族真的是一笔大恩赐！一定要把在各种内容平台的收藏夹都翻出来一顿朝下倒，遥远的雪山想看，超大片的荒原想看，能把人吞了一样的瀑布也想看….\r\n\r\n这种纠结到了最后往往就是——机票也涨价了，火车票也抢不到了，最好看的酒店也满房了！于是最后终于做出了决定：\r\n\r\n那就自驾吧，走向人烟逐渐稀少的北方。\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n一直以来，内蒙在我眼中的成分主要是草原，无边的草原，与之匹配的是无比发达的畜牧业和粗犷的少数民族。在我看来，这块儿地区是扁平的，宽展的，就像是一块铺在北方的大地毯，绒绒糙糙的，让无数动物自由奔跑，树木', '每年十一长假来临的节点，我都会患上选择困难症，能休息7天对于一个上班族真的是一笔大恩赐！一定要把在各种内容平台的收藏夹都翻出来一顿朝下倒，遥远的雪山想看，超大片的荒原想看，能把人吞了一样的瀑布也想看….\r\n\r\n这种纠结到了最后往往就是——机票也涨价了，火车票也抢不到了，最好看的酒店也满房了！于是最后终于做出了决定：\r\n\r\n那就自驾吧，走向人烟逐渐稀少的北方。\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n一直以来，内蒙在我眼中的成分主要是草原，无边的草原，与之匹配的是无比发达的畜牧业和粗犷的少数民族。在我看来，这块儿地区是扁平的，宽展的，就像是一块铺在北方的大地毯，绒绒糙糙的，让无数动物自由奔跑，树木自由生长。\r\n\r\n10月的内蒙，我们一直担心会不会太冷，以至于树叶已经掉落，看不到一丝丝的秋色，好在，传说中的“秋色童话”没有完全消失，这几 天全 部都是橙色的。\r\n\r\n\r\n你在这里，可以明显感受到，是到了大自然的地盘儿，人类显得越发渺小。意外出现的的彩虹，远处明媚透亮的天光，草原深处肥硕的奶牛、绒绒的小羊，简直令动物之友狂喜，感觉一切烦恼都消失的无影无踪了。\r\n\r\n我们甚至跑到了边境，在国门，把外 蒙古 的草原也看了一遍。每一站都有不同的调性，好了，那就接下来看这篇游记，走向秋天的内蒙。\r\n\r\n\r\n自驾游灵魂，线路的设计最重要\r\n这条线路是我在出发前半个月DIY出来的，当时在往西走和往北走之间，纠结了很久，往西走主要是想去 鄂尔多斯 ，听说那边的沙漠真不戳，后面又得知因秋季多雨很可能会玩到泥巴，于是放弃。\r\n\r\n那么往北走的这条线路呢，本电商狗也是非常开窍的提炼出来了4个核心卖点，在去打卡草原秋景、火山、边境线的同时，也只占用了小长假7天中的6天，能余下来1天的时间休整，毕竟，成年人嘛最好的假期是疗养院。如果你从 北京 出发，如果你有6天的假期，可以大大参考一下！\r\n\r\n① 轻自驾：6天行程刚刚好，不用和领导卑微请假~ 超级适合年假额度不足的上班族\r\n② 不太累：自驾时长很合适，不烦不累不会和队友撕逼~ 超级适合日常撕逼透支的上班族\r\n③ 风景棒：火山草原和动物，核心看点一本满足，超级适合想寻找内心宁静的上班族\r\n④ 低消费：高星酒店也不贵，民宿，超级适合钱包比较瘦弱的上班族\r\n\r\n\r\n这一路，有秋色，有动物，有火山，有奇特的地貌，有边境线，更有的是那些，只要不去你永远想不到世上还有这样的生活方式的小城市。\r\n\r\n我们在出发前还制作了一张招募队友的海报！请把专业打在评论区\r\n于是我俩获得了2位一同前行的伙伴\r\n\r\n\r\n就这样我们4个人，2对CP，出发啦！\r\n\r\n一直向北开，走过森林和草原\r\n国庆第一天，我们4人一车，从 北京 出发，到达了 乌兰布统 景区，470公里的路程，居然走了一天。不过，这一天并不是忙着纯赶路，我们K着歌，感受由南到北气温逐渐的下降，后视镜的景象，慢慢从夏末到了深秋，从矮矮的山坡变成高高的树林，晨间的云令人心旷神怡，伴着落日的到来，行程临近终点，还进入了一片令人直呼哇塞的大森林。\r\n\r\n一路顺畅且不闹心的自驾行，必早起。因此，本次的司机兼线路总管CJJ下了死命令，为保证一车人可以在当天到达指定地点，必须5点起床，哪怕另外远道而来的小伙伴前一晚0点才和我们汇合。然后在我的据理力争下，快要撕破脸的那种，争取到了5点半起床。\r\n\r\n事实证明，再早也没用，在6点半左右出京的路口，依然形成了小范围的拥堵。这是个好天气，太阳还没升起时，蓝色通透的天空有一点克莱因的调调，天上的云的形状像虾滑，一条条的被码成一片，直到太阳出现，就像在青虾滑中打了一颗鲜鸡蛋，橘色的圆圈从云当中渗了出来。\r\n\r\n\r\n除了司机以外，我们其他3人，都是“虽然醒了，但也付出了相应的代价”那种，因此，本次的生活总管NANA，拿出来了一支话筒，我们开始K歌，唱的都是非常应景的作品，从“今天是你的生日我的祖国”唱到“我爱你我的家”。\r\n\r\n正当我想要不要来一首“火红的萨日朗”的时候，第一个服务区到了，我们快速找准了自己的定位，如下图。\r\n\r\n感受了一下这边的温度，由于太阳开始上升了，气温和 北京 差不多，还都可以穿短裤。中午我们在一个服务区，吃了自热米饭和泡面。\r\n\r\n说句题外话，因为真的很担心后面几天只有碳水和大肉，以及一天见不到一个餐厅的情况，请感受一下本次自驾游携带的食物：');
INSERT INTO `t_news` VALUES (4, '2022-01-05 14:24:00', '管理员', '分开旅行｜用VLOG记录一场爹妈同体的泰国游学之旅', '这是一篇由32段VOLG和配文组成的游记\r\n记录了一位雌雄同体的超人妈妈独自带着她的熊孩子\r\n在 泰国 华欣 国际学校游学了一个月的真实体验\r\n请准备好足够的流量和一颗想要带娃看世界的心▼\r\n\r\n写给骏的第三封“情书”\r\n亲爱的骏：\r\n敲下这些文字的时候，距离上次旅行仅半年时间！照这种频次写下去，等你年满十八的时候，也许我可以整合成一本书送给你当成人礼。\r\n这是我们俩的第一次“单独约会”，经过一个月的观察和考验，我预测十年后，你将会是我最好的旅伴。虽然我也在心里抱怨过：“我这么雷厉风行的妈，怎么会生了你这么个拖泥带水的儿子！”但一路上，你的嘘寒问暖和细心体贴让我仿佛有种被照顾的错觉。如果说女儿', '这是一篇由32段VOLG和配文组成的游记\r\n记录了一位雌雄同体的超人妈妈独自带着她的熊孩子\r\n在 泰国 华欣 国际学校游学了一个月的真实体验\r\n请准备好足够的流量和一颗想要带娃看世界的心▼\r\n\r\n写给骏的第三封“情书”\r\n亲爱的骏：\r\n敲下这些文字的时候，距离上次旅行仅半年时间！照这种频次写下去，等你年满十八的时候，也许我可以整合成一本书送给你当成人礼。\r\n这是我们俩的第一次“单独约会”，经过一个月的观察和考验，我预测十年后，你将会是我最好的旅伴。虽然我也在心里抱怨过：“我这么雷厉风行的妈，怎么会生了你这么个拖泥带水的儿子！”但一路上，你的嘘寒问暖和细心体贴让我仿佛有种被照顾的错觉。如果说女儿是爸爸的小情人的话，那儿子一定是妈妈的小暖炉。\r\n我确信你一定是个勇敢而坚强的孩子。你一定会继承我的疯狂，敢在 巴厘岛 佩戴“蟒蛇围巾”，也勇于在 仙本那 的海底与鱼群共舞。你甚至会遗传了我顽强的肩膀，能把大半个房间的细软都收拾到一个背囊里去，然后背着它们挑战 尼泊尔 的雪山之巅。当然如果你继承了你爹的伶牙俐齿──这简直是毋庸置疑的一件事，那么，你也许要学会收敛它们的杀伤力，不至于让太多无辜的小女生碎了小心肝。\r\n你的母亲热爱旅行，你的父亲热爱生活。你也一定会热爱这个世界，并能从中找到许多乐子。你可以不赚很多钱，不当一个有名气的上流社会人士。你可以成绩不太好，甚至不必潇洒帅气。但你一定要做自己，持自己坚定的信念，过自己要过的人生。\r\n你一定不需要我们任何一个人向你解释旅行是一件多么幸福的事。因为你从我们都不明白的某个神秘角落，穿梭了各种隧道，最终才到达我的子宫里，然后经过漫长的10个月的旅程，才来到这个世界上。你一定比我们任何人都懂得什么叫做启程，什么叫做回家。等到我和你父亲都已白发苍苍，归田园居的时候，希望还能收到你从世界各地寄来的明信片……\r\n\r\nVLOG 浮生一日\r\n#vlog1-游学第一天：渐渐习惯右舵驾驶，从第一天的30迈到现在60＋，我一定是被秋名山车神附体了。上学路上骏还在练习如何做用英语自我介绍，到了幼儿园完全蒙圈！自我介绍的声音小到连自己都听不见。不过幸好我们是自来熟，一下就跟小朋友们打成一片。为娘我守了半天，总算是可以安心落意地离去了▼');
INSERT INTO `t_news` VALUES (5, '2022-01-05 14:24:14', '管理员', '我生活在四季如春的城市，但我向往白雪皑皑的北国。', '2021年12月，是我跟马蜂窝共度的第六年，在我第一次登上蜂首之前，曾经我以它为目标，在成长的路上不断的努力。“被收纳为攻略”、“被评为星级游记”，终于，我等来了”被评为蜂首游记“登上了APP开屏页。所有的努力都没白费，我也拿下了我认为的，最高荣誉。\r\n2021年12月16日，我做为蜂首之一有幸参加了”蜂首旅行团”，报名的时候也只是抱着尝试一下的心态，毕竟报了名还有机会，不报名就会连机会都没有。从没想过我会被选上参加这次的活动，目的地还是我这个南方人最期待的北方。\r\n这是我此生见的第二次雪，在祖国 东北 - 长白山 。', '2021年12月，是我跟马蜂窝共度的第六年，在我第一次登上蜂首之前，曾经我以它为目标，在成长的路上不断的努力。“被收纳为攻略”、“被评为星级游记”，终于，我等来了”被评为蜂首游记“登上了APP开屏页。所有的努力都没白费，我也拿下了我认为的，最高荣誉。\r\n2021年12月16日，我做为蜂首之一有幸参加了”蜂首旅行团”，报名的时候也只是抱着尝试一下的心态，毕竟报了名还有机会，不报名就会连机会都没有。从没想过我会被选上参加这次的活动，目的地还是我这个南方人最期待的北方。\r\n这是我此生见的第二次雪，在祖国 东北 - 长白山 。');
INSERT INTO `t_news` VALUES (6, '2022-01-05 14:24:57', '管理员', '骑摩托游走斯里兰卡,追忆安宁世界—— #拯救草稿计划#', '开篇\r\n2019年2月，疫情爆发前，我们最后一次回国探亲，顺道去 斯里兰卡 旅行。没想到一年后国内疫情爆发时，我们刚从 葡萄牙 回家\r\n2020年，我的生活发生了很多变化。从 斯里兰卡 回来后，我在幼儿园做了一年的中文老师；三月 西班牙 疫情爆发，我改成线上工作半日。那时我才停下来思考：来西三年，这是我想要的生活吗？在否定的答案里，我决定回归本行 —— 医学。9月，我很幸运地再次回归校园，在 马德里 康普顿斯大学攻读医学博士。直到今日圣诞节假期，才有时间着手整理这趟旅行的资料\r\n看着 斯里兰卡 的照片，记忆里那个没有口罩的世界，一派繁荣和自由，原来自由畅快的呼吸才是我们追念的\r\n。\r\n。\r\n。', '开篇\r\n2019年2月，疫情爆发前，我们最后一次回国探亲，顺道去 斯里兰卡 旅行。没想到一年后国内疫情爆发时，我们刚从 葡萄牙 回家\r\n2020年，我的生活发生了很多变化。从 斯里兰卡 回来后，我在幼儿园做了一年的中文老师；三月 西班牙 疫情爆发，我改成线上工作半日。那时我才停下来思考：来西三年，这是我想要的生活吗？在否定的答案里，我决定回归本行 —— 医学。9月，我很幸运地再次回归校园，在 马德里 康普顿斯大学攻读医学博士。直到今日圣诞节假期，才有时间着手整理这趟旅行的资料\r\n看着 斯里兰卡 的照片，记忆里那个没有口罩的世界，一派繁荣和自由，原来自由畅快的呼吸才是我们追念的\r\n。\r\n。\r\n。\r\n斯里兰卡 ，追忆一趟刺激的旅途\r\n\r\n 背景音乐：Tú，Maye + Sapore di mare,Fernando。这首 意大利 语的Sapore di mare是我们在 康提 的一个夜晚，伴随着蛙声，他弹吉他唱歌，一首很安静的歌曲 ');
INSERT INTO `t_news` VALUES (7, '2022-01-05 14:25:15', '管理员', '在游轮上躺着看海的快乐，终于回来了，维京邮轮招商伊敦号游轮，它来中国了！招商伊敦号吃喝玩乐全攻略', '在游轮上躺着看海的快乐，终于回来了\r\n朋友们，我最近去坐邮轮了。\r\n\r\n说出这句话真的太不容易了。要知道我上次长途游轮旅行，不算西沙那种短途的话，还是在两年前在 南极洲 的午夜阳光号。前段时间已经到了我对游轮想念的顶峰，做梦都会梦到浪花的那种程度。所以当得知维京邮轮来 中国 了，或者确切说 中国 也能邮轮旅行的时候，我兴奋的都要跳起来了！因为这不仅是 中国 第一艘五星级海轮，她还曾经是一艘 Viking Sun，奢华游轮界的金字塔尖，是世界顶级邮轮第一梯队的佼佼者。', '在游轮上躺着看海的快乐，终于回来了\r\n朋友们，我最近去坐邮轮了。\r\n\r\n说出这句话真的太不容易了。要知道我上次长途游轮旅行，不算西沙那种短途的话，还是在两年前在 南极洲 的午夜阳光号。前段时间已经到了我对游轮想念的顶峰，做梦都会梦到浪花的那种程度。所以当得知维京邮轮来 中国 了，或者确切说 中国 也能邮轮旅行的时候，我兴奋的都要跳起来了！因为这不仅是 中国 第一艘五星级海轮，她还曾经是一艘 Viking Sun，奢华游轮界的金字塔尖，是世界顶级邮轮第一梯队的佼佼者。');
INSERT INTO `t_news` VALUES (8, '2022-01-05 14:28:54', '管理员', '水韵江苏', '我的家中国大运河绵延2700公里，其中 江苏 段690公里， 苏州 、 无锡 、 常州 、 镇江 、 扬州 、 高邮 、 淮安 、 宿迁 、 徐州 ，九座城市从南到北如明珠串线。&nbsp;扬州人自豪地说， 中国 大运河开凿的第一锹土是在 扬州 挖出的；淮安人也自豪地说，这初代运河的最后一土落在 淮安 ；镇江人说，长江与运河的交汇地， 镇江 是唯一；高邮人说，镇国寺是大运河上最美的明珠；徐州人说，提起运河上的古镇就绕不过窑湾；苏州人说，运河在 苏州 织出梦幻的水网；无锡人说，一座清名桥，一条古河道， 无锡 是生在运河上的；宿迁人说，走走东关口的旧石阶，那是多少历史变迁都磨不掉的凝固瞬间；常州人', '<p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><h3><b>我的家中国</b></h3><div><img src=\"http://localhost:9999/uploads/2e04aafa3bcd4822ba8cf3cb8dd0324a.jpeg\" style=\"max-width:100%;\"></div><p>大运河绵延2700公里，其中 江苏 段690公里， 苏州 、 无锡 、 常州 、 镇江 、 扬州 、 高邮 、 淮安 、 宿迁 、 徐州 ，九座城市从南到北如明珠串线。&nbsp;</p><p>扬州人自豪地说， 中国 大运河开凿的第一锹土是在 扬州 挖出的；</p><p>淮安人也自豪地说，这初代运河的最后一土落在 淮安 ；</p><p>镇江人说，长江与运河的交汇地， 镇江 是唯一；</p><p>高邮人说，镇国寺是大运河上最美的明珠；</p><p>徐州人说，提起运河上的古镇就绕不过窑湾；</p><p>苏州人说，运河在 苏州 织出梦幻的水网；</p><p>无锡人说，一座清名桥，一条古河道， 无锡 是生在运河上的；</p><p>宿迁人说，走走东关口的旧石阶，那是多少历史变迁都磨不掉的凝固瞬间；</p><p>常州人说，看看今天，青果巷的河边像过去千百年一样商贾繁华如云。</p><p>是的，就是这样啊。</p><p></p><p><br></p>');
INSERT INTO `t_news` VALUES (9, '2022-01-15 16:24:06', '管理员', '为什么要出租？', '房东和体验达人让爱租房成为爱租房无论何种房源、无论位于何处提供全面保障。所有房东/体验达人均可免费使用。爱租房用户专享。', '<p></p><p>房东和体验达人让爱租房成为爱租房</p><p>无论何种房源、无论位于何处</p><p><br></p><p>提供全面保障。所有房东/体验达人均可免费使用。爱租房用户专享。</p>');
INSERT INTO `t_news` VALUES (10, '2022-01-15 16:25:31', '管理员', '待客之道', '​对房东有哪些期待？我们希望为您指明方向，让您有清晰的目标，在每次分享房源时，都能提供五星的服务。我们要求所有房东满足四项基本要求：总体评分、回复率、取消和接受预订。除了这些基本要求，入住您房源的房客还会对您进行评价。已经是房东了？请查看您的个人进展，看看自己表现如何。基本要求为了给房客创造一个舒适、可信赖的住宿体验，所有的房源和房东都必须满足四项基本要求。积极回复快速回复房客，展现出您的细心周到。房客申请预订和提出相关疑问时，您的回复频次和速度会反映在回复率上。我们要求房东对此类信息的回复时间不超过24小时。接受预订申请要连发4、5个申请才能找到可订的房源，没有哪个房客会享受这样的体验。因此', '<p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><h1 tabindex=\"-1\"></h1><h2>​对房东有哪些期待？</h2><pre宋体\',monospace;font-size:9.8pt;\">我们希望为您指明方向，让您有清晰的目标，在每次分享房源时，都能提供五星的服务。<br>我们要求所有房东满足四项基本要求：总体评分、回复率、取消和接受预订。除了这些基本要求，入住您房源的房客还会对您进行评价。<br>已经是房东了？请查看您的个人进展，看看自己表现如何。<br></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\" style=\"\">基本要求</pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\">为了给房客创造一个舒适、可信赖的住宿体验，所有的房源和房东都必须满足四项基本要求。<br></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\" style=\"\">积极回复</pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\">快速回复房客，展现出您的细心周到。房客申请预订和提出相关疑问时，您的回复频次和速度会反映在回复率上。我们要求房东对此类信息的回复时间不超过<spanjetbrains mono\',monospace;\"=\"\">24小时。<br></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">接受预订申请</spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\">要连发<spanjetbrains mono\',monospace;\"=\"\">4、<spanjetbrains mono\',monospace;\"=\"\">5个申请才能找到可订的房源，没有哪个房客会享受这样的体验。因此，我们希望，如果房源在日历上显示为可订，您应尽量接受预订申请。请确保房源日历上体现的是您能够出租的日期，这样，您就更有可能接受这些预订。您可以通过设置可订状态，屏蔽两次入住之间的间隔期，也可以禁止当天入住的预订和提早太久的预订。<br></spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">避免取消房客的预订</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">我们对取消预订有着严格的处罚。为了避免影响房客的旅行计划，我们希望房东避免取消预订。如果您取消了已确认的预订，将受到罚款等处罚。除非遇到特殊情况，我们希望您不要取消已确认的预订。<br></spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">争取正面评价</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">不管住在哪里，房客都希望能享受始终如一的优质体验。每次结束入住后，房客会评价您提供的住宿体验，这也是我们衡量房东服务的标准之一。您的总体评分就是所有入住房客给您的平均评分。<br>作为房东，您也可以给房客打分，评价他们在清洁度、礼仪、沟通方面的表现。通过您的反馈，我们能更好地确保房客像对待自家一样对待入住的房源。总是被房东标记的房客可能要受到处罚。<br></spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">获得房客高度评价</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">我们发现，获得好评的房东通常注重五个方面：清洁、必要的便利设施、准确的房源信息、顺畅的入住过程、积极沟通。<br></spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">干净指数</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">在浏览您的房源照片时，房客希望看到整洁干净的空间。请务必在不同房客入住之间留出足够时间进行打扫，尤其是当您的各预订之间没有天数间隔。<br>房客将会有机会为房源的干净指数评分，您的平均评分会显示在房源页面上。如果持续收到较低的清洁指数评分，您可能会受到处罚。<br></spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">预期行为准则</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">请打扫房客可使用的所有房间，特别是卧室、浴室和厨房。<br>请确保地面上没有头发、灰尘或发霉<br>在不同房客入住之间做好打扫工作：<br>为房客提供干净的床上用品和毛巾<br>清理干净上一位房客留下的垃圾、食物和余留物品<br></spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">小窍门</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">在两笔预订之间留出足够的时间做准备。您可以更新预订偏好设置，屏蔽掉预订开始前的一晚或两晚<br>收取清洁费，用这些额外的款项购买清洁用品或雇佣专业清洁服务<br>在房源里留一些清洁用品，方便房客处理洒溅的液体和意外造成的脏污<br></spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">必备便利设施</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><ul><li><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">卫生纸</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></li><li><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">肥皂（或洗浴用品）</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></li><li><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">床套／床单</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></li><li><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">每位入住房客至少有一条浴巾</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></li><li><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">每位入住房客至少有一个枕头</spanjetbrains></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></li><li><br></li></ul></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><p></p><p></p><h2><pre宋体\',monospace;font-size:9.8pt;\" style=\"\">准确的房源细节</pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\">在旅程开始前，确保房客对房源有合理期望，这能帮助您和房客拥有更好的体验。您可以向房客清晰说明房源信息，例如是否允许携带宠物入住，以帮助他们决定您的房源是否满足他们的需求。如果旅行者对住宿的期望与您的房源相符，那么详细的房源描述也能吸引他们入住。<br>房客将有机会对您所提供信息的准确度进行评价。<br></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><b>房源信息</b></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><b>预期行为准则</b><br>精确、及时更新的房源地址（房客在预订后才会收到该信息）<br>卧室和浴室有精确的私密性信息<br>房源照片准确反映房源情况和布局<br>便利设施与描述相符，方便使用且性能良好<br></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\" style=\"\">小窍门</pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\">请为您的房源上传多张高品质且附带说明的照片，并撰写详细的房源描述。<br>请制定房屋守则，帮助解决一些和房客有关的问题。在房屋守则中，您可以如实说明您允许和不希望房客做的事情，例如吸烟、携带宠物入住、带其他人进入房源。<br>如果房源有些区域是房客不能进入的，如车库或阁楼等，请告知房客。<br>请如实说明可能会影响房客住宿的意外因素。如果您的邻居刚刚开始了一个建筑工程，会制造噪音，或者如果要爬<spanjetbrains mono\',monospace;\"=\"\">8层楼梯才能到达您的房源，您的房客有权知道。<br></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">便利设施</spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\">请列出房源内具备的所有便利设施，并确保设施方便使用、性能良好。<br></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">每晚价格</spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\">请确保您的房源符合房费定价，过高的房费可能会让旅行者认为房源非常豪华。如果您需要帮助，可以查看附近其他房源的定价，或开启智能定价功能。<br></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">便捷的入住程序</spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\">在一天的旅行后，清晰简单的入住流程会让您的房客感到非常省心。房客会在住宿结束后评价他们的入住流程体验。<br></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">小窍门</spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\">为房源制定入住指南，我们会在房客入住前<spanjetbrains mono\',monospace;\"=\"\">24小时把入住指南发送给房客，方便房客顺利入住<br>如果您计划亲自在房源迎接房客，请务必提前协商好入住时间<br>如果您的房源提供自助入住，请在房源页面的房客资源一栏添加自助入住的详细信息<br>确保您的房客知道如果他们的旅程出现延误或在最后一刻出现情况，应该如何联系您。<br>为房客提供前往房源的详细路线。在房屋使用指南中详细列明相关信息能为您节省时间<br></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">为入住房客提供支持</spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">不管在房客入住期间您是否与他们同住，请一定要留出时间回应他们的问题。您的房客将有机会在入住结束后，对您沟通的清晰度和响应时间进行评分，且该项评分的平均值将出现在您的房源页面上。<br></spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\" style=\"\">小窍门</spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"></h2><pre宋体\',monospace;font-size:9.8pt;\"><spanjetbrains mono\',monospace;\"=\"\"><spanjetbrains mono\',monospace;\"=\"\">请积极沟通，让房客知道您的房源可订。提早和房客联系，协调他们抵达房源后的入住流程。如果在房客抵达时您无法亲自迎接，您可以在入住时间向他们发送信息，确保一切顺利。<br>如果您在确认预订后房源情况有变更，请提前通知房客。<br>下载爱租房应用，随时随地回复消息。<br>如果在房客入住期间您不在当地，不妨向他们提供一位当地联系人。</spanjetbrains></spanjetbrains></pre宋体\',monospace;font-size:9.8pt;\"><p></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p><p></p><p><br></p>');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `customer_user_id` bigint(20) NULL DEFAULT NULL COMMENT '租客用户ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT '房东用户ID',
  `house_id` bigint(20) NULL DEFAULT NULL COMMENT '房字ID',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态：-3租客已取消 -2待签合同 -1待付款 0生效中 1已到期 2退租申请 3退租申请不通过',
  `month_rent` decimal(11, 2) NULL DEFAULT NULL COMMENT '月租金',
  `day_num` int(11) NULL DEFAULT NULL COMMENT '租住天数',
  `total_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '总金额',
  `start_date` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime NULL DEFAULT NULL COMMENT '结束日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (31, '2022-02-08 17:51:06', 3, 2, 20, 1, 4500.00, 0, 0.00, '2022-02-08 17:51:06', '2022-02-08 17:51:24');
INSERT INTO `t_order` VALUES (32, '2022-02-08 17:55:09', 3, 2, 20, 1, 4500.00, 0, 0.00, '2022-02-08 17:55:09', '2022-02-08 17:56:17');
INSERT INTO `t_order` VALUES (33, '2022-02-08 17:56:43', 3, 2, 20, 1, 4500.00, 1, 150.00, '2022-02-07 18:56:43', '2022-02-08 17:57:19');
INSERT INTO `t_order` VALUES (34, '2022-02-11 15:04:00', 4, 2, 20, 1, 4500.00, 0, 0.00, '2022-02-11 15:04:00', '2022-02-11 15:07:12');
INSERT INTO `t_order` VALUES (35, '2022-02-11 15:08:15', 3, 2, 20, 1, 4500.00, 0, 0.00, '2022-02-11 15:08:15', '2022-02-11 15:11:20');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名/账号',
  `user_display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `user_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像URL',
  `user_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人描述',
  `status` int(1) NULL DEFAULT 1 COMMENT '正常1、禁用0',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色，管理员admin/房东owner/租客customer',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业余爱好',
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `balance` decimal(20, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '现金余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (2, '2022-01-06 14:13:45', 'admin', 'adminuser', '15223157149', 'admin@qq.com', '123456', '500000000000000000', '/uploads/98453a2f22754d468aa642e8106eb71a.jpg', '你好', 1, 'admin', '男', '健身、打游戏、听歌', '互联网/计算机', 3100.00);
INSERT INTO `t_user` VALUES (3, '2022-01-17 17:11:09', 'tangly', 'testuser', '15223157149', 'test@qq.com', '123456', 'null', '/assets/img/default-avatar.jpg', '还未填写...', 1, 'customer', '保密', '暂未填写', '暂未填写', 0.00);
INSERT INTO `t_user` VALUES (4, '2022-02-17 20:20:55', 'zuke', 'zuke', '15555582930', 'zuke@qq.com', '123456', '', '/assets/img/default-avatar.jpg', '还未填写...', 1, 'customer', '保密', '暂未填写', '暂未填写', 0.00);

SET FOREIGN_KEY_CHECKS = 1;
