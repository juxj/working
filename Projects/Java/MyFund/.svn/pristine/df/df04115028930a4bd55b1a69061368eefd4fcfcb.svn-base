package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.UsrOrgAttachDAO;
import com.zj198.model.UsrOrgAttach;
import com.zj198.model.UsrPerson;
import com.zj198.util.Constants;

public class UsrOrgAttachDAOImpl extends HibernateDAO<UsrOrgAttach, Integer> implements UsrOrgAttachDAO {

	@Override
	public UsrOrgAttach getById(Integer id) {
		// TODO Auto-generated method stub
		String hql="from UsrOrgAttach as model where model.id=:id";
		List<UsrOrgAttach> list = list(hql,"id", id);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<UsrOrgAttach> fintByUid(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "from UsrOrgAttach as model where model.userId=:uid and model.attachStatus=:attachStatus";
		return this.list(hql, "uid", uid,"attachStatus",Constants.BASEDATA_GROUP_ORG_ATTACH_STATUS_ON);
	}

	@Override
	public UsrOrgAttach getByUidAttachType(Integer uid, Integer type) {
		// TODO Auto-generated method stub
		String hql="from UsrOrgAttach as model where model.userId=:uid and model.attachType=:attachType and model.attachStatus=:attachStatus";
		List<UsrOrgAttach> list = list(hql,"uid", uid,"attachType",type,"attachStatus",Constants.BASEDATA_GROUP_ORG_ATTACH_STATUS_ON);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

}
