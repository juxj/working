package com.zj198.action.news;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zj198.action.BaseAction;
import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;
import com.zj198.model.PrdRecommendation;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.news.NewsService;
import com.zj198.util.Constants;

public class InfoAction extends BaseAction {

	private static final Integer pageSize = 20;
	private Integer typeId = 0;
	private Integer pageNo = 1;
	private KnwTitle knwTitle;
	private List<KnwType> knwTypeList;
	
	private NewsService newsService;
//	private FinanceProductService financeProductService;
	private FinanceProdService financeProdService;
	private KnwType knwType;

	private List<KnwTitle> siteNews;

	private List<PrdRecommendation> bankFinanceRecommendationList;

//	/**热门融资产品*/
	private List<PrdRecommendation> prdFinanceList;
	
	private Integer id;
	
	/**
	 * 常见问题
	 * 注册与登陆
	 * 融资与服务
	 * 服务协议与规则
	 */
	private Map<String,List<KnwTitle>> knwTitleMap;
	
	@Override
	public String execute() throws Exception {
		this.knwTitle = newsService.getKnwTitleById(id);
		if(knwTitle.getTypeId() == Constants.NEWS_COMMON_ISSUES || 
				knwTitle.getTypeId() == Constants.NEWS_REGISTER_LOGIN || 
				knwTitle.getTypeId() == Constants.NEWS_FINANCING_SERVICE || 
				knwTitle.getTypeId() == Constants.NEWS_SERVICE_AGREEMENT){
			knwTitleMap = new HashMap<String, List<KnwTitle>>();
			knwTitleMap.put("NEWS_COMMON_ISSUES", newsService.findKnwTitleByType(Constants.NEWS_COMMON_ISSUES));
			knwTitleMap.put("NEWS_REGISTER_LOGIN", newsService.findKnwTitleByType(Constants.NEWS_REGISTER_LOGIN));
			knwTitleMap.put("NEWS_FINANCING_SERVICE", newsService.findKnwTitleByType(Constants.NEWS_FINANCING_SERVICE));
			knwTitleMap.put("NEWS_SERVICE_AGREEMENT", newsService.findKnwTitleByType(Constants.NEWS_SERVICE_AGREEMENT));
			return "common";
		}else if(knwTitle.getTypeId() == Constants.NEWS_FINANCING_DICTIONARY){
			siteNews = newsService.findKnwTitleByType(Constants.NEWS_FINANCING_DICTIONARY);
			return "knowledge";
		}else if(knwTitle.getTypeId() == Constants.NEWS_FINACING_ENCYCLOPEDIA){
			siteNews = newsService.findKnwTitleByType(Constants.NEWS_FINACING_ENCYCLOPEDIA);	
			return "knowledge";
		}else{
			bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 5);
			prdFinanceList = financeProdService.findRecommendationByTopNumber(Constants.PRD_RECOMMEND_TYPE_LOAN, 5);
			return "detail";
		}
	}
	
	public String infoGroup() {
		this.bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 5);
		knwTypeList = newsService.findAllKnwType();
		knwType = newsService.getKnwTypeById(typeId);
		pager = newsService.findKnwTitleByType(typeId, pageSize, pageNo, Short.valueOf("1"), 1);
		return SUCCESS;
	}
	
	//公告专用
	public String gonggao(){
		siteNews = newsService.findKnwTitleByType(Constants.ANNOUNCED_NEWS);
		return "gonggao";
	}
	
	//setter and getter
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public KnwType getKnwType() {
		return knwType;
	}
	public void setKnwType(KnwType knwType) {
		this.knwType = knwType;
	}
	public KnwTitle getKnwTitle() {
		return knwTitle;
	}
	public List<KnwType> getKnwTypeList() {
		return knwTypeList;
	}
	public List<KnwTitle> getSiteNews() {
		return siteNews;
	}
	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}
	public List<PrdRecommendation> getPrdFinanceList() {
		return prdFinanceList;
	}
	public Map<String, List<KnwTitle>> getKnwTitleMap() {
		return knwTitleMap;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
//	public void setFinanceProductService(FinanceProductService financeProductService) {
//		this.financeProductService = financeProductService;
//	}
	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}
	public void setId(Integer id) {
		this.id = id;
	}	

}
