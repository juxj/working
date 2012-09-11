package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.UsrFinanceorgDAO;
import com.zj198.model.UsrFinanceorg;

public class UsrFinanceorgDAOImpl extends HibernateDAO<UsrFinanceorg, Integer> implements UsrFinanceorgDAO {

	@Override
	public UsrFinanceorg getByUid(Integer uid) {
		String hql="from UsrFinanceorg as model where model.userid=:uid";
		List<UsrFinanceorg> list = list(hql,"uid", uid);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<UsrFinanceorg> findUsrFinanceOrgsByName(String name) {
		String hql = "from UsrFinanceorg where orgname like :name";
		return this.list(hql, "name", "%"+name+"%");
	}

}
