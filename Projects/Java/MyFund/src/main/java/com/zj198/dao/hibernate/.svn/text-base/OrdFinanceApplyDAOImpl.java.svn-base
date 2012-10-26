package com.zj198.dao.hibernate;
import java.util.Hashtable;
import java.util.List;

import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.dao.OrdFinanceApplyDAO;
import com.zj198.model.OrdFinanceApply;
import com.zj198.util.Pager;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:59
 */
public class OrdFinanceApplyDAOImpl extends HibernateDAO<OrdFinanceApply, Integer> implements OrdFinanceApplyDAO {
	public List<OrdFinanceApply> findUserApply(Integer userId){
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.zj198.model.OrdFinanceApply(t1.id,t1.applyNum,t1.applyType,t1.applyStatus,t1.createdt,t1.loanAmount,t1.loanMonth,t1.applyUserName,t2.financeName, t3.realname, t1.userId, t2.userId, t1.agreeNum) ")
			.append(" from OrdFinanceApply t1, PrdFinance t2, UsrUser t3 ")
			.append(" where t1.financeId=t2.id and t2.userId=t3.id and t1.userId=:user_id");
		hql.append(" order by t1.id desc");
		return list(hql.toString(),"user_id", userId);
	}
	
	public Pager findFinanceApply(FinanceApplySpModel spModel){
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.zj198.model.OrdFinanceApply(t1.id,t1.applyNum,t1.applyType,t1.applyStatus,t1.createdt,t1.loanAmount,t1.loanMonth,t1.applyUserName,t2.financeName, t1.userId, t2.userId, t1.agreeNum) ")
			.append(" from OrdFinanceApply t1, PrdFinance t2")
			.append(" where t1.financeId=t2.id ");
		
		if(spModel.getApplyAmountBig() != null){
			hql.append(" and t1.loanAmount <= :loanAmountbig");
			params.put("loanAmountbig", spModel.getApplyAmountBig());
		}
		if(spModel.getApplyAmountLittle() != null){
			hql.append(" and t1.loanAmount >= :loanAmountLittle");
			params.put("loanAmountLittle", spModel.getApplyAmountLittle());
		}
		if(spModel.getApplyEndDt() != null){
			hql.append(" and date(t1.createdt) <= :appenddt");
			params.put("appenddt", spModel.getApplyEndDt());
		}
		if(spModel.getApplyStartDt() != null){
			hql.append(" and date(t1.createdt) >= :appstartdt");
			params.put("appstartdt", spModel.getApplyStartDt());
		}
		if(spModel.getApplyNum() != null && !spModel.getApplyNum().trim().equals("")){
			hql.append(" and t1.applyNum = :applyNum");
			params.put("applyNum", spModel.getApplyNum());
		}
		if(spModel.getApplyStatus() != null){
			hql.append(" and t1.applyStatus = :applyStatus");
			params.put("applyStatus", spModel.getApplyStatus());
		}
		if(spModel.getApplyType()!= null){
			hql.append(" and t1.applyType = :applyType");
			params.put("applyType", spModel.getApplyType());
		}
		if(spModel.getEndMonth()!= null){
			hql.append(" and t1.loanMonth <= :loanMonthEnd");
			params.put("loanMonthEnd", spModel.getEndMonth());
		}
		if(spModel.getStartMonth()!= null){
			hql.append(" and t1.loanMonth >= :loanMonthstart");
			params.put("loanMonthstart", spModel.getStartMonth());
		}
		if(spModel.getProductName() != null && !spModel.getProductName().trim().equals("")){
			hql.append(" and t2.financeName like :financeName");
			params.put("financeName", "%" + spModel.getProductName() + "%");
		}
		if(spModel.getUserName() != null && !spModel.getUserName().trim().equals("")){
			hql.append(" and t1.applyUserName like :applyUserName");
			params.put("applyUserName", "%" + spModel.getUserName() + "%");
		}
		hql.append(" order by t1.id desc");
		
		return pagedQuery(hql.toString(),spModel.getPager().getCurrentPage(), spModel.getPager().getPageCount(),params);
	}
	public Pager orgFindFinanceApply(FinanceApplySpModel spModel){
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.zj198.model.OrdFinanceApply(t1.id,t1.applyNum,t1.applyType,t1.applyStatus,t1.createdt,t1.loanAmount,t1.loanMonth,t1.applyUserName,t2.financeName,t1.userId, t2.userId, t1.agreeNum) ")
			.append(" from OrdFinanceApply t1, PrdFinance t2")
			.append(" where t1.financeId=t2.id and t1.applyStatus in (306,307,308,309,310,312) ")
			.append(" and t2.userId=:user_id");
		params.put("user_id", spModel.getUserId());
		
		if(spModel.getApplyAmountBig() != null){
			hql.append(" and t1.loanAmount < :loanAmountbig");
			params.put("loanAmountbig", spModel.getApplyAmountBig());
		}
		if(spModel.getApplyAmountLittle() != null){
			hql.append(" and t1.loanAmount > :loanAmountLittle");
			params.put("loanAmountLittle", spModel.getApplyAmountLittle());
		}
		if(spModel.getApplyEndDt() != null){
			hql.append(" and date(t1.createdt) <= :appenddt");
			params.put("appenddt", spModel.getApplyEndDt());
		}
		if(spModel.getApplyStartDt() != null){
			hql.append(" and date(t1.createdt) >= :appstartdt");
			params.put("appstartdt", spModel.getApplyStartDt());
		}
		if(spModel.getApplyNum() != null && !spModel.getApplyNum().trim().equals("")){
			hql.append(" and t1.applyNum = :applyNum");
			params.put("applyNum", spModel.getApplyNum());
		}
		if(spModel.getApplyStatus() != null){
			hql.append(" and t1.applyStatus = :applyStatus");
			params.put("applyStatus", spModel.getApplyStatus());
		}
		if(spModel.getApplyType()!= null){
			hql.append(" and t1.applyType = :applyType");
			params.put("applyType", spModel.getApplyType());
		}
		if(spModel.getEndMonth()!= null){
			hql.append(" and t1.loanMonth <= :loanMonthEnd");
			params.put("loanMonthEnd", spModel.getEndMonth());
		}
		if(spModel.getStartMonth()!= null){
			hql.append(" and t1.loanMonth >= :loanMonthstart");
			params.put("loanMonthstart", spModel.getStartMonth());
		}
		if(spModel.getProductName() != null && !spModel.getProductName().trim().equals("")){
			hql.append(" and t2.financeName like :financeName");
			params.put("financeName",  "%" + spModel.getProductName() + "%");
		}
		if(spModel.getUserName() != null && !spModel.getUserName().trim().equals("")){
			hql.append(" and t1.applyUserName like :applyUserName");
			params.put("applyUserName", "%" + spModel.getUserName() + "%");
		}
		hql.append(" order by t1.id desc");
		return pagedQuery(hql.toString(),spModel.getPager().getCurrentPage(), spModel.getPager().getPageCount(),params);
	}

