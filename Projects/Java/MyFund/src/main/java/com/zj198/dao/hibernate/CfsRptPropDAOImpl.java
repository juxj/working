package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.CfsRptPropDAO;
import com.zj198.model.CfsRptProp;

public class CfsRptPropDAOImpl extends HibernateDAO<CfsRptProp, Integer> implements CfsRptPropDAO {

	@Override
	public List<CfsRptProp> getCfsRptPropListByType(String rptTypeCode) {
		String hql = "from CfsRptProp where cfsRptTypeCode = :cfsRptTypeCode";
		return this.list(hql, "cfsRptTypeCode", rptTypeCode);
	}


}
