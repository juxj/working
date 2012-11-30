package com.zj198.dao;

import java.util.List;

import com.zj198.model.CfsRptData;

public interface CfsRptDataDAO extends BaseDAO<CfsRptData, Integer>{
	/** 根据userid  和typcode{01:资产负债表,02:利润及利润分配表,03:现金流量表}  取出用报表*/
	public List<CfsRptData> findCfsRptDataByUseridTypeCode(Integer userid,String code);
	/**根据cfsRptItem.code usr_id and code and cfs_rpt_type_code取到单条数据*/
	public CfsRptData getCfsRptDataByCode(String code,Integer userid,String typeCode);
	
	public Double getRptCellData(Integer userId, String cfsRptTypeCode, String itemCode, Integer year);
}
