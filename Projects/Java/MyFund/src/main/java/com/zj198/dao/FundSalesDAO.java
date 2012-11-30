package com.zj198.dao;

import java.util.List;

import com.zj198.model.FundSales;

public interface FundSalesDAO extends BaseDAO<FundSales, Integer> {
	/**基金投次回报*/
	public FundSales getSalesByFundId(Integer id);
	/**基金投次回报*/
	public List<FundSales> findSalesByFundId(Integer id);
}
