package com.zj198.dao;

import com.zj198.model.FundNav;
import com.zj198.util.Pager;

public interface FundNavDAO extends BaseDAO<FundNav, Integer> {
	/**基金Nav*/
	public Pager getNavByFundId(Integer id,Integer pageNo, Integer pageSize);
}
