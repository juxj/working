package com.zj198.service.loan;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.action.loan.model.RequestSearch;
import com.zj198.model.OrdLoanRequest;
import com.zj198.util.Pager;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-6-20 10:07:45
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public interface LoanRequestService {

	/**
	 * 统计银行的数量
	 * @return
	 */
	public Long countBankNum();
	/**
	 * 统计各贷款机构的数量
	 * @param type
	 * @return
	 */
	public Long countUserByType(Short type);
	
	/**
	 * 快速申请保存
	 * @param loan
	 * @param loanObjects
	 * @param minBound
	 * @param maxBound
	 * @return
	 */
	public String saveLoanRequest(OrdLoanRequest loan, String[] loanObjects, Integer minBound, Integer maxBound);
	/**
	 * 根据贷款时间获取基准利率
	 * @param month
	 * @return
	 */
	public Double getBaseRate(Integer month);
	

    /**
     * 分页显示融资需求列表
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description
     * @param url
     * @param userId
     * @param pageSize
     * @param pageNo
     * @return
     */
	public Pager getPagationList(int userId, int pageNo, int pageSize);

    /**
     * 分页显示融资需求列表
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description
     * @param obj
     * @param pageSize
     * @param pageNo
     * @return
     */
	public Pager findReqByCon(int pageSize, int pageNo, RequestSearch qr, Integer type);

    /**
     * 根据ID查看Ord详情
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description
     * @return
     */
    public OrdLoanRequest getOrdDetailById(int id);


	/**
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 下午3:19:13
	 * @param pageNo
	 * @param pageSize
	 * @param wherejpql
	 * @param queryParams
	 * @param orderby
	 * @return
	 */
	public Map<String, Object> getScrollData(int pageNo, int pageSize, String wherejpql, Object[] queryParams, LinkedHashMap<String, String> orderby);

	/**
	 * 只分页,不要求条件查询
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 下午3:21:02
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pager getAdminRequest(FindFinanceAdminSpModel spModel);

	/**
	 * 修改需求的状态
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-20| 上午9:54:37
	 * @param olr
	 */
	public void updateLoan(OrdLoanRequest olr);

	/**
	 * 企业或者个人登录进入用户中心,显示前三条快速申请数据
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-20| 上午9:54:37
	 */
	public List<OrdLoanRequest> getTopThree(int userId);
	
	/**
	 * 金融机构登录进入用户中心,显示前三条快速申请数据
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-20| 上午9:54:37
	 */
	public List<OrdLoanRequest> getTopThree(); 
}
