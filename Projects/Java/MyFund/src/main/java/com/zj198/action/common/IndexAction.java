package com.zj198.action.common;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;
import com.zj198.model.PrdBankfinance;
import com.zj198.model.PrdRecommendation;
import com.zj198.model.PrdServiceItem;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.news.NewsService;
import com.zj198.service.sin.ServiceInfoService;
import com.zj198.util.Constants;

public class IndexAction extends BaseAction{
	
	private List<PrdBankfinance> bankFinanceList;
	/*融资案例*/
	private List<KnwTitle> financingCases;
	/*新闻-政府动态*/
	private List<KnwTitle> govermentNews;
	/*新闻-金融快讯*/
	private List<KnwTitle> financeNews;
	/*新闻-资金网动态*/
	private List<KnwTitle> siteNews;
	
	private List<PrdRecommendation> bankFinanceRecommendationList;
	
	private List<KnwType> newsTypeList;
	private List<PrdServiceItem> serviceItemList;
	private List<PrdRecommendation> prdFinanceList;
	
	private FinanceProdService financeProdService;
	private NewsService newsService;
	private ServiceInfoService serviceInfoService;
	private FinanceProductService financeProductService;
	
	//整站首页
	public String execute(){
		bankFinanceList = financeProdService.findByBenefitRate(3);
		this.getNewsRelatedData();
		this.getServiceInfoList();
		this.getImportentProduct();
		return SUCCESS;
	}
	public void getImportentProduct(){
		prdFinanceList = financeProdService.findRecommendationByTopNumber(Constants.PRD_RECOMMEND_TYPE_LOAN, 4);
		this.bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1,4);
	}
	//整站首页
	public String building(){
		return "building";
	}
	private void getServiceInfoList() {
		this.serviceItemList = this.serviceInfoService.findPrdServiceItemByRecentN(5);
	}
	
	private void getNewsRelatedData() {
		//融资案例
		this.financingCases = newsService.findLastestByType(Constants.FINANCING_CASE,5);
		//政府动态
		this.govermentNews = newsService.findLastestByType(Constants.GOVERMENT_NEWS,5);
		//金融资讯
		this.financeNews = newsService.findLastestByType(Constants.FINANCE_NEWS,5);
		//资金网动态
		this.siteNews = newsService.findLastestByType(Constants.SITE_NEWS,5);
	}
	
	//setter and getter
	public List<PrdBankfinance> getBankFinanceList() {
		return bankFinanceList;
	}
	public List<KnwType> getNewsTypeList() {
		return newsTypeList;
	}
	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
	public List<PrdServiceItem> getServiceItemList() {
		return serviceItemList;
	}
	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
	}
	public List<KnwTitle> getFinancingCases() {
		return financingCases;
	}
	public List<KnwTitle> getGovermentNews() {
		return govermentNews;
	}
	public List<KnwTitle> getFinanceNews() {
		return financeNews;
	}
	public List<KnwTitle> getSiteNews() {
		return siteNews;
	}
	public List<PrdRecommendation> getPrdFinanceList() {
		return prdFinanceList;
	}
	public void setPrdFinanceList(List<PrdRecommendation> prdFinanceList) {
		this.prdFinanceList = prdFinanceList;
	}
	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}
	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}
	
}
