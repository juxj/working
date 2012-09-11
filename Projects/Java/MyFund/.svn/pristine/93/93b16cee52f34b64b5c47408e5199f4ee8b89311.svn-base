package com.zj198.dao.hibernate;
import java.util.List;

import com.zj198.dao.PrdFinanceInterestDAO;
import com.zj198.model.PrdFinanceInterest;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:59
 */
public class PrdFinanceInterestDAOImpl extends HibernateDAO<PrdFinanceInterest, Integer> implements PrdFinanceInterestDAO {
//	public List<OrdFinanceInterest> findInterestByPro(Integer productId){
//		String hql = "from OrdFinanceInterest t where t.financeId=:finance_id";
//		return list(hql,"finance_id",productId);
//	}
	
	public List<PrdFinanceInterest> findInterest(Integer financeId){
		String hql = "from PrdFinanceInterest t where t.financeId=" + financeId + " order by t.id";
		return this.list(hql);
	}
}
