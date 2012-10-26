package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.zj198.dao.ClbRequestInfoDAO;
import com.zj198.model.ClbRequestInfo;
import com.zj198.util.Pager;

public class ClbRequestInfoDAOImpl extends HibernateDAO<ClbRequestInfo, Integer>  implements ClbRequestInfoDAO {

	public Pager findAll(int pageSize, int pageNo){
		//信息标识( 1 审核通过信息 9 未审核信息 10审核通过信息)
		String hql = "from ClbRequestInfo  where (rank=1 or rank=10) order by lastPostDate desc";
		Hashtable<String,Object> params = new Hashtable<String, Object>();
		return this.pagedQuery(hql, pageNo, pageSize, params);
	}
	
	public List<ClbRequestInfo> findLastRequestInfo(int num){
		String hql = "from ClbRequestInfo  where (rank=1 or rank=10) order by lastPostDate desc";
		return this.findTopRows(hql, num);
	}
	
	public Pager findByHomeQuery(int pageSize, int pageNo, String[] query){
		String hql = "from ClbRequestInfo where (rank=1 or rank=10) ";
		Hashtable<String,Object> params = new Hashtable<String, Object>();
		
		String q0 = query[2];
		String q1 = query[0];
		String q2 = query[1];
		String q3 = query[3];
		if (StringUtils.isNotBlank(q0)) {
			hql = hql + " and (area like :area or area like '%全国%')";
			params.put("area", "%"+q0+"%");
		}
		
		if (StringUtils.isNotBlank(q1)){
			hql = hql + " and  industry like :industry";
			params.put("industry", "%"+q1+"%");
		}
		
		if (StringUtils.isNotBlank(q2)){
			hql = hql + " and financeType like :financeType";
			params.put("financeType", "%"+q2+"%");
		}
		
		
		if (StringUtils.isNotBlank(q3)){
			hql = hql + " and title like :title";
			params.put("title", "%"+q3+"%");
		}
		
		
		hql = hql + " order by lastPostDate desc";
		return this.pagedQuery(hql, pageNo, pageSize, params);
		
	}
	
	public Pager findRequestInfoItemsByAdmin(ClbRequestInfo requestInfo, int pageSize, int pageNo) {
		String hql = "from ClbRequestInfo where 1=1";
		Hashtable<String,Object> params = new Hashtable<String, Object>();
		
		if (requestInfo.getRank() != null) {
			 int rank = requestInfo.getRank();
			 
			 if (rank == 1) {
				 hql = hql + " and rank in (1, 2, 3, 4, 5)";
			 } else {
				 hql = hql + " and rank = :rank";
				 params.put("rank", requestInfo.getRank());
			 }
		} else {
			hql = hql + " and rank = 0";
		}
		
		if (StringUtils.isNotBlank(requestInfo.getTitle())) {
			hql = hql + " and title like :title";
			params.put("title", "%"+requestInfo.getTitle()+"%");
		}
		
		if (StringUtils.isNotBlank(requestInfo.getArea())) {
			hql = hql + " and area like :area";
			params.put("area", "%"+requestInfo.getArea()+"%");
		}
		
		if (StringUtils.isNotBlank(requestInfo.getIndustry())){
			hql = hql + " and industry like :industry";
			params.put("industry", "%"+requestInfo.getIndustry()+"%");
		}
		
		if (StringUtils.isNotBlank(requestInfo.getFinanceType())) {
			hql = hql + " and financeType like :financeType";
			params.put("financeType", "%"+requestInfo.getFinanceType()+"%");
		}
		
		if (requestInfo.getLastPostDate() != null && requestInfo.getLastPostDate1() != null) {
			hql = hql + " and lastPostDate between :start and :end";
			params.put("start", requestInfo.getLastPostDate());
			params.put("end", requestInfo.getLastPostDate1());
		}
		
		if (requestInfo.getTotalMoney() != null) {
			hql = hql + " and totalMoney = :totalMoney";
			params.put("totalMoney", requestInfo.getTotalMoney());
		}
		
		hql = hql + " order by lastPostDate desc";
		return this.pagedQuery(hql, pageNo, pageSize, params);
	}

	@Override
	public Pager findClbRequestInfoListByUser(int userId,
			int pageSize, int pageNo) {
		String hql ="from ClbRequestInfo where userid = :userId order by lastPostDate desc";
		Hashtable<String,Object> params = new Hashtable<String, Object>();
		params.put("userId", userId);
		return this.pagedQuery(hql, pageNo, pageSize, params);
	}
	
	public List<ClbRequestInfo> findByIndustryOfTopN(String industry, int num){
		String hql = "from ClbRequestInfo where (rank = 1 or rank = 10) and industry = :industry order by lastPostDate desc";
		return this.findTopRows(hql, num, "industry", industry);
	}
	
	
}
