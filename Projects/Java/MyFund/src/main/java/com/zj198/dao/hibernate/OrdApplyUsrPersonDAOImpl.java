package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.OrdApplyUsrPersonDAO;
import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.OrdApplyUsrPerson;

public class OrdApplyUsrPersonDAOImpl extends HibernateDAO<OrdApplyUsrPerson, Integer> implements OrdApplyUsrPersonDAO {
	public void add(OrdApplyUsrPerson o) {
		this.save(o);
	}

	public OrdApplyUsrPerson getByApplyId(Integer id) {
		String hql = "from OrdApplyUsrPerson o where o.applyId = :applyId";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("applyId", id);
		List<OrdApplyUsrPerson> list = list(hql, params);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
}
