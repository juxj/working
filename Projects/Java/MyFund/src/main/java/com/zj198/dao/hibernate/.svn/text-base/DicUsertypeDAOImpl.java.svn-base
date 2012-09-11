package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicUsertypeDAO;
import com.zj198.model.DicUsertype;


public class DicUsertypeDAOImpl extends HibernateDAO<DicUsertype, Integer> implements DicUsertypeDAO{

	public List<DicUsertype> findByGroup(Integer groupId) {
		String hql="from DicUsertype as model where model.group=:groupId";
		return list(hql,"groupId", groupId);
	}

}