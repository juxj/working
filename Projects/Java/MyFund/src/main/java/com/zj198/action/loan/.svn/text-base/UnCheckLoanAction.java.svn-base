package com.zj198.action.loan;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.loan.model.FindFinanceApplySpModel;

public class UnCheckLoanAction extends BaseAction{

	private List<OrdLoanRequest> topThree;
	private LoanRequestService loanRequestService;
	private List<OrdFinanceApply> applyList;
	private FinanceApplyService financeApplyService;

	public String loanRequestHome() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3) {// 银行或其它贷款机构
			topThree = loanRequestService.getTopThrees(user.getType().intValue());
		} else {
			topThree = loanRequestService.getTopThree(user.getId());
		}
		return "loanRequestHome";
	}
	
	public String findApplyHome(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		FindFinanceApplySpModel spModel = new FindFinanceApplySpModel();
		spModel.setUser(user);
		applyList = financeApplyService.findFinanceApply(spModel);
		return "findApplyHome";
	}
	

	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
	}

	public List<OrdLoanRequest> getTopThree() {
		return topThree;
	}

	public void setTopThree(List<OrdLoanRequest> topThree) {
		this.topThree = topThree;
	}


	public String execute() throws Exception {
		return null;
	}

	public List<OrdFinanceApply> getApplyList() {
		return applyList;
	}

	public void setApplyList(List<OrdFinanceApply> applyList) {
		this.applyList = applyList;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

}
