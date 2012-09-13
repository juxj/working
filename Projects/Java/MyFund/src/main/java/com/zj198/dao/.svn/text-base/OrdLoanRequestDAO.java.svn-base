package com.zj198.dao;

import java.util.List;

import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.action.loan.model.RequestSearch;
import com.zj198.model.OrdLoanRequest;
import com.zj198.util.Pager;

/**
 * @author paul Description: CreateAuthor:paul CreateDate:2012-6-26 14:34:04
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public interface OrdLoanRequestDAO extends BaseDAO<OrdLoanRequest, Integer>{

    public List<OrdLoanRequest> getByUserId(Integer userId);

	public Pager getPagationList(int userId, int pageNo, int pageSize);

	public Pager findReqByCon(Integer currentPage, Integer pageCount, RequestSearch rq, Integer type);

	public Pager getAdminRequest(FindFinanceAdminSpModel spModel);
	
	public List<OrdLoanRequest> getTopThree(int userid);
	
	public List<OrdLoanRequest> getTopThrees(int userType);

}
