package com.zj198.dao.hibernate;

import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.UsrMemberPeroidDAO;
import com.zj198.model.UsrMemberPeroid;
import com.zj198.model.UsrUser;
import com.zj198.util.Pager;

public class UsrMemberPeroidDAOImpl extends HibernateDAO<UsrMemberPeroid, Integer> implements UsrMemberPeroidDAO {
	//select new com.zj198.model.vo.FinanceIndustryModel(t.id,t.financeId,t.industryId,t.industryChildid,t1.name) from PrdFinanceInducty t, DicIndustry t1 where t.financeId=:financeId and (t.industryId=t1.id or t.industryChildid=t1.id)";
	@Override
	public Pager findAllUsrMP(Integer id, Integer userid, Integer orderId,Integer memberType, Integer pageNo, Integer pageSize) {
		String hql = "select new com.zj198.model.UsrMemberPeroid(u.userId,u.memberStart,u.memberEnd,u.memberType,u.createTime,u.orderId,u.status,user.username) from UsrMemberPeroid as u ,UsrUser as user where u.userId=user.id";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(id!=null && id!=-1){
			hql+=" and u.id=:id";
			paramMap.put("id", id);
		}
		if(userid!=null && userid!=-1){
			hql+=" and u.userId=:userid";
			paramMap.put("userid", userid);
		}
		return pagedQuery(hql,pageNo,pageSize,paramMap);
	}

	@Override
	public UsrMemberPeroid getUsrMP(Integer userid) {
		String hql="from UsrMemberPeroid as model where model.userId=:userId order by model.createTime desc";
		List<UsrMemberPeroid> usrMpList = list(hql,"userId", userid);
		if(usrMpList.size()>=1){
			return usrMpList.get(0);
		}
		return null;
	}

}
