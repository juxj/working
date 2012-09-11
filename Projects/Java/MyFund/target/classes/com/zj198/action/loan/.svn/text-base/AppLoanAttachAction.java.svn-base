package com.zj198.action.loan;

import java.io.File;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.AppLoanAttachSpModel;
import com.zj198.model.OrdFaLoanData;
import com.zj198.model.OrdFaLoanUpload;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.OrdFinanceAppLoanService;

public class AppLoanAttachAction extends BaseAction {
	private OrdFinanceAppLoanService ordFinanceAppLoanService;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private List<OrdFaLoanData> loanDataList;
	private Integer appLoanId;
	private Integer viewAttachType;
	private OrdFaLoanData loanData;
	private List<OrdFaLoanUpload> loanUploadList;
	public String execute() {
		return null;
	}
	
	public String upload(){
		if(upload == null){
			msg = "上传失败，文件类型不符合要求！";
			return ERROR;
		}else{			
			ActionContext context = ActionContext.getContext();
			UsrUser user = (UsrUser) context.getSession().get("_user");
			AppLoanAttachSpModel spModel = new AppLoanAttachSpModel();
			spModel.setUpload(upload);
			spModel.setUploadContentType(uploadContentType);
			spModel.setUploadFileName(uploadFileName);
			spModel.setUserId(user.getId());
			spModel.setLoanDataId(loanData.getId());
			spModel.setAppLoanId(appLoanId);
			ordFinanceAppLoanService.saveUploadAttach(spModel);
		}
		
		msg = "1";
		return "success";
	}
	
	public String attachManag(){
		loanDataList = ordFinanceAppLoanService.findFaLoanData(appLoanId);
		return "loanAppAttach";
	}
	
	public String viewAttach(){
		loanUploadList = ordFinanceAppLoanService.findLoanUpload(loanData.getId());
		return "downloan_attach";
	}
	public String checkAttach(){
		ordFinanceAppLoanService.updateLoanData(loanData);
		return this.attachManag();
	}

	//setter and getter
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public List<OrdFaLoanData> getLoanDataList() {
		return loanDataList;
	}

	public void setLoanDataList(List<OrdFaLoanData> loanDataList) {
		this.loanDataList = loanDataList;
	}

	public Integer getAppLoanId() {
		return appLoanId;
	}

	public void setAppLoanId(Integer appLoanId) {
		this.appLoanId = appLoanId;
	}

	public Integer getViewAttachType() {
		return viewAttachType;
	}

	public void setViewAttachType(Integer viewAttachType) {
		this.viewAttachType = viewAttachType;
	}

	public OrdFaLoanData getLoanData() {
		return loanData;
	}

	public void setLoanData(OrdFaLoanData loanData) {
		this.loanData = loanData;
	}

	public void setOrdFinanceAppLoanService(
			OrdFinanceAppLoanService ordFinanceAppLoanService) {
		this.ordFinanceAppLoanService = ordFinanceAppLoanService;
	}

	public List<OrdFaLoanUpload> getLoanUploadList() {
		return loanUploadList;
	}

	public void setLoanUploadList(List<OrdFaLoanUpload> loanUploadList) {
		this.loanUploadList = loanUploadList;
	}
}
