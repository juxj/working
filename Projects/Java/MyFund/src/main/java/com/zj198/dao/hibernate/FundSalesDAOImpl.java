package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundSalesDAO;
import com.zj198.model.FundSales;

public class FundSalesDAOImpl extends HibernateDAO<FundSales, Integer> implements  FundSalesDAO{

	@Override
	public FundSales getSalesByFundId(Integer id) {
		String hql="from FundSales as model where model.fundId=:id";
		List<FundSales> fundSalesList = list(hql,"id", id);
		if(fundSalesList.size()==1){
			return fundSalesList.get(0);
		}
		return null;
	}

	@Override
	public List<FundSales> findSalesByFundId(Integer id) {
		String hql="from FundSales as model where model.fundId=:id";
		return list(hql,"id", id);
	}
	
}
