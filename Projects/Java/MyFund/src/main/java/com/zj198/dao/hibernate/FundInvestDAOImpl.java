package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundInvestDAO;
import com.zj198.model.FundInvest;

public class FundInvestDAOImpl  extends HibernateDAO<FundInvest, Integer> implements  FundInvestDAO{

	@Override
	public FundInvest getInvestByFundId(Integer id) {
		String hql="from FundInvest as model where model.fundId=:id";
		List<FundInvest> fundInvestList = list(hql,"id", id);
		if(fundInvestList.size()==1){
			return fundInvestList.get(0);
		}
		return null;
	}

	@Override
	public List<FundInvest> findInvestByFundId(Integer id) {
		String hql="from FundInvest as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
