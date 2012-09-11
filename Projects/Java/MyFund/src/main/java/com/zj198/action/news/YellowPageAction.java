package com.zj198.action.news;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.DicYellowpage;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.news.DicYellowpageService;

public class YellowPageAction extends BaseAction {

	private DicYellowpageService dicYellowpageService;
	private Integer type;
	private List<DicYellowpage> pages;
	private DictoryDataService dictoryDataService;
	private List<DicCommon> commons;


	public String execute() throws Exception {
		return null;
	}

	public String appendToIndex() {
		pages = dicYellowpageService.findPageByType(type);
		return "yellopage";
	}
	
	public String appendToIndex2() {
		pages = dicYellowpageService.findPageByTypeAll(type);
		return "yellopage";
	}

	public String appendAllList() {
		pages = dicYellowpageService.findPageByTypeAll(type);
		commons = dictoryDataService.findCommonDataByGroupId(53);
		return "appendAllList";
	}

	public void setDicYellowpageService(DicYellowpageService dicYellowpageService) {
		this.dicYellowpageService = dicYellowpageService;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public List<DicYellowpage> getPages() {
		return pages;
	}

	public void setPages(List<DicYellowpage> pages) {
		this.pages = pages;
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
}
