package com.hua.modules.enterprise.dao;

import com.hua.modules.enterprise.entity.AccountInfoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 账号信息
 * 
 * @author qianye.zheng
 * @email dearcode2019@qq.com
 * @date 2020-05-19 12:03:19
 */
@Mapper
public interface AccountInfoDao extends BaseMapper<AccountInfoEntity> {
	
}
