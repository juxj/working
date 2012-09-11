package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.UsrCompanyDAO;
import com.zj198.model.UsrCompany;

public class UsrCompanyDAOImpl extends HibernateDAO<UsrCompany, Integer> implements UsrCompanyDAO {

	@Override
	public UsrCompany getByUid(Integer uid) {
		String hql="from UsrCompany as model where model.userid=:uid";
		List<UsrCompany> list = list(hql,"uid", uid);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<UsrCompany> findUsrCompaniesByName(String name) {
		String hql = "from UsrCompany where companyname like :name";
		List<UsrCompany> result = this.list(hql, "name",  "%"+name+"%");
		return result;
	}


}
