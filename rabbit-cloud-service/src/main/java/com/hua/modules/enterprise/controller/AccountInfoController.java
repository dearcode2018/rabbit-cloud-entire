package com.hua.modules.enterprise.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hua.modules.enterprise.entity.AccountInfoEntity;
import com.hua.modules.enterprise.service.AccountInfoService;
import com.hua.common.util.PageUtils;
import com.hua.common.util.R;



/**
 * 账号信息
 *
 * @author qianye.zheng
 * @email dearcode2019@qq.com
 * @date 2020-05-19 12:03:19
 */
@RestController
@RequestMapping("enterprise/accountinfo")
public class AccountInfoController {
    @Autowired
    private AccountInfoService accountInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("enterprise:accountinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = accountInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("enterprise:accountinfo:info")
    public R info(@PathVariable("id") Integer id){
		AccountInfoEntity accountInfo = accountInfoService.getById(id);

        return R.ok().put("accountinfo", accountInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("enterprise:accountinfo:save")
    public R save(@RequestBody AccountInfoEntity accountInfo){
		accountInfoService.save(accountInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("enterprise:accountinfo:update")
    public R update(@RequestBody AccountInfoEntity accountInfo){
		accountInfoService.updateById(accountInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("enterprise:accountinfo:delete")
    public R delete(@RequestBody Integer[] ids){
		accountInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
