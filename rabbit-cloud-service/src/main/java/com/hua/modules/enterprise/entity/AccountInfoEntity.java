package com.hua.modules.enterprise.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.hua.transform.DateTimeSerializer;

import lombok.Data;

/**
 * 账号信息
 * 
 * @author qianye.zheng
 * @email dearcode2019@qq.com
 * @date 2020-05-19 12:03:19
 */
@Data
@TableName("account_info")
public class AccountInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键-自增长
	 */
	@TableId
	private Integer id;
	/**
	 * 名称，平台名称等
	 */
	private String name;
	/**
	 * 主账号
	 */
	private String master;
	/**
	 * 从账号，多个用|隔开
	 */
	private String salve;
	/**
	 * 登录密码
	 */
	private String loginPassword;
	/**
	 * 交易密码
	 */
	private String tradePassword;
	/**
	 * 有效期，长期或区间
	 */
	private String validPeriod;
	/**
	 * 类型，1-社交，2-电商，3-银行，4-证券，5-金融，6-网站，100-其他
	 */
	private Integer type;
	/**
	 * 链接
	 */
	private String linker;
	/**
	 * 状态，1-有效，0-无效
	 */
	private Integer status;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 更新日期时间
	 */
	@JsonSerialize(using = DateTimeSerializer.class)
	private Date updateGmt;
	/**
	 * 创建日期时间
	 */
	@JsonSerialize(using = DateTimeSerializer.class)
	private Date createGmt;

}
