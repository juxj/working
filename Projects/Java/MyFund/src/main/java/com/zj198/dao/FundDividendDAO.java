package com.zj198.dao;

import java.util.List;

import com.zj198.model.FundDividend;

public interface FundDividendDAO extends BaseDAO<FundDividend, Integer> {
	/**根据基金id基金分红*/
	public FundDividend getDividendByFundId(Integer id);
	public List<FundDividend> findDividendByFundId(Integer id);
}
