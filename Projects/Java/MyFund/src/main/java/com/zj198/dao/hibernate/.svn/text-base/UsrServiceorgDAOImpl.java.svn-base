package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.UsrServiceorgDAO;
import com.zj198.model.UsrServiceorg;

public class UsrServiceorgDAOImpl extends HibernateDAO<UsrServiceorg, Integer> implements UsrServiceorgDAO {

	@Override
	public UsrServiceorg getByUid(Integer uid) {
		String hql="from UsrServiceorg as model where model.userid=:uid";
		List<UsrServiceorg> list = list(hql,"uid", uid);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<UsrServiceorg> findUsrServiceOrgsByName(String name) {
		String hql = "from UsrServiceorg where orgname like :name";
		return this.list(hql, "name", "%"+name+"%");
	}


}
