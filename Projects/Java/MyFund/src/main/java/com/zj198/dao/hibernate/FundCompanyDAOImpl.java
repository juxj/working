package com.zj198.dao.hibernate;

import com.zj198.dao.FundCompanyDAO;
import com.zj198.model.FundCompany;
import com.zj198.util.Pager;

public class FundCompanyDAOImpl  extends HibernateDAO<FundCompany, Integer> implements  FundCompanyDAO{

	@Override
	public Pager findAll(int pageSize, int pageNo) {
		String hql = "from FundCompany";
		return pagedQuery(hql,pageNo,pageSize);
	}

}
