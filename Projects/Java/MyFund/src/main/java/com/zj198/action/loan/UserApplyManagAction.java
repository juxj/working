package com.zj198.action.loan;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.model.DicCity;
import com.zj198.model.DicCommon;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
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
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;
import com.zj198.util.StringUtil;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
 */
public class UserApplyManagAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private FinanceProductService financeProductService;
	private DictoryDataService dictoryDataService;
	private ProfileService profileService;
	private ApplyUserService applyUserService;
	private OrdFinanceApply apply;
	private PrdFinance product;
	private Integer groupType;
	private List<FinanceAreaModel> productAreaList;
	private List<OrdFinanceApply> applyList;
	private FinanceApplySpModel spModel = new FinanceApplySpModel();
	private List<FinanceApplyAttachModel> attachList;
	// 行业级联
	private List<DicIndustry> industryList;
	private Integer industryId;
	private String pindName;
	private String cindName;
	private OrdCheckLog appCheck;
	private Integer[] supplyWay;
	private OrdFinanceApplyAttach attach;
	private Integer userCheckStatus;
	private List<OrdCheckLog> applyCheckList;
	private UsrPerson usrPerson;
	private List<PrdExtendsValue> extendsValueList;
	private Map<String,String> profileMap;
	private Integer applyId;
	private OrdApplyUsrCompany ordCompany;
	private Integer print;
	private List<DicProvince> listProvince;
	private Map<String,List<DicCommon>> dataMap;
	private Map<String,List<DicCity>> cityMap;
	private Map<String,List<DicDistrict>> districtMap;
	private String left;
	private String right;
	
	public String execute() {
		
		UsrUser user = getSessionUser();
		if(user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3){
			return this.applyOrgMana();
		}else{
			return this.userApplyMana();
		}
	}
	public String applyCheckList(){
		applyCheckList = financeApplyService.findApplyCheck(applyId);
		return "applyCheckList";
	}

	public String viewFinanceApply() {
		
		return comMethod();
	}
	
	public String print(){
		return comMethod();
	}
	
	private String comMethod(){
		String o = "";
		UsrUser user = getSessionUser();
		apply = financeApplyService.getFinanceApply(apply.getId());
		product = financeProductService.getFinance(apply.getFinanceId());
		productAreaList = financeProductService.findFiananceArea(product.getId());
		applyCheckList = financeApplyService.findApplyCheck(apply.getId(),1);
		
		//申贷材料列表
		attachList = financeApplyService.findApplyAttach(apply.getId());
		apply = financeApplyService.findById(apply.getId());
		reLoadStatus(apply);
		/**
		 * 扩展属性
		 */
		extendsValueList = financeApplyService.getFinanceApplyExtendsValue(apply.getId());
		if(apply.getRunningTrade()!=null){
			pindName = dictoryDataService.getIndustryNameById(apply.getRunningTrade());
		}
		if(apply.getRunningTradeChild()!=null){
			cindName = dictoryDataService.getIndustryNameById(apply.getRunningTradeChild());
		}
		if(user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3){//银行或其它贷款机构
			userCheckStatus = 1;
		}else{
			userCheckStatus = 0;
		}
		Integer j = 0; 
		Integer k = 0;
		j = user.getUserTypeGroup().intValue();
		k = apply.getApplyType().intValue();
		if (j == 2 || j == 3) {//银行查看贷款
			if(k == 151){
				ordCompany = applyUserService.getByApplyId(apply.getId());
				if(ordCompany != null){
					profileMap=new HashMap<String,String>();
					profileMap.put("address",dictoryDataService.getPCDNameByIds(ordCompany.getLphkprovinceid(), ordCompany.getLphkcityid(), ordCompany.getLphkdistrictid()));
				}
				if(print!=null && print==1){
					o= "view_busi_apply_print";
				}else{
					o= "view_busi_apply_bybank";
				}
			}else{
				profileMap=new HashMap<String,String>();
				usrPerson = (UsrPerson)profileService.getProfiles(apply.getUserId());
				profileMap.put("address", dictoryDataService.getPCDNameByIds(usrPerson.getProvinceid(), usrPerson.getCityid(), usrPerson.getDistrictid()));
				profileMap.put("psersoncareer",dictoryDataService.getValueNameById(usrPerson.getCareerid()) );
				profileMap.put("eduAtion",dictoryDataService.getValueNameById(usrPerson.getEducation()) );
				profileMap.put("imtype1", dictoryDataService.getValueNameById(usrPerson.getIm1type()));
				profileMap.put("imtype2",dictoryDataService.getValueNameById(usrPerson.getIm2type()) );
				profileMap.put("imtype3", dictoryDataService.getValueNameById(usrPerson.getIm3type()));
				if(print!=null && print==1){
					o = "view_perrun_apply_print";
				}else{
					o = "view_perrun_apply_bybank";
				}
			}
		} else if (k == 151) {// 企业经营贷款
			//企业的详细信息和法人信息
			ordCompany = applyUserService.getByApplyId(apply.getId());
			if(ordCompany != null){
				profileMap=new HashMap<String,String>();
				profileMap.put("address",dictoryDataService.getPCDNameByIds(ordCompany.getLphkprovinceid(), ordCompany.getLphkcityid(), ordCompany.getLphkdistrictid()));
			}
			if(print!=null && print==1){
				o = "view_busi_apply_print";
			}else{
				o = "view_busi_apply";
			}
		} else if (k == 152) {// 个人经营贷款
			profileMap=new HashMap<String,String>();
			usrPerson = (UsrPerson)profileService.getProfiles(apply.getUserId());
			profileMap.put("address", dictoryDataService.getPCDNameByIds(usrPerson.getProvinceid(), usrPerson.getCityid(), usrPerson.getDistrictid()));
			profileMap.put("psersoncareer",dictoryDataService.getValueNameById(usrPerson.getCareerid()) );
			profileMap.put("eduAtion",dictoryDataService.getValueNameById(usrPerson.getEducation()) );
			profileMap.put("imtype1", dictoryDataService.getValueNameById(usrPerson.getIm1type()));
			profileMap.put("imtype2",dictoryDataService.getValueNameById(usrPerson.getIm2type()) );
			profileMap.put("imtype3", dictoryDataService.getValueNameById(usrPerson.getIm3type()));
			if(print!=null && print==1){
				o = "view_perrun_apply_print";
			}else{
				o = "view_perrun_apply";
			}
		}
		return o;
	}
	

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	private String userApplyMana() { 
		// INIT
		
		UsrUser user = getSessionUser();
		applyList = financeApplyService.findUserApply(user.getId());
		groupType = user.getUserTypeGroup().intValue();
		
		return "user_apply_mana";
	}
	
	private String applyOrgMana(){
		
		UsrUser user = getSessionUser();
		spModel.setUserId(user.getId());
		spModel.setPager(this.getPagerObj());
		groupType = user.getUserTypeGroup().intValue();
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
	
	public String updateApplyStatus(){
		financeApplyService.updateAppInfo(apply, left, right);
		return comMethod();
	}
	
	
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
	
	public String checkAndSearchApply(){
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdCheckLog();

		return execute();
	}
	public String checkApply(){
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdCheckLog();

		return viewFinanceApply();
	}
	
	public String addAttach(){
		attach.setApplyId(apply.getId());
		attach.setSupplyWay(StringUtil.getStrByArray(supplyWay));
		financeApplyService.saveNewAttach(attach);
		return execute();
	}
	/**用户修改企业信息**/
	public String editOrdCom(){
		
		UsrUser user = getSessionUser();
		int groupid = profileService.getGroupidByUserType(user.getType());
		switch (groupid){
		case Constants.USERTYPE_GROUP_COMPANY:
			ordCompany = applyUserService.getByApplyId(applyId);
			if(ordCompany != null){
				listProvince=dictoryDataService.findAllProvince();
				dataMap = new HashMap<String,List<DicCommon>>();
				cityMap = new HashMap<String,List<DicCity>>();
				districtMap = new HashMap<String,List<DicDistrict>>();
				profileMap=new HashMap<String,String>();
				cityMap.put("regCity", dictoryDataService.findCityByProvinceid(ordCompany.getRegprovinceid()));
				districtMap.put("regDistrict", dictoryDataService.findDistrictByCityid(ordCompany.getRegcityid()));
				cityMap.put("lpliveCity", dictoryDataService.findCityByProvinceid(ordCompany.getLpliveprovinceid()));
				districtMap.put("lpliveDistrict", dictoryDataService.findDistrictByCityid(ordCompany.getLplivecityid()));
				cityMap.put("lphkCity", dictoryDataService.findCityByProvinceid(ordCompany.getLphkprovinceid()));
				districtMap.put("lphkDistrict", dictoryDataService.findDistrictByCityid(ordCompany.getLphkcityid()));
				dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
				dataMap.put("companyTmployee", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYEMPLOYEE));
				dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
				dataMap.put("marry", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_MARRY));
				dataMap.put("workYears", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKYEARS));
				return "editOrdCompanyProfile";
			}
		}
		return ERROR;
	}
	/**修改融资申请企业信息-----保存*/
	public String updateOrdCom(){
		
		UsrUser user = getSessionUser();
		if(ordCompany!=null){
			int groupid = profileService.getGroupidByUserType(user.getType());
			switch (groupid){
				case Constants.USERTYPE_GROUP_COMPANY:
					OrdApplyUsrCompany ordCompanyOld = applyUserService.getByApplyId(applyId);
					ordCompanyOld.setLoanFields(ordCompany);
					applyUserService.updateCompDetail(ordCompanyOld);
					apply = financeApplyService.getFinanceApply(applyId);
			}
		}
		return comMethod();
	}
	//setter and getter
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	public void setApplyUserService(ApplyUserService applyUserService) {
		this.applyUserService = applyUserService;
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
	public Integer getGroupType() {
		return groupType;
	}
	public void setGroupType(Integer groupType) {
		this.groupType = groupType;
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
	public FinanceApplySpModel getSpModel() {
		return spModel;
	}
	public void setSpModel(FinanceApplySpModel spModel) {
		this.spModel = spModel;
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
	public String getPindName() {
		return pindName;
	}
	public void setPindName(String pindName) {
		this.pindName = pindName;
	}
	public String getCindName() {
		return cindName;
	}
	public void setCindName(String cindName) {
		this.cindName = cindName;
	}
	public OrdCheckLog getAppCheck() {
		return appCheck;
	}
	public void setAppCheck(OrdCheckLog appCheck) {
		this.appCheck = appCheck;
	}
	public Integer[] getSupplyWay() {
		return supplyWay;
	}
	public void setSupplyWay(Integer[] supplyWay) {
		this.supplyWay = supplyWay;
	}
	public OrdFinanceApplyAttach getAttach() {
		return attach;
	}
	public void setAttach(OrdFinanceApplyAttach attach) {
		this.attach = attach;
	}
	public Integer getUserCheckStatus() {
		return userCheckStatus;
	}
	public void setUserCheckStatus(Integer userCheckStatus) {
		this.userCheckStatus = userCheckStatus;
	}
	public List<OrdCheckLog> getApplyCheckList() {
		return applyCheckList;
	}
	public void setApplyCheckList(List<OrdCheckLog> applyCheckList) {
		this.applyCheckList = applyCheckList;
	}
	public UsrPerson getUsrPerson() {
		return usrPerson;
	}
	public void setUsrPerson(UsrPerson usrPerson) {
		this.usrPerson = usrPerson;
	}
	public List<PrdExtendsValue> getExtendsValueList() {
		return extendsValueList;
	}
	public void setExtendsValueList(List<PrdExtendsValue> extendsValueList) {
		this.extendsValueList = extendsValueList;
	}
	public Map<String, String> getProfileMap() {
		return profileMap;
	}
	public void setProfileMap(Map<String, String> profileMap) {
		this.profileMap = profileMap;
	}
	public Integer getApplyId() {
		return applyId;
	}
	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}
	public OrdApplyUsrCompany getOrdCompany() {
		return ordCompany;
	}
	public void setOrdCompany(OrdApplyUsrCompany ordCompany) {
		this.ordCompany = ordCompany;
	}
	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}
	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	public Integer getPrint() {
		return print;
	}
	public void setPrint(Integer print) {
		this.print = print;
	}
	public List<DicProvince> getListProvince() {
		return listProvince;
	}
	public Map<String, List<DicCommon>> getDataMap() {
		return dataMap;
	}
	public Map<String, List<DicCity>> getCityMap() {
		return cityMap;
	}
	public Map<String, List<DicDistrict>> getDistrictMap() {
		return districtMap;
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
