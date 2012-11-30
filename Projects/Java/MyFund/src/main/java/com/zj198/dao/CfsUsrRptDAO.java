package com.zj198.dao;

import com.zj198.model.CfsUsrRpt;

public interface CfsUsrRptDAO extends BaseDAO<CfsUsrRpt, Integer>{
	/**检查用户所要填写的报表*/
	public CfsUsrRpt getCfsUsrRptByUserId(Integer userid);
}
