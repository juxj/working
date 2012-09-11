package com.zj198.action.loan;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.RequestSearch;
import com.zj198.model.DicCommon;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.user.AccountService;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-6-20 10:07:45
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public class UserLoanRequestAction extends BaseAction {
	private DictoryDataService dictoryDataService;
	private LoanRequestService loanRequestService;
	private AccountService accountService;
	private Integer industryId;
	private OrdLoanRequest loan;
	private List<OrdLoanRequest> topThree;
	private Integer groupType;
	private RequestSearch requestSearch;
	private Integer typeId;
	private List<DicCommon> purposeTypeList;

	public String execute() {
		return null;
	}

	

	public String loanRequestHome(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3) {// 银行或其它贷款机构
			topThree = loanRequestService.getTopThree();
		}else{
			topThree = loanRequestService.getTopThree(user.getId());
		}
		return "loanRequestHome";
	}
	
	public String loanPurposeByTypeId() {
		if (typeId > 0) {
			purposeTypeList = dictoryDataService.findCommonDataByGroupId(typeId);
		}
		return "purposes";
	}

	/**
	 * 
	 * @Author zeroleavebaoyang@gmail.com
	 * @Description 融资需求管理
	 * @return
	 */
	public String loanManage() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			return "index";
		}
		groupType = user.getUserTypeGroup().intValue();
		if (groupType == 2 || groupType == 3) {// 银行或贷款机构
			// 银行只能查看到 个人用户选择了银行贷款机构的信息
			pager = loanRequestService.findReqByCon(pager == null ? 1 : pager.getCurrentPage(), pager == null ? 5 : pager.getPageCount(), requestSearch, user.getType().intValue());
		} else {
			// 个人用户只能看到自己的融资需求
			pager = this.loanRequestService.getPagationList(user.getId(), pager == null ? 1 : pager.getCurrentPage(), pager == null ? 5 : pager.getPageCount());
		}
		return "loanManage";
	}

	public String loanManageDetail() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			return "index";
		}
		groupType = user.getUserTypeGroup().intValue();
		this.loan = loanRequestService.getOrdDetailById(industryId);
		user = accountService.getUserById(loan.getUserId());
		if (loan.getApplyType().intValue() == 136) {// 企业经营快速申请
			return "busi_request_view";
		}
		return "loanManageDetail";
	}

	public Integer getIndustryId() {
		return industryId;
	}

	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}

	public OrdLoanRequest getLoan() {
		return loan;
	}

	public void setLoan(OrdLoanRequest loan) {
		this.loan = loan;
	}

	public List<OrdLoanRequest> getTopThree() {
		return topThree;
	}

	public void setTopThree(List<OrdLoanRequest> topThree) {
		this.topThree = topThree;
	}

	public Integer getGroupType() {
		return groupType;
	}

	public void setGroupType(Integer groupType) {
		this.groupType = groupType;
	}

	public RequestSearch getRequestSearch() {
		return requestSearch;
	}

	public void setRequestSearch(RequestSearch requestSearch) {
		this.requestSearch = requestSearch;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public List<DicCommon> getPurposeTypeList() {
		return purposeTypeList;
	}

	public void setPurposeTypeList(List<DicCommon> purposeTypeList) {
		this.purposeTypeList = purposeTypeList;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	
}
