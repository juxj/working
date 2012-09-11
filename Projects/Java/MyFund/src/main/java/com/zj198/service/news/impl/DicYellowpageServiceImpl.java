package com.zj198.service.news.impl;

import java.util.List;

import com.zj198.dao.DicYellowpageDAO;
import com.zj198.model.DicYellowpage;
import com.zj198.service.news.DicYellowpageService;

public class DicYellowpageServiceImpl implements DicYellowpageService {

	private DicYellowpageDAO dicYellowpageDAO;

	public void setDicYellowpageDAO(DicYellowpageDAO dicYellowpageDAO) {
		this.dicYellowpageDAO = dicYellowpageDAO;
	}

	public List<DicYellowpage> findPageByType(Integer type) {
		return dicYellowpageDAO.findPageByType(type);
	}

	@Override
	public List<DicYellowpage> findPageByTypeAll(Integer type) {
		return dicYellowpageDAO.findPageByTypeAll(type);
	}
}
