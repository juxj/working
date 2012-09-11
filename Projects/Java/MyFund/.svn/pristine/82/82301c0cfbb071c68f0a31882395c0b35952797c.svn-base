package com.zj198.dao.hibernate;
import java.util.List;

import com.zj198.dao.PrdFinanceInductyDAO;
import com.zj198.model.PrdFinanceInducty;
import com.zj198.model.vo.FinanceIndustryModel;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 14:54:57
 */
public class PrdFinanceInductyDAOImpl extends HibernateDAO<PrdFinanceInducty, Integer> implements PrdFinanceInductyDAO {
	public List<FinanceIndustryModel> findFiananceInducty(Integer financeId){
		String hql = "select new com.zj198.model.vo.FinanceIndustryModel(t.id,t.financeId,t.industryId,t.industryChildid,t1.name) from PrdFinanceInducty t, DicIndustry t1 where t.financeId=:financeId and (t.industryId=t1.id or t.industryChildid=t1.id)";
		return getQuery(hql,"financeId", financeId).list();
	}
	public PrdFinanceInducty findInducty(Integer financeId, Integer id){
		String hql = "from PrdFinanceInducty t where t.financeId=" + financeId + " and t.industryId=" + id;
		List<PrdFinanceInducty> list = this.list(hql);
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}
	public PrdFinanceInducty findInductyChild(Integer financeId, Integer childId){
		String hql = "from PrdFinanceInducty t where t.financeId=" + financeId + " and t.industryChildid=" + childId;
		List<PrdFinanceInducty> list = this.list(hql);
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}
}
