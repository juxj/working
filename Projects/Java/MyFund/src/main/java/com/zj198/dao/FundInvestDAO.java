package com.zj198.dao;

import java.util.List;

import com.zj198.model.FundInvest;

public interface FundInvestDAO extends BaseDAO<FundInvest, Integer> {
	/**根据基金id投资组合*/
	public FundInvest getInvestByFundId(Integer id);
	public List<FundInvest> findInvestByFundId(Integer id);
}
