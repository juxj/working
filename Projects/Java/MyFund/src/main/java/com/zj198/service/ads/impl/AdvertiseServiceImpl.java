package com.zj198.service.ads.impl;

import java.util.List;

import com.zj198.dao.AdsItemDAO;
import com.zj198.dao.AdsPlaceDAO;
import com.zj198.dao.AdsPostDAO;
import com.zj198.model.AdsItem;
import com.zj198.model.AdsPlace;
import com.zj198.model.AdsPost;
import com.zj198.service.ads.AdvertiseService;

public class AdvertiseServiceImpl implements AdvertiseService{
	private AdsPlaceDAO adsPlaceDAO;
	private AdsItemDAO adsItemDAO;
	private AdsPostDAO adsPostDAO;
	
	public void setAdsPlaceDAO(AdsPlaceDAO adsPlaceDAO) {
		this.adsPlaceDAO = adsPlaceDAO;
	}
	public void setAdsItemDAO(AdsItemDAO adsItemDAO) {
		this.adsItemDAO = adsItemDAO;
	}
	public void setAdsPostDAO(AdsPostDAO adsPostDAO) {
		this.adsPostDAO = adsPostDAO;
	}

	@Override
	public AdsItem getItemById(Integer id) {
		return adsItemDAO.get(id);
	}

	@Override
	public AdsPlace getPlaceById(Integer id) {
		return adsPlaceDAO.get(id);
	}

	@Override
	public AdsPost getPostById(Integer id) {
		return adsPostDAO.get(id);
	}

	@Override
	public List<AdsItem> findAllItem() {
		return adsItemDAO.findAll();
	}

	@Override
	public List<AdsPlace> findAllPlace() {
		return adsPlaceDAO.findAll();
	}

	@Override
	public List<AdsPost> findAllPost() {
		return adsPostDAO.findAll();
	}

	@Override
	public void addPlace(AdsPlace adsPlace) {
		adsPlaceDAO.save(adsPlace);		
	}

	@Override
	public void addItem(AdsItem adsItem) {
		adsItemDAO.save(adsItem);		
	}

	@Override
	public boolean addPost(AdsPost adsPost) {
		//TODO:检查是否有重复
		adsPostDAO.save(adsPost);
		return false;
	}

	@Override
	public void updatePlace(AdsPlace adsPlace) {
		adsPlaceDAO.update(adsPlace);
	}

	@Override
	public void updateItem(AdsItem adsItem) {
		adsItemDAO.update(adsItem);		
	}

	@Override
	public void updatePost(AdsPost adsPost) {
		// TODO 检查重复
		adsPostDAO.update(adsPost);
	}

	@Override
	public boolean deletePost(Integer id) {
		adsPostDAO.delete(id);
		return true;
	}

}
