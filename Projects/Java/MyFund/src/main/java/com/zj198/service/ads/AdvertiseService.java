package com.zj198.service.ads;

import java.util.List;

import com.zj198.model.AdsItem;
import com.zj198.model.AdsPlace;
import com.zj198.model.AdsPost;

public interface AdvertiseService {
	public AdsItem getItemById(Integer id);
	public AdsPlace getPlaceById(Integer id);
	public AdsPost getPostById(Integer id);
	public List<AdsItem> findAllItem();
	public List<AdsPlace> findAllPlace();
	public List<AdsPost> findAllPost();
	
	public void addPlace(AdsPlace adsPlace);
	public void addItem(AdsItem adsItem);
	public boolean addPost(AdsPost adsPost);
	
	public void updatePlace(AdsPlace adsPlace);
	public void updateItem(AdsItem adsItem);
	public void updatePost(AdsPost adsPost);
	
	public boolean deletePost(Integer id);
}
