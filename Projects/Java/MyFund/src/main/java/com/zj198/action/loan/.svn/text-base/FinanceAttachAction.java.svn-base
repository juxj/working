package com.zj198.action.loan;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zj198.action.BaseAction;
import com.zj198.model.DicIndustry;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.util.UploadUtil;

public class FinanceAttachAction extends ActionSupport {
	private FinanceApplyService financeApplyService;
	private OrdFinanceApply apply;
	private List<FinanceApplyAttachModel> attachList;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private Integer attachId;
	private Integer applyId;
	/**
	 * 
	 */
	private Integer viewAttachType;
	private List<OrdFaAttachList> faList;
	private OrdFinanceApplyAttach attach;
	/**
	 * 上传文件类型
	 * 1：融资咨询服务协议
	 * 0：其它材料
	 */
	private Integer attachType;
	private String msg;
	public String execute() {
		return null;
	}
	public String upload(){
		if(upload == null){
			msg = "0";
			return "input";
		}
		/**
		 * 类型检查
		 */
//		String[] extendStr = {"png","jpg","jpeg","bmp","doc","docx","xls","xlsx","pdf","txt"}; 
//		String extendName = uploadFileName.substring(uploadFileName.lastIndexOf(".")+1,uploadFileName.length());
//		int bool = 0;
//		for(String s : extendStr){
//			if(extendName.equals(s)){
//				bool = 1;
//				break;
//			}
//		}
//		if(bool == 0){
//			msg = "0！";
//			return "input";
//		}else{			
//		}
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		String path = "";
		msg = financeApplyService.saveAttach(upload, uploadFileName, uploadContentType, attachId, path, user.getId(),attachType,applyId);
		msg = "1";
		
		return "success";
	}
	
	public String attachMana(){
		attachList = financeApplyService.findApplyAttach(applyId);
		apply = financeApplyService.findById(applyId);
		
		return "apply_upload_attach";
	}
	
	public String attachAdminManag(){
		attachList = financeApplyService.findApplyAttach(applyId);
		apply = financeApplyService.findById(applyId);
		
		return "apply_upload_attach_admin";
	}
	
	public String viewAttach(){
		faList = financeApplyService.findAttachList(attachId);
		if (faList != null && faList.size() > 0) {
			for (int i = 0; i < faList.size(); i++) {
				OrdFaAttachList o = (OrdFaAttachList) faList.get(i);
				o.setExt(UploadUtil.getFileExtName(o.getOldFileName()));
			}
		}
		return "downloan_attach";
	}
	
	public String checkAttach(){
		financeApplyService.savefinanceAttach(attach);
		return attachMana();
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
	public Integer getViewAttachType() {
		return viewAttachType;
	}
	public void setViewAttachType(Integer viewAttachType) {
		this.viewAttachType = viewAttachType;
	}
	public List<OrdFaAttachList> getFaList() {
		return faList;
	}
	public void setFaList(List<OrdFaAttachList> faList) {
		this.faList = faList;
	}
	public OrdFinanceApplyAttach getAttach() {
		return attach;
	}
	public void setAttach(OrdFinanceApplyAttach attach) {
		this.attach = attach;
	}
	public Integer getAttachType() {
		return attachType;
	}
	public void setAttachType(Integer attachType) {
		this.attachType = attachType;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

}
