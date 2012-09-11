package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.AdmUserDAO;
import com.zj198.model.AdmUser;

public class AdmUserDAOImpl extends HibernateDAO<AdmUser, Integer> implements AdmUserDAO {

	@Override
	public AdmUser getByUsername(String username) {
		String hql="from AdmUser as model where model.username=:username";
		List<AdmUser> adminList = list(hql,"username",username);
		if(adminList.size()==1){
			return adminList.get(0);
		}
		return null;
	}

}
