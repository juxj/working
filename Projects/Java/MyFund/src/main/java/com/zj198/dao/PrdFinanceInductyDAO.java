package com.zj198.dao;

import java.util.List;

import com.zj198.model.PrdFinanceInducty;
import com.zj198.model.vo.FinanceIndustryModel;

/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 14:54:57
 */
public interface PrdFinanceInductyDAO extends BaseDAO<PrdFinanceInducty, Integer>{
	public List<FinanceIndustryModel> findFiananceInducty(Integer financeId);
	public PrdFinanceInducty findInducty(Integer financeId, Integer id);
	public PrdFinanceInducty findInductyChild(Integer financeId, Integer childId);
}
