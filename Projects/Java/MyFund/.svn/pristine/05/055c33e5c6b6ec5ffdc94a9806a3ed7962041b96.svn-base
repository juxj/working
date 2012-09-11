package com.zj198.service.loan;

import java.util.List;

import com.zj198.action.loan.model.AppLoanAttachSpModel;
import com.zj198.model.OrdFaLoanData;
import com.zj198.model.OrdFaLoanUpload;
import com.zj198.model.OrdFinanceAppLoan;
import com.zj198.util.Pager;

public interface OrdFinanceAppLoanService {

	/**
	 * 根据申请ID,查看放款详情
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-23| 下午2:35:06
	 * @param appId
	 * @return
	 */
	public OrdFinanceAppLoan findByAppId(Integer appId);
	
	/**
	 * 添加放款记录
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-25| 下午2:21:23
	 * @param o
	 */
	public void save(OrdFinanceAppLoan o);

	/**
	 * 贷后管理分页显示
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-25| 下午2:29:47
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Pager getList(Integer userId, Integer page, Integer pageSize);
	
	public List<OrdFinanceAppLoan> findAppLoan(Integer userId);
	public void saveLoanAttach(OrdFaLoanData d);
	public List<OrdFaLoanData> findFaLoanData(Integer appLoanId);
	public void saveUploadAttach(AppLoanAttachSpModel spModel);
	public OrdFaLoanData getLoanData(Integer dataId);
	public List<OrdFaLoanUpload> findLoanUpload(Integer dataId);
	public OrdFaLoanUpload getOrdFaLoanUpload(Integer id);
	public void updateLoanData(OrdFaLoanData ld);
	public void updateAppLoanStatus(OrdFinanceAppLoan o);
}
