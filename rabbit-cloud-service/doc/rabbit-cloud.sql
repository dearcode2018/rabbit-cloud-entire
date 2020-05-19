
/* 若存在先删除 */
DROP TABLE IF EXISTS `account_info`;
/* 创建 账号信息表 */
CREATE TABLE `account_info` (
	`ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键-自增长',			
	`NAME` varchar(256) COMMENT '名称，平台名称等',
	`MASTER` varchar(128) COMMENT '主账号', 
	`SALVE` varchar(512) COMMENT '从账号，多个用|隔开', 	
	`LOGIN_PASSWORD` varchar(128) COMMENT '登录账号',
	`TRADE_PASSWORD` varchar(128) COMMENT '交易账号',
	`VALID_PERIOD` varchar(128) COMMENT '有效期，长期或区间',
	`TYPE` tinyint COMMENT '类型，1-社交，2-电商，3-银行，4-证券，5-金融，6-网站，100-其他',
	`LINKER` varchar(256) COMMENT '链接',
	`STATUS` tinyint COMMENT '状态，1-有效，0-无效',
	`REMARK` varchar(512) COMMENT '备注',
	`UPDATE_GMT` timestamp DEFAULT CURRENT_TIMESTAMP() comment '更新日期时间',		
	`CREATE_GMT` timestamp DEFAULT CURRENT_TIMESTAMP() comment '创建日期时间',			 	
	PRIMARY KEY (`ID`)  
) ENGINE=InnoDB COMMENT '账号信息表' DEFAULT CHARSET=UTF8;
























