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
	private List<FinanceAreaModel> productAreaList;
	private FinanceApplySpModel spModel = new FinanceApplySpModel();
	// 行业级联
	private OrdFinanceApplyCheck appCheck;
	private List<OrdFinanceApplyCheck> applyCheckList;
	private List<PrdExtendsValue> extendsValueList;

	public String execute() {
		return null;
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
		applyCheckList = financeApplyService.findApplyCheck(apply.getId(),1);
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
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdFinanceApplyCheck();
		return adminFinanceApply();
	}
	public String checkApply(){
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdFinanceApplyCheck();

		return adminViewApply();
	}

	public OrdFinanceApply getApply() {
		return apply;
	}

	public void setApply(OrdFinanceApply apply) {
		this.apply = apply;
	}

	public UsrUser getUser() {
		return user;
	}

	public void setUser(UsrUser user) {
		this.user = user;
	}

	public PrdFinance getProduct() {
		return product;
	}

	public void setProduct(PrdFinance product) {
		this.product = product;
	}

	public List<FinanceAreaModel> getProductAreaList() {
		return productAreaList;
	}

	public void setProductAreaList(List<FinanceAreaModel> productAreaList) {
		this.productAreaList = productAreaList;
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

	public List<OrdFinanceApplyCheck> getApplyCheckList() {
		return applyCheckList;
	}

	public void setApplyCheckList(List<OrdFinanceApplyCheck> applyCheckList) {
		this.applyCheckList = applyCheckList;
	}

	public List<PrdExtendsValue> getExtendsValueList() {
		return extendsValueList;
	}

	public void setExtendsValueList(List<PrdExtendsValue> extendsValueList) {
		this.extendsValueList = extendsValueList;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}


}
