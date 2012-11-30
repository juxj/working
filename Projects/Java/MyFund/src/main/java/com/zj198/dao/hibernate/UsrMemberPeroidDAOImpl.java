package com.zj198.dao.hibernate;

import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import org.springframework.util.StringUtils;

import com.zj198.dao.UsrMemberPeroidDAO;
import com.zj198.model.UsrMemberPeroid;
import com.zj198.model.UsrUser;
import com.zj198.util.Pager;

public class UsrMemberPeroidDAOImpl extends HibernateDAO<UsrMemberPeroid, Integer> implements UsrMemberPeroidDAO {
	@Override
	public Pager findAllUsrMP(Integer ordId,String username,Integer status,Integer memberType,Date[] startdt,Date[] createdt,Integer pageNo, Integer pageSize) {
		String hql = "select new com.zj198.model.UsrMemberPeroid(u.userId,u.memberStart,u.memberEnd,u.memberType,u.createTime,u.orderId,u.status,user.username) from UsrMemberPeroid as u ,UsrUser as user where u.userId=user.id";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(ordId!=null && ordId!=-1){
			hql+=" and u.orderId=:id";
			paramMap.put("id", ordId);
		}
		if(StringUtils.hasText(username)){
			hql+=" and user.username like :username";
			paramMap.put("username", "%"+username+"%");
		}
		if(status!=null && status!=-1){
			hql+=" and u.status=:status";
			paramMap.put("status", status);
		}
		if(memberType!=null && memberType!=-1){
			hql+=" and u.memberType=:memberType";
			paramMap.put("memberType", memberType);
		}
		if (startdt != null && startdt.length > 0){
			Date j0 = startdt[0];
			Date j1 = startdt[1];
			if (j0 != null && j1 != null) {
				hql = hql + " and date(u.memberStart) >= :j0 and date(u.memberStart) <= :j1";
				paramMap.put("j0", j0);
				paramMap.put("j1", j1);
			}
		}
		if (createdt != null && createdt.length > 0){
			Date j0 = createdt[0];
			Date j1 = createdt[1];
			if (j0 != null && j1 != null) {
				hql = hql + " and date(u.createTime) >= :j0 and date(u.createTime) <= :j1";
				paramMap.put("j0", j0);
				paramMap.put("j1", j1);
			}
		}
		return pagedQuery(hql,pageNo,pageSize,paramMap);
	}

	@Override
	public UsrMemberPeroid getUsrMP(Integer userid) {
		String hql="from UsrMemberPeroid as model where model.userId=:userId and model.status=1 order by model.createTime desc";
		List<UsrMemberPeroid> usrMpList = list(hql,"userId", userid);
		if(usrMpList.size()>=1){
			return usrMpList.get(0);
		}
		return null;
	}

}
