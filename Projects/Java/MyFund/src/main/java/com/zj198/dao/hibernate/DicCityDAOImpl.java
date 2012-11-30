package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicCityDAO;
import com.zj198.model.DicCity;
import com.zj198.util.CacheUtil;

public class DicCityDAOImpl extends HibernateDAO<DicCity, Integer> implements DicCityDAO{

	@Override
	public List<DicCity> findByProvinceid(Integer provinceId) {
		Object object = CacheUtil.get("DicCity_provinceid_"+provinceId);
		if(object==null){
			String hql="from DicCity as model where model.provinceid=:provinceId";
			List<DicCity> list = list(hql,"provinceId", provinceId);
			CacheUtil.set("DicCity_provinceid_"+provinceId,list);
			return list;
		}else{
			return (List<DicCity>)object;
		}
	}
	
	@Override
	public DicCity get(Integer id){
		Object object = CacheUtil.get("DicCity_"+id);
		if(object==null){
			DicCity dicCity = super.get(id);
			CacheUtil.set("DicCity_"+id,dicCity);
			return dicCity;
		}else{
			return (DicCity)object;
		}
	}

}
