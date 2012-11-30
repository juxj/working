package com.zj198.dao;

import java.util.List;

import com.zj198.model.FundAnnouncement;

public interface FundAnnouncementDAO extends BaseDAO<FundAnnouncement, Integer> {
	/**基金相关公告*/
	public FundAnnouncement getAnnByFundId(Integer id);
	/**基金相关公告*/
	public List<FundAnnouncement> findAnnByFundId(Integer id);
}
