package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.PrdExtendsPropertyDAO;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.util.Constants;

public class PrdExtendsPropertyDAOImpl extends HibernateDAO<PrdExtendsProperty, Integer> implements PrdExtendsPropertyDAO {
	public List<PrdExtendsProperty> getFinancePropertys(Integer financeId){
		String hql = "from PrdExtendsProperty t where t.extendsType= :extendsType and t.rowId = :rowId order by t.id";
		return this.list(hql, "extendsType",Constants.EXTENDS_PROPERTY_FINANCE, "rowId", financeId);
	}
	
}