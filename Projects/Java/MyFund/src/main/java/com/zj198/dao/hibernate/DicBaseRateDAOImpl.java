package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicBaseRateDAO;
import com.zj198.model.DicBaseRate;

public class DicBaseRateDAOImpl  extends HibernateDAO<DicBaseRate, Integer> implements  DicBaseRateDAO{
	/**
	 * 查询基准利率
	 * @return
	 */
	public List<DicBaseRate> findBaseRate(){
		String hql = "from DicBaseRate t where t.id in (1,2,3,4,5) order by t.id";
		return this.list(hql);
	}
}
