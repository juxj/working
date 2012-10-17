package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicUsertypeDAO;
import com.zj198.model.DicUsertype;
import com.zj198.util.CacheUtil;


public class DicUsertypeDAOImpl extends HibernateDAO<DicUsertype, Integer> implements DicUsertypeDAO{

	public List<DicUsertype> findByGroup(Integer groupId) {
		Object object = CacheUtil.get("DicUsertype_group_"+groupId);
		if(object==null){
			String hql="from DicUsertype as model where model.group=:groupId";
			List<DicUsertype> list = list(hql,"groupId", groupId);
			CacheUtil.set("DicUsertype_group_"+groupId,list);
			return list;
		}else{
			return (List<DicUsertype>)object;
		}
	}
	
	@Override
	public List<DicUsertype> findAll(){
		Object object = CacheUtil.get("DicUsertype_all");
		if(object==null){
			List<DicUsertype> list = super.findAll();
			CacheUtil.set("DicUsertype_all",list);
			return list;
		}else{
			return (List<DicUsertype>)object;
		}
	}

}