package com.zj198.action.loan;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.model.FindFinanceApplySpModel;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
 */
public class UnCheckApplyAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private List<OrdFinanceApply> applyList;
	
	public String execute() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		FindFinanceApplySpModel spModel = new FindFinanceApplySpModel();
		spModel.setUser(user);
		applyList = financeApplyService.findFinanceApply(spModel);
		return "findApplyHome";
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
