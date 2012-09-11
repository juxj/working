package com.zj198.dao.hibernate;
import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.PrdFinanceAreaDAO;
import com.zj198.model.PrdFinanceArea;
import com.zj198.model.vo.FinanceAreaModel;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 14:54:57
 */
public class PrdFinanceAreaDAOImpl extends HibernateDAO<PrdFinanceArea, Integer> implements PrdFinanceAreaDAO {
	public List<FinanceAreaModel> findFiananceArea(Integer financeId){
		String hql = "select new com.zj198.model.vo.FinanceAreaModel(t.id,t.financeId,t.provinceId,t.cityId,t1.name) from PrdFinanceArea t, DicProvince t1 where t.financeId=:financeId and t.provinceId=t1.id";
		List<FinanceAreaModel> result = getQuery(hql,"financeId", financeId).list();
		
		String cityhql = "select new com.zj198.model.vo.FinanceAreaModel(t.id,t.financeId,t.provinceId,t.cityId,t1.name) from PrdFinanceArea t, DicCity t1 where t.financeId=:financeId and t.cityId=t1.id";
		List<FinanceAreaModel> cityresult = getQuery(cityhql,"financeId", financeId).list();
		if(cityresult != null && cityresult.size() > 0){			
			result.addAll(cityresult);
		}
		return result;
	}
	public PrdFinanceArea findProvince(Integer financeId, Integer proid){
		String hql = "from PrdFinanceArea t where t.financeId=" + financeId + " and t.provinceId=" + proid;
		List<PrdFinanceArea> list = this.list(hql);
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}
	public PrdFinanceArea findCity(Integer financeId, Integer cityid){
		String hql = "from PrdFinanceArea t where t.financeId=" + financeId + " and t.cityId=" + cityid;
		List<PrdFinanceArea> list = this.list(hql);
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}
	public PrdFinanceArea findByPid(Integer financeId) {
		String hql = "from PrdFinanceArea t where t.financeId=:financeId";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("financeId", financeId);
		List<PrdFinanceArea> list = this.list(hql, params);
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}
}
