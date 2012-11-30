package com.zj198.dao;

import java.util.List;

import com.zj198.model.FundCharge;

public interface FundChargeDAO extends BaseDAO<FundCharge, Integer> {
	/**根据基金id基金费率*/
	public FundCharge getChargeByFundId(Integer id);
	/**根据基金id基金费率*/
	public List<FundCharge> findChargeByFundId(Integer id);
}
