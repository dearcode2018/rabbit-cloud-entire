package com.hua.modules.enterprise.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hua.common.util.PageUtils;
import com.hua.modules.enterprise.entity.AccountInfoEntity;

import java.util.Map;

/**
 * 账号信息
 *
 * @author qianye.zheng
 * @email dearcode2019@qq.com
 * @date 2020-05-19 12:03:19
 */
public interface AccountInfoService extends IService<AccountInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