	@Override
	public OrdFinanceApply findById(Integer id) {
		return super.get(id);
	}
	
	public List<OrdFinanceApply> findApplyByUserId(Integer userId, Integer number){
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.zj198.model.OrdFinanceApply(t1.id,t1.applyNum,t1.applyType,t1.applyStatus,t1.createdt,t1.loanAmount,t1.loanMonth,t1.applyUserName,t2.financeName, t3.realname, t1.userId, t2.userId, t1.agreeNum) ")
			.append(" from OrdFinanceApply t1, PrdFinance t2, UsrUser t3 ")
			.append(" where t1.financeId=t2.id and t2.userId=t3.id and t1.userId=:user_id");
		hql.append(" order by t1.id desc limit 0, " + number);
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("user_id", userId);
		List<Object> obj = pagedQuery(hql.toString(),1,3,params).getData();
		List<OrdFinanceApply> list = new java.util.ArrayList<OrdFinanceApply>();
		for(Object o:obj){
			list.add((OrdFinanceApply)o);
		}
		return list;
//		org.hibernate.Query query = this.getSession().createQuery(hql.toString());
//		query.setParameter("user_id", userId);
//		return query.list();
//		return list(hql.toString(),"user_id", userId);
	}
	public List<OrdFinanceApply> findApplyByOrg(Integer userId, Integer number){
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.zj198.model.OrdFinanceApply(t1.id,t1.applyNum,t1.applyType,t1.applyStatus,t1.createdt,t1.loanAmount,t1.loanMonth,t1.applyUserName,t2.financeName, t3.realname, t1.userId, t2.userId, t1.agreeNum) ")
			.append(" from OrdFinanceApply t1, PrdFinance t2, UsrUser t3 ")
			.append(" where t1.financeId=t2.id and t1.applyStatus in (306,307,308,309,310)")
			.append(" and t2.userId=t3.id and t2.userId=:user_id");
		hql.append(" order by t1.id desc limit 0, " + number);
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("user_id", userId);
		List<Object> obj = pagedQuery(hql.toString(),1,3,params).getData();
		List<OrdFinanceApply> list = new java.util.ArrayList<OrdFinanceApply>();
		for(Object o:obj){
			list.add((OrdFinanceApply)o);
		}
		return list;
	}
}
