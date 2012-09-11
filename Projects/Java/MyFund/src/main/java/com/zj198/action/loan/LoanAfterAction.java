package com.zj198.action.loan;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.OrdFaLoanData;
import com.zj198.model.OrdFinanceAppLoan;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.OrdFinanceAppLoanService;
import com.zj198.util.StringUtil;

/**
 * @description: 贷后管理
 * @author zeroleavebaoyang@gmail.com
 * @time 2012-7-17| 下午2:53:31
 */
public class LoanAfterAction extends BaseAction {

	private OrdFinanceAppLoanService ordFinanceAppLoanService;
	private FinanceApplyService financeApplyService;
	// 申请ID
	private Integer appId;
	private OrdFinanceAppLoan appLoan;
	private Integer id;
	private Integer groupType;

	// 初始化分页参数
	private Integer currentPage = 1;
	private Integer pageCount = 5;
	private List<OrdFinanceAppLoan> appLoanList;
	private OrdFaLoanData loanData;
	private List<OrdFaLoanData> loanDataList;
	private Integer[] supplyWay;
	private Integer viewAttachType;
	@Override
	public String execute() throws Exception {
		return null;
	}

	public String loanAfterAddUI() {
		return "loanAfterAddUI";
	}

	/**
	 * 根据申请ID 查看该申请的放款信息
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-23| 下午2:14:13
	 * @return
	 */
	public String loanAfterDetail() {
		appLoan = ordFinanceAppLoanService.findByAppId(id);
		return "loanAfterDetail";
	}

	/**
	 * 修改放款详情
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-25| 下午1:15:19
	 * @return
	 */
	public String loanAfterAdd() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		OrdFinanceApply ofa = financeApplyService.findById(appId);
		appLoan.setApplyId(appId);
		appLoan.setProductId(ofa.getFinanceId());
		appLoan.setOrgId(user.getId());
		appLoan.setCreateDt(new Date());
		ordFinanceAppLoanService.save(appLoan);

		return "loanAfterAdd";
	}

	/**
	 * 贷后管理列表
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-25| 下午1:13:58
	 * @return
	 */
	public String loanAfterList() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		groupType = user.getUserTypeGroup().intValue();
		if (user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3) {
			pager = ordFinanceAppLoanService.getList(user.getId(), currentPage, pageCount);
			return "loanAfterList";
		}else{
			appLoanList = ordFinanceAppLoanService.findAppLoan(user.getId());
			return "userAppLoan";
		}
	}
	
	public String needAttach(){
		loanData.setSupplyWay(StringUtil.getStrByArray(supplyWay));
		ordFinanceAppLoanService.saveLoanAttach(loanData);
		msg = "补充材料已添加！";
		return loanAfterList();
	}
	
	public String updateStatus(){
		ordFinanceAppLoanService.updateAppLoanStatus(appLoan);
		msg = "补充完成";
		return loanAfterList();
	}

	public String loanAfterSearch() {

		return "loanAfterDetail";
	}

	public OrdFinanceAppLoan getAppLoan() {
		return appLoan;
	}

	public void setAppLoan(OrdFinanceAppLoan appLoan) {
		this.appLoan = appLoan;
	}


	public Integer getAppId() {
		return appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}

	public void setOrdFinanceAppLoanService(OrdFinanceAppLoanService ordFinanceAppLoanService) {
		this.ordFinanceAppLoanService = ordFinanceAppLoanService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public List<OrdFinanceAppLoan> getAppLoanList() {
		return appLoanList;
	}

	public void setAppLoanList(List<OrdFinanceAppLoan> appLoanList) {
		this.appLoanList = appLoanList;
	}

	public OrdFaLoanData getLoanData() {
		return loanData;
	}

	public void setLoanData(OrdFaLoanData loanData) {
		this.loanData = loanData;
	}

	public Integer[] getSupplyWay() {
		return supplyWay;
	}

	public void setSupplyWay(Integer[] supplyWay) {
		this.supplyWay = supplyWay;
	}

	public List<OrdFaLoanData> getLoanDataList() {
		return loanDataList;
	}

	public void setLoanDataList(List<OrdFaLoanData> loanDataList) {
		this.loanDataList = loanDataList;
	}

	public Integer getViewAttachType() {
		return viewAttachType;
	}

	public void setViewAttachType(Integer viewAttachType) {
		this.viewAttachType = viewAttachType;
	}

	public Integer getGroupType() {
		return groupType;
	}

	public void setGroupType(Integer groupType) {
		this.groupType = groupType;
	}

}
