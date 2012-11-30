package com.zj198.action.loan;

import com.zj198.action.BaseAction;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.model.SaveAttachListSpModel;

public class AddOrgAttachAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private SaveAttachListSpModel saveAttachListSpModel;
	private Integer applyId;
	public String execute() {
		saveAttachListSpModel.setApplyId(applyId);
		financeApplyService.saveAttachList(saveAttachListSpModel);
		return SUCCESS;
	}
	public Integer getApplyId() {
		return applyId;
	}
	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}
	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}
	public SaveAttachListSpModel getSaveAttachListSpModel() {
		return saveAttachListSpModel;
	}
	public void setSaveAttachListSpModel(SaveAttachListSpModel saveAttachListSpModel) {
		this.saveAttachListSpModel = saveAttachListSpModel;
	}
}
