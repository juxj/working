package com.zj198.service.club.impl;

import java.util.List;

import com.zj198.dao.ClbRequestInfoDAO;
import com.zj198.dao.ClbSupplyInfoDAO;
import com.zj198.dao.DicInvestRangeDAO;
import com.zj198.model.ClbRequestInfo;
import com.zj198.model.ClbSupplyInfo;
import com.zj198.model.DicInvestRange;
import com.zj198.service.club.SupplyRequestService;
import com.zj198.util.Pager;

public class SupplyRequestServiceImpl implements SupplyRequestService{
	
	private ClbRequestInfoDAO clbRequestInfoDAO;
	private ClbSupplyInfoDAO clbSupplyInfoDAO;
	private DicInvestRangeDAO dicInvestRangeDAO;
	
	public Pager findByHomeQuery(int pageSize, int pageNo, String[] query) {
		return this.clbRequestInfoDAO.findByHomeQuery(pageSize, pageNo, query);
	}
	
	public Pager findSupplyInfoByAdmin(ClbSupplyInfo supplyInfo,  int pageSize, int pageNo) {
		return this.clbSupplyInfoDAO.findByAdmin(supplyInfo, pageSize, pageNo);
	}
	
	public Pager findRequestInfoListByAdmin(ClbRequestInfo requestInfo, int pageSize, int pageNo) {
		return this.clbRequestInfoDAO.findRequestInfoItemsByAdmin(requestInfo, pageSize, pageNo);
	}

	@Override
	public List<DicInvestRange> findDicInvestRangeList(int typeId) {
		return this.dicInvestRangeDAO.findDicInvestRangeListByType(typeId);
	}	

	
	@Override
	public Pager findRequestInfoListByUser(int userId, int pageNo, int pageSize) {
		return this.clbRequestInfoDAO.findClbRequestInfoListByUser(userId, pageSize, pageNo);
	}

	@Override
	public Pager findClbSupplyInfoListByUser(int userId, int pageNo, int pageSize) {
		return this.clbSupplyInfoDAO.findClbSupplyInfoListByUser(userId, pageSize, pageNo);
	}

	@Override
	public ClbRequestInfo getClbRequestInofById(Integer id) {
		return clbRequestInfoDAO.get(id);
	}

	@Override
	public Pager findRequestInfoList(int pageSize, int pageNo) {
		return clbRequestInfoDAO.findAll(pageSize, pageNo);
	}
	
	public List<ClbRequestInfo> findLastRequestInfo(int num){
		return clbRequestInfoDAO.findLastRequestInfo(num);
	}

	@Override
	public void saveClbRequestInfo(ClbRequestInfo instance) {
		
		if (instance.getId() == null) {
			this.clbRequestInfoDAO.save(instance);
		} else {
			this.clbRequestInfoDAO.update(instance);
		}
	}

	@Override
	public ClbSupplyInfo getClbSupplyInfoById(Integer id) {
		return this.clbSupplyInfoDAO.get(id);
	}

	@Override
	public Pager findClbSupplyInfoList(int pageSize, int pageNo) {
		return this.clbSupplyInfoDAO.findAll(pageSize, pageNo);
	}
	
	public List<ClbSupplyInfo> findLastSupplyInfo(int num){
		return this.clbSupplyInfoDAO.findLastSupplyInfo(num);
	}

	@Override
	public void saveClbSupplyInfo(ClbSupplyInfo instance) {
		if (instance.getId() == null) {
			this.clbSupplyInfoDAO.save(instance);
		} else {
			this.clbSupplyInfoDAO.update(instance);
		}
	}

	public void setClbRequestInfoDAO(ClbRequestInfoDAO clbRequestInfoDAO) {
		this.clbRequestInfoDAO = clbRequestInfoDAO;
	}

	public void setClbSupplyInfoDAO(ClbSupplyInfoDAO clbSupplyInfoDAO) {
		this.clbSupplyInfoDAO = clbSupplyInfoDAO;
	}

	public void setDicInvestRangeDAO(DicInvestRangeDAO dicInvestRangeDAO) {
		this.dicInvestRangeDAO = dicInvestRangeDAO;
	}

	@Override
	public Pager findClbSupplyInfoList(int pageSize, int pageNo, String[] query) {
		return clbSupplyInfoDAO.findClbSupplyInfoList(pageSize, pageNo, query);
	}

	@Override
	public void deleteSupplyInfo(int id) {
		this.clbSupplyInfoDAO.delete(id);
	}

	@Override
	public void deleteRequestInfo(int id) {
		this.clbRequestInfoDAO.delete(id);
	}

	@Override
	public List<ClbSupplyInfo> findSupplyInfoByType(String investType, int num) {
		return this.clbSupplyInfoDAO.findByType(investType, num);
	}

	@Override
	public List<ClbRequestInfo> findRequestInfoByType(String industry, int num) {
		return this.clbRequestInfoDAO.findByIndustryOfTopN(industry, num);
	}
	
	

}
