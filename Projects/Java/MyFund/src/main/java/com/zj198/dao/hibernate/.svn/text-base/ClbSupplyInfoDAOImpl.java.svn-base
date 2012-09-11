package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.zj198.dao.ClbSupplyInfoDAO;
import com.zj198.model.ClbSupplyInfo;
import com.zj198.util.Pager;
import com.zj198.util.StringUtil;

public class ClbSupplyInfoDAOImpl extends HibernateDAO<ClbSupplyInfo, Integer> implements ClbSupplyInfoDAO{

	public Pager findAll(int pageSize, int pageNo) {
		String hql = "from ClbSupplyInfo  where (rank=1 or rank=10)   order by lastPostDate desc";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		return super.pagedQuery(hql, pageNo, pageSize, params);
	}
	
	public List<ClbSupplyInfo> findLastSupplyInfo(int num) {
		String hql = "from ClbSupplyInfo where (rank=1 or rank=10) order by id desc";
		return super.findTopRows(hql, num);
	}
	
	
	public Pager findByAdmin(ClbSupplyInfo supplyInfo,  int pageSize, int pageNo) {
		
		String hql = "from ClbSupplyInfo where 1=1";
		Hashtable<String,Object> params = new Hashtable<String, Object>();
		
		if (StringUtils.isNotBlank(supplyInfo.getTitle())) {
			hql = hql + " and title like :title";
			params.put("title", "%"+supplyInfo.getTitle()+"%");
		}
		
		if (StringUtils.isNotBlank(supplyInfo.getWorkTranche())) {
			hql = hql + " and workTranche = :workTranche";
			params.put("workTranche", supplyInfo.getWorkTranche());
		}
		
		if (StringUtils.isNotBlank(supplyInfo.getWorkRange())) {
			hql = hql + " and workRange like :workRange";
			params.put("workRange", "%"+supplyInfo.getWorkRange()+"%");
		}
		
		if (StringUtils.isNotBlank(supplyInfo.getWorkArea())) {
			hql = hql + " and workArea like :workArea";
			params.put("workArea", "%"+supplyInfo.getWorkArea()+"%");
		}
		
		if (StringUtils.isNotBlank(supplyInfo.getWorkTrade())) {
			hql = hql + " and workTrade like :workTrade";
			params.put("workTrade", "%"+supplyInfo.getWorkTrade()+"%");
		}
		
		if (StringUtils.isNotBlank(supplyInfo.getRank())) {
			String rank = supplyInfo.getRank();
			
			if (rank.equalsIgnoreCase("0")) {
				hql = hql + " and ( rank in ('0', '9') or rank is null) ";
			}
			
			if (rank.equalsIgnoreCase("1")) {
				hql = hql + " and rank in ('1', '10')";
			}
			
			if (rank.equalsIgnoreCase("-1")) {
				hql = hql + " and rank = '-1'";
			}
		} else {
			hql = hql + " and rank in ('-1', '0', '9')";
		}
		
		
		if (supplyInfo.getLastPostDate() != null && supplyInfo.getLastPostDateBak() != null) {
			hql = hql + " and lastPostDate between :start and :end";
			params.put("start", supplyInfo.getLastPostDate());
			params.put("end", supplyInfo.getLastPostDateBak());
		}
		
		hql = hql + " order by lastPostDate desc";
		return this.pagedQuery(hql, pageNo, pageSize, params);
	}

	@Override
	public Pager findClbSupplyInfoListByUser(int userId, int pageSize, int pageNo) {
		String hql = "from ClbSupplyInfo where userid = :userId order by lastPostDate desc";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("userId", userId);
		return super.pagedQuery(hql, pageNo, pageSize, params);
	}


	@Override
	public Pager findClbSupplyInfoList(int pageSize, int pageNo, String[] query) {
		String hql = "from ClbSupplyInfo where (rank=1 or rank=10)";
		Hashtable<String, Object> params = new Hashtable<String, Object>();

		String q0 = query[0];
		String q1 = query[1];
		String q2 = query[2];
		String q3 = query[3];
		//Modify by zeroleavebaoyang@gmail.com(搜索某一地区要同时将='全国'的也显示出来)
		if (!StringUtil.isNullOrBlank(q0)) {
			hql = hql + " and (workArea like :area or workArea like :j)";
			params.put("area", "%"+q0+"%");
			params.put("j", "%全国%");
		}
		
		if (!StringUtil.isNullOrBlank(q1)) {
			hql = hql + " and workTrade like :industry";
			params.put("industry", "%"+q1+"%");
		}
		
		if (!StringUtil.isNullOrBlank(q2)) {
			hql = hql + " and workRange like :range";
			params.put("range", "%"+q2+"%");
		}
		
		if (!StringUtil.isNullOrBlank(q3)) {
			hql = hql + " and title like :title";
			params.put("title", "%"+q3+"%");
		}
		
		return super.pagedQuery(hql, pageNo, pageSize, params);
	}
	
	
}
