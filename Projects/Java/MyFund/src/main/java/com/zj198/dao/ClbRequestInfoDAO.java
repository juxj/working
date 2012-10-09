package com.zj198.dao;

import java.util.List;

import com.zj198.model.ClbRequestInfo;
import com.zj198.util.Pager;

public interface ClbRequestInfoDAO extends BaseDAO<ClbRequestInfo, Integer> {

	public Pager findAll(int pageSize, int pageNo);
	public Pager findRequestInfoItemsByAdmin(ClbRequestInfo requestInfo, int pageSize, int pageNo) ;
	public Pager findClbRequestInfoListByUser(int userId, int pageSize, int pageNo);
	public Pager findByHomeQuery(int pageSize, int pageNo, String[] query);
	public List<ClbRequestInfo> findLastRequestInfo(int num);
	public List<ClbRequestInfo> findByIndustryOfTopN(String industry, int num);
}
