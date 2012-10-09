package com.zj198.service.club;

import java.util.List;

import com.zj198.model.ClbRequestInfo;
import com.zj198.model.ClbSupplyInfo;
import com.zj198.model.DicInvestRange;
import com.zj198.util.Pager;

public interface SupplyRequestService {

	/**Get ClbRequestInfo By Id.*/
	public ClbRequestInfo getClbRequestInofById(Integer id);
	
	/**Get all objects which sort by lastPostDate with descending order.*/
	public Pager findRequestInfoList(int pageSize, int pageNo);
	
	/**Save Object.*/
	public void saveClbRequestInfo(ClbRequestInfo instance);

	/*** Find objects by User.*/
	public Pager findRequestInfoListByUser(int userId, int pageNo, int pageSize);
	
	
	/**Get ClbSupplyInfo By Id*/
	public ClbSupplyInfo getClbSupplyInfoById(Integer id);
	
	/**Get all ClbSupply Info with paginations and order by lastPostDate.*/
	public Pager findClbSupplyInfoList(int pageSize, int pageNo);
	
	public Pager findClbSupplyInfoList(int pageSize, int pageNo, String[] query);
	
	/**Save ClbSupplyInfo */
	public void saveClbSupplyInfo(ClbSupplyInfo instance);
	
	
	/**Get all ClbSupplyInfo by User.*/
	public Pager findClbSupplyInfoListByUser(int userId, int pageNo, int pageSize);
	
	/**get related parameters by type id.*/
	public List<DicInvestRange> findDicInvestRangeList(int typeId);
	
	/**Get unauthorized items of supply info*/
	public Pager findSupplyInfoByAdmin(ClbSupplyInfo supplyInfo, int pageSize, int pageNo);
	
	/**get unauthorized items of request info.*/
	public Pager findRequestInfoListByAdmin(ClbRequestInfo requestInfo, int pageSize, int pageNo);
	
	
	public Pager findByHomeQuery(int pageSize, int pageNo, String[] query);
	
	
	public void deleteSupplyInfo(int id);
	
	public void deleteRequestInfo(int id);
	
	public List<ClbSupplyInfo> findLastSupplyInfo(int num);
	
	public List<ClbRequestInfo> findLastRequestInfo(int num);
	
	/**取指定类别的前Ｎ个记录*/
	public List<ClbSupplyInfo> findSupplyInfoByType(String investType, int num);
	
	/**取指定类别的前Ｎ个记录*/
	public List<ClbRequestInfo> findRequestInfoByType(String industry, int num) ;
	
}
