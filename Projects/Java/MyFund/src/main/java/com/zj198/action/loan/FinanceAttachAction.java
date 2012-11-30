package com.zj198.action.loan;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;


import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.util.Constants;
import com.zj198.util.UploadUtil;

public class FinanceAttachAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private OrdFinanceApply apply;
	private List<FinanceApplyAttachModel> attachList;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private Integer attachId;
	private Integer applyId;
	
	private Integer[] ckbox;

	private Integer viewAttachType;
	private List<OrdFaAttachList> faList;
	private OrdFinanceApplyAttach attach;
	private OrdFaAttachList attachlist;
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
		UsrUser user = getSessionUser();
		String path = "";
		msg = financeApplyService.saveAttach(upload, uploadFileName, uploadContentType, attachId, path, user.getId(),attachType,applyId);
		msg = "1";
		attach = financeApplyService.getOrdFinanceApplyAttach(attachId);
		return "success";
	}
	
	public String attachMana(){
		attachList = financeApplyService.findApplyAttach(applyId);
		apply = financeApplyService.findById(applyId);
		
		return "apply_upload_attach";
	}
	
	/**
	 * 客户提交资金网需要的材料
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-29|下午2:00:05
	 * @return
	 */
	public String uploadOverToZjw(){
		financeApplyService.updateOrdStatus(apply, null, getSessionUser().getRealname(), Constants.ORD_ZJW_UPLOAD_CHECK);
		writeJson("{\"success\":\"true\"}");
		return null;
	}
	
	/**
	 * 客户提交资金方需要的材料
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-29|下午2:00:05
	 * @return
	 */
	public String uploadOverToZjf(){
		financeApplyService.updateOrdStatus(apply, null, getSessionUser().getRealname(), Constants.ORD_ORG_CHECKING);
		writeJson("{\"success\":\"true\"}");
		return null;
	}
	
	/**
	 * 资金方材料批量审核通过
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|上午11:41:46
	 * @return
	 */
	public String allMaterialsPass(){
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.updateMaterialStatus(ckbox, null, Constants.ORD_ATTACH_ORG_CHECK);
		}
		return "rtnRedirect";
	}
	
	/**
	 * 资金方材料批量审核不通过
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|上午11:41:46
	 * @return
	 */
	public String allMaterialsUnPass(){
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.updateMaterialStatus(ckbox, null, Constants.ORD_ATTACH_CHECK_FAILURE);
		}
		return "rtnRedirect";
	}
	
	/**
	 * 资金方单独一份材料审核通过
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|下午3:05:22
	 * @return
	 */
	public String eachMaterialsPass(){
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.updateMaterialStatus(ckbox, null, Constants.ORD_ATTACH_ORG_CHECK);
		}
		return "rtnRedirect";
	}
	
	/**
	 * 资金方单独一份材料审核不通过
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|下午3:05:32
	 * @return
	 */
	public String eachMaterialsUnPass(){
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.updateMaterialStatus(ckbox, null, Constants.ORD_ATTACH_CHECK_FAILURE);
		}
		return "rtnRedirect";
	}
	
	/**
	 * 线下提交
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|下午4:49:30
	 * @return
	 */
	public String underSubmit(){
		if(attachType != null && attachType == 1){
			apply = financeApplyService.updateOffLineAgree(attach, apply, Constants.ORD_ATTACH_POST_SUB);
		}else{			
			attach = financeApplyService.updateOfflineAttach(attach, Constants.ORD_ATTACH_POST_SUB);
		}
		return "rtnAttach";
	}
	
	
	
	/**
	 * 删除所选的上传材料条目
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|上午11:37:37
	 * @return
	 */
	public String selectCancel() {
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.deleteAttach(ckbox);
		}
		return "rtnRedirect";
	}
	
	public String attachAdminManag(){
		attachList = financeApplyService.findApplyAttach(applyId);
		apply = financeApplyService.findById(applyId);
		
		return "apply_upload_attach_admin";
	}
	
	/**
	 * 查看每个条目所上传的材料列表
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-1|上午11:02:33
	 * @return
	 */
	public String viewAttach(){
		faList = financeApplyService.findAttachList(attachId);
		attach = financeApplyService.getOrdFinanceApplyAttach(attachId);
		if (faList != null && faList.size() > 0) {
			for (int i = 0; i < faList.size(); i++) {
				OrdFaAttachList o = (OrdFaAttachList) faList.get(i);
				o.setExt(UploadUtil.getFileExtName(o.getOldFileName()));
			}
		}
		return "downloan_attach";
	}
	
	/**
	 * 删除已经上传的材料
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-1|上午11:05:20
	 * @return
	 */
	public String delAttach(){
		financeApplyService.deleteAttachListById(attachlist.getId());
		writeJson("{\"success\":\"true\"}");
		return null;
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
	public Integer[] getCkbox() {
		return ckbox;
	}
	public void setCkbox(Integer[] ckbox) {
		this.ckbox = ckbox;
	}
	public OrdFaAttachList getAttachlist() {
		return attachlist;
	}
	public void setAttachlist(OrdFaAttachList attachlist) {
		this.attachlist = attachlist;
	}

}
