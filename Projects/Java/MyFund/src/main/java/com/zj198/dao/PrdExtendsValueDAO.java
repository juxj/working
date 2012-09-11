package com.zj198.dao;

import java.util.List;

import com.zj198.model.PrdExtendsValue;

public interface PrdExtendsValueDAO extends BaseDAO<PrdExtendsValue, Integer>{
	public List<PrdExtendsValue> getFinanceApplyExtendsValue(Integer applyId);
}