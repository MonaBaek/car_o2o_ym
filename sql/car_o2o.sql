/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : car_o2o

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2021-10-29 18:47:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_appointment
-- ----------------------------
DROP TABLE IF EXISTS `bus_appointment`;
CREATE TABLE `bus_appointment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `customer_phone` varchar(50) DEFAULT NULL COMMENT '客户联系方式',
  `appointment_time` datetime DEFAULT NULL COMMENT '预约时间',
  `actual_arrival_time` datetime DEFAULT NULL COMMENT '实际到店时间',
  `license_plate` varchar(20) DEFAULT NULL COMMENT '车牌号码',
  `car_series` varchar(20) DEFAULT NULL COMMENT '汽车类型',
  `service_type` int(1) DEFAULT NULL COMMENT '服务类型【维修0/保养1】',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `info` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `status` int(1) DEFAULT '0' COMMENT '状态【预约中0/已到店1/用户取消2/超时取消3】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='养修信息预约';

-- ----------------------------
-- Records of bus_appointment
-- ----------------------------
INSERT INTO `bus_appointment` VALUES ('1', '肖战', '13088889999', '2021-05-19 15:45:00', '2021-05-19 11:49:24', '豫A66688', '宝马X5', '1', '2021-05-19 11:49:17', 'hello', '4');
INSERT INTO `bus_appointment` VALUES ('3', '王一博', '13088886666', '2021-05-28 10:00:00', null, '赣A55588', '特斯拉Model3', '1', '2021-05-28 10:27:32', '', '2');
INSERT INTO `bus_appointment` VALUES ('4', '蔡徐坤', '13033335555', '2021-05-28 10:10:00', '2021-05-28 10:28:48', '粤G88888', '迈巴赫', '0', '2021-05-28 10:28:45', '', '4');
INSERT INTO `bus_appointment` VALUES ('5', '易烊千玺', '13055558888', '2021-06-15 18:25:00', '2021-06-15 18:26:57', '豫B88899', '奔驰', '1', '2021-06-15 18:26:42', '我是备注', '4');
INSERT INTO `bus_appointment` VALUES ('7', '杨洋', '13066668888', '2021-10-28 06:30:00', null, '粤AB8899', '宝马', '1', null, 'ddd', '2');
INSERT INTO `bus_appointment` VALUES ('9', '苏炳添', '13099996666', '2021-10-28 16:05:00', '2021-10-27 16:06:17', '粤A88888', '宝马', '0', null, '后轮维修', '4');

-- ----------------------------
-- Table structure for bus_bpmn_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_bpmn_info`;
CREATE TABLE `bus_bpmn_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bpmn_name` varchar(255) DEFAULT NULL COMMENT '流程(图)名称',
  `bpmn_type` varchar(255) DEFAULT NULL COMMENT '流程(图)类型',
  `deployment_id` varchar(255) DEFAULT NULL COMMENT '流程部署id',
  `act_process_id` varchar(255) DEFAULT NULL COMMENT 'activity流程定义生成的主键',
  `act_process_key` varchar(255) DEFAULT NULL COMMENT 'activity流程定义生成的key',
  `deploy_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '部署时间',
  `info` varchar(255) DEFAULT NULL COMMENT '描述信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程定义明细';

-- ----------------------------
-- Records of bus_bpmn_info
-- ----------------------------

-- ----------------------------
-- Table structure for bus_car_package_audit
-- ----------------------------
DROP TABLE IF EXISTS `bus_car_package_audit`;
CREATE TABLE `bus_car_package_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_item_id` bigint(20) DEFAULT NULL COMMENT '服务单项id',
  `service_item_info` varchar(255) DEFAULT NULL COMMENT '服务单项备注',
  `service_item_price` decimal(10,2) DEFAULT NULL COMMENT '服务单项审核价格',
  `instance_id` varchar(255) DEFAULT NULL COMMENT '流程实例id',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建者',
  `auditor_id` bigint(20) DEFAULT NULL COMMENT '当前审核人id',
  `bpmnInfo_id` bigint(20) DEFAULT NULL COMMENT '关联流程id',
  `info` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(10) DEFAULT NULL COMMENT '状态【进行中0/审核拒绝1/审核通过2/审核撤销3】',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_car_package_audit
-- ----------------------------
INSERT INTO `bus_car_package_audit` VALUES ('1', '4', '包括高压洗车，去除沥青、焦油等污物，上蜡增艳与镜面处理，新车开蜡，钢圈、轮胎、保险杠翻新与底盘防腐涂胶处理', '5000.00', '5001', '管理员', '2', '3', '888<br>杨龙【同意】,批注意见:6666<br>熊长青【同意】,批注意见:', '2', '2021-10-29 18:37:48', '2021-10-29 16:12:01');

-- ----------------------------
-- Table structure for bus_service_item
-- ----------------------------
DROP TABLE IF EXISTS `bus_service_item`;
CREATE TABLE `bus_service_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '服务项名称',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '服务项原价',
  `discount_price` decimal(10,2) DEFAULT NULL COMMENT '服务项折扣价',
  `car_package` int(1) DEFAULT NULL COMMENT '是否套餐【是/否】',
  `info` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `service_catalog` int(1) DEFAULT NULL COMMENT '服务分类【维修/保养/其他】',
  `audit_status` int(1) DEFAULT '4' COMMENT '审核状态【初始化/审核中/审核通过/审核拒绝/无需审核】',
  `sale_status` int(1) DEFAULT '0' COMMENT '上架状态【已上架/未上架】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_service_item
-- ----------------------------
INSERT INTO `bus_service_item` VALUES ('1', '人工费(小时)', '188.00', '188.00', '0', '每小时人工费', '2021-05-14 10:09:36', '2', '4', '1');
INSERT INTO `bus_service_item` VALUES ('2', '换机油', '88.00', '88.00', '0', '更换机油', '2021-05-14 10:32:30', '0', '4', '1');
INSERT INTO `bus_service_item` VALUES ('3', '洗车套餐', '3000.00', '1800.00', '1', '无水洗车、泡沫精致洗车、全自动电脑洗车、底盘清洗', '2021-05-14 10:33:24', '1', '0', '0');
INSERT INTO `bus_service_item` VALUES ('4', '车身美容', '2990.00', '5000.00', '1', '包括高压洗车，去除沥青、焦油等污物，上蜡增艳与镜面处理，新车开蜡，钢圈、轮胎、保险杠翻新与底盘防腐涂胶处理', '2021-05-18 10:31:13', '1', '0', '0');
INSERT INTO `bus_service_item` VALUES ('5', '洗车', '99.00', '68.00', '0', '洗车', '2021-05-18 10:32:48', '1', '4', '1');
INSERT INTO `bus_service_item` VALUES ('6', '米其林轮胎', '500.00', '399.00', '0', '米其林轮胎', '2021-05-18 10:33:18', '0', '4', '1');
INSERT INTO `bus_service_item` VALUES ('7', '玻璃水', '88.00', '68.00', '0', '玻璃水', '2021-05-18 10:33:48', '0', '4', '1');
INSERT INTO `bus_service_item` VALUES ('8', '车饰美容', '6000.00', '1500.00', '1', '车饰美容包括仪表台、顶棚、地毯。脚垫、座椅、座套、车门内饰的吸尘清洁保护，以及蒸汽杀菌、冷暖风口除臭、室内空气净化、内饰清洁、表盘上光、包真皮、车内除味等项目。', '2021-05-27 11:21:53', '1', '0', '0');
INSERT INTO `bus_service_item` VALUES ('9', '新车开蜡', '288.00', '198.00', '0', '新车开蜡', '2021-05-28 10:41:49', '1', '4', '0');
INSERT INTO `bus_service_item` VALUES ('10', '空调清洁', '199.00', '129.00', '0', '空调清洁', '2021-06-15 15:47:54', '1', '4', '0');
INSERT INTO `bus_service_item` VALUES ('11', '车内除味', '99.00', '69.00', '0', '全车车内除味', '2021-06-15 15:48:37', '1', '4', '0');

