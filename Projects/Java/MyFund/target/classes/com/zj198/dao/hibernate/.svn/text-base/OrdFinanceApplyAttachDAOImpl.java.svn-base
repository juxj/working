package com.zj198.dao.hibernate;
import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.OrdFinanceApplyAttachDAO;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.vo.FinanceApplyAttachModel;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:59
 */
public class OrdFinanceApplyAttachDAOImpl extends HibernateDAO<OrdFinanceApplyAttach, Integer> implements OrdFinanceApplyAttachDAO {
	/**
	 *
	 * @param applyId
	 * @return
	 * 
	 */
	public List<FinanceApplyAttachModel> findApplyAttach(Integer applyId){
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.zj198.model.vo.FinanceApplyAttachModel(t.id,t1.dataName, t1.dataSupply, t1.otherMemo, t1.needNum, t1.haveMemo, ")
			.append(" t.applyId,t.datalistId,t.financeDataId,t.oldFileName,t.fileName,t.uploadPath,")
			.append("t.createUserId,t.uploadStatus,t.checkStatus,t.attachType,t.supplyName,t.supplyMemo,t.supplyWay)")
			.append(" from OrdFinanceApplyAttach t, PrdFinanceDatafile t1 ")
			.append(" where t.financeDataId = t1.id and t.applyId = :apply_id");
		return getQuery(hql.toString(),"apply_id", applyId).list();
	}
	
	public List<FinanceApplyAttachModel> findApplyAttachSupply(Integer applyId){
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.zj198.model.vo.FinanceApplyAttachModel(t.id, ")
			.append(" t.applyId,t.datalistId,t.financeDataId,t.oldFileName,t.fileName,t.uploadPath,")
			.append("t.createUserId,t.uploadStatus,t.checkStatus,t.attachType,t.supplyName,t.supplyMemo,t.supplyWay)")
			.append(" from OrdFinanceApplyAttach t")
			.append(" where t.attachType=1 and t.applyId = :apply_id");
		return getQuery(hql.toString(),"apply_id", applyId).list();
	}
}
