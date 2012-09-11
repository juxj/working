package com.zj198.action.admin.news;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.KnwType;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.news.NewsService;

public class KnwTypeAction extends BaseAction {

	private KnwType knwType;
	private List<KnwType> knwTypeList;
	private Integer typeId;
	private NewsService newsService;
	private DictoryDataService dictoryDataService;
	private List<DicCommon> showOnPageList;
	
	
	
	@Override
	public String execute() throws Exception {
		return null;
	}
	
	
	public String showHome() {
		this.knwTypeList = this.newsService.findAllKnwType();
		return SUCCESS;
	}
	
	public String save() {
		this.newsService.saveKnwType(knwType);
		return this.showHome();
	}
	
	public String delete() {
		if (this.typeId != null) {
			this.knwType = newsService.getKnwTypeById(this.typeId);
			this.newsService.deleteKnwType(this.knwType);
		}
		return this.showHome();
	}
	
	public String edit() {
		this.showOnPageList = this.dictoryDataService.findCommonDataByGroupId(28);
		if (this.typeId == null) {
			this.knwType = new KnwType();
		} else {
			this.knwType = newsService.getKnwTypeById(this.typeId);
		}
		return "edit";
	}


	public KnwType getKnwType() {
		return knwType;
	}


	public void setKnwType(KnwType knwType) {
		this.knwType = knwType;
	}


	public List<KnwType> getKnwTypeList() {
		return knwTypeList;
	}


	public void setKnwTypeList(List<KnwType> knwTypeList) {
		this.knwTypeList = knwTypeList;
	}


	public Integer getTypeId() {
		return typeId;
	}


	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}


	public NewsService getNewsService() {
		return newsService;
	}


	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}


	public List<DicCommon> getShowOnPageList() {
		return showOnPageList;
	}


	public void setShowOnPageList(List<DicCommon> showOnPageList) {
		this.showOnPageList = showOnPageList;
	}


	public DictoryDataService getDictoryDataService() {
		return dictoryDataService;
	}


	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	

}
