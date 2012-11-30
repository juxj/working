package com.zj198.dao;

import com.zj198.model.CfsRptType;

public interface CfsRptTypeDAO extends BaseDAO<CfsRptType, Integer>{
	/**根据报表类型 code {01:资产负债表,02:利润及利润分配表,03:现金流量表} 取出报表类型属性*/
	public CfsRptType getRptTypeByCode(String code);
}
