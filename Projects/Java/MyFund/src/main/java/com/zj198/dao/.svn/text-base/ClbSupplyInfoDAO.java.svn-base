package com.zj198.dao;

import java.util.List;

import com.zj198.model.ClbSupplyInfo;
import com.zj198.util.Pager;

public interface ClbSupplyInfoDAO extends BaseDAO<ClbSupplyInfo, Integer>{
	public Pager findAll(int pageSize, int pageNo);
	public Pager findClbSupplyInfoListByUser(int userId, int pageSize, int pageNo);
	public Pager findByAdmin(ClbSupplyInfo supplyInfo,  int pageSize, int pageNo) ;
	public Pager findClbSupplyInfoList(int pageSize, int pageNo, String[] query);
	public List<ClbSupplyInfo> findLastSupplyInfo(int num);
	
	public List<ClbSupplyInfo> findByType(String investType, int num);
}
