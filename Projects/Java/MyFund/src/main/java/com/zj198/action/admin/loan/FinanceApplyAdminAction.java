package com.zj198.action.admin.loan;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.model.DicIndustry;
import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.OrdCheckLog;
import com.zj198.model.PrdExtendsValue;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.ApplyUserService;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
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
	private OrdCheckLog appCheck;
	private List<OrdCheckLog> applyCheckList;
	private List<PrdExtendsValue> extendsValueList;
	private ApplyUserService applyUserService;
	private OrdApplyUsrCompany ordCompany;
	private Map<String,String> profileMap;
	private DictoryDataService dictoryDataService;
	private List<FinanceApplyAttachModel> attachList;
	private UsrPerson usrPerson;
	private ProfileService profileService;
	private Integer applyId;
	
	private String left;
	private String right;

	public String execute() {
		return null;
	}
	public String applyCheckList(){
		applyCheckList = financeApplyService.findApplyCheck(applyId);
		return "applyCheckList";
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
		//申贷材料列表
		attachList = financeApplyService.findApplyAttach(apply.getId());
//		apply = financeApplyService.findById(apply.getId());
		//根据状态显示按钮
		reLoadStatus(apply);
		/**
		 * 扩展属性
		 */
		extendsValueList = financeApplyService.getFinanceApplyExtendsValue(apply.getId());
		if(apply.getApplyType().intValue() == 151){//企业经营贷款
			ordCompany = applyUserService.getByApplyId(apply.getId());
			if(ordCompany != null){
				profileMap=new HashMap<String,String>();
				profileMap.put("address",dictoryDataService.getPCDNameByIds(ordCompany.getLphkprovinceid(), ordCompany.getLphkcityid(), ordCompany.getLphkdistrictid()));
			}
			return "view_busi_apply";
		}else{
			profileMap=new HashMap<String,String>();
			usrPerson = (UsrPerson)profileService.getProfiles(apply.getUserId());
			profileMap.put("address", dictoryDataService.getPCDNameByIds(usrPerson.getProvinceid(), usrPerson.getCityid(), usrPerson.getDistrictid()));
			profileMap.put("psersoncareer",dictoryDataService.getValueNameById(usrPerson.getCareerid()) );
			profileMap.put("eduAtion",dictoryDataService.getValueNameById(usrPerson.getEducation()) );
			profileMap.put("imtype1", dictoryDataService.getValueNameById(usrPerson.getIm1type()));
			profileMap.put("imtype2",dictoryDataService.getValueNameById(usrPerson.getIm2type()) );
			profileMap.put("imtype3", dictoryDataService.getValueNameById(usrPerson.getIm3type()));
			return "view_person_apply";
		}
	}
	public String checkAndSearchApply(){
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdCheckLog();
		return adminFinanceApply();
	}
	public String checkApply(){
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdCheckLog();
		
		return adminViewApply();
	}
	
	/**
	 * @description 资金网初审 基本信息和申请信息
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-24|下午3:41:12
	 * @return
	 */
	public String chuShen(){
		financeApplyService.updateChuShen(apply, appCheck, left, right, getSessionAdm().getRealname());
		return adminViewApply();
	}
	
	/**
	 * @description 资金网复审 修改订单状态
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-25|上午9:54:02
	 * @return
	 */
	public String fuShen(){
		financeApplyService.updateFuShen(apply, appCheck, getSessionAdm().getRealname());
		return adminViewApply();
	}
	
	/**
	 * 退回修改，标识客户信息和申请信息需要修改
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-25|下午2:38:37
	 * @return
	 */
	public String tuiHui(){
		financeApplyService.updateTuiHui(apply, appCheck, left, right, getSessionAdm().getRealname());
		return adminViewApply();
	}
	
	/**
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午1:35:52
	 * @return
	 */
	public String finalCheck(){
		financeApplyService.updateFinalCheck(apply, appCheck, getSessionAdm().getRealname());
		return adminViewApply();
	}
	
	/**
	 * 拆分客户信息和申请信息的标识(复用)
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午1:34:04
	 * @param ofa
	 */
	private void reLoadStatus(OrdFinanceApply ofa) {
		String j = ofa.getBaseCheckStatus();
		if (StringUtils.isNotBlank(j)) {
			left = j.substring(0, 1);
			right = j.substring(1, 2);
		} else {
			left = "0";
			right = "0";
		}
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

	public OrdCheckLog getAppCheck() {
		return appCheck;
	}

	public void setAppCheck(OrdCheckLog appCheck) {
		this.appCheck = appCheck;
	}

	public List<OrdCheckLog> getApplyCheckList() {
		return applyCheckList;
	}

	public void setApplyCheckList(List<OrdCheckLog> applyCheckList) {
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

	public void setApplyUserService(ApplyUserService applyUserService) {
		this.applyUserService = applyUserService;
	}

	public OrdApplyUsrCompany getOrdCompany() {
		return ordCompany;
	}

	public void setOrdCompany(OrdApplyUsrCompany ordCompany) {
		this.ordCompany = ordCompany;
	}

	public Map<String, String> getProfileMap() {
		return profileMap;
	}

	public void setProfileMap(Map<String, String> profileMap) {
		this.profileMap = profileMap;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public List<FinanceApplyAttachModel> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<FinanceApplyAttachModel> attachList) {
		this.attachList = attachList;
	}

	public UsrPerson getUsrPerson() {
		return usrPerson;
	}

	public void setUsrPerson(UsrPerson usrPerson) {
		this.usrPerson = usrPerson;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	public Integer getApplyId() {
		return applyId;
	}
	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}
	public String getLeft() {
		return left;
	}
	public void setLeft(String left) {
		this.left = left;
	}
	public String getRight() {
		return right;
	}
	public void setRight(String right) {
		this.right = right;
	}


}
