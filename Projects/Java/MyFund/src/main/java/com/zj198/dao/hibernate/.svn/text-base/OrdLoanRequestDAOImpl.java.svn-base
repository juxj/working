package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.action.loan.model.RequestSearch;
import com.zj198.dao.OrdLoanRequestDAO;
import com.zj198.model.OrdLoanRequest;
import com.zj198.util.Pager;

/**
 * @author paul Description: CreateAuthor:paul CreateDate:2012-6-26 14:34:04
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public class OrdLoanRequestDAOImpl extends HibernateDAO<OrdLoanRequest, Integer> implements OrdLoanRequestDAO {

	public List<OrdLoanRequest> getByUserId(Integer userId) {
		String hql = "from OrdLoanRequest as m where m.userId =:userId order by m.id desc";
		return list(hql, "userId", userId);
	}

	public Pager getPagationList(int userId, int pageNo, int pageSize) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("userId", userId);
		String hql = "from OrdLoanRequest as m where m.userId =:userId order by m.id desc";
		return pagedQuery(hql, pageNo, pageSize, params);
	}

	public Pager findReqByCon(Integer currentPage, Integer pageCount, RequestSearch rq, Integer type) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		// 银行只能看到 融资需求的组织机构选择过自己的数据
		String hql = "from OrdLoanRequest as o where o.applyStatus = 145 and o.loanOrganization like :userType";
		params.put("userType", "%," + type + ",%");
		if (rq != null) {
			// 需求编号
			if (rq.getApplyNum() != null && !"".equals(rq.getApplyNum())) {
				hql = hql + " and o.applyNum = :applyNum";
				params.put("applyNum", rq.getApplyNum());
			}
			// 需求方名称
			if (StringUtils.isNotBlank(rq.getBusiName())) {
				hql = hql + " and o.busiName = :busiName";
				params.put("busiName", rq.getBusiName());
			}
			// 贷款用途
			if (StringUtils.isNotBlank(rq.getLoanPurpose())) {
				hql = hql + " and o.loanPurpose = :loanPurpose";
				params.put("loanPurpose", rq.getLoanPurpose());
			}
			// 贷款类型
			if (StringUtils.isNotBlank(rq.getCompanyType())) {
				hql = hql + " and o.applyType = :applyType";
				params.put("applyType", Integer.parseInt(rq.getCompanyType()));
			}
			// 发布时间
			if (rq.getCreatedtFirst() != null && rq.getCreatedtSecond() != null) {
				hql = hql + " and date(o.createdt) >= :createdtF and date(o.createdt) <= :createdtS";
				params.put("createdtF", rq.getCreatedtFirst());
				params.put("createdtS", rq.getCreatedtSecond());
			}
			// 需求金额
			if (rq.getLoanAmountOne() != null && rq.getLoanAmountTwo() != null) {
				hql = hql + " and o.loanAmount >= :loanAmountF and o.loanAmount <= :loanAmountS";
				params.put("loanAmountF", rq.getLoanAmountOne());
				params.put("loanAmountS", rq.getLoanAmountTwo());
			}
			// 贷款期限
			if (rq.getLoanMonthOne() != null && rq.getLoanMonthTwo() != null) {
				hql = hql + " and o.loanMonth >= :loanMonthF and o.loanMonth <= :loanMonthS";
				params.put("loanMonthF", rq.getLoanMonthOne());
				params.put("loanMonthS", rq.getLoanMonthTwo());
			}
		}
		hql = hql + " order by o.id desc";
		return super.pagedQuery(hql, currentPage, pageCount, params);
	}

	public Pager getAdminRequest(FindFinanceAdminSpModel spModel) {
		// String hql = "from OrdLoanRequest t order by t.id desc";
		StringBuffer hql = new StringBuffer();
		hql.append("from OrdLoanRequest t where t.isdeleted=0 ");
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		if (spModel.getFinanceType() != null && spModel.getFinanceType() >= 0) {
			hql.append(" and t.applyType = :applyType");
			params.put("applyType", spModel.getFinanceType());
		}
		if (spModel.getStatus() != null && spModel.getStatus() >= 0) {
			hql.append(" and t.applyStatus = :applyStatus");
			params.put("applyStatus", spModel.getStatus());
		}
		if (spModel.getStartDt() != null) {
			hql.append(" and date(t.createdt) >= :startdt");
			params.put("startdt", spModel.getStartDt());
		}
		if (spModel.getEndDt() != null) {
			hql.append(" and date(t.createdt) <= :enddt");
			params.put("enddt", spModel.getEndDt());
		}
		hql.append(" order by t.id desc");

		return pagedQuery(hql.toString(), spModel.getPager().getCurrentPage(), spModel.getPager().getPageCount(), params);
	}

	public List<OrdLoanRequest> getTopThree(int userId) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("userId", userId);
		return findTopRows("from OrdLoanRequest t where t.isdeleted=0 and t.userId = :userId", 3, params);
	}

	public List<OrdLoanRequest> getTopThrees(int userType) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("userType", "%," + userType + ",%");
		return findTopRows("from OrdLoanRequest t where t.isdeleted=0 and t.applyStatus = 145 and t.loanOrganization like :userType", 3, params);
	}
}
