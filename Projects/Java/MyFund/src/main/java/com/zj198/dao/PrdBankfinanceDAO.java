package com.zj198.dao;

import java.util.Date;
import java.util.List;

import com.zj198.model.PrdBankfinance;
import com.zj198.util.Pager;

public interface PrdBankfinanceDAO extends BaseDAO<PrdBankfinance, Integer> {

	public List<PrdBankfinance> findByBenefitRate(int top);
	public Pager findAll(int pageSize, int pageNo);
	public PrdBankfinance getByCode(String code);
	public Pager findByRecommedation(String name, String bank, Date startDate,  Date endDate,  int status, int pageSize, int pageNo);
	public Pager findByMultiConditions(String[] query, int pageSize, int pageNo);
}
