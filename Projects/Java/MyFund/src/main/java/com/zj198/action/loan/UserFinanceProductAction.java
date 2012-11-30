package com.zj198.action.loan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.PreviewFinanceProSrModel;
import com.zj198.model.DicCommon;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicUsertype;
import com.zj198.model.PrdDatafileList;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.model.PrdPropertyDic;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.model.vo.FinanceIndustryModel;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.OrdLrRecommendService;
import com.zj198.service.loan.model.FinanceProductSpModel;
import com.zj198.service.loan.model.FinanceProductSrModel;
import com.zj198.util.Constants;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 14:54:57
 * @modify zeroleavebaoyang@gmail.com
 * @since 2012-7-18 | 13:23:49
 */
public class UserFinanceProductAction extends BaseAction {
	private FinanceProductService financeProductService;
	private DictoryDataService dictoryDataService;
	private List<PrdFinance> productList;
	private PrdFinance product;
	private Integer productId;
	private FinanceProductSpModel financeProductSpModel;
	private List<PrdDatafileList> dataFileList;
	private Map<String, List<?>> dataMap;
	private List<DicUsertype> finaceTypeList;
	private List<DicCommon> mortgageTypeList;
	private List<DicCommon> repaymentTypeList;
	private List<DicCommon> purposeTypeList;
	private List<FinanceAreaModel> productAreaList;
	private List<FinanceIndustryModel> productIndustryList;
	// ajax二级联动ID
	private Integer purposeId;
	private Integer industryId;

	// 行业级联
	private List<DicIndustry> industryList;
	// 产品推荐列表
	private List<PrdFinance> recommendProducts;
	// 快速申请ID
	private Integer requestId;
	// 快速申请类型
	private Integer appId;
	/**
	 * 重新发布产品标志
	 */
	private Integer repeatStatus;
	// 产品推荐service
	private OrdLrRecommendService ordLrRecommendService;
	/**
	 * 银行或其它贷款机构产品管理
	 * @return
	 */
	public String execute() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if(user == null){
			return ERROR;
		}
		productList = financeProductService.findFinanceByUser(user.getId());
		
