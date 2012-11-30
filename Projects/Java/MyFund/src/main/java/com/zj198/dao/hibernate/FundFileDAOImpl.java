package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundFileDAO;
import com.zj198.model.FundFile;

public class FundFileDAOImpl  extends HibernateDAO<FundFile, Integer> implements  FundFileDAO{

	@Override
	public FundFile getFileByFundId(Integer id) {
		String hql="from FundFile as model where model.fundId=:id";
		List<FundFile> fundFileList = list(hql,"id", id);
		if(fundFileList.size()==1){
			return fundFileList.get(0);
		}
		return null;
	}

	@Override
	public List<FundFile> findFileByFundId(Integer id) {
		String hql="from FundFile as model where model.fundId=:id order by issuedDate desc";
		return list(hql,"id", id);
	}

}
