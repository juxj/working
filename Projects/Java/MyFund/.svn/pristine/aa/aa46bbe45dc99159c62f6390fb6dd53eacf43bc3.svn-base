package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.OrdAppLoanDAO;
import com.zj198.model.OrdFinanceAppLoan;
import com.zj198.util.Pager;

public class OrdAppLoanDAOImpl extends HibernateDAO<OrdFinanceAppLoan, Integer> implements OrdAppLoanDAO {

	public OrdFinanceAppLoan findByAppId(Integer id) {
		String hql = "from OrdFinanceAppLoan o where o.id = :id";
		List<OrdFinanceAppLoan> OrdFinanceAppLoans = list(hql, "id", id);
		if (OrdFinanceAppLoans.size() > 0) {
			return OrdFinanceAppLoans.get(0);
		}
		return null;
	}

	public Pager getList(Integer userId, Integer page, Integer pageSize) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("orgId", userId);
		return super.pagedQuery("from OrdFinanceAppLoan o where o.orgId = :orgId", page, pageSize, params);
	}
	
	public List<OrdFinanceAppLoan> findAppLoan(Integer userId){
		String hql = "select t1 from OrdFinanceApply t, OrdFinanceAppLoan t1 where t.id=t1.applyId and t.userId = :userId order by t1.id desc";
		return this.list(hql, "userId", userId);
	}
}
