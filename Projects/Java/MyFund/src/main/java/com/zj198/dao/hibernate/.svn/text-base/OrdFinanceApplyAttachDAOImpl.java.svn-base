package com.zj198.dao.hibernate;
import java.util.List;

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
			.append(" where t.financeDataId = t1.id and t.applyId = :apply_id and t.isdeleted = 0");
		return getQuery(hql.toString(),"apply_id", applyId).list();
	}
	
	public List<FinanceApplyAttachModel> findApplyAttachSupply(Integer applyId){
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.zj198.model.vo.FinanceApplyAttachModel(t.id, ")
			.append(" t.applyId,t.datalistId,t.financeDataId,t.oldFileName,t.fileName,t.uploadPath,")
			.append("t.createUserId,t.uploadStatus,t.checkStatus,t.attachType,t.supplyName,t.supplyMemo,t.supplyWay)")
			.append(" from OrdFinanceApplyAttach t")
			.append(" where t.isdeleted = 0 and t.attachType=1 and t.applyId = :apply_id");
		return getQuery(hql.toString(),"apply_id", applyId).list();
	}

	/**
	 * 点击取消，将会更改申贷材料的删除状态=0
	 */
	public void deleteAttach(Integer[] ids) {
		if (ids != null && ids.length > 0) {
			for (int j = 0; j < ids.length; j++) {
				OrdFinanceApplyAttach f = this.get(ids[j]);
				f.setIsdeleted(1);
				update(f);
			}
		}
	}
	
	
}
