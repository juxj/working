package com.zj198.action.loan;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.model.DicCity;
import com.zj198.model.DicCommon;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.OrdApplyUsrPerson;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.OrdCheckLog;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdExtendsValue;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.ApplyUserService;
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
	private ApplyUserService applyUserService;
	private OrdFinanceApply apply;
	private PrdFinance product;
	private FinanceApplySpModel spModel = new FinanceApplySpModel();
	// 行业级联
	private List<DicIndustry> industryList;
	private Integer industryId;
	private List<OrdCheckLog> applyCheckList;
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
	private Map<String,String> profileMap;
	private Integer applyId;
	private String copy;   //用户选择是否把融资详细信息填写到   用户中心表里面
	private Integer oaucId;  //生成的融资申请单id
	public String execute() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			msg = "1";//对不起！您尚未登录，请登录后再提交申请。
			return "applyFailure";
		}else if(user.getAuditstatus() == null || user.getAuditstatus().intValue() < 2){
			msg = "2";//您的帐号还未通过审核，请完善用户信息并通过审核后，再申请融资。
			return "applyFailure";
		}
		int userGroup = user.getUserTypeGroup().intValue();

		product = financeProductService.getFinance(product.getId());
		extendsPropertyList = financeProductService.getFinancePropertys(product.getId());
		int financeType = product.getFinanceType().intValue();
		if (financeType == 151) {// 企业经营贷款
			if (userGroup != 1) {
				msg = "3";//只有企业用户可以申请企业经营性贷款
				return "applyFailure";
			}else{
//				UsrCompany usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
//				if(usrCompany.getCompleteratebase() < 100){
//					msg = "企业信息不完整，请补充完整!";
//					return "complementUserInfo";
//				}
			}
			usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
				String st="";
				if(usrCompany.getIndustryid()!=null && usrCompany.getIndustryid()!=0){
					st=dictoryDataService.getIndustryById(usrCompany.getIndustryid()).getName();
				}
				profileMap=new HashMap<String,String>();
				profileMap.put("industry", st);
				profileMap.put("bizaddress",dictoryDataService.getPCDNameByIds(usrCompany.getBizprovinceid(), usrCompany.getBizcityid(), usrCompany.getBizdistrictid()));
				profileMap.put("eduAtion", dictoryDataService.getValueNameById(usrCompany.getLpeducation()));
			return companyInfoEdit();
			//return busiApplyFirst();
		}
		if (financeType == 152) {// 个人经营贷款
			if (userGroup != 5) {
				msg = "4";//只有个人用户才能申请个人经营贷款
				return "applyFailure";
			}else{
//				UsrPerson usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
//				if(usrPerson.getCompleterate() < 100){
//					msg = "用户信息不完整，请补充完整!";
//					return "complementUserInfo";
//				}
			}
			profileMap=new HashMap<String,String>();
			usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
			profileMap.put("address", dictoryDataService.getPCDNameByIds(usrPerson.getProvinceid(), usrPerson.getCityid(), usrPerson.getDistrictid()));
			profileMap.put("psersoncareer",dictoryDataService.getValueNameById(usrPerson.getCareerid()) );
			profileMap.put("eduAtion",dictoryDataService.getValueNameById(usrPerson.getEducation()) );
			return personcInfo();
		}
		/*
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
		}*/

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
			UsrCompany oldUsrCompany = (UsrCompany)profileService.getProfiles(user.getId());
			usrCompany.setAuditFields(oldUsrCompany);
			if(copy != null && copy.equalsIgnoreCase("1")){
				oldUsrCompany.setLoanFields(usrCompany);
				profileService.saveorupdate(oldUsrCompany);
			}
			OrdApplyUsrCompany ucmo = new OrdApplyUsrCompany();
			BeanUtils.copyProperties(usrCompany, ucmo);
			//if(message.startsWith("0#")){
				List<FinanceAreaModel> pms = prdFinanceAreaService.findFiananceArea(product.getId());
				if(pms != null && pms.size() > 0){
					for(FinanceAreaModel j : pms){
						if (j.getProvinceId() == 0 || j.getProvinceId() == null) {
							applyUserService.addCompDetail(ucmo);
							break;
						} else if (j.getProvinceId() == usrCompany.getRegprovinceid() && j.getCityId() == 0) {
							applyUserService.addCompDetail(ucmo);
							break;
						} else if(j.getProvinceId() == usrCompany.getRegprovinceid() && j.getCityId() == usrCompany.getRegcityid()){
							applyUserService.addCompDetail(ucmo);
							break;
						} else{
							applyUserService.addCompDetail(ucmo);
							msg = "5";
							return "applyFailure";
						}
					}
				}else{
					applyUserService.addCompDetail(ucmo);
				}
				oaucId=ucmo.getId();
			}
		//}
		return "busi_apply_first";
	}


	public String perruntApplyFirst() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			msg = "对不起！您尚未登录，请登录后再提交申请。";
			return "applyFailure";
		}
		product = financeProductService.getFinance(product.getId());
		industryList = dictoryDataService.findIndustryByParentid(0);
		extendsPropertyList = financeProductService.getFinancePropertys(product.getId());
		if(product != null){
			UsrPerson oldUsrPerson = (UsrPerson)profileService.getProfiles(user.getId());
			OrdApplyUsrPerson upmo = new OrdApplyUsrPerson();
			BeanUtils.copyProperties(oldUsrPerson, upmo);
			applyUserService.addPersDetail(upmo);
			oaucId=upmo.getId();
		}
		return "perrunApplyFirst";
	}

	public String applySecond() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		spModel = new FinanceApplySpModel();
		spModel.setExtendsProValues(extendsProValues);
		Map<?,?> param = context.getParameters();
		spModel.setParamap(param);
		
		financeApplyService.saveFinanceApply(apply, product.getId(), user, spModel);
		if(oaucId != null && oaucId != 0){
			if(user.getUserTypeGroup() == Constants.USERTYPE_GROUP_COMPANY){
				OrdApplyUsrCompany ordApplyUsrCompany = applyUserService.getOrdApplyUsrCompanyById(oaucId);
				ordApplyUsrCompany.setApplyId(apply.getId());
				applyUserService.updateCompDetail(ordApplyUsrCompany);
			}else if(user.getUserTypeGroup() == Constants.USERTYPE_GROUP_PERSONAL){
				OrdApplyUsrPerson ordApplyUsrPerson = applyUserService.getOrdApplyUsrPersonById(oaucId);
				ordApplyUsrPerson.setApplyId(apply.getId());
				applyUserService.updateCompDetail(ordApplyUsrPerson);
			}
		}
		return "apply_second";
	}
	
	public String applyCheckList(){
		applyCheckList = financeApplyService.findApplyCheck(applyId);
		return "applyCheckList";
	}

	/**
	 * 
	 * @Author zeroleavebaoyang@gmail.com
	 * @Description 行业异步级联显示
	 * @return
	 */
	public String industry() {
		industryList = dictoryDataService.findIndustryByParentid(industryId);
		return "industryList";
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

	public FinanceApplySpModel getSpModel() {
		return spModel;
	}

	public void setSpModel(FinanceApplySpModel spModel) {
		this.spModel = spModel;
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

	public List<OrdCheckLog> getApplyCheckList() {
		return applyCheckList;
	}

	public void setApplyCheckList(List<OrdCheckLog> applyCheckList) {
		this.applyCheckList = applyCheckList;
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

	public String getCopy() {
		return copy;
	}

	public void setCopy(String copy) {
		this.copy = copy;
	}

	public Integer getOaucId() {
		return oaucId;
	}

	public void setOaucId(Integer oaucId) {
		this.oaucId = oaucId;
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

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public void setApplyUserService(ApplyUserService applyUserService) {
		this.applyUserService = applyUserService;
	}

	public void setPrdFinanceAreaService(PrdFinanceAreaService prdFinanceAreaService) {
		this.prdFinanceAreaService = prdFinanceAreaService;
	}

	
	
}
