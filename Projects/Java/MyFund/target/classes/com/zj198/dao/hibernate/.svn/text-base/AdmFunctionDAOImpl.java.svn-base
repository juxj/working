package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.AdmFunctionDAO;
import com.zj198.model.AdmFunction;

public class AdmFunctionDAOImpl extends HibernateDAO<AdmFunction, Integer> implements AdmFunctionDAO {

	@Override
	public List<AdmFunction> findAllMenu() {
		String hql="from AdmFunction as model where model.ismenu=1";
		return list(hql);
	}

	@Override
	public AdmFunction getByActionName(String actionName) {
		String hql="from AdmFunction as model where model.action like :actionName";
		List<AdmFunction> list = list(hql,"actionName","%"+actionName+"%");
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

}
