package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicDistrictDAO;
import com.zj198.model.DicCity;
import com.zj198.model.DicDistrict;
import com.zj198.util.CacheUtil;

public class DicDistrictDAOImpl extends HibernateDAO<DicDistrict, Integer> implements DicDistrictDAO{

	@Override
	public List<DicDistrict> findByCityid(Integer cityId) {
		Object object = CacheUtil.get("DicDistrict_cityid_"+cityId);
		if(object==null){
			String hql="from DicDistrict as model where model.cityid=:cityId";
			List<DicDistrict> list = list(hql,"cityId", cityId);
			CacheUtil.set("DicDistrict_cityid_"+cityId,list);
			return list;
		}else{
			return (List<DicDistrict>)object;
		}
	}
	
	@Override
	public DicDistrict get(Integer id){
		Object object = CacheUtil.get("DicDistrict_"+id);
		if(object==null){
			DicDistrict dicDistrict = super.get(id);
			CacheUtil.set("DicDistrict_"+id,dicDistrict);
			return dicDistrict;
		}else{
			return (DicDistrict)object;
		}
	}
}
