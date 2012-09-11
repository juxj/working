package com.zj198.dao;

import java.util.List;

import com.zj198.model.DicDistrict;

public interface DicDistrictDAO extends BaseDAO<DicDistrict, Integer> {
	public List<DicDistrict> findByCityid(Integer cityId);
}
