package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.PrdExtendsValueDAO;
import com.zj198.model.PrdExtendsValue;
import com.zj198.util.Constants;

public class PrdExtendsValueDAOImpl extends HibernateDAO<PrdExtendsValue, Integer> implements PrdExtendsValueDAO {
	public List<PrdExtendsValue> getFinanceApplyExtendsValue(Integer applyId){
		String hql = "from PrdExtendsValue t where t.extendsType= :extendsType and t.rowId = :rowId";
		return this.list(hql,"extendsType", Constants.EXTENDS_PROPERTY_FINANCE,"rowId", applyId);
	}
}