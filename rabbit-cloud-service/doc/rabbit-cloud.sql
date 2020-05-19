
/* 若存在先删除 */
DROP TABLE IF EXISTS `account_info`;
/* 创建 账号信息 */
CREATE TABLE `account_info` (
	`ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键-自增长',			
	`NAME` varchar(256) COMMENT '名称，平台名称等',
	`MASTER` varchar(128) COMMENT '主账号', 
	`SALVE` varchar(512) COMMENT '从账号，多个用|隔开', 	
	`LOGIN_PASSWORD` varchar(128) COMMENT '登录密码',
	`TRADE_PASSWORD` varchar(128) COMMENT '交易密码',
	`VALID_PERIOD` varchar(128) default '长期' COMMENT '有效期，长期或区间',
	`TYPE` tinyint default 100 COMMENT '类型，1-社交，2-电商，3-银行，4-证券，5-金融，6-网站，100-其他',
	`LINKER` varchar(256) COMMENT '链接',
	`STATUS` tinyint default 1 COMMENT '状态，1-有效，0-无效',
	`REMARK` varchar(512) COMMENT '备注',
	`UPDATE_GMT` timestamp DEFAULT CURRENT_TIMESTAMP() comment '更新日期时间',		
	`CREATE_GMT` timestamp DEFAULT CURRENT_TIMESTAMP() comment '创建日期时间',			 	
	PRIMARY KEY (`ID`)  
) ENGINE=InnoDB COMMENT '账号信息' DEFAULT CHARSET=UTF8;


-- 菜单SQL
INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
    VALUES ('1', '账号信息', 'enterprise/accountinfo', NULL, '1', 'config', '6');

-- 按钮父菜单ID
set @parentId = @@identity;

-- 菜单对应按钮SQL
INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
    SELECT @parentId, '查看', null, 'enterprise:accountinfo:list,enterprise:accountinfo:info', '2', null, '6';
INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
    SELECT @parentId, '新增', null, 'enterprise:accountinfo:save', '2', null, '6';
INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
    SELECT @parentId, '修改', null, 'enterprise:accountinfo:update', '2', null, '6';
INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
    SELECT @parentId, '删除', null, 'enterprise:accountinfo:delete', '2', null, '6';



















