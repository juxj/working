package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundManagerDAO;
import com.zj198.model.FundManager;

public class FundManagerDAOImpl  extends HibernateDAO<FundManager, Integer> implements  FundManagerDAO{

	@Override
	public FundManager getManagerByFundId(Integer id) {
		String hql="from FundManager as model where model.fundId=:id";
		List<FundManager> FundManagerList = list(hql,"id", id);
		if(FundManagerList.size()==1){
			return FundManagerList.get(0);
		}
		return null;
	}

	@Override
	public List<FundManager> findManagerByFundId(Integer id) {
		String hql="from FundManager as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
