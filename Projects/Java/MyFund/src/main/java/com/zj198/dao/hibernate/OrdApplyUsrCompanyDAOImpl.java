package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.OrdApplyUsrCompanyDAO;
import com.zj198.model.OrdApplyUsrCompany;

public class OrdApplyUsrCompanyDAOImpl extends HibernateDAO<OrdApplyUsrCompany, Integer> implements OrdApplyUsrCompanyDAO {

	public void add(OrdApplyUsrCompany o) {
		this.save(o);
	}

	public OrdApplyUsrCompany getByApplyId(Integer id) {
		String hql = "from OrdApplyUsrCompany o where o.applyId = :applyId";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("applyId", id);
		List<OrdApplyUsrCompany> list = list(hql, params);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
