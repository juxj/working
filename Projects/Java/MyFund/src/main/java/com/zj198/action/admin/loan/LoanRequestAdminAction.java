package com.zj198.action.admin.loan;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.model.AdmUser;
import com.zj198.model.PrdFinance;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.OrdLrRecommend;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.loan.OrdLrRecommendService;
import com.zj198.util.Pager;

public class LoanRequestAdminAction extends BaseAction {

	private LoanRequestService loanRequestService;
	private FinanceProductService financeProductService;
	// 分页相关数据
	private FindFinanceAdminSpModel spModel = new FindFinanceAdminSpModel();
	// 获取一条融资需求的ID
	private Integer requestId;
	private OrdLoanRequest loan;
	// 修改状态值
	private String applyStatus;
	// 管理员推荐产品的 需求ID,需求类型,贷款机构,期限,金额,推荐产品集合
	private Integer appId;
	private String orgId;
	private Long loanAmount;
	private Integer loanMonth;
	private List<PrdFinance> recommendProducts;

	// 已经被选择的产品ID
	private String[] checkId;

	// 产品推荐service
	private OrdLrRecommendService ordLrRecommendService;

	@Override
	public String execute() throws Exception {
		return null;
	}

	/**
	 * 获取所有的融资需求
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 下午4:23:16
	 * @return
	 */
	public String getRequests() {
		spModel.setPager(this.getPagerObj());
		pager = loanRequestService.getAdminRequest(spModel);
		return "adminRequests";
	}
	private Pager getPagerObj(){
		if(pager==null){
			pager = new Pager();
			pager.setPageCount(10);
			pager.setCurrentPage(1);
		}
		return pager;
	}
	/**
	 * 根据ID获取某一条融资需求的详细信息
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 下午4:25:03
	 * @return
	 */
	public String getRequest() {
		loan = loanRequestService.getOrdDetailById(requestId);
		if(loan.getApplyType().intValue() == 136){//企业经营快速申请
			return "busi_request_view";
		}else{			
			return "adminRequest";
		}
	}

	/**
	 * 管理员修改状态
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-20| 上午11:20:23
	 * @return
	 */
	public String updateStatus() {
		loanRequestService.updateLoan(loan);
		loan = loanRequestService.getOrdDetailById(loan.getId());
		if(loan.getApplyType().intValue() == 136){//企业经营快速申请
			return "busi_request_view";
		}else{			
			return "adminRequest";
		}
	}

	/**
	 * 管理员推荐产品
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-20| 上午11:21:02
	 * @return
	 */
	public String recommendProduct() {
		Integer financeType = -1;
		// 由于需求申请类型和产品贷款类型没有做关系映射, 只能将其写成swich(个人综合消费申请137=个人综合消费贷款152)
		switch (appId) {
		case 136:
			financeType = 151;
			break;
		case 137:
			financeType = 152;
			break;
		case 138:
			financeType = 153;
			break;
		case 139:
			financeType = 154;
			break;
		}
		recommendProducts = financeProductService.recomPro(financeType, loanAmount, loanMonth, orgId);
		// 该需求已经被选择过的产品ID集合
		List<Integer> selectIds = ordLrRecommendService.getByRequestId(requestId, 1);
		// 循环所有的推荐产品与已经选择过的产品比对,如果已被选择 就标示为 选中isRecommend(1)
		if (selectIds != null && selectIds.size() > 0) {
			for (PrdFinance o : recommendProducts) {
				for (Integer id : selectIds) {
					if (id == o.getId()) {
						o.setIsRecommend(1);
						break;
					}
				}
			}
		}
		return "recommendProduct";
	}

	/**
	 * 管理员：选择最多三条推荐产品
	 * 
	 * @author: zeroleavebaoyang@gmail.com
	 * @since: 2012-7-18 | 14:34:13
	 * @return
	 */
	public String selectRecProdcutAdmin() {
		if (checkId != null && checkId.length > 0) {
			int[] intTemp = new int[checkId.length];
			for (int i = 0; i < checkId.length; i++) {
				intTemp[i] = Integer.parseInt(checkId[i]);
			}
			ActionContext context = ActionContext.getContext();
			AdmUser user = (AdmUser) context.getSession().get("_admin");
			List<OrdLrRecommend> list = new ArrayList<OrdLrRecommend>();
			for (int i = 0; i < intTemp.length; i++) {
				OrdLrRecommend o = new OrdLrRecommend();
				o.setFinanceId(intTemp[i]);
				o.setRequestId(requestId);
				o.setCreatedt(new Date());
				o.setRecommendType(1);
				o.setCreateUserId(user.getId());
				list.add(o);
			}
			ordLrRecommendService.saveSelRecProByAdmin(requestId, list);
		}
		return null;
	}

	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
	}

	public FindFinanceAdminSpModel getSpModel() {
		return spModel;
	}

	public void setSpModel(FindFinanceAdminSpModel spModel) {
		this.spModel = spModel;
	}

	public Integer getRequestId() {
		return requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public OrdLoanRequest getLoan() {
		return loan;
	}

	public void setLoan(OrdLoanRequest loan) {
		this.loan = loan;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public Integer getAppId() {
		return appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public List<PrdFinance> getRecommendProducts() {
		return recommendProducts;
	}

	public void setRecommendProducts(List<PrdFinance> recommendProducts) {
		this.recommendProducts = recommendProducts;
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	public void setOrdLrRecommendService(OrdLrRecommendService ordLrRecommendService) {
		this.ordLrRecommendService = ordLrRecommendService;
	}

	public void setCheckId(String checkId) {

		this.checkId = checkId.split(",");

	}

	public Long getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(Long loanAmount) {
		this.loanAmount = loanAmount;
	}

	public Integer getLoanMonth() {
		return loanMonth;
	}

	public void setLoanMonth(Integer loanMonth) {
		this.loanMonth = loanMonth;
	}

}
