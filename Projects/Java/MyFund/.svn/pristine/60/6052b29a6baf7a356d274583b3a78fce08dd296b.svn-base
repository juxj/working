package com.zj198.action.news;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.zj198.model.KnwTitle;
import com.zj198.service.news.NewsService;
import com.zj198.util.Pagination;

public class NewsAction implements Action{
	private Integer typeId;
	private int pageSize = 20;
	private int pageNo;
	private KnwTitle knwTitle;
	private List<KnwTitle> listKnwTitle;
	private NewsService newsService;
	
	@SuppressWarnings("unchecked")
	public String execute(){
		if(typeId==1){  //1为政府动态
//			Map<String, Object> map = newsService.findKnwTitleByType(typeId, pageSize, 0);
//			listKnwTitle = (List<KnwTitle>) map.get("list");
//			Pagination p = (Pagination) map.get("pagination");
			return "government";
		}else if(typeId==2){  //2为金融资讯
			return "financeInformation";
		}else if(typeId==3){  //3为资金网动态
			return "zjTrends";
		}
		return ERROR;
	}
	
    //get and set
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
	public List<KnwTitle> getListKnwTitle() {
		return listKnwTitle;
	}
	public KnwTitle getKnwTitle() {
		return knwTitle;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
