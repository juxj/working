package com.zj198.action.admin.ads;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.AdsPlace;
import com.zj198.service.ads.AdvertiseService;

public class PlaceAction extends BaseAction{
	private Integer placeId;
	private AdsPlace adsPlace;
	private List<AdsPlace> placeList;
	private AdvertiseService advertiseService;
	
	public String execute(){
		placeList = advertiseService.findAllPlace();
		return SUCCESS;
	}
	
	public String bfAdd(){
		return "add";
	}
	
	public String edit(){
		adsPlace = advertiseService.getPlaceById(placeId);
		return "edit";
	}
	
	public String add(){
		advertiseService.addPlace(adsPlace);
		adsPlace=null;
		msg = "增加成功！您可以继续添加下一个广告位。";
		return "add";
	}
	
	public String update(){
		advertiseService.updatePlace(adsPlace);
		msg = "更新成功！";
		return "edit";
	}
	
	//setter and getter
	public AdsPlace getAdsPlace() {
		return adsPlace;
	}

	public void setAdsPlace(AdsPlace adsPlace) {
		this.adsPlace = adsPlace;
	}

	public List<AdsPlace> getPlaceList() {
		return placeList;
	}

	public void setAdvertiseService(AdvertiseService advertiseService) {
		this.advertiseService = advertiseService;
	}

	public void setPlaceId(Integer placeId) {
		this.placeId = placeId;
	}

}
