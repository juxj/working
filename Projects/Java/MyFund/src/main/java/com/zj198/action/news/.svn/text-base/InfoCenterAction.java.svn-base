package com.zj198.action.news;

import java.util.ArrayList;
import java.util.List;

import com.zj198.model.DicCommon;
import com.zj198.model.KnwTitle;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.news.NewsService;
import com.zj198.util.Constants;

public class InfoCenterAction {

	private List<KnwTitle> siteNewsList;
	private List<KnwTitle> financingNewsList;
	private List<KnwTitle> finacialNewsList;
	private List<KnwTitle> govermentNewsList;
	private List<KnwTitle> faqNews;
	
	private List<KnwTitle> financingDictionaryList;
	private List<KnwTitle> financingEncyclopediaList;
	private List<KnwTitle> commonIssueList;
	private List<KnwTitle> registerLoginList;
	private List<KnwTitle> financingServiceList;
	private List<KnwTitle> serviceAgreementList;

	private DictoryDataService dictoryDataService;
	private List<DicCommon> commons;

	private NewsService newsService;

	public String execute() {
		commons = dictoryDataService.findCommonDataByGroupId(53);
		List<DicCommon> j = new ArrayList<DicCommon>();
		for (DicCommon d : commons) {
			if (d.getName().equals("资产管理") || d.getName().equals("财务公司") || d.getName().equals("期货公司")) {
				j.add(d);
			}
		}
		commons.removeAll(j);
		siteNewsList = newsService.findLastestByType(Constants.SITE_NEWS, 5);
		finacialNewsList = newsService.findLastestByType(Constants.FINANCE_NEWS, 5);
		this.govermentNewsList = newsService.findLastestByType(Constants.GOVERMENT_NEWS, 5);
		
		this.financingDictionaryList = newsService.findLastestByType(Constants.NEWS_FINANCING_DICTIONARY, 5);
		this.financingEncyclopediaList = newsService.findLastestByType(Constants.NEWS_FINACING_ENCYCLOPEDIA, 5);
		this.commonIssueList = newsService.findLastestByType(Constants.NEWS_COMMON_ISSUES, 10);
		this.registerLoginList = newsService.findLastestByType(Constants.NEWS_REGISTER_LOGIN, 5);
		this.financingServiceList = newsService.findLastestByType(Constants.NEWS_FINANCING_SERVICE, 5);
		this.serviceAgreementList = newsService.findLastestByType(Constants.NEWS_SERVICE_AGREEMENT, 5);
		
		return "center";
	}

	

	public List<KnwTitle> getFaqNews() {
		return faqNews;
	}

	public void setFaqNews(List<KnwTitle> faqNews) {
		this.faqNews = faqNews;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public List<DicCommon> getCommons() {
		return commons;
	}

	public void setCommons(List<DicCommon> commons) {
		this.commons = commons;
	}



	public List<KnwTitle> getSiteNewsList() {
		return siteNewsList;
	}



	public List<KnwTitle> getFinancingNewsList() {
		return financingNewsList;
	}



	public List<KnwTitle> getGovermentNewsList() {
		return govermentNewsList;
	}



	public List<KnwTitle> getFinacialNewsList() {
		return finacialNewsList;
	}



	public List<KnwTitle> getFinancingDictionaryList() {
		return financingDictionaryList;
	}



	public List<KnwTitle> getFinancingEncyclopediaList() {
		return financingEncyclopediaList;
	}



	public List<KnwTitle> getCommonIssueList() {
		return commonIssueList;
	}



	public List<KnwTitle> getRegisterLoginList() {
		return registerLoginList;
	}



	public List<KnwTitle> getFinancingServiceList() {
		return financingServiceList;
	}



	public List<KnwTitle> getServiceAgreementList() {
		return serviceAgreementList;
	}
	
	

}
