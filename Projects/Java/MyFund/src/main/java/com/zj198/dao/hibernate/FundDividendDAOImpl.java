package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundDividendDAO;
import com.zj198.model.FundDividend;

public class FundDividendDAOImpl  extends HibernateDAO<FundDividend, Integer> implements  FundDividendDAO{

	@Override
	public FundDividend getDividendByFundId(Integer id) {
		String hql="from FundDividend as model where model.fundId=:id";
		List<FundDividend> fundDivList = list(hql,"id", id);
		if(fundDivList.size()==1){
			return fundDivList.get(0);
		}
		return null;
	}

	@Override
	public List<FundDividend> findDividendByFundId(Integer id) {
		String hql="from FundDividend as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
