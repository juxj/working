package com.zj198.dao;

import java.util.List;

import com.zj198.model.DicCity;

public interface DicCityDAO extends BaseDAO<DicCity, Integer> {
	public List<DicCity> findByProvinceid(Integer provinceId);
}
