package com.zj198.action.admin.loan;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.loan.FinanceApplyService;

public class FinanceAttachAdminAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private OrdFinanceApply apply;
	private List<FinanceApplyAttachModel> attachList;
	private Integer attachId;
	private Integer applyId;
	private List<OrdFaAttachList> faList;
	public String execute() {
		return null;
	}
	
	
	public String attachAdminManag(){
		attachList = financeApplyService.findApplyAttach(applyId);
		apply = financeApplyService.findById(applyId);
		
		return "apply_upload_attach_admin";
	}
	
	public String viewAttach(){
		faList = financeApplyService.findAttachList(attachId);
		return "downloan_attach";
	}
	
	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}
	public OrdFinanceApply getApply() {
		return apply;
	}
	public void setApply(OrdFinanceApply apply) {
		this.apply = apply;
	}
	public List<FinanceApplyAttachModel> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<FinanceApplyAttachModel> attachList) {
		this.attachList = attachList;
	}
	public Integer getAttachId() {
		return attachId;
	}
	public void setAttachId(Integer attachId) {
		this.attachId = attachId;
	}
	public Integer getApplyId() {
		return applyId;
	}
	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}
	public List<OrdFaAttachList> getFaList() {
		return faList;
	}
	public void setFaList(List<OrdFaAttachList> faList) {
		this.faList = faList;
	}

}
