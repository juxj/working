package com.zj198.action.admin.loan;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.action.loan.model.PreviewFinanceProSrModel;
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
import com.zj198.service.loan.model.FinanceProductSpModel;
import com.zj198.service.loan.model.FinanceProductSrModel;
import com.zj198.service.user.AccountService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public class FinanceProductAdminAction extends BaseAction{
	private FinanceProductService financeProductService;
	private AccountService accountService;
	private DictoryDataService dictoryDataService;
	private List<PrdFinance> productList;
	private PrdFinance product;
	private Integer productId;
	private List<FinanceAreaModel> productAreaList;
	private List<FinanceIndustryModel> productIndustryList;
	private FinanceProductSpModel financeProductSpModel;
	
	private FindFinanceAdminSpModel spModel = new FindFinanceAdminSpModel();
	private List<PrdDatafileList> dataFileList;
	private String companyName;
	private String userName;
	
	public String execute() {
		return null;
	}
	
	public String financeAdmin(){
//		Map<String, Object> map = financeProductService.findFinanceAdmin(spModel);
//		this.productList = (List<OrdFinanceProduct>) map.get("list");
//		spModel.setPagination((Pagination) map.get("pagination"));
		
		spModel.setPager(this.getPagerObj());
		pager = financeProductService.findFinanceAdmin(spModel);
		return "finance_product_admin";
	}
	private Pager getPagerObj(){
		if(pager==null){
			pager = new Pager();
			pager.setPageCount(10);
			pager.setCurrentPage(1);
		}
		return pager;
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
		UsrUser user = accountService.getUserById(product.getUserId());
		userName = user.getUsername();
		companyName = dictoryDataService.getCompanyNameByUserId(user.getId());
		
		return "view_finance";
	}
	
	
	public String updateStatus(){
		financeProductService.updateFinanceStatus(product);
		return "update_success";
	}
	
	public String recommend(){
		financeProductService.updateRecommendFinance(product);
		return financeAdmin();
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
	public String updateFinancePage() {
		financeProductSpModel = financeProductService.getFinanceProductToEdit(product.getId());
		product = financeProductSpModel.getProduct();
		dataFileList = financeProductSpModel.getDataFileList();
		return "update_finance_page";
	}
	
	public String updatefin() {
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
	
	//setter and getter
	public List<PrdFinance> getProductList() {
		return productList;
	}

	public void setProductList(List<PrdFinance> productList) {
		this.productList = productList;
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
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

	public FinanceProductSpModel getFinanceProductSpModel() {
		return financeProductSpModel;
	}

	public void setFinanceProductSpModel(FinanceProductSpModel financeProductSpModel) {
		this.financeProductSpModel = financeProductSpModel;
	}

	public FinanceProductService getFinanceProductService() {
		return financeProductService;
	}

	public FindFinanceAdminSpModel getSpModel() {
		return spModel;
	}

	public void setSpModel(FindFinanceAdminSpModel spModel) {
		this.spModel = spModel;
	}

	public List<PrdDatafileList> getDataFileList() {
		return dataFileList;
	}

	public void setDataFileList(List<PrdDatafileList> dataFileList) {
		this.dataFileList = dataFileList;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

}
