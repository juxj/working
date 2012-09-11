package com.zj198.dao.hibernate;

import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.util.StringUtils;

import com.zj198.dao.UsrUserDAO;
import com.zj198.model.UsrUser;
import com.zj198.util.Constants;
import com.zj198.util.NumberUtil;
import com.zj198.util.Pager;

public class UsrUserDAOImpl extends HibernateDAO<UsrUser, Integer> implements UsrUserDAO{

	@Override
	public boolean isExistUsername(String username) {
		String hql="from UsrUser as model where model.username=:username";
		return list(hql,"username", username).size()>0;
	}

	@Override
	public boolean isExistMobile(String mobile, Integer uid) {
		String hql="from UsrUser as model where model.mobile=:mobile";
		if(uid!=null){
			hql+=" and model.id!="+uid;
		}
		List<UsrUser> list = list(hql,"mobile", mobile);;
		for(UsrUser user:list){//没有验证过的不算
			if(NumberUtil.ifExist(user.getActivetype(), Constants.USER_ACTIVE_MOBILE)){
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean isExistEmail(String email, Integer uid) {
		String hql="from UsrUser as model where model.email=:email";
		if(uid!=null){
			hql+=" and model.id!="+uid;
		}
		List<UsrUser> list = list(hql,"email", email);
		for(UsrUser user:list){//没有验证过的不算
			if(NumberUtil.ifExist(user.getActivetype(), Constants.USER_ACTIVE_EMAIL)){
				return true;
			}
		}
		return false;
	}

	@Override
	public UsrUser getByUsername(String username) {
		String hql="from UsrUser as model where model.username=:username";
		List<UsrUser> userList = list(hql,"username", username);
		if(userList.size()==1){
			return userList.get(0);
		}
		return null;
	}
	
	@Override
	public List<UsrUser> findUserByType(Short type){
		String hql="from UsrUser as model where model.status=0 and model.type=:type";
		return list(hql,"type", type);
	}

	@Override
	public List<UsrUser> getUserList(String userName) {
		String hql = "from UsrUser where name like :userName";
		return list(hql,"username", "%"+userName+"%");
	}

	@Override
	public Pager findUserByTodayReg(Integer pageNo, Integer pageSize) {
		String hql = "from UsrUser as model where model.createdt>:todayZero";
		return pagedQuery(hql,pageNo,pageSize,"todayZero", DateUtils.truncate(Calendar.getInstance(), Calendar.DAY_OF_MONTH).getTime());
	}

	public Pager findByMutiCondition(String username,String realname,Short auditStatus,String userType,Integer pageNo,Integer pageSize,String email, String mobile, Date[] createdt, Date[] logindt) {
		String hql = "from UsrUser as o where 1=1";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(auditStatus!=null && auditStatus!=-1){
			hql+=" and o.auditstatus=:auditStatus";
			paramMap.put("auditStatus", auditStatus);
		}
		if(userType!=null && !userType.equals("-1")){
			if(userType.split("-").length>1){
				String[] types=userType.split("-");
				hql+=" and o.type>=:userType1 and o.type<=:userType2";
				paramMap.put("userType1", Short.valueOf(types[0]));
				paramMap.put("userType2", Short.valueOf(types[1]));
			}else{
				hql+=" and o.type=:userType";
				paramMap.put("userType", Short.valueOf(userType));
			}
		}
		if(StringUtils.hasText(username)){
			hql+=" and o.username like :username";
			paramMap.put("username", "%"+username+"%");
		}
		if(StringUtils.hasText(realname)){
			hql+=" and o.realname like :realname";
			paramMap.put("realname", "%"+realname+"%");
		}
		if(StringUtils.hasText(mobile)){
			hql+=" and o.mobile =:mobile";
			paramMap.put("mobile", mobile);
		}
		if(StringUtils.hasText(email)){
			hql+=" and o.email =:email";
			paramMap.put("email", email);
		}
		if (createdt != null && createdt.length > 0){
			Date j0 = createdt[0];
			Date j1 = createdt[1];
			if (j0 != null && j1 != null) {
				hql = hql + " and date(o.createdt) >= :j0 and date(o.createdt) <= :j1";
				paramMap.put("j0", j0);
				paramMap.put("j1", j1);
			}
		}
		if(logindt != null && logindt.length>0){
			Date d1 = logindt[0];
			Date d2 = logindt[1];
			if (d1 != null && d2 != null) {
				hql+=" and exists (select u.id from UsrLoginhistory u where u.uid = o.id and date(u.logindt) >=:d1 and date(u.logindt) <=:d2)";
				paramMap.put("d1", d1);
				paramMap.put("d2", d2);
			}
		}
		return pagedQuery(hql,pageNo,pageSize,paramMap);
	}
}
