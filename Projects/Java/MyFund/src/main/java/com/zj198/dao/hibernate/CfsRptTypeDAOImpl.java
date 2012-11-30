package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.CfsRptTypeDAO;
import com.zj198.model.CfsRptType;

public class CfsRptTypeDAOImpl extends HibernateDAO<CfsRptType, Integer> implements CfsRptTypeDAO {

	@Override
	public CfsRptType getRptTypeByCode(String code) {
		String hql="from CfsRptType as model where model.code=:code";
		List<CfsRptType> types=list(hql,"code",code);
		if(types.size()==1){
			return types.get(0);
		}
		return null;
	}


}
