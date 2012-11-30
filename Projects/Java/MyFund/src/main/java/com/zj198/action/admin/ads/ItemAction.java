package com.zj198.action.admin.ads;

import java.io.File;
import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.AdsItem;
import com.zj198.service.ads.AdvertiseService;
import com.zj198.util.Constants;
import com.zj198.util.UploadUtil;

public class ItemAction extends BaseAction{
	private Integer itemId;
	private AdsItem adsItem;
	private File images;
	private String imagesFileName;
    private String imagesContentType;
    private List<AdsItem> itemList;
	private AdvertiseService advertiseService;
	
	public String execute(){
		itemList = advertiseService.findAllItem();
		return SUCCESS;
	}
	
	public String bfAdd(){
		return "add";
	}
	
	public String add(){
		if(null!=this.images){
			String img = UploadUtil.upload(images, imagesFileName, "ads", Constants.UPLOAD_PRIVACY_PUBLIC);
			adsItem.setContent(img);
		}
		advertiseService.addItem(adsItem);
		adsItem=null;
		msg = "增加成功！您可以继续添加下一个广告：";
		return "add";
	}

	public String edit(){
		adsItem = advertiseService.getItemById(itemId);
		return "edit";
	}
	
	public String update(){
		if(null!=this.images){
			String img = UploadUtil.upload(images, imagesFileName, "ads", Constants.UPLOAD_PRIVACY_PUBLIC);
			adsItem.setContent(img);
		}
		advertiseService.updateItem(adsItem);
		msg = "更新成功！";
		return "edit";
	}
	
	//setter and getter
	public void setAdvertiseService(AdvertiseService advertiseService) {
		this.advertiseService = advertiseService;
	}

	public AdsItem getAdsitem() {
		return adsItem;
	}

	public void setAdsItem(AdsItem adsItem) {
		this.adsItem = adsItem;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public void setImages(File images) {
		this.images = images;
	}

	public void setImagesFileName(String imagesFileName) {
		this.imagesFileName = imagesFileName;
	}

	public void setImagesContentType(String imagesContentType) {
		this.imagesContentType = imagesContentType;
	}

	public List<AdsItem> getItemList() {
		return itemList;
	}

	public AdsItem getAdsItem() {
		return adsItem;
	}

}
