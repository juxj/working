package com.zj198.action.loan;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.model.DicCity;
import com.zj198.model.DicCommon;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.OrdFinanceApplyCheck;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdExtendsValue;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdFinanceArea;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.PrdFinanceAreaService;
import com.zj198.service.loan.model.FindFinanceApplySpModel;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;
import com.zj198.util.StringUtil;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
 */
public class FinanceApplyAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private FinanceProductService financeProductService;
	private DictoryDataService dictoryDataService;
	private ProfileService profileService;
	private OrdFinanceApply apply;
	private PrdFinance product;
	private Integer financeId;
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
	private OrdFinanceApplyCheck appCheck;
	private Integer userType;
	private Integer[] supplyWay;
	private OrdFinanceApplyAttach attach;
	private Integer userCheckStatus;
	private List<OrdFinanceApplyCheck> applyCheckList;
	private List<PrdExtendsProperty> extendsPropertyList;
	private List<String> extendsProValues;
	private UsrCompany usrCompany;
	private Map<String,List<DicCommon>> dataMap;
	private Map<String,List<DicCity>> cityMap;
	private Map<String,List<DicDistrict>> districtMap;
	private List<DicProvince> listProvince;
	private List<DicIndustry> industry;
	private UsrPerson usrPerson;
	private PrdFinanceAreaService prdFinanceAreaService;
	private List<PrdExtendsValue> extendsValueList;
	public String execute() {
		return null;
	}
	
	public String companyInfoEdit(){
		product = financeProductService.getFinance(product.getId());
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		listProvince=dictoryDataService.findAllProvince();
		dataMap = new HashMap<String,List<DicCommon>>();
		cityMap = new HashMap<String,List<DicCity>>();
		districtMap = new HashMap<String,List<DicDistrict>>();
		usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
		if(usrCompany!=null){
			cityMap.put("regCity", dictoryDataService.findCityByProvinceid(usrCompany.getRegprovinceid()));
			districtMap.put("regDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getRegcityid()));
			cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrCompany.getBizprovinceid()));
			districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getBizcityid()));
			cityMap.put("lpliveCity", dictoryDataService.findCityByProvinceid(usrCompany.getLpliveprovinceid()));
			districtMap.put("lpliveDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getLplivecityid()));
			cityMap.put("lphkCity", dictoryDataService.findCityByProvinceid(usrCompany.getLphkprovinceid()));
			districtMap.put("lphkDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getLphkcityid()));
			industry=dictoryDataService.findIndustryByParentid(usrCompany.getIndustryparentid());
		}
		dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
		dataMap.put("companyTmployee", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYEMPLOYEE));
		dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
		dataMap.put("marry", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_MARRY));
		dataMap.put("workYears", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKYEARS));
		industryList = dictoryDataService.findIndustryByParentid(0);
		return "companyInfoEdit";
	}
	
	public String personcInfo(){
		product = financeProductService.getFinance(product.getId());
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
		return "personInfo";
	}

	public String financeApply() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			msg = "对不起！您尚未登录，请登录后再提交申请。";
			return "applyFailure";
		}else if(user.getAuditstatus() == null || user.getAuditstatus().intValue() < 2){
			msg = "您的帐号还未通过审核，请完善用户信息并通过审核后，再申请融资。";
			return "applyFailure";
		}
		int userGroup = user.getUserTypeGroup().intValue();

		product = financeProductService.getFinance(product.getId());
		extendsPropertyList = financeProductService.getFinancePropertys(product.getId());
		int financeType = product.getFinanceType().intValue();
		
		if (financeType == 151) {// 企业经营贷款
			if (userGroup != 1) {
				msg = "只有企业用户可以申请企业经营性贷款";
				return "applyFailure";
			}else{
//				UsrCompany usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
//				if(usrCompany.getCompleteratebase() < 100){
//					msg = "企业信息不完整，请补充完整!";
//					return "complementUserInfo";
//				}
			}
			return companyInfoEdit();
			//return busiApplyFirst();
		}
		if (financeType == 152) {// 个人经营贷款
			if (userGroup != 5) {
				msg = "只有个人用户才能申请个人经营贷款";
				return "applyFailure";
			}else{
//				UsrPerson usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
//				if(usrPerson.getCompleterate() < 100){
//					msg = "用户信息不完整，请补充完整!";
//					return "complementUserInfo";
//				}
			}
			return personcInfo();
		}
		if (financeType == 153) {// 个人综合性消费贷款
			if (userGroup != 5) {
				msg = "只有个人用户才能申请个人综合性消费贷款";
				return "applyFailure";
			}
			//return percostApplyFirst();
			return personcInfo();
		}
		if (financeType == 154) {// 个人购房性贷款
			if (userGroup != 5) {
				msg = "只有个人用户才能申请个人购房性贷款";
				return "applyFailure";
			}
			return perhouseApplyFirst();
		}

		return null;
	}

	public String busiApplyFirst() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			msg = "对不起！您尚未登录，请登录后再提交申请。";
			return "applyFailure";
		}
		product = financeProductService.getFinance(product.getId());
		extendsPropertyList = financeProductService.getFinancePropertys(product.getId());
		if(product != null){
			List<FinanceAreaModel> pms = prdFinanceAreaService.findFiananceArea(product.getId());
			UsrCompany old_UsrCompany = (UsrCompany)profileService.getProfiles(usrCompany.getUserid());
			old_UsrCompany.setLoanFields(usrCompany);
			if(pms != null && pms.size() > 0){				
				for(FinanceAreaModel j : pms){
					if (j.getProvinceId() == 0 || j.getProvinceId() == null) {
						profileService.saveorupdate(old_UsrCompany);
						break;
					} else if (j.getProvinceId() == usrCompany.getRegprovinceid() && j.getCityId() == 0) {
						profileService.saveorupdate(old_UsrCompany);
						break;
					} else if(j.getProvinceId() == usrCompany.getRegprovinceid() && j.getCityId() == usrCompany.getRegcityid()){
						profileService.saveorupdate(old_UsrCompany);
						break;
					} else{
						profileService.saveorupdate(old_UsrCompany);
						msg = "对不起，该融资产品暂不支持您的企业所在地区，请您重新选择其他融资产品！ ";
						return "applyFailure";
					}
				}
			}else{
				profileService.saveorupdate(old_UsrCompany);
			}
		}
		return "busi_apply_first";
	}

	private String percostApplyFirst() {

		return "percostApplyFirst";
	}

	public String perruntApplyFirst() {
		
		product = financeProductService.getFinance(product.getId());

		industryList = dictoryDataService.findIndustryByParentid(0);
		extendsPropertyList = financeProductService.getFinancePropertys(product.getId());
		return "perrunApplyFirst";
	}

	private String perhouseApplyFirst() {

		return "perhouseApplyFirst";
	}

	public String applySecond() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		spModel = new FinanceApplySpModel();
		spModel.setExtendsProValues(extendsProValues);
		Map param = context.getParameters();
		spModel.setParamap(param);
		
		financeApplyService.saveFinanceApply(apply, product.getId(), user, spModel);
		return "apply_second";
	}

	public String viewFinanceApply() {

		apply = financeApplyService.getFinanceApply(apply.getId());
		product = financeProductService.getFinance(apply.getFinanceId());
		productAreaList = financeProductService.findFiananceArea(product.getId());
		applyCheckList = financeApplyService.findApplyCheck(apply.getId());
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
		groupType = user.getUserTypeGroup().intValue();
		
		return "user_apply_mana";
	}
	
	private String applyOrgMana(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
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
		product = financeProductService.getFinance(apply.getFinanceId());
		productAreaList = financeProductService.findFiananceArea(product.getId());
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
	
	/**
	 * 
	 * @Author zeroleavebaoyang@gmail.com
	 * @Description 行业异步级联显示
	 * @return
	 */
	public String Industry() {
		industryList = dictoryDataService.findIndustryByParentid(industryId);
		return "industryList";
	}

	public String findApplyHome(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		FindFinanceApplySpModel spModel = new FindFinanceApplySpModel();
		spModel.setUser(user);
		applyList = financeApplyService.findFinanceApply(spModel);
		return "findApplyHome";
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


	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
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

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public List<PrdExtendsProperty> getExtendsPropertyList() {
		return extendsPropertyList;
	}

	public void setExtendsPropertyList(List<PrdExtendsProperty> extendsPropertyList) {
		this.extendsPropertyList = extendsPropertyList;
	}

	public List<String> getExtendsProValues() {
		return extendsProValues;
	}

	public void setExtendsProValues(List<String> extendsProValues) {
		this.extendsProValues = extendsProValues;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public UsrCompany getUsrCompany() {
		return usrCompany;
	}

	public void setUsrCompany(UsrCompany usrCompany) {
		this.usrCompany = usrCompany;
	}

	public Map<String, List<DicCommon>> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, List<DicCommon>> dataMap) {
		this.dataMap = dataMap;
	}

	public Map<String, List<DicCity>> getCityMap() {
		return cityMap;
	}

	public void setCityMap(Map<String, List<DicCity>> cityMap) {
		this.cityMap = cityMap;
	}

	public Map<String, List<DicDistrict>> getDistrictMap() {
		return districtMap;
	}

	public void setDistrictMap(Map<String, List<DicDistrict>> districtMap) {
		this.districtMap = districtMap;
	}

	public List<DicProvince> getListProvince() {
		return listProvince;
	}

	public void setListProvince(List<DicProvince> listProvince) {
		this.listProvince = listProvince;
	}

	public List<DicIndustry> getIndustry() {
		return industry;
	}

	public void setIndustry(List<DicIndustry> industry) {
		this.industry = industry;
	}

	public UsrPerson getUsrPerson() {
		return usrPerson;
	}

	public void setUsrPerson(UsrPerson usrPerson) {
		this.usrPerson = usrPerson;
	}

	public void setPrdFinanceAreaService(PrdFinanceAreaService prdFinanceAreaService) {
		this.prdFinanceAreaService = prdFinanceAreaService;
	}

	public List<PrdExtendsValue> getExtendsValueList() {
		return extendsValueList;
	}

	public void setExtendsValueList(List<PrdExtendsValue> extendsValueList) {
		this.extendsValueList = extendsValueList;
	}

	public Integer getGroupType() {
		return groupType;
	}

	public void setGroupType(Integer groupType) {
		this.groupType = groupType;
	}
	
	
}
