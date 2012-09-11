package com.zj198.action.admin.loan;

import java.io.IOException;
import java.io.InputStream;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.AdmUser;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFaLoanUpload;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.OrdFinanceAppLoanService;
import com.zj198.util.Constants;
import com.zj198.util.UploadUtil;

public class FileDownloadAdminAction extends BaseAction{
	private FinanceApplyService financeApplyService;
	private OrdFinanceAppLoanService ordFinanceAppLoanService;
	private Integer falistId;
	private String fileName;
	private Integer applyId;
	/**
	 * 0:融资申请附件
	 * 1:贷后附件
	 */
	private Integer type;
	
	public InputStream getAttachStream(){
		String downloadFileName = "";
		if(type.intValue() == 0){			
			OrdFaAttachList fa = financeApplyService.getOrdFaAttachList(falistId);
			try {				
//				fileName = new String(fa.getOldFileName().getBytes(), "ISO8859-1");
				fileName = java.net.URLEncoder.encode(fa.getOldFileName(), "UTF-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
			downloadFileName = fa.getFileName();
		}else{
			OrdFaLoanUpload u = ordFinanceAppLoanService.getOrdFaLoanUpload(falistId);
			try {				
//				fileName = new String(u.getOldFileName().getBytes(), "ISO8859-1");
				fileName = java.net.URLEncoder.encode(u.getOldFileName(), "UTF-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
			downloadFileName = u.getFileName();
		}
		InputStream is = UploadUtil.getFileStream(downloadFileName);
		if(is == null){
			is = new InputStream() {
				
				@Override
				public int read() throws IOException {
					return 0;
				}
			};
		}
		return is;
//		File file = new File(fa.getUploadPath()  + fa.getFileName());
//		FileInputStream instream = null;
//		try {
//			instream = new FileInputStream(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return  instream;
//		return new ByteArrayInputStream((fa.getUploadPath() + fa.getFileName()).getBytes());
	}
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		AdmUser admin = (AdmUser)context.getSession().get("_admin");
		if(user == null && admin == null){
			return ERROR;
		}
		return SUCCESS;
	}
	public String downAgree(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		AdmUser admin = (AdmUser)context.getSession().get("_admin");
		if(user == null && admin == null){
			return ERROR;
		}
		return "downAgree";
	}
	public InputStream getDownAgreeStream(){
		OrdFinanceApply apply = financeApplyService.getFinanceApply(applyId);
		String downloadFileName = apply.getAgreeFileUpload();
		InputStream is = UploadUtil.getFileStream(downloadFileName);
		try {			
//			fileName = new String(Constants.SHOW_NAME_ZJ198_FINANCE_AGREE.getBytes(), "UTF-8");
			fileName = java.net.URLEncoder.encode(Constants.SHOW_NAME_ZJ198_FINANCE_AGREE, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(is == null){
			is = new InputStream() {
				
				@Override
				public int read() throws IOException {
					return 0;
				}
			};
		}
		return is;
//		return UploadUtil.getFileStream(downloadFileName);
	}
	public String downAgreeTemplate(){
		return "template";
	}
	public InputStream getAgreeTemplateStream(){
		String downloadFileName = Constants.FILE_NAME_ZJ198_FINANCE_AGREE;
		try {			
//			fileName = new String(Constants.SHOW_NAME_ZJ198_FINANCE_AGREE.getBytes(), "ISO8859-1");
			fileName = java.net.URLEncoder.encode(Constants.SHOW_NAME_ZJ198_FINANCE_AGREE, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return UploadUtil.getFileStream(downloadFileName);
	}
	public Integer getFalistId() {
		return falistId;
	}
	public void setFalistId(Integer falistId) {
		this.falistId = falistId;
	}
	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public void setOrdFinanceAppLoanService(
			OrdFinanceAppLoanService ordFinanceAppLoanService) {
		this.ordFinanceAppLoanService = ordFinanceAppLoanService;
	}
	public Integer getApplyId() {
		return applyId;
	}
	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}
}
