package com.zj198.action.admin.loan;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.model.DicIndustry;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.OrdFinanceApplyCheck;
import com.zj198.model.PrdExtendsValue;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.user.AccountService;
import com.zj198.util.Pager;
import com.zj198.util.StringUtil;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
 */
public class FinanceApplyAdminAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private FinanceProductService financeProductService;
	private OrdFinanceApply apply;
	private AccountService accountService;
	private UsrUser user;
	private PrdFinance product;
	private Integer financeId;
	private List<FinanceAreaModel> productAreaList;
	private List<OrdFinanceApply> applyList;
	private FinanceApplySpModel spModel = new FinanceApplySpModel();
	private List<FinanceApplyAttachModel> attachList;
	// 行业级联
	private List<DicIndustry> industryList;
	private Integer industryId;
	private OrdFinanceApplyCheck appCheck;
	private Integer userType;
	private Integer[] supplyWay;
	private OrdFinanceApplyAttach attach;
	private Integer userCheckStatus;
	private List<OrdFinanceApplyCheck> applyCheckList;
	private List<PrdExtendsValue> extendsValueList;
	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public String execute() {
		return null;
	}

	

	public String viewFinanceApply() {

		apply = financeApplyService.getFinanceApply(apply.getId());
		product = financeProductService.getFinance(apply.getFinanceId());
		productAreaList = financeProductService.findFiananceArea(product.getId());
		applyCheckList = financeApplyService.findApplyCheck(apply.getId());
		
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if(user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3){//银行或其它贷款机构
			userCheckStatus = 1;
		}else{
			userCheckStatus = 0;
		}
		if (apply.getApplyType().intValue() == 151) {// 企业经营贷款
			return "view_busi_apply";
		} else if (apply.getApplyType().intValue() == 152) {// 个人经营贷款
			return "view_perrun_apply";
		} else if (apply.getApplyType().intValue() == 153) {// 个人综合消费贷款
			return "view_percost_apply";
		} else if (apply.getApplyType().intValue() == 154) {// 个人购房贷款
			return "view_perhouse_apply";
		}

		return null;
	}
	public String applyManag(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if(user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3){
			return this.applyOrgMana();
		}else{
			return this.userApplyMana();
		}
	}
	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	private String userApplyMana() { 
		// INIT
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		applyList = financeApplyService.findUserApply(user.getId());
		
		return "user_apply_mana";
	}
	
	private String applyOrgMana(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		spModel.setUserId(user.getId());
		spModel.setPager(this.getPagerObj());
		pager = financeApplyService.orgFindFinanceApply(spModel);
//		this.applyList = (List<OrdFinanceApply>) map.get("list");
//		spModel.setPagination((Pagination) map.get("pagination"));
		return "apply_mana_org";
	}
	private Pager getPagerObj(){
		if(pager==null){
			pager = new Pager();
			pager.setPageCount(10);
			pager.setCurrentPage(1);
		}
		return pager;
	}
	
	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public String adminFinanceApply() { 
		// INIT
		spModel.setPager(this.getPagerObj());
		pager = financeApplyService.findFinanceApply(spModel);
//		this.applyList = (List<OrdFinanceApply>) map.get("list");
//		spModel.setPagination((Pagination) map.get("pagination"));
		return "finance_apply_admin";
	} 
	public String adminViewApply(){
		
		apply = financeApplyService.getFinanceApply(apply.getId());
		user = accountService.getUserById(apply.getUserId());
		product = financeProductService.getFinance(apply.getFinanceId());
		productAreaList = financeProductService.findFiananceArea(product.getId());
		applyCheckList = financeApplyService.findApplyCheck(apply.getId());
		/**
		 * 扩展属性
		 */
		extendsValueList = financeApplyService.getFinanceApplyExtendsValue(apply.getId());
		if(apply.getApplyType().intValue() == 151){//企业经营贷款
			return "view_busi_apply";
		}else{
			return "view_person_apply";
		}
	}
	public String checkAndSearchApply(){
//		ActionContext context = ActionContext.getContext();
//		UsrUser user = (UsrUser) context.getSession().get("_user");
//		appCheck.setCreateUserId(user.getId());
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdFinanceApplyCheck();
		if(userType.intValue() == 0){
			return adminFinanceApply();
		}else{			
			return applyManag();
		}
	}
	public String checkApply(){
//		ActionContext context = ActionContext.getContext();
//		UsrUser user = (UsrUser) context.getSession().get("_user");
//		appCheck.setCreateUserId(user.getId());
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdFinanceApplyCheck();
		if(userType.intValue() == 0){
			return adminViewApply();
		}else{			
			return viewFinanceApply();
		}
	}
	
	public String addAttach(){
		attach.setApplyId(apply.getId());
		attach.setSupplyWay(StringUtil.getStrByArray(supplyWay));
		financeApplyService.saveNewAttach(attach);
		return applyManag();
	}
	
	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public String searchDateFile() { 
		// INIT
		financeApplyService.searchDateFile();
		return "searchDateFile";
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public String updateFinanceAttach() { 
		// INIT
		financeApplyService.updateFinanceAttach();
		return "updateFinanceAttach";
	}

	public OrdFinanceApply getApply() {
		return apply;
	}

	public void setApply(OrdFinanceApply apply) {
		this.apply = apply;
	}

	public PrdFinance getProduct() {
		return product;
	}

	public void setProduct(PrdFinance product) {
		this.product = product;
	}

	public Integer getFinanceId() {
		return financeId;
	}

	public void setFinanceId(Integer financeId) {
		this.financeId = financeId;
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	public List<FinanceAreaModel> getProductAreaList() {
		return productAreaList;
	}

	public void setProductAreaList(List<FinanceAreaModel> productAreaList) {
		this.productAreaList = productAreaList;
	}

	public List<OrdFinanceApply> getApplyList() {
		return applyList;
	}

	public void setApplyList(List<OrdFinanceApply> applyList) {
		this.applyList = applyList;
	}

	public List<FinanceApplyAttachModel> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<FinanceApplyAttachModel> attachList) {
		this.attachList = attachList;
	}
	public List<DicIndustry> getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List<DicIndustry> industryList) {
		this.industryList = industryList;
	}

	public Integer getIndustryId() {
		return industryId;
	}

	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}

	public FinanceApplySpModel getSpModel() {
		return spModel;
	}

	public void setSpModel(FinanceApplySpModel spModel) {
		this.spModel = spModel;
	}

	public OrdFinanceApplyCheck getAppCheck() {
		return appCheck;
	}

	public void setAppCheck(OrdFinanceApplyCheck appCheck) {
		this.appCheck = appCheck;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}


	public OrdFinanceApplyAttach getAttach() {
		return attach;
	}

	public void setAttach(OrdFinanceApplyAttach attach) {
		this.attach = attach;
	}

	public Integer[] getSupplyWay() {
		return supplyWay;
	}

	public void setSupplyWay(Integer[] supplyWay) {
		this.supplyWay = supplyWay;
	}

	public Integer getUserCheckStatus() {
		return userCheckStatus;
	}

	public void setUserCheckStatus(Integer userCheckStatus) {
		this.userCheckStatus = userCheckStatus;
	}

	public List<OrdFinanceApplyCheck> getApplyCheckList() {
		return applyCheckList;
	}

	public void setApplyCheckList(List<OrdFinanceApplyCheck> applyCheckList) {
		this.applyCheckList = applyCheckList;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public UsrUser getUser() {
		return user;
	}

	public void setUser(UsrUser user) {
		this.user = user;
	}

	public List<PrdExtendsValue> getExtendsValueList() {
		return extendsValueList;
	}

	public void setExtendsValueList(List<PrdExtendsValue> extendsValueList) {
		this.extendsValueList = extendsValueList;
	}

}
