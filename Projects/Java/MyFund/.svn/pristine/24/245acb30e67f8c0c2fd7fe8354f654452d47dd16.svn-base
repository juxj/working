package com.zj198.action.loan;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.ClbRequestInfo;
import com.zj198.model.ClbSupplyInfo;
import com.zj198.model.DicIndustry;
import com.zj198.model.KnwTitle;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdServiceItem;
import com.zj198.service.club.SupplyRequestService;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.news.NewsService;
import com.zj198.service.sin.ServiceInfoService;
import com.zj198.util.Constants;

public class LoanServiceAction extends BaseAction {
	private ServiceInfoService serviceInfoService;
	private FinanceProductService financeProductService;
	private DictoryDataService dictoryDataService;
	private SupplyRequestService supplyRequestService;
	private NewsService newsService;
	
	private List<KnwTitle> finacialNewsList;
	private List<KnwTitle> financingGuideList;
	private List<ClbRequestInfo> requestInfoList;
	private List<ClbSupplyInfo> supplyInfoList;
	private List<PrdFinance> prdFinanceList;
	private List<DicIndustry> industryList;// 行业
	private List<PrdServiceItem> serviceItemList;
	
	public String execute() {
		this.financingGuideList =  this.newsService.findLastestByType(Constants.FINANCING_GUIDE, 5);
		this.finacialNewsList =  this.newsService.findLastestByType(Constants.FINANCING_NEWS, 5);
		industryList = dictoryDataService.findIndustryByParentid(0);
		this.serviceItemList = this.serviceInfoService.findPrdServiceItemByRecentN(5);
		prdFinanceList = financeProductService.findFinanceImportent(new Integer(5));
		
		requestInfoList = supplyRequestService.findLastRequestInfo(10);
		supplyInfoList = supplyRequestService.findLastSupplyInfo(10);
		
		return "financing";
	}

	public List<KnwTitle> getFinacialNewsList() {
		return finacialNewsList;
	}

	public void setFinacialNewsList(List<KnwTitle> finacialNewsList) {
		this.finacialNewsList = finacialNewsList;
	}

	public List<KnwTitle> getFinancingGuideList() {
		return financingGuideList;
	}

	public void setFinancingGuideList(List<KnwTitle> financingGuideList) {
		this.financingGuideList = financingGuideList;
	}

	public List<ClbRequestInfo> getRequestInfoList() {
		return requestInfoList;
	}

	public void setRequestInfoList(List<ClbRequestInfo> requestInfoList) {
		this.requestInfoList = requestInfoList;
	}

	public List<ClbSupplyInfo> getSupplyInfoList() {
		return supplyInfoList;
	}

	public void setSupplyInfoList(List<ClbSupplyInfo> supplyInfoList) {
		this.supplyInfoList = supplyInfoList;
	}

	public List<PrdFinance> getPrdFinanceList() {
		return prdFinanceList;
	}

	public void setPrdFinanceList(List<PrdFinance> prdFinanceList) {
		this.prdFinanceList = prdFinanceList;
	}

	public List<DicIndustry> getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List<DicIndustry> industryList) {
		this.industryList = industryList;
	}

	public List<PrdServiceItem> getServiceItemList() {
		return serviceItemList;
	}

	public void setServiceItemList(List<PrdServiceItem> serviceItemList) {
		this.serviceItemList = serviceItemList;
	}

	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setSupplyRequestService(SupplyRequestService supplyRequestService) {
		this.supplyRequestService = supplyRequestService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
}
