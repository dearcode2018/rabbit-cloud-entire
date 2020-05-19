package com.hua.modules.enterprise.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.SqlHelper;
import com.hua.common.util.PageUtils;
import com.hua.common.util.Query;
import com.hua.modules.enterprise.dao.AccountInfoDao;
import com.hua.modules.enterprise.entity.AccountInfoEntity;
import com.hua.modules.enterprise.service.AccountInfoService;
import com.hua.util.SqlUtil;
import com.hua.util.StringUtil;

@Service("accountInfoService")
public class AccountInfoServiceImpl extends ServiceImpl<AccountInfoDao, AccountInfoEntity> implements AccountInfoService {

	/* 编码解码秘钥 */
	@Value("${encrpty.key:-}")
	private String key;
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
    	final QueryWrapper<AccountInfoEntity> wrapper = new QueryWrapper<>();
    	// 将 &amp; -> &，特殊字符需要反转
 		final String value = StringEscapeUtils.unescapeHtml(params.get("key").toString());
    	if (StringUtil.isNotEmpty(value)) {
    		final String likeWord = SqlUtil.bothLike(value);
    		wrapper.and((x) -> x.like("NAME", likeWord).or().like("MASTER", likeWord).or().like("SALVE", likeWord)
    				.or().like("LINKER", likeWord).or().like("REMARK", likeWord));
    	}
    	// 模糊查询指定字段
    	// and (多个 OR ) and (多个 OR)
    	// 第一个参数true表示将后者加入查询条件，false后者条件无效
    	// 表示非空才执行，避免传null值无法匹配
    	wrapper.and(null != params.get("type"), (x) ->x.eq("type", params.get("type")));    	
    	wrapper.and(null != params.get("status"), (x) ->x.eq("status", params.get("status")));    	
    	wrapper.orderByDesc("UPDATE_GMT");
    	
        final IPage<AccountInfoEntity> page = this.page(new Query<AccountInfoEntity>().getPage(params), wrapper);        

        return new PageUtils(page);
    }


    @Override
    public AccountInfoEntity getById(Serializable id) {
        return baseMapper.selectById(id);
    }


    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return SqlHelper.delBool(baseMapper.deleteBatchIds(idList));
    }
    
    @Override
    public boolean save(AccountInfoEntity entity) {
    	entity.setUpdateGmt(new Date());
    	entity.setCreateGmt(new Date());
        return retBool(baseMapper.insert(entity));
    }
    
    @Override
    public boolean updateById(AccountInfoEntity entity) {
    	entity.setUpdateGmt(new Date());
        return retBool(baseMapper.updateById(entity));
    }
	
    

}