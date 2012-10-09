package com.zj198.dao.hibernate;
import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.OrdFinanceApplyCheckDAO;
import com.zj198.model.OrdFinanceApplyCheck;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:59
 */
public class OrdFinanceApplyCheckDAOImpl extends HibernateDAO<OrdFinanceApplyCheck, Integer> implements OrdFinanceApplyCheckDAO {
	public List<OrdFinanceApplyCheck> findApplyCheck(Integer applyId){
		String hql = "from OrdFinanceApplyCheck t where t.financeApplyId=:applyId order by id desc";
		return this.list(hql,"applyId", applyId);
	}

	public List<OrdFinanceApplyCheck> findApplyCheck(Integer applyId, Integer num) {
		String hql = "from OrdFinanceApplyCheck t where t.financeApplyId=:applyId order by id desc";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("applyId", applyId);
		return this.findTopRows(hql,num, params);
	}
}
