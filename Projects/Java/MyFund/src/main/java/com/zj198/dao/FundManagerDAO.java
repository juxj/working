package com.zj198.dao;

import java.util.List;

import com.zj198.model.FundManager;

public interface FundManagerDAO extends BaseDAO<FundManager, Integer> {
	/**根据基金id基金经理*/
	public FundManager getManagerByFundId(Integer id);
	public List<FundManager> findManagerByFundId(Integer id);
}
