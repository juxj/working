package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicCityDAO;
import com.zj198.model.DicCity;

public class DicCityDAOImpl extends HibernateDAO<DicCity, Integer> implements DicCityDAO{

	@Override
	public List<DicCity> findByProvinceid(Integer provinceId) {
		String hql="from DicCity as model where model.provinceid=:provinceId";
		return list(hql,"provinceId", provinceId);
	}

}
