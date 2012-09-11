package com.zj198.action.finance;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.DicBank;
import com.zj198.model.DicCommon;
import com.zj198.model.KnwTitle;
import com.zj198.model.PrdBankfinance;
import com.zj198.model.PrdRecommendation;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.util.Pager;
import com.zj198.util.Pagination;

public class BankProductAction extends BaseAction{
	
//	private static final Logger log = LoggerFactory.getLogger(BankProductAction.class);

	private final int pageSize = 20;
	private final int searchPageSize = 20;
	
	private Integer top;
	private String code;
	private int id;
	private String[] query;

	private Integer pageNo;
	private Pagination pagination;
	
	private PrdBankfinance prdBankfinance;
	private Pager pager;
	private FinanceProdService financeProdService;
	private DictoryDataService dictoryDataService;
	
	/**产品的状态，分为全部，预售，在售与停售*/
	private List<DicCommon> productStatus;
	/**投资周期，分为3个月以下,３-６个月...*/
	private List<DicCommon> investmentCycle;
	/**投资额度，分为 5万以下,　５-１０万...*/
	private List<DicCommon> investmentQuota;
	/**投资回报率*/
	private List<DicCommon> investmentReturnRate;
	/**银行列表*/
	private List<DicBank> bankList;
	/**基金类型**/
	private List<DicCommon> fundTypeList;
	/**基金公司*/
	private List<String> fundFirmList;
	
	private List<PrdRecommendation> bankFinanceRecommendationList;
	
	private List<KnwTitle> hotSaleItemsList;
	
	private void setBankList() {
		this.bankList = this.dictoryDataService.findDicBankList();
		DicBank emptyBank = new DicBank();
		emptyBank.setId(Integer.valueOf(0));
		emptyBank.setName("不限");
		bankList.add(0, emptyBank);
	}
	
	public String getList() throws Exception {
		this.intialize();
		pageNo = null==pageNo ? 1: pageNo;
		pager = this.financeProdService.findAll(pageSize, pageNo);
		return "home";
	}
	
	public String search() throws Exception {
		this.intialize();
		pageNo = null==pageNo ? 1: pageNo;
		pager = this.financeProdService.findBankProductsByMultiQuery(query, searchPageSize, pageNo);
		return "home";
	}
	
	public String showDetails() throws Exception {
		this.bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 5);
		prdBankfinance = financeProdService.getBankfinanceById(id);
		return "details";
	}
	
	
	private void intialize() {
		investmentCycle = this.dictoryDataService.findCommonDataByGroupId(10);
		this.investmentReturnRate = this.dictoryDataService.findCommonDataByGroupId(11);
		this.investmentQuota = this.dictoryDataService.findCommonDataByGroupId(12);
		productStatus = this.dictoryDataService.findCommonDataByGroupId(13);
		this.fundTypeList = this.dictoryDataService.findCommonDataByGroupId(4);
		DicCommon dc = new DicCommon();
		dc.setName("不限");
		this.fundTypeList.add(0, dc);
		this.fundFirmList = this.dictoryDataService.getUniqueFundFirmList();
		this.fundFirmList.add(0, "不限");
		this.setBankList();
	}
	
	//setter and getter
	public Integer getTop() {
		return top;
	}
	public FinanceProdService getFinanceProdService() {
		return financeProdService;
	}
	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}
	public void setTop(Integer top) {
		this.top = top;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public PrdBankfinance getPrdBankfinance() {
		return prdBankfinance;
	}
	public void setPrdBankfinance(PrdBankfinance prdBankfinance) {
		this.prdBankfinance = prdBankfinance;
	}
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
	
	public String[] getQuery() {
		return query;
	}

	public void setQuery(String[] query) {
		this.query = query;
	}

	public DictoryDataService getDictoryDataService() {
		return dictoryDataService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public List<DicBank> getBankList() {
		return bankList;
	}

	public void setBankList(List<DicBank> bankList) {
		this.bankList = bankList;
	}

	public List<DicCommon> getInvestmentCycle() {
		return investmentCycle;
	}

	public void setInvestmentCycle(List<DicCommon> investmentCycle) {
		this.investmentCycle = investmentCycle;
	}

	public List<DicCommon> getInvestmentQuota() {
		return investmentQuota;
	}

	public void setInvestmentQuota(List<DicCommon> investmentQuota) {
		this.investmentQuota = investmentQuota;
	}

	public List<DicCommon> getInvestmentReturnRate() {
		return investmentReturnRate;
	}

	public void setInvestmentReturnRate(List<DicCommon> investmentReturnRate) {
		this.investmentReturnRate = investmentReturnRate;
	}
	
	public List<DicCommon> getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(List<DicCommon> productStatus) {
		this.productStatus = productStatus;
	}

	public String execute(){
		return null;
	}
	
	public List<DicCommon> getFundTypeList() {
		return fundTypeList;
	}

	public void setFundTypeList(List<DicCommon> fundTypeList) {
		this.fundTypeList = fundTypeList;
	}

	public List<String> getFundFirmList() {
		return fundFirmList;
	}

	public void setFundFirmList(List<String> fundFirmList) {
		this.fundFirmList = fundFirmList;
	}

	public Pager getPager() {
		return pager;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}

	public List<KnwTitle> getHotSaleItemsList() {
		return hotSaleItemsList;
	}

//	public void setNewsService(NewsService newsService) {
//		this.newsService = newsService;
//	}


	
}
