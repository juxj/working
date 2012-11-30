package com.zj198.dao;

import java.util.List;

import com.zj198.model.DicBaseRate;

public interface DicBaseRateDAO  extends BaseDAO<DicBaseRate, Integer>{
	public List<DicBaseRate> findBaseRate();
}
