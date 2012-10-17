package com.zj198.action.admin.news;

import java.util.Calendar;
import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;
import com.zj198.service.news.NewsService;
import com.zj198.util.CacheUtil;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public class KnwTitleAction extends BaseAction {

	private final static Integer PAGE_SIZE = 20;
	
	private boolean continueToAdd = false;
	private Integer id;
	private Integer typeId = 0;
	
	private Integer pageNo = 1;
	private KnwTitle knwTitle;
	private Pager pager;

	private List<KnwType> knwTypeList;
	private NewsService newsService;
	
	private Integer titleId;
	private Integer isActive;
	
	@Override
	public String execute() throws Exception {
		return null;
	}
	
	public String refresh(){
		CacheUtil.delete("KnwTitle_last_typeId_"+typeId);//TODO:
		return null;
	}
	
	public String showDetail(){
		this.knwTitle = newsService.getKnwTitleById(titleId);
		return "detail";
	}
	
	private void getHomePage(){
		pager = this.newsService.findKnwTitleByType(typeId, PAGE_SIZE, pageNo, Short.valueOf("-1"), -1);
		this.knwTypeList = this.newsService.findAllKnwType();
	}
	
	public String showHome() {
		getHomePage();
		return SUCCESS;
	}
	
	public String edit() {
		this.knwTypeList = this.newsService.findAllKnwType();
		this.getKnwTitleById(this.id);
		return "edit";
	}
	
	public String save() {
		if (this.knwTitle.getIsActive()==null) {
			this.knwTitle.setIsActive(1);
		}
		this.newsService.saveKnwTitle(knwTitle);
		this.typeId = knwTitle.getTypeId();
		getHomePage();
		return SUCCESS;
	}
	
	public String changeActiveStatus() {
		this.getKnwTitleById(this.id);
		this.knwTitle.setIsActive(isActive);
		this.knwTitle.setIssuedDate(Calendar.getInstance().getTime());
		this.newsService.saveKnwTitle(knwTitle);
		this.typeId = this.knwTitle.getTypeId();
		return this.showHome();
	}
	
	public String findUnAuthenticatedTitles() {
		pager = this.newsService.findUnAuthenticatedTitleList(PAGE_SIZE, pageNo);
		return SUCCESS;
	}
	
	private void getKnwTitleById(Integer id) {
		if (this.id == null || this.id.intValue() ==0) {
			this.knwTitle = new KnwTitle();
			if (typeId>0) {
				KnwType type = this.newsService.getKnwTypeById(typeId);
				this.knwTitle.setTypeId(type.getId());
				this.knwTitle.setTypeName(type.getName());
			}
		} else {
			this.knwTitle = this.newsService.getKnwTitleById(id);
		}
	}
	/***编辑内容* @return*/
	public String editContent() {
		this.knwTypeList = this.newsService.findAllKnwType();
		this.getKnwTitleById(this.id);
		return "edit";
	}
	/*** 保存编辑的内容* @return*/
	public String saveContent() {
		String redirect;
		knwTitle.setTotalPages(1);
		this.newsService.saveKnwTitle(knwTitle);
		this.typeId = knwTitle.getTypeId();
		if (this.continueToAdd) {
			this.id = 0;
			redirect = this.showHome();
		} else {
			redirect = this.edit();
		}
		return redirect;
	}

	public Integer getKnwTypeId() {
		return typeId;
	}

	public void setKnwTypeId(Integer knwTypeId) {
		this.typeId = knwTypeId;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public KnwTitle getKnwTitle() {
		return knwTitle;
	}

	public void setKnwTitle(KnwTitle knwTitle) {
		this.knwTitle = knwTitle;
	}

	public Integer getPageSize() {
		return PAGE_SIZE;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public boolean isContinueToAdd() {
		return continueToAdd;
	}

	public void setContinueToAdd(boolean continueToAdd) {
		this.continueToAdd = continueToAdd;
	}

	public List<KnwType> getKnwTypeList() {
		return knwTypeList;
	}

	public void setKnwTypeList(List<KnwType> knwTypeList) {
		this.knwTypeList = knwTypeList;
	}
	
	public Pager getPager() {
		return pager;
	}

	public Integer getTitleId() {
		return titleId;
	}

	public void setTitleId(Integer titleId) {
		this.titleId = titleId;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}
	
	

}
