package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.UsrBankDAO;
import com.zj198.model.UsrBank;

public class UsrBankDAOImpl extends HibernateDAO<UsrBank, Integer> implements UsrBankDAO {

	@Override
	public UsrBank getByUid(Integer uid) {
		String hql="from UsrBank as model where model.userid=:uid";
		List<UsrBank> list = list(hql,"uid", uid);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<UsrBank> findUsrBanksByName(String name) {
		String hql = "from UsrBank where detailname like :name";
		return this.list(hql, "name", "%"+name+"%");
	}

}
