package com.zj198.dao;

import java.util.Date;

import com.zj198.model.Fund;
import com.zj198.util.Pager;

public interface FundDAO extends BaseDAO<Fund, Integer> {

	public Pager findFundAll(String catelogName, String companyName, String fundCode, String fullName,Date[] issuedDt,Integer pageSize, Integer pageNo);
}
