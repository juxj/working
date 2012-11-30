package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundAnnouncementDAO;
import com.zj198.model.FundAnnouncement;
import com.zj198.model.UsrUser;

public class FundAnnouncementDAOImpl  extends HibernateDAO<FundAnnouncement, Integer> implements  FundAnnouncementDAO{

	@Override
	public FundAnnouncement getAnnByFundId(Integer id) {
		String hql="from FundAnnouncement as model where model.fundId=:id";
		List<FundAnnouncement> fundAnnList = list(hql,"id", id);
		if(fundAnnList.size()==1){
			return fundAnnList.get(0);
		}
		return null;
	}

	@Override
	public List<FundAnnouncement> findAnnByFundId(Integer id) {
		String hql="from FundAnnouncement as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
