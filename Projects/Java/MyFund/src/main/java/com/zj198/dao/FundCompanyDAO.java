package com.zj198.dao;

import com.zj198.model.FundCompany;
import com.zj198.util.Pager;

public interface FundCompanyDAO extends BaseDAO<FundCompany, Integer> {
	public Pager findAll(int pageSize, int pageNo);
}