-- ----------------------------
-- Table structure for bus_statement
-- ----------------------------
DROP TABLE IF EXISTS `bus_statement`;
CREATE TABLE `bus_statement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户姓名',
  `customer_phone` varchar(255) DEFAULT NULL COMMENT '客户联系方式',
  `actual_arrival_time` datetime DEFAULT NULL COMMENT '实际到店时间',
  `license_plate` varchar(255) DEFAULT NULL COMMENT '车牌号码',
  `car_series` varchar(255) DEFAULT NULL COMMENT '汽车类型',
  `service_type` bigint(20) DEFAULT NULL COMMENT '服务类型【维修/保养】',
  `appointment_id` bigint(20) DEFAULT NULL COMMENT '预约单ID【通过这个来判断是否预约用户,唯一标识】',
  `status` int(1) DEFAULT '0' COMMENT '结算状态【消费中0/已支付1】',
  `pay_time` datetime DEFAULT NULL COMMENT '收款时间',
  `payee_id` bigint(11) DEFAULT NULL COMMENT '收款人id',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '总消费金额',
  `total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '服务项数量',
  `discount_amount` decimal(10,2) DEFAULT '0.00' COMMENT '折扣金额',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `info` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `maintenance_id` (`appointment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='结算单';

-- ----------------------------
-- Records of bus_statement
-- ----------------------------
INSERT INTO `bus_statement` VALUES ('1', '苏炳添', '13099996666', '2021-10-27 16:06:17', '粤A88888', '宝马', '0', '9', '1', '2021-10-27 16:24:10', '1', '256.00', '2.00', '0.00', '2021-10-27 16:23:57', null);
INSERT INTO `bus_statement` VALUES ('2', '易建联', '13033336666', '2021-10-28 18:30:00', '粤X9999', '奔驰', '0', null, '1', '2021-10-27 17:00:50', '1', '675.00', '3.00', '20.00', null, '');

-- ----------------------------
-- Table structure for bus_statement_item
-- ----------------------------
DROP TABLE IF EXISTS `bus_statement_item`;
CREATE TABLE `bus_statement_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` bigint(20) DEFAULT NULL COMMENT '结算单ID',
  `item_id` bigint(20) DEFAULT NULL COMMENT '服务项明细ID',
  `item_name` varchar(255) DEFAULT NULL COMMENT '服务项明细名称',
  `item_price` decimal(10,2) DEFAULT NULL COMMENT '服务项价格',
  `item_quantity` decimal(10,0) DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='结算单明细';

-- ----------------------------
-- Records of bus_statement_item
-- ----------------------------
INSERT INTO `bus_statement_item` VALUES ('1', '1', '1', '人工费(小时)', '188.00', '1');
INSERT INTO `bus_statement_item` VALUES ('2', '1', '5', '洗车', '68.00', '1');
INSERT INTO `bus_statement_item` VALUES ('3', '2', '1', '人工费(小时)', '188.00', '1');
INSERT INTO `bus_statement_item` VALUES ('4', '2', '2', '换机油', '88.00', '1');
INSERT INTO `bus_statement_item` VALUES ('5', '2', '6', '米其林轮胎', '399.00', '1');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `ckey` varchar(100) DEFAULT '' COMMENT '参数键名',
  `value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES ('4', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES ('6', '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('7', '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('8', '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES ('9', '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES ('10', '套餐审核价格阈值', 'bus_car_package_limit', '3000', 'N', '套餐审核价格阈值');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `seq` int(11) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', 'e店邦O2O平台', '0', '叩丁狼', '15888888888', 'admin@wolfocode.cn', '0', '0');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '广州店', '1', '叩丁狼', '15888888888', 'admin@wolfcode.cn', '0', '0');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '2');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '2');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '2');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `seq` int(11) DEFAULT '0' COMMENT '字典排序',
  `label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('30', '1', '维修', '0', 'cmi_service_type', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('31', '1', '保养', '1', 'cmi_service_type', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('32', '1', '预约中', '0', 'cmi_status', '', '', 'Y', '0', '');
INSERT INTO `sys_dict_data` VALUES ('33', '2', '已到店', '1', 'cmi_status', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('34', '3', '用户取消', '2', 'cmi_status', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('35', '4', '超时取消', '3', 'cmi_status', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('36', '5', '结算单生成', '4', 'cmi_status', '', '', 'N', '0', '');
INSERT INTO `sys_dict_data` VALUES ('37', '1', '否', '0', 'si_car_package', null, null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('38', '2', '是', '1', 'si_car_package', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('39', '1', '否', '0', 'si_visible', null, null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('40', '2', '是', '1', 'si_visible', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('41', '1', '维修', '0', 'si_service_catalog', '', '', 'Y', '0', '');
INSERT INTO `sys_dict_data` VALUES ('42', '2', '保养', '1', 'si_service_catalog', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('43', '3', '其他', '2', 'si_service_catalog', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('44', '1', '初始化', '0', 'si_audit_status', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('45', '2', '审核中', '1', 'si_audit_status', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('46', '3', '审核通过', '2', 'si_audit_status', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('47', '4', '重新调整', '3', 'si_audit_status', '', '', 'N', '0', '');
INSERT INTO `sys_dict_data` VALUES ('48', '5', '无需审核', '4', 'si_audit_status', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('49', '1', '未上架', '0', 'si_sale_status', null, null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('50', '2', '已上架', '1', 'si_sale_status', null, null, 'N', '0', null);
INSERT INTO `sys_dict_data` VALUES ('51', '1', '消费中', '0', 'statement_status', null, null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('52', '2', '已支付', '1', 'statement_status', null, null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('53', '1', '进行中', '0', 'cpa_status', null, null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('54', '2', '审核拒绝', '1', 'cpa_status', '', '', 'Y', '0', '');
INSERT INTO `sys_dict_data` VALUES ('55', '3', '审核通过', '2', 'cpa_status', '', '', 'Y', '0', '');
INSERT INTO `sys_dict_data` VALUES ('56', '4', '审核撤销', '3', 'cpa_status', '', '', 'Y', '0', '');
INSERT INTO `sys_dict_data` VALUES ('57', '1', '学员推荐', '1', 'sys_customer_source', 'primary', null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('58', '2', '广告', '2', 'sys_customer_source', 'danger', null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('59', '1', '广州校区', '1', 'sys_customer_school', 'primary', null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('60', '2', '上海校区', '2', 'sys_customer_school', 'danger', null, 'Y', '0', null);
INSERT INTO `sys_dict_data` VALUES ('61', '1', '服务套餐', 'car_package', 'bus_audit_type', '', 'default', 'N', '0', '服务套餐');
INSERT INTO `sys_dict_data` VALUES ('62', '2', '请假-事假', 'casual-leave', 'bus_audit_type', '', '', 'N', '0', '请假-事假');
INSERT INTO `sys_dict_data` VALUES ('63', '3', '请假-病假', 'sick-leave', 'bus_audit_type', '', 'default', 'N', '0', '请假-病假');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dict_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '养修预约-服务类型', 'cmi_service_type', '0', '养修预约-服务类型');
INSERT INTO `sys_dict_type` VALUES ('12', '养修预约-状态', 'cmi_status', '0', '养修预约-状态');
INSERT INTO `sys_dict_type` VALUES ('13', '服务项目-是否套餐', 'si_car_package', '0', '服务项目-是否套餐');
INSERT INTO `sys_dict_type` VALUES ('14', '服务项目-是否禁用', 'si_visible', '0', '服务项目-是否禁用');
INSERT INTO `sys_dict_type` VALUES ('15', '服务项目-服务分类', 'si_service_catalog', '0', '服务项目-服务分类');
INSERT INTO `sys_dict_type` VALUES ('16', '服务项目-审核状态', 'si_audit_status', '0', '服务项目-状态');
INSERT INTO `sys_dict_type` VALUES ('17', '服务项目-上架状态', 'si_sale_status', '0', '服务项目-上架状态');
INSERT INTO `sys_dict_type` VALUES ('18', '结算单-结算状态', 'statement_status', '0', '结算单-结算状态');
INSERT INTO `sys_dict_type` VALUES ('19', '汽车套餐审核状态', 'cpa_status', '0', '汽车套餐审核状态');
INSERT INTO `sys_dict_type` VALUES ('20', '来源', 'sys_customer_source', '0', '学生来源');
INSERT INTO `sys_dict_type` VALUES ('21', '校区', 'sys_customer_school', '0', '期望哪个地区学校');
INSERT INTO `sys_dict_type` VALUES ('22', '审核流程类型', 'bus_audit_type', '0', '系统审核流程类型');

-- ----------------------------
-- Table structure for sys_logininfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfo`;
CREATE TABLE `sys_logininfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfo
-- ----------------------------
INSERT INTO `sys_logininfo` VALUES ('1', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '1', '用户不存在/密码错误', '2021-09-24 21:22:11');
INSERT INTO `sys_logininfo` VALUES ('2', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '1', '用户不存在/密码错误', '2021-09-24 21:20:02');
INSERT INTO `sys_logininfo` VALUES ('3', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-24 21:20:07');
INSERT INTO `sys_logininfo` VALUES ('4', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-25 20:28:53');
INSERT INTO `sys_logininfo` VALUES ('5', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-25 20:34:41');
INSERT INTO `sys_logininfo` VALUES ('6', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-25 20:38:25');
INSERT INTO `sys_logininfo` VALUES ('7', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-25 20:49:05');
INSERT INTO `sys_logininfo` VALUES ('8', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-26 20:17:57');
INSERT INTO `sys_logininfo` VALUES ('9', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 10:19:06');
INSERT INTO `sys_logininfo` VALUES ('10', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 11:50:11');
INSERT INTO `sys_logininfo` VALUES ('11', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 14:54:55');
INSERT INTO `sys_logininfo` VALUES ('12', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 14:55:19');
INSERT INTO `sys_logininfo` VALUES ('13', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 14:55:35');
INSERT INTO `sys_logininfo` VALUES ('14', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:03:15');
INSERT INTO `sys_logininfo` VALUES ('15', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:03:49');
INSERT INTO `sys_logininfo` VALUES ('16', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:04:58');
INSERT INTO `sys_logininfo` VALUES ('17', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:05:35');
INSERT INTO `sys_logininfo` VALUES ('18', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:05:56');
INSERT INTO `sys_logininfo` VALUES ('19', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:08:31');
INSERT INTO `sys_logininfo` VALUES ('20', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:21:06');
INSERT INTO `sys_logininfo` VALUES ('21', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:21:20');
INSERT INTO `sys_logininfo` VALUES ('22', 'xcq', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:21:36');
INSERT INTO `sys_logininfo` VALUES ('23', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:21:48');
INSERT INTO `sys_logininfo` VALUES ('24', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:23:20');
INSERT INTO `sys_logininfo` VALUES ('25', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:26:41');
INSERT INTO `sys_logininfo` VALUES ('26', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:42:17');
INSERT INTO `sys_logininfo` VALUES ('27', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:42:36');
INSERT INTO `sys_logininfo` VALUES ('28', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:42:59');
INSERT INTO `sys_logininfo` VALUES ('29', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:56:40');
INSERT INTO `sys_logininfo` VALUES ('30', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 15:56:51');
INSERT INTO `sys_logininfo` VALUES ('31', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 16:00:48');
INSERT INTO `sys_logininfo` VALUES ('32', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 16:01:53');
INSERT INTO `sys_logininfo` VALUES ('33', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 16:03:27');
INSERT INTO `sys_logininfo` VALUES ('34', 'dafei', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2021-09-27 16:05:53');
INSERT INTO `sys_logininfo` VALUES ('35', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 10:41:53');
INSERT INTO `sys_logininfo` VALUES ('36', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 10:46:29');
INSERT INTO `sys_logininfo` VALUES ('37', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 10:54:37');
INSERT INTO `sys_logininfo` VALUES ('38', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 11:00:44');
INSERT INTO `sys_logininfo` VALUES ('39', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 11:01:51');
INSERT INTO `sys_logininfo` VALUES ('40', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 11:07:32');
INSERT INTO `sys_logininfo` VALUES ('41', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 11:08:42');
INSERT INTO `sys_logininfo` VALUES ('42', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 11:19:44');
INSERT INTO `sys_logininfo` VALUES ('43', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 11:29:09');
INSERT INTO `sys_logininfo` VALUES ('44', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 11:43:52');
INSERT INTO `sys_logininfo` VALUES ('45', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 21:29:49');
INSERT INTO `sys_logininfo` VALUES ('46', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 21:38:34');
INSERT INTO `sys_logininfo` VALUES ('47', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 21:50:03');
INSERT INTO `sys_logininfo` VALUES ('48', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 21:52:40');
INSERT INTO `sys_logininfo` VALUES ('49', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 22:14:02');
INSERT INTO `sys_logininfo` VALUES ('50', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 22:20:42');
INSERT INTO `sys_logininfo` VALUES ('51', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 22:59:44');
INSERT INTO `sys_logininfo` VALUES ('52', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 23:35:45');
INSERT INTO `sys_logininfo` VALUES ('53', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 23:46:59');
INSERT INTO `sys_logininfo` VALUES ('54', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 23:52:26');
INSERT INTO `sys_logininfo` VALUES ('55', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-02 23:55:50');
INSERT INTO `sys_logininfo` VALUES ('56', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 16:13:34');
INSERT INTO `sys_logininfo` VALUES ('57', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 16:24:07');
INSERT INTO `sys_logininfo` VALUES ('58', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 16:51:10');
INSERT INTO `sys_logininfo` VALUES ('59', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 16:56:18');
INSERT INTO `sys_logininfo` VALUES ('60', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 17:04:34');
INSERT INTO `sys_logininfo` VALUES ('61', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 17:10:39');
INSERT INTO `sys_logininfo` VALUES ('62', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 17:13:38');
INSERT INTO `sys_logininfo` VALUES ('63', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 17:17:26');
INSERT INTO `sys_logininfo` VALUES ('64', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 17:20:29');
INSERT INTO `sys_logininfo` VALUES ('65', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 17:27:24');
INSERT INTO `sys_logininfo` VALUES ('66', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 17:28:25');
INSERT INTO `sys_logininfo` VALUES ('67', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 17:33:13');
INSERT INTO `sys_logininfo` VALUES ('68', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 19:49:09');
INSERT INTO `sys_logininfo` VALUES ('69', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 19:53:16');
INSERT INTO `sys_logininfo` VALUES ('70', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 20:23:23');
INSERT INTO `sys_logininfo` VALUES ('71', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 21:37:41');
INSERT INTO `sys_logininfo` VALUES ('72', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 21:38:53');
INSERT INTO `sys_logininfo` VALUES ('73', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 22:12:04');
INSERT INTO `sys_logininfo` VALUES ('74', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 22:27:44');
INSERT INTO `sys_logininfo` VALUES ('75', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 22:29:36');
INSERT INTO `sys_logininfo` VALUES ('76', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 22:39:34');
INSERT INTO `sys_logininfo` VALUES ('77', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 22:41:42');
INSERT INTO `sys_logininfo` VALUES ('78', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 22:43:06');
INSERT INTO `sys_logininfo` VALUES ('79', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 22:44:28');
INSERT INTO `sys_logininfo` VALUES ('80', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-03 22:50:20');
INSERT INTO `sys_logininfo` VALUES ('81', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 10:42:51');
INSERT INTO `sys_logininfo` VALUES ('82', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 10:45:58');
INSERT INTO `sys_logininfo` VALUES ('83', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 12:08:56');
INSERT INTO `sys_logininfo` VALUES ('84', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 12:25:28');
INSERT INTO `sys_logininfo` VALUES ('85', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 13:56:32');
INSERT INTO `sys_logininfo` VALUES ('86', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 13:56:47');
INSERT INTO `sys_logininfo` VALUES ('87', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 13:57:03');
INSERT INTO `sys_logininfo` VALUES ('88', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 14:55:27');
INSERT INTO `sys_logininfo` VALUES ('89', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 14:58:18');
INSERT INTO `sys_logininfo` VALUES ('90', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 15:11:10');
INSERT INTO `sys_logininfo` VALUES ('91', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 15:13:47');
INSERT INTO `sys_logininfo` VALUES ('92', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 15:19:50');
INSERT INTO `sys_logininfo` VALUES ('93', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 15:23:57');
INSERT INTO `sys_logininfo` VALUES ('94', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 15:31:56');
INSERT INTO `sys_logininfo` VALUES ('95', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 15:42:35');
INSERT INTO `sys_logininfo` VALUES ('96', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 16:44:42');
INSERT INTO `sys_logininfo` VALUES ('97', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 16:48:26');
INSERT INTO `sys_logininfo` VALUES ('98', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 16:52:55');
INSERT INTO `sys_logininfo` VALUES ('99', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 17:31:50');
INSERT INTO `sys_logininfo` VALUES ('100', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 17:45:04');
INSERT INTO `sys_logininfo` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-04 17:59:27');
INSERT INTO `sys_logininfo` VALUES ('102', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 16:00:37');
INSERT INTO `sys_logininfo` VALUES ('103', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 16:09:46');
INSERT INTO `sys_logininfo` VALUES ('104', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 16:12:07');
INSERT INTO `sys_logininfo` VALUES ('105', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 16:26:59');
INSERT INTO `sys_logininfo` VALUES ('106', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 16:31:17');
INSERT INTO `sys_logininfo` VALUES ('107', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 16:42:00');
INSERT INTO `sys_logininfo` VALUES ('108', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 17:39:40');
INSERT INTO `sys_logininfo` VALUES ('109', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 17:42:28');
INSERT INTO `sys_logininfo` VALUES ('110', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 18:37:14');
INSERT INTO `sys_logininfo` VALUES ('111', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 20:49:46');
INSERT INTO `sys_logininfo` VALUES ('112', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 21:32:05');
INSERT INTO `sys_logininfo` VALUES ('113', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 21:42:01');
INSERT INTO `sys_logininfo` VALUES ('114', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 21:43:58');
INSERT INTO `sys_logininfo` VALUES ('115', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 21:51:58');
INSERT INTO `sys_logininfo` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 22:18:33');
INSERT INTO `sys_logininfo` VALUES ('117', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 22:29:52');
INSERT INTO `sys_logininfo` VALUES ('118', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 22:36:41');
INSERT INTO `sys_logininfo` VALUES ('119', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 22:37:06');
INSERT INTO `sys_logininfo` VALUES ('120', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 22:49:26');
INSERT INTO `sys_logininfo` VALUES ('121', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 22:50:02');
INSERT INTO `sys_logininfo` VALUES ('122', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 22:53:22');
INSERT INTO `sys_logininfo` VALUES ('123', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 23:06:10');
INSERT INTO `sys_logininfo` VALUES ('124', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 23:06:27');
INSERT INTO `sys_logininfo` VALUES ('125', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-05 23:08:39');
INSERT INTO `sys_logininfo` VALUES ('126', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 12:42:06');
INSERT INTO `sys_logininfo` VALUES ('127', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 12:50:23');
INSERT INTO `sys_logininfo` VALUES ('128', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 12:51:28');
INSERT INTO `sys_logininfo` VALUES ('129', 'yf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '1', '用户不存在/密码错误', '2021-10-06 12:53:41');
INSERT INTO `sys_logininfo` VALUES ('130', 'yf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '1', '用户不存在/密码错误', '2021-10-06 12:53:49');
INSERT INTO `sys_logininfo` VALUES ('131', 'yf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '1', '用户不存在/密码错误', '2021-10-06 12:53:56');
INSERT INTO `sys_logininfo` VALUES ('132', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 12:54:15');
INSERT INTO `sys_logininfo` VALUES ('133', 'yf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 12:54:39');
INSERT INTO `sys_logininfo` VALUES ('134', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 12:54:59');
INSERT INTO `sys_logininfo` VALUES ('135', 'xch', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 12:55:19');
INSERT INTO `sys_logininfo` VALUES ('136', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 12:55:40');
INSERT INTO `sys_logininfo` VALUES ('137', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:14:19');
INSERT INTO `sys_logininfo` VALUES ('138', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:21:13');
INSERT INTO `sys_logininfo` VALUES ('139', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:21:49');
INSERT INTO `sys_logininfo` VALUES ('140', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:23:41');
INSERT INTO `sys_logininfo` VALUES ('141', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:24:00');
INSERT INTO `sys_logininfo` VALUES ('142', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:25:38');
INSERT INTO `sys_logininfo` VALUES ('143', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:25:56');
INSERT INTO `sys_logininfo` VALUES ('144', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:28:12');
INSERT INTO `sys_logininfo` VALUES ('145', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:28:27');
INSERT INTO `sys_logininfo` VALUES ('146', 'xcq', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:28:38');
INSERT INTO `sys_logininfo` VALUES ('147', 'xch', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:29:08');
INSERT INTO `sys_logininfo` VALUES ('148', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:30:18');
INSERT INTO `sys_logininfo` VALUES ('149', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 13:30:28');
INSERT INTO `sys_logininfo` VALUES ('150', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 15:22:15');
INSERT INTO `sys_logininfo` VALUES ('151', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 15:25:13');
INSERT INTO `sys_logininfo` VALUES ('152', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 15:28:52');
INSERT INTO `sys_logininfo` VALUES ('153', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-06 15:29:15');
INSERT INTO `sys_logininfo` VALUES ('154', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 13:25:53');
INSERT INTO `sys_logininfo` VALUES ('155', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 14:33:11');
INSERT INTO `sys_logininfo` VALUES ('156', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 15:53:30');
INSERT INTO `sys_logininfo` VALUES ('157', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 20:58:17');
INSERT INTO `sys_logininfo` VALUES ('158', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 21:50:27');
INSERT INTO `sys_logininfo` VALUES ('159', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 22:04:45');
INSERT INTO `sys_logininfo` VALUES ('160', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 22:11:33');
INSERT INTO `sys_logininfo` VALUES ('161', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 22:21:43');
INSERT INTO `sys_logininfo` VALUES ('162', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 22:29:42');
INSERT INTO `sys_logininfo` VALUES ('163', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 22:43:08');
INSERT INTO `sys_logininfo` VALUES ('164', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 22:46:28');
INSERT INTO `sys_logininfo` VALUES ('165', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 22:50:36');
INSERT INTO `sys_logininfo` VALUES ('166', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 22:52:33');
INSERT INTO `sys_logininfo` VALUES ('167', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 22:55:01');
INSERT INTO `sys_logininfo` VALUES ('168', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:01:27');
INSERT INTO `sys_logininfo` VALUES ('169', 'yl', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:03:20');
INSERT INTO `sys_logininfo` VALUES ('170', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:08:07');
INSERT INTO `sys_logininfo` VALUES ('171', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:10:34');
INSERT INTO `sys_logininfo` VALUES ('172', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:11:39');
INSERT INTO `sys_logininfo` VALUES ('173', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:12:55');
INSERT INTO `sys_logininfo` VALUES ('174', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:15:48');
INSERT INTO `sys_logininfo` VALUES ('175', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:17:24');
INSERT INTO `sys_logininfo` VALUES ('176', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:25:48');
INSERT INTO `sys_logininfo` VALUES ('177', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:26:09');
INSERT INTO `sys_logininfo` VALUES ('178', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:27:32');
INSERT INTO `sys_logininfo` VALUES ('179', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:29:58');
INSERT INTO `sys_logininfo` VALUES ('180', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:34:08');
INSERT INTO `sys_logininfo` VALUES ('181', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-10-07 23:38:27');
INSERT INTO `sys_logininfo` VALUES ('182', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 09:28:37');
INSERT INTO `sys_logininfo` VALUES ('183', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:03:23');
INSERT INTO `sys_logininfo` VALUES ('184', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:08:25');
INSERT INTO `sys_logininfo` VALUES ('185', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:15:33');
INSERT INTO `sys_logininfo` VALUES ('186', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:18:28');
INSERT INTO `sys_logininfo` VALUES ('187', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:19:21');
INSERT INTO `sys_logininfo` VALUES ('188', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:26:29');
INSERT INTO `sys_logininfo` VALUES ('189', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:30:42');
INSERT INTO `sys_logininfo` VALUES ('190', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:30:53');
INSERT INTO `sys_logininfo` VALUES ('191', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:33:07');
INSERT INTO `sys_logininfo` VALUES ('192', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:33:30');
INSERT INTO `sys_logininfo` VALUES ('193', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:37:36');
INSERT INTO `sys_logininfo` VALUES ('194', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 10:55:58');
INSERT INTO `sys_logininfo` VALUES ('195', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:03:10');
INSERT INTO `sys_logininfo` VALUES ('196', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:03:15');
INSERT INTO `sys_logininfo` VALUES ('197', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:03:57');
INSERT INTO `sys_logininfo` VALUES ('198', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:04:11');
INSERT INTO `sys_logininfo` VALUES ('199', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:05:01');
INSERT INTO `sys_logininfo` VALUES ('200', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:05:18');
INSERT INTO `sys_logininfo` VALUES ('201', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:06:05');
INSERT INTO `sys_logininfo` VALUES ('202', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:07:07');
INSERT INTO `sys_logininfo` VALUES ('203', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:08:20');
INSERT INTO `sys_logininfo` VALUES ('204', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:08:28');
INSERT INTO `sys_logininfo` VALUES ('205', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:10:22');
INSERT INTO `sys_logininfo` VALUES ('206', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:10:54');
INSERT INTO `sys_logininfo` VALUES ('207', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:11:44');
INSERT INTO `sys_logininfo` VALUES ('208', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:14:54');
INSERT INTO `sys_logininfo` VALUES ('209', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:21:39');
INSERT INTO `sys_logininfo` VALUES ('210', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-10-26 11:23:43');
INSERT INTO `sys_logininfo` VALUES ('211', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-10-26 11:26:18');
INSERT INTO `sys_logininfo` VALUES ('212', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-10-26 11:26:48');
INSERT INTO `sys_logininfo` VALUES ('213', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-10-26 11:27:07');
INSERT INTO `sys_logininfo` VALUES ('214', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:31:24');
INSERT INTO `sys_logininfo` VALUES ('215', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:31:30');
INSERT INTO `sys_logininfo` VALUES ('216', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:31:42');
INSERT INTO `sys_logininfo` VALUES ('217', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:32:02');
INSERT INTO `sys_logininfo` VALUES ('218', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:32:08');
INSERT INTO `sys_logininfo` VALUES ('219', 'wyf', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:32:57');
INSERT INTO `sys_logininfo` VALUES ('220', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:34:00');
INSERT INTO `sys_logininfo` VALUES ('221', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:34:47');
INSERT INTO `sys_logininfo` VALUES ('222', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 11:41:14');
INSERT INTO `sys_logininfo` VALUES ('223', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 15:55:23');
INSERT INTO `sys_logininfo` VALUES ('224', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 16:31:43');
INSERT INTO `sys_logininfo` VALUES ('225', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 16:51:36');
INSERT INTO `sys_logininfo` VALUES ('226', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 17:41:53');
INSERT INTO `sys_logininfo` VALUES ('227', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 18:42:03');
INSERT INTO `sys_logininfo` VALUES ('228', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 18:45:33');
INSERT INTO `sys_logininfo` VALUES ('229', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 18:52:40');
INSERT INTO `sys_logininfo` VALUES ('230', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 18:56:43');
INSERT INTO `sys_logininfo` VALUES ('231', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 19:01:47');
INSERT INTO `sys_logininfo` VALUES ('232', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 19:21:19');
INSERT INTO `sys_logininfo` VALUES ('233', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 19:27:51');
INSERT INTO `sys_logininfo` VALUES ('234', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 19:29:41');
INSERT INTO `sys_logininfo` VALUES ('235', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 19:45:49');
INSERT INTO `sys_logininfo` VALUES ('236', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 19:47:00');
INSERT INTO `sys_logininfo` VALUES ('237', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 19:49:03');
INSERT INTO `sys_logininfo` VALUES ('238', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 09:02:52');
INSERT INTO `sys_logininfo` VALUES ('239', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 09:28:40');
INSERT INTO `sys_logininfo` VALUES ('240', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 09:29:22');
INSERT INTO `sys_logininfo` VALUES ('241', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 09:41:07');
INSERT INTO `sys_logininfo` VALUES ('242', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 09:53:33');
INSERT INTO `sys_logininfo` VALUES ('243', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 10:10:59');
INSERT INTO `sys_logininfo` VALUES ('244', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 10:38:57');
INSERT INTO `sys_logininfo` VALUES ('245', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 10:47:11');
INSERT INTO `sys_logininfo` VALUES ('246', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 11:02:14');
INSERT INTO `sys_logininfo` VALUES ('247', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 11:09:09');
INSERT INTO `sys_logininfo` VALUES ('248', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 11:17:52');
INSERT INTO `sys_logininfo` VALUES ('249', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 14:04:35');
INSERT INTO `sys_logininfo` VALUES ('250', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 14:14:56');
INSERT INTO `sys_logininfo` VALUES ('251', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 14:18:37');
INSERT INTO `sys_logininfo` VALUES ('252', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 14:37:56');
INSERT INTO `sys_logininfo` VALUES ('253', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:07:00');
INSERT INTO `sys_logininfo` VALUES ('254', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:08:04');
INSERT INTO `sys_logininfo` VALUES ('255', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:11:16');
INSERT INTO `sys_logininfo` VALUES ('256', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:12:39');
INSERT INTO `sys_logininfo` VALUES ('257', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:13:35');
INSERT INTO `sys_logininfo` VALUES ('258', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:14:20');
INSERT INTO `sys_logininfo` VALUES ('259', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:29:07');
INSERT INTO `sys_logininfo` VALUES ('260', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:32:32');
INSERT INTO `sys_logininfo` VALUES ('261', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:38:32');
INSERT INTO `sys_logininfo` VALUES ('262', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:59:50');
INSERT INTO `sys_logininfo` VALUES ('263', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 16:01:40');
INSERT INTO `sys_logininfo` VALUES ('264', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 16:04:45');
INSERT INTO `sys_logininfo` VALUES ('265', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 16:23:50');
INSERT INTO `sys_logininfo` VALUES ('266', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 16:28:45');
INSERT INTO `sys_logininfo` VALUES ('267', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 09:48:02');
INSERT INTO `sys_logininfo` VALUES ('268', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 09:56:30');
INSERT INTO `sys_logininfo` VALUES ('269', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 10:19:07');
INSERT INTO `sys_logininfo` VALUES ('270', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 10:42:58');
INSERT INTO `sys_logininfo` VALUES ('271', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 10:47:40');
INSERT INTO `sys_logininfo` VALUES ('272', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 10:59:01');
INSERT INTO `sys_logininfo` VALUES ('273', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 12:05:08');
INSERT INTO `sys_logininfo` VALUES ('274', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 14:17:27');
INSERT INTO `sys_logininfo` VALUES ('275', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 14:21:16');
INSERT INTO `sys_logininfo` VALUES ('276', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 14:25:09');
INSERT INTO `sys_logininfo` VALUES ('277', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 14:26:29');
INSERT INTO `sys_logininfo` VALUES ('278', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 14:40:06');
INSERT INTO `sys_logininfo` VALUES ('279', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 15:08:56');
INSERT INTO `sys_logininfo` VALUES ('280', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 15:10:52');
INSERT INTO `sys_logininfo` VALUES ('281', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 15:27:40');
INSERT INTO `sys_logininfo` VALUES ('282', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 15:29:11');
INSERT INTO `sys_logininfo` VALUES ('283', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 15:59:55');
INSERT INTO `sys_logininfo` VALUES ('284', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 16:02:53');
INSERT INTO `sys_logininfo` VALUES ('285', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 16:04:50');
INSERT INTO `sys_logininfo` VALUES ('286', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 16:18:24');
INSERT INTO `sys_logininfo` VALUES ('287', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 16:20:39');
INSERT INTO `sys_logininfo` VALUES ('288', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 16:35:08');
INSERT INTO `sys_logininfo` VALUES ('289', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 18:35:19');
INSERT INTO `sys_logininfo` VALUES ('290', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 18:37:42');
INSERT INTO `sys_logininfo` VALUES ('291', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 18:37:52');
INSERT INTO `sys_logininfo` VALUES ('292', 'xcq', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 18:38:21');
INSERT INTO `sys_logininfo` VALUES ('293', 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 18:38:33');
INSERT INTO `sys_logininfo` VALUES ('294', 'yl', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 18:45:36');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `seq` int(11) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1138 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '1', '', 'fa fa-gear', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', '', 'M', '0', '1', '', 'fa fa-video-camera', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', '', 'M', '1', '1', '', 'fa fa-bars', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '叩丁狼官网', '0', '6', 'https://www.wolfcode.cn/', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user/listPage', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role/listPage', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu/listPage', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept/listPage', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post/listPage', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dictType/listPage', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config/listPage', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice/listPage', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '2', '9', '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '1', '1', 'monitor:online:view', 'fa fa-user-circle', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '1', '1', 'monitor:job:view', 'fa fa-tasks', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', '/monitor/cache', '', 'C', '1', '1', 'monitor:cache:view', 'fa fa-cube', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', '/tool/build', '', 'C', '1', '1', 'tool:build:view', 'fa fa-wpforms', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', '/tool/swagger', '', 'C', '1', '1', 'tool:swagger:view', 'fa fa-gg', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '1', '1', 'monitor:operlog:view', 'fa fa-address-book', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/loginInfo/listPage', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', '1', 'system:user:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', '1', 'system:user:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', '1', 'system:user:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', '1', 'system:user:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', '1', 'system:user:export', '#', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', '1', 'system:user:import', '#', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', '1', 'system:role:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', '1', 'system:role:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', '1', 'system:role:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', '1', 'system:role:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', '1', 'system:role:export', '#', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', '1', 'system:menu:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', '1', 'system:menu:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', '1', 'system:menu:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', '1', 'system:menu:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', '1', 'system:dept:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', '1', 'system:dept:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', '1', 'system:dept:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', '1', 'system:dept:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', '1', 'system:post:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', '1', 'system:post:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', '1', 'system:post:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', '1', 'system:post:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', '1', 'system:post:export', '#', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', '1', 'system:dict:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', '1', 'system:dict:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', '1', 'system:dict:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', '1', 'system:dict:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', '1', 'system:dict:export', '#', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', '1', 'system:config:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', '1', 'system:config:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', '1', 'system:config:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', '1', 'system:config:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', '1', 'system:config:export', '#', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', '1', 'system:notice:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', '1', 'system:notice:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', '1', 'system:notice:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', '1', 'system:notice:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', '');
INSERT INTO `sys_menu` VALUES ('1046', '账户解锁', '501', '4', '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', '');
INSERT INTO `sys_menu` VALUES ('1047', '在线查询', '109', '1', '#', '', 'F', '0', '1', 'monitor:online:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1048', '批量强退', '109', '2', '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', '');
INSERT INTO `sys_menu` VALUES ('1049', '单条强退', '109', '3', '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务查询', '110', '1', '#', '', 'F', '0', '1', 'monitor:job:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务新增', '110', '2', '#', '', 'F', '0', '1', 'monitor:job:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务修改', '110', '3', '#', '', 'F', '0', '1', 'monitor:job:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务删除', '110', '4', '#', '', 'F', '0', '1', 'monitor:job:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1054', '状态修改', '110', '5', '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务详细', '110', '6', '#', '', 'F', '0', '1', 'monitor:job:detail', '#', '');
INSERT INTO `sys_menu` VALUES ('1056', '任务导出', '110', '7', '#', '', 'F', '0', '1', 'monitor:job:export', '#', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成查询', '115', '1', '#', '', 'F', '0', '1', 'tool:gen:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1058', '生成修改', '115', '2', '#', '', 'F', '0', '1', 'tool:gen:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1059', '生成删除', '115', '3', '#', '', 'F', '0', '1', 'tool:gen:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1060', '预览代码', '115', '4', '#', '', 'F', '0', '1', 'tool:gen:preview', '#', '');
INSERT INTO `sys_menu` VALUES ('1061', '生成代码', '115', '5', '#', '', 'F', '0', '1', 'tool:gen:code', '#', '');
INSERT INTO `sys_menu` VALUES ('1062', '业务功能', '0', '5', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-newspaper-o', '');
INSERT INTO `sys_menu` VALUES ('1063', '购车询价信息管理', '1062', '1', '#', 'menuItem', 'M', '0', '1', '', '#', '');
INSERT INTO `sys_menu` VALUES ('1064', '续保询价信息管理', '1062', '2', '#', 'menuItem', 'M', '0', '1', '', '#', '');
INSERT INTO `sys_menu` VALUES ('1065', '试驾预约信息管理', '1062', '3', '#', 'menuItem', 'M', '0', '1', '', '#', '');
INSERT INTO `sys_menu` VALUES ('1066', '养修预约业务', '1062', '5', '#', 'menuItem', 'M', '0', '1', '', '#', null);
INSERT INTO `sys_menu` VALUES ('1072', '养修信息预约', '1066', '1', '/business/appointment/listPage', '', 'C', '0', '1', 'business:carMaintenanceInfo:view', '#', '养修信息预约菜单');
INSERT INTO `sys_menu` VALUES ('1073', '养修信息预约查询', '1072', '1', '#', '', 'F', '0', '1', 'business:carMaintenanceInfo:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1074', '养修信息预约新增', '1072', '2', '#', '', 'F', '0', '1', 'business:carMaintenanceInfo:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1075', '养修信息预约修改', '1072', '3', '#', '', 'F', '0', '1', 'business:carMaintenanceInfo:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1076', '养修信息预约删除', '1072', '4', '#', '', 'F', '0', '1', 'business:carMaintenanceIinfo:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1077', '客户到店', '1072', '5', '#', 'menuItem', 'F', '0', '1', 'business:carMaintenanceInfo:arrival', '#', '');
INSERT INTO `sys_menu` VALUES ('1078', '养修服务单项', '1066', '2', '/business/serviceItem/listPage', 'menuItem', 'C', '0', '1', 'business:serviceItem:view', '#', '养修服务项菜单');
INSERT INTO `sys_menu` VALUES ('1079', '养修服务项查询', '1078', '1', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1080', '养修服务项新增', '1078', '2', '#', '', 'F', '0', '1', 'business:serviceItem:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1081', '养修服务项修改', '1078', '3', '#', '', 'F', '0', '1', 'business:serviceItem:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1082', '养修服务项上架', '1078', '4', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:saleOn', '#', '');
INSERT INTO `sys_menu` VALUES ('1083', '养修服务项下架', '1078', '5', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:saleOff', '#', '');
INSERT INTO `sys_menu` VALUES ('1084', '服务结算单', '1066', '3', '/business/statement/listPage', 'menuItem', 'C', '0', '1', 'business:statement:view', '#', '结算单菜单');
INSERT INTO `sys_menu` VALUES ('1085', '结算单查询', '1084', '1', '#', '', 'F', '0', '1', 'business:statement:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1086', '结算单新增', '1084', '2', '#', '', 'F', '0', '1', 'business:statement:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1087', '结算单修改', '1084', '3', '#', '', 'F', '0', '1', 'business:statement:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1088', '结算单删除', '1084', '4', '#', '', 'F', '0', '1', 'business:statement:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1089', '结算单明细', '1084', '5', '#', 'menuItem', 'F', '0', '1', 'business:statement:detail', '#', '');
INSERT INTO `sys_menu` VALUES ('1096', '生成结算单', '1072', '7', '#', 'menuItem', 'F', '0', '1', 'business:carMaintenanceInfo:generateStatement', '#', '');
INSERT INTO `sys_menu` VALUES ('1097', '客户取消', '1072', '6', '#', 'menuItem', 'F', '0', '1', 'business:carMaintenanceInfo:cancel', '#', '');
INSERT INTO `sys_menu` VALUES ('1098', '结算单明细', '1066', '4', '#', 'menuItem', 'C', '1', '1', null, '#', '');
INSERT INTO `sys_menu` VALUES ('1099', '明细保存', '1098', '1', '#', 'menuItem', 'F', '0', '1', 'business:statementItem:saveItems', '#', '');
INSERT INTO `sys_menu` VALUES ('1100', '确认支付', '1098', '2', '#', 'menuItem', 'F', '0', '1', 'business:statementItem:payStatement', '#', '');
INSERT INTO `sys_menu` VALUES ('1101', '流程管理', '0', '4', '#', 'menuItem', 'M', '0', '1', null, 'fa fa-hourglass-start', '');
INSERT INTO `sys_menu` VALUES ('1104', '养修套餐审核', '1062', '6', '#', 'menuItem', 'M', '0', '1', '', '#', null);
INSERT INTO `sys_menu` VALUES ('1106', '套餐审核列表', '1104', '1', '/business/carPackageAudit/listPage', 'menuItem', 'C', '0', '1', 'business:carPackageAudit:view', '#', '审核列表菜单');
INSERT INTO `sys_menu` VALUES ('1112', '我的待办', '1104', '2', '/business/carPackageAudit/todoPage', 'menuItem', 'C', '0', '1', '', '#', '');
INSERT INTO `sys_menu` VALUES ('1113', '我的已办', '1104', '3', '/business/carPackageAudit/donePage', 'menuItem', 'C', '0', '1', '', '#', '');
INSERT INTO `sys_menu` VALUES ('1114', '明细列表', '1098', '3', '#', 'menuItem', 'C', '0', '1', 'business:statementItem:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1115', '审核列表', '1106', '1', '#', 'menuItem', 'F', '0', '1', 'business:carPackageAudit:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1116', '养修服务项已上架集合', '1078', '6', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:selectAllSaleOnList', '#', '');
INSERT INTO `sys_menu` VALUES ('1117', '发起审核', '1078', '7', '#', 'menuItem', 'F', '0', '1', 'business:serviceItem:startAudit', '#', '');
INSERT INTO `sys_menu` VALUES ('1118', '在线客户信息管理', '1062', '4', '/xxx', 'menuItem', 'C', '0', '1', 'business:customer:view', '#', null);
INSERT INTO `sys_menu` VALUES ('1119', '客户查询', '1118', '1', '#', '', 'F', '0', '1', 'business:customer:list', '#', '');
INSERT INTO `sys_menu` VALUES ('1120', '客户新增', '1118', '2', '#', '', 'F', '0', '1', 'business:customer:add', '#', '');
INSERT INTO `sys_menu` VALUES ('1121', '客户修改', '1118', '3', '#', '', 'F', '0', '1', 'business:customer:edit', '#', '');
INSERT INTO `sys_menu` VALUES ('1122', '客户删除', '1118', '4', '#', '', 'F', '0', '1', 'business:customer:remove', '#', '');
INSERT INTO `sys_menu` VALUES ('1123', '客户导出', '1118', '5', '#', '', 'F', '0', '1', 'business:customer:export', '#', '');
INSERT INTO `sys_menu` VALUES ('1124', '审核流程定义', '1101', '0', '/business/bpmnInfo/listPage', 'menuItem', 'C', '0', '1', 'business:definition:view', '#', '流程定义菜单');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(50) NOT NULL COMMENT '公告标题',
  `type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '1', '1', '<p>1111<img src=\"http://localhost/profile/upload/2021/09/09/457ad497-4c6d-47d1-a05f-8b07a8b5ab01.jpg\" data-filename=\"/profile/upload/2021/09/09/457ad497-4c6d-47d1-a05f-8b07a8b5ab01.jpg\" style=\"width: 948px;\"></p>', '0', 'admin', '2021-09-09 20:26:56', null);
INSERT INTO `sys_notice` VALUES ('5', '222', '1', '<p>222</p>', '0', null, '2021-09-11 10:32:17', null);
INSERT INTO `sys_notice` VALUES ('6', '333', '2', '<p>333</p>', '0', null, '2021-09-11 10:32:31', null);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `code` varchar(64) NOT NULL COMMENT '岗位编码',
  `name` varchar(50) NOT NULL COMMENT '岗位名称',
  `seq` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', '董事长');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', '项目经理');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', '人力资源');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', '普通员工');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(30) NOT NULL COMMENT '角色名称',
  `rkey` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `seq` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` varchar(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` varchar(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '0', '0', '2021-09-11 11:49:43', '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', '2021-09-11 11:49:48', '普通角色');
INSERT INTO `sys_role` VALUES ('3', '财务', 'caiwu', '3', '1', '0', '0', '2021-09-11 11:49:51', null);
INSERT INTO `sys_role` VALUES ('4', '业务员', 'salesman', '3', null, '0', '0', '2021-09-11 11:49:53', '');
INSERT INTO `sys_role` VALUES ('5', '店长', 'shopOwner', '4', '1', '0', '0', '2021-09-11 11:49:55', '');
INSERT INTO `sys_role` VALUES ('6', '财务专员', 'financial', '5', '1', '0', '0', '2021-09-11 11:49:57', '');
INSERT INTO `sys_role` VALUES ('7', '总经理', 'generalManager', '6', '1', '0', '0', '2021-09-11 11:50:00', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('2', '1061');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '4');
INSERT INTO `sys_role_menu` VALUES ('4', '1062');
INSERT INTO `sys_role_menu` VALUES ('4', '1063');
INSERT INTO `sys_role_menu` VALUES ('4', '1064');
INSERT INTO `sys_role_menu` VALUES ('4', '1065');
INSERT INTO `sys_role_menu` VALUES ('4', '1066');
INSERT INTO `sys_role_menu` VALUES ('4', '1072');
INSERT INTO `sys_role_menu` VALUES ('4', '1078');
INSERT INTO `sys_role_menu` VALUES ('4', '1084');
INSERT INTO `sys_role_menu` VALUES ('4', '1098');
INSERT INTO `sys_role_menu` VALUES ('4', '1104');
INSERT INTO `sys_role_menu` VALUES ('4', '1106');
INSERT INTO `sys_role_menu` VALUES ('4', '1112');
INSERT INTO `sys_role_menu` VALUES ('4', '1113');
INSERT INTO `sys_role_menu` VALUES ('4', '1114');
INSERT INTO `sys_role_menu` VALUES ('4', '1131');
INSERT INTO `sys_role_menu` VALUES ('4', '1132');
INSERT INTO `sys_role_menu` VALUES ('4', '1133');
INSERT INTO `sys_role_menu` VALUES ('5', '1062');
INSERT INTO `sys_role_menu` VALUES ('5', '1104');
INSERT INTO `sys_role_menu` VALUES ('5', '1112');
INSERT INTO `sys_role_menu` VALUES ('5', '1113');
INSERT INTO `sys_role_menu` VALUES ('6', '1062');
INSERT INTO `sys_role_menu` VALUES ('6', '1104');
INSERT INTO `sys_role_menu` VALUES ('6', '1112');
INSERT INTO `sys_role_menu` VALUES ('6', '1113');
INSERT INTO `sys_role_menu` VALUES ('7', '1062');
INSERT INTO `sys_role_menu` VALUES ('7', '1104');
INSERT INTO `sys_role_menu` VALUES ('7', '1112');
INSERT INTO `sys_role_menu` VALUES ('7', '1113');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '管理员', '00', 'admin2@wolfcode.cn', '15888888888', '0', '/avatar/2021/09/19/e6f86cde-5d87-4a90-a5a8-a39a108310c4.png', '1a9afbc60137abc3ed4ee54dd16bdabc', 'f28344', '0', '0', '127.0.0.1', '2021-09-04 13:35:56', '管理员');
INSERT INTO `sys_user` VALUES ('2', '104', 'xcq', '熊长青', '00', 'xcq@wolfcode.cn', '15666666666', '0', '', '3bc4191ab19247847baefafe01a0eeb5', '7dc302', '0', '0', '127.0.0.1', '2021-06-15 18:52:49', '测试员');
INSERT INTO `sys_user` VALUES ('3', '104', 'yl', '杨龙', '00', 'yl@wolfcode.cn', '13088886666', '0', '', 'a491f284859c6789cef2bd9e77319e2b', '0d0a40', '0', '0', '127.0.0.1', '2021-06-15 18:50:36', '业务员');
INSERT INTO `sys_user` VALUES ('4', '104', 'yf', '杨凤', '00', '', '13022223333', '0', '', '7455358315f4e2f2584543f1f170dc6d', 'aa475b', '0', '0', '', null, '');
INSERT INTO `sys_user` VALUES ('5', '104', 'xch', '熊长黄', '00', '', '13022223338', '0', '', '5356b70eb3bde91e63239a9c6a56774b', '46f429', '0', '0', '', null, null);
INSERT INTO `sys_user` VALUES ('6', '104', 'stef', '吴嘉俊', '00', '', '13022223339', '0', '', '80207361411d15943caf05ee8a0fcf8d', '4e065f', '0', '0', '', null, null);
INSERT INTO `sys_user` VALUES ('7', '104', 'wyf', '王一飞', '00', '', '13022223331', '0', '', 'a64e1acf2a01233f7ff2b63f29d9e35f', '5904ff', '0', '0', '127.0.0.1', '2021-06-15 18:53:06', null);
INSERT INTO `sys_user` VALUES ('8', '104', 'wef', '王二飞', '00', '', '13022223332', '0', '', '3e7b7bfb4315310d2acbf7aa0022b8d4', '3b7881', '0', '0', '', null, null);
INSERT INTO `sys_user` VALUES ('9', '103', 'lin', '林叫兽', '00', '123@qq.com', '15315315332', '0', '', 'c26965b0f1f39668acf6dd293514ecb9', '6e8487', '0', '0', '', null, null);
INSERT INTO `sys_user` VALUES ('11', '103', 'dafei', 'dafei', '00', '', '15666666645', '0', null, '6413abb855b9c7ff7c864db16f932a03', 'a71482', '0', '0', null, null, '222');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('3', '4');
INSERT INTO `sys_user_post` VALUES ('11', '2');
INSERT INTO `sys_user_post` VALUES ('11', '3');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '6');
INSERT INTO `sys_user_role` VALUES ('3', '5');
INSERT INTO `sys_user_role` VALUES ('4', '5');
INSERT INTO `sys_user_role` VALUES ('5', '6');
INSERT INTO `sys_user_role` VALUES ('6', '7');
INSERT INTO `sys_user_role` VALUES ('7', '4');
INSERT INTO `sys_user_role` VALUES ('8', '4');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('10', '3');
INSERT INTO `sys_user_role` VALUES ('10', '5');
INSERT INTO `sys_user_role` VALUES ('11', '2');
