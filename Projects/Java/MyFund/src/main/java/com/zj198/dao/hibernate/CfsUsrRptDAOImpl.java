package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.CfsUsrRptDAO;
import com.zj198.model.CfsUsrRpt;

public class CfsUsrRptDAOImpl extends HibernateDAO<CfsUsrRpt, Integer> implements CfsUsrRptDAO {

	@Override
	public CfsUsrRpt getCfsUsrRptByUserId(Integer userid) {
		String hql="from CfsUsrRpt as model where model.usrId=:userId";
		List<CfsUsrRpt> usrRptList = list(hql,"userId", userid);
		if(usrRptList.size()==1){
			return usrRptList.get(0);
		}
		return null;
	}


}