		return "financeMana";
	}
	
	
	
	public String viewFinance(){
		product = financeProductService.getFinance(productId);
		productAreaList = financeProductService.findFiananceArea(productId);
		productIndustryList = financeProductService.findFiananceInducty(productId);
		financeProductSpModel = new FinanceProductSpModel();
		financeProductSpModel.setExtendsPropertyList(financeProductService.getFinancePropertys(productId));
		if(product.getOtherRequire() != null){
			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
		}
		if(product.getProIntroduce() != null){
			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
		}
		if(product.getDataFiles() != null){			
			for(PrdFinanceDatafile df: product.getDataFiles()){
				if(df.getOtherMemo() != null){
					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
				}
			}
		}
		
		
		return "view_finance";
	}
	
	public String updateStatus(){
		financeProductService.updateFinanceStatus(product);
		return "update_success";
	}

	public String newfin() {
		dataFileList = financeProductService.findDataFileListAll();
		return "new_finanace_page";
	}

	/**
	 * @description: 金融机构：产品推荐显示,过滤条件(贷款类型,当前用户创建的产品...)
	 * @author: zeroleavebaoyang@gmail.com
	 * @since: 2012-7-18 | 11:04:12
	 * @return
	 */
	public String recommendProduct() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		Integer financeType = -1;
		// 由于需求申请类型和产品贷款类型没有做关系映射, 只能将其写成swich(个人综合消费申请137=个人综合消费贷款152)
		switch (appId) {
		case 136:
			financeType = 151;
			break;
		case 137:
			financeType = 152;
			break;
		case 138:
			financeType = 153;
			break;
		case 139:
			financeType = 154;
			break;
		}
		// 该需求已经被选择过的产品ID集合
		List<Integer> selectIds = ordLrRecommendService.getByRequestId(requestId, 0);

		recommendProducts = financeProductService.getRecProByLoan(new Object[] { user.getId(), financeType });
		// 循环所有的推荐产品与已经选择过的产品比对,如果已被选择 就标示为 选中isRecommend(1)
		if (selectIds != null && selectIds.size() > 0) {
			for (PrdFinance o : recommendProducts) {
				for (Integer id : selectIds) {
					if (id == o.getId()) {
						o.setIsRecommend(1);
						break;
					}
				}
			}
		}
		return "recommend";
	}
	
	/**
	 * 融资产品预览
	 * @return
	 */
	public String previewfin(){
		financeProductSpModel.setProduct(product);
		PreviewFinanceProSrModel srmodel = financeProductService.priviewFinance(financeProductSpModel);
		productAreaList = srmodel.getProductAreaList();
		productIndustryList = srmodel.getProductIndustryList();
		financeProductSpModel.setExtendsPropertyList(srmodel.getExtendsPropertyList());
		return "view_finance";
	}
	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 14:54:57
	 * @param
	 * @return
	 */
	public String savefin() {
		// INIT
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		financeProductSpModel.setProduct(product);
//		financeProductSpModel.setUserId(user.getId());
//		financeProductSpModel.setUserType(Integer.valueOf(user.getType()));
		financeProductSpModel.setUser(user);
		financeProductService.saveFinance(financeProductSpModel);
		productAreaList = financeProductService.findFiananceArea(product.getId());
		productIndustryList = financeProductService.findFiananceInducty(product.getId());
		
		if(product.getOtherRequire() != null){
			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
		}
		if(product.getProIntroduce() != null){
			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
		}
		if(product.getDataFiles() != null){			
			for(PrdFinanceDatafile df: product.getDataFiles()){
				if(df.getOtherMemo() != null){
					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
				}
			}
		}
		
		return "view_finance";
	}

	public String updateFinancePage() {
		financeProductSpModel = financeProductService.getFinanceProductToEdit(product.getId());
		product = financeProductSpModel.getProduct();
		dataFileList = financeProductSpModel.getDataFileList();
		return "update_finance_page";
	}
	
	public String updatefin() {
		if(repeatStatus != null && repeatStatus.intValue() == 1){
			return savefin();
		}
		// INIT
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		financeProductSpModel.setProduct(product);
//		financeProductSpModel.setUserId(user.getId());
		financeProductSpModel.setUser(user);
		FinanceProductSrModel srModel = financeProductService.updateFinance(financeProductSpModel);
		product = srModel.getProduct();
		productAreaList = financeProductService.findFiananceArea(product.getId());
		productIndustryList = financeProductService.findFiananceInducty(product.getId());
		financeProductSpModel.setExtendsPropertyList(srModel.getExtendsPropertyList());
		
		if(product.getOtherRequire() != null){
			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
		}
		if(product.getProIntroduce() != null){
			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
		}
		if(product.getDataFiles() != null && product.getDataFiles().size() > 0){			
			for(PrdFinanceDatafile df: product.getDataFiles()){
				if(df.getOtherMemo() != null){
					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
				}
			}
		}
		
		return "view_finance";
	}

	
	public String extendsPro(){
		List<PrdExtendsProperty> plist = new ArrayList<PrdExtendsProperty>();
		if(financeProductSpModel.getExtendsName() != null && financeProductSpModel.getExtendsName().length > 0){
			int j = 0;
			for(int i = 0; i< financeProductSpModel.getExtendsName().length; i++){
				PrdExtendsProperty pro = new PrdExtendsProperty();
				pro.setExtendsType(Constants.EXTENDS_PROPERTY_FINANCE);
				pro.setRowId(product.getId());
				pro.setFieldName(financeProductSpModel.getExtendsName()[i]);
				pro.setFieldType(financeProductSpModel.getExtendsType()[i]);
				String pv = "";
				if(financeProductSpModel.getExtendsType()[i] == 3 || financeProductSpModel.getExtendsType()[i] == 4){
					pv = financeProductSpModel.getExtendsValue()[j++];
					pro.setFieldValue(pv);
				}
				pro.setFieldvalueNullAble(0);
				pro.setStatus(0);
				
				if(financeProductSpModel.getExtendsType()[i] == 3 || financeProductSpModel.getExtendsType()[i] == 4){
					if(pv != null && pv.length() > 0){
						String[] pstr = pv.split("#");
						Set<PrdPropertyDic> dicSet = new LinkedHashSet<PrdPropertyDic>();
						for(int k = 0; k < pstr.length; k++){
							PrdPropertyDic dic = new PrdPropertyDic();
							dic.setGroupId(pro.getId());
							dic.setDicValue(k + 1);
							dic.setDicName(pstr[k]);
							dicSet.add(dic);
						}
						pro.setPropertyDicSet(dicSet);
					}
				}
				plist.add(pro);
			}
		}
		financeProductSpModel.setExtendsPropertyList(plist);
		
		return "previewExtendsProperty";
	}


	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 14:54:57
	 * @param
	 * @return
	 */
	public String searchDateFile() {
		// INIT
		financeProductService.searchDateFile();
		return "searchDateFile";
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	/**
	 * 
	 * @Author zeroleavebaoyang@gmail.com
	 * @Description 用途异步级联显示
	 * @return
	 */
	public String purpose() {
		purposeTypeList = dictoryDataService.findCommonDataByGroupId(purposeId);
		return "purposeTypeList";
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

	/**
	 * 待筛选的条件列表
	 */
	private void getMapSource() {
		// 从DIC_USERTYPE中取得融资渠道类型
		dataMap = new HashMap<String, List<?>>();
		finaceTypeList = (List<DicUsertype>) dictoryDataService.findUserTypeByGroup(3);
		// 从DIC_COMMON中取得融资担保方式
		mortgageTypeList = dictoryDataService.findCommonDataByGroupId(35);
		// 从DIC_COMMON中取得融资担保方式
		repaymentTypeList = dictoryDataService.findCommonDataByGroupId(34);
		dataMap.put("finaceType", finaceTypeList);
		dataMap.put("mortgageType", mortgageTypeList);
		dataMap.put("repaymentType", repaymentTypeList);
	}

	//setter and getter

	public List<PrdFinance> getProductList() {
		return productList;
	}



	public void setProductList(List<PrdFinance> productList) {
		this.productList = productList;
	}



	public PrdFinance getProduct() {
		return product;
	}



	public void setProduct(PrdFinance product) {
		this.product = product;
	}



	public Integer getProductId() {
		return productId;
	}



	public void setProductId(Integer productId) {
		this.productId = productId;
	}



	public FinanceProductSpModel getFinanceProductSpModel() {
		return financeProductSpModel;
	}



	public void setFinanceProductSpModel(FinanceProductSpModel financeProductSpModel) {
		this.financeProductSpModel = financeProductSpModel;
	}



	public List<PrdDatafileList> getDataFileList() {
		return dataFileList;
	}



	public void setDataFileList(List<PrdDatafileList> dataFileList) {
		this.dataFileList = dataFileList;
	}



	public Map<String, List<?>> getDataMap() {
		return dataMap;
	}



	public void setDataMap(Map<String, List<?>> dataMap) {
		this.dataMap = dataMap;
	}



	public List<DicUsertype> getFinaceTypeList() {
		return finaceTypeList;
	}



	public void setFinaceTypeList(List<DicUsertype> finaceTypeList) {
		this.finaceTypeList = finaceTypeList;
	}



	public List<DicCommon> getMortgageTypeList() {
		return mortgageTypeList;
	}



	public void setMortgageTypeList(List<DicCommon> mortgageTypeList) {
		this.mortgageTypeList = mortgageTypeList;
	}



	public List<DicCommon> getRepaymentTypeList() {
		return repaymentTypeList;
	}



	public void setRepaymentTypeList(List<DicCommon> repaymentTypeList) {
		this.repaymentTypeList = repaymentTypeList;
	}



	public List<DicCommon> getPurposeTypeList() {
		return purposeTypeList;
	}



	public void setPurposeTypeList(List<DicCommon> purposeTypeList) {
		this.purposeTypeList = purposeTypeList;
	}



	public List<FinanceAreaModel> getProductAreaList() {
		return productAreaList;
	}



	public void setProductAreaList(List<FinanceAreaModel> productAreaList) {
		this.productAreaList = productAreaList;
	}



	public List<FinanceIndustryModel> getProductIndustryList() {
		return productIndustryList;
	}



	public void setProductIndustryList(
			List<FinanceIndustryModel> productIndustryList) {
		this.productIndustryList = productIndustryList;
	}



	public Integer getPurposeId() {
		return purposeId;
	}



	public void setPurposeId(Integer purposeId) {
		this.purposeId = purposeId;
	}



	public Integer getIndustryId() {
		return industryId;
	}



	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}



	public List<DicIndustry> getIndustryList() {
		return industryList;
	}



	public void setIndustryList(List<DicIndustry> industryList) {
		this.industryList = industryList;
	}



	public List<PrdFinance> getRecommendProducts() {
		return recommendProducts;
	}



	public void setRecommendProducts(List<PrdFinance> recommendProducts) {
		this.recommendProducts = recommendProducts;
	}



	public Integer getRequestId() {
		return requestId;
	}



	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}



	public Integer getAppId() {
		return appId;
	}



	public void setAppId(Integer appId) {
		this.appId = appId;
	}



	public Integer getRepeatStatus() {
		return repeatStatus;
	}



	public void setRepeatStatus(Integer repeatStatus) {
		this.repeatStatus = repeatStatus;
	}



	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}



	public void setOrdLrRecommendService(OrdLrRecommendService ordLrRecommendService) {
		this.ordLrRecommendService = ordLrRecommendService;
	}
	


}
