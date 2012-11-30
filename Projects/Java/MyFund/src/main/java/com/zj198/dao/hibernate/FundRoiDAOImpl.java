package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundRoiDAO;
import com.zj198.model.FundRoi;

public class FundRoiDAOImpl  extends HibernateDAO<FundRoi, Integer> implements  FundRoiDAO{

	@Override
	public FundRoi getRoiByFundId(Integer id) {
		String hql="from FundRoi as model where model.fundId=:id";
		List<FundRoi> fundRoiList = list(hql,"id", id);
		if(fundRoiList.size()==1){
			return fundRoiList.get(0);
		}
		return null;
	}

	@Override
	public List<FundRoi> findRoiByFundId(Integer id) {
		String hql="from FundRoi as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
