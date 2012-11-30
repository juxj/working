package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicProvinceDAO;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicProvince;
import com.zj198.util.CacheUtil;

public class DicProvinceDAOImpl extends HibernateDAO<DicProvince, Integer> implements DicProvinceDAO{
	@Override
	public List<DicProvince> findAll(){
		Object object = CacheUtil.get("DicProvince_all");
		if(object==null){
			List<DicProvince> list = super.findAll();
			CacheUtil.set("DicProvince_all",list);
			return list;
		}else{
			return (List<DicProvince>)object;
		}
	}
	
	@Override
	public DicProvince get(Integer id){
		Object object = CacheUtil.get("DicProvince_"+id);
		if(object==null){
			DicProvince dicProvince = super.get(id);
			CacheUtil.set("DicProvince_"+id,dicProvince);
			return dicProvince;
		}else{
			return (DicProvince)object;
		}
	}
}
