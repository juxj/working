package com.zj198.dao.hibernate;
import java.util.List;

import com.zj198.dao.OrdFaLoanDataDAO;
import com.zj198.model.OrdFaLoanData;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-25 16:37:43
 */
public class OrdFaLoanDataDAOImpl extends HibernateDAO<OrdFaLoanData, Integer> implements OrdFaLoanDataDAO {
	public List<OrdFaLoanData> findFaLoanData(Integer appLoanId){
		String hql = "from OrdFaLoanData t where t.appLoanId = :appLoanId";
		
		return this.list(hql, "appLoanId", appLoanId);
	}
}
