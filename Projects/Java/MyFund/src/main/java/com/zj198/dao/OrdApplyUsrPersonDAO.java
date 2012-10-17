package com.zj198.dao;

import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.OrdApplyUsrPerson;

public interface OrdApplyUsrPersonDAO extends BaseDAO<OrdApplyUsrPerson, Integer> {
	public void add(OrdApplyUsrPerson o);

	public OrdApplyUsrPerson getByApplyId(Integer id);
}
