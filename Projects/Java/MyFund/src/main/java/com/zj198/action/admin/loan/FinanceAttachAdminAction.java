package com.zj198.action.admin.loan;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.util.Constants;
import com.zj198.util.UploadUtil;

public class FinanceAttachAdminAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private OrdFinanceApply apply;
	private List<FinanceApplyAttachModel> attachList;
	private Integer attachId;
	private Integer applyId;
	private List<OrdFaAttachList> faList;
	private Integer[] ckbox;
	private OrdFinanceApplyAttach attach;
	private OrdFaAttachList attachlist;
	private Integer status;
	public String execute() {
		return null;
	}

	public String attachAdminManag() {
		attachList = financeApplyService.findApplyAttach(applyId);
		apply = financeApplyService.findById(applyId);

		return "apply_upload_attach_admin";
	}

	/**
	 * 客户提交资金网需要的材料
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-29|下午2:00:05
	 * @return
	 */
	public String uploadOverToZjw() {
		financeApplyService.updateFinalCheck(apply, null, getSessionUser()
				.getRealname(), Constants.ORD_ZJW_UPLOAD_CHECK);
		writeJson("{\"success\":\"true\"}");
		return null;
	}

	/**
	 * 客户提交资金方需要的材料
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-29|下午2:00:05
	 * @return
	 */
	public String uploadOverToZjf() {
		financeApplyService.updateFinalCheck(apply, null, getSessionUser()
				.getRealname(), Constants.ORD_ORG_CHECKING);
		writeJson("{\"success\":\"true\"}");
		return null;
	}

	/**
	 * 材料批量审核通过
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|上午11:41:46
	 * @return
	 */
	public String allMaterialsPass() {
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.updateMaterialStatus(ckbox, null,
					Constants.ORD_ATTACH_ZJW_CHECK);
		}
		return "rtnUrl";
	}
	
	/**
	 * 材料批量审核不通过
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|上午11:41:46
	 * @return
	 */
	public String allMaterialsUnPass() {
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.updateMaterialStatus(ckbox, null,
					Constants.ORD_ATTACH_CHECK_FAILURE);
		}
		return "rtnUrl";
	}

	/**
	 * 单独一份材料审核通过
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|下午3:05:22
	 * @return
	 */
	public String eachMaterialsPass() {
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.updateMaterialStatus(ckbox, null,
					Constants.ORD_ATTACH_ZJW_CHECK);
		}
		return "rtnUrl";
	}

	/**
	 * 单独一份材料审核不通过
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|下午3:05:32
	 * @return
	 */
	public String eachMaterialsUnPass() {
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.updateMaterialStatus(ckbox, null,
					Constants.ORD_ATTACH_CHECK_FAILURE);
		}
		return "rtnUrl";
	}

	/**
	 * 线下提交
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|下午4:49:30
	 * @return
	 */
	public String underSubmit() {
		financeApplyService.updateMaterialStatus(ckbox, attach.getPostid(),
				Constants.ORD_ATTACH_POST_SUB);
		return "rtnUrl";
	}

	/**
	 * 删除所选的上传材料条目
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|上午11:37:37
	 * @return
	 */
	public String selectCancel() {
		if (ckbox != null && ckbox.length > 0) {
			financeApplyService.deleteAttach(ckbox);
		}
		return "rtnUrl";
	}

	/**
	 * 查看每个条目所上传的材料列表
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-1|上午11:02:33
	 * @return
	 */
	public String viewAttach() {
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
	public String agreeCheck(){
		apply = financeApplyService.updateOffLineAgreeCheck(apply, status);
		return "rtnUrl";
	}

	/**
	 * 删除已经上传的材料
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-1|上午11:05:20
	 * @return
	 */
	public String delAttach() {
		financeApplyService.deleteAttachListById(attachlist.getId());
		writeJson("{\"success\":\"true\"}");
		return null;
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

	public Integer[] getCkbox() {
		return ckbox;
	}

	public void setCkbox(Integer[] ckbox) {
		this.ckbox = ckbox;
	}

	public OrdFinanceApplyAttach getAttach() {
		return attach;
	}

	public void setAttach(OrdFinanceApplyAttach attach) {
		this.attach = attach;
	}

	public OrdFaAttachList getAttachlist() {
		return attachlist;
	}

	public void setAttachlist(OrdFaAttachList attachlist) {
		this.attachlist = attachlist;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
