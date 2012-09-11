package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.UsrPersonDAO;
import com.zj198.model.UsrPerson;

public class UsrPersonDAOImpl extends HibernateDAO<UsrPerson, Integer> implements UsrPersonDAO {

	@Override
	public UsrPerson getByUid(Integer uid) {
		String hql="from UsrPerson as model where model.userid=:uid";
		List<UsrPerson> list = list(hql,"uid", uid);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

	
}
