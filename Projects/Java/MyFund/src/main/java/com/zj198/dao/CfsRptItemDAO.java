package com.zj198.dao;

import java.util.List;

import com.zj198.model.CfsRptItem;

public interface CfsRptItemDAO extends BaseDAO<CfsRptItem, Integer>{
	/**取出所有的报表样式*/
	public List<CfsRptItem> findCfsRptItemsByVersion();
	/**根据报表版本version 和报表类型 code {01:资产负债表,02:利润及利润分配表,03:现金流量表} 取出报表样式*/
	public List<CfsRptItem> findRptItemByTypeCode(String code);
}
