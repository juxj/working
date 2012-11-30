package com.zj198.dao;

import java.util.List;

import com.zj198.model.PrdRecommendation;
import com.zj198.util.Pager;

public interface PrdRecommendationDAO extends
		BaseDAO<PrdRecommendation, Integer> {

	public PrdRecommendation getPrdRecommendationByProduct(int typeId, int prodId);
	public PrdRecommendation getPrdRecommendationBySequence(int typeId, int sequence);
	
	public Pager getPrdRecommedationListByType(Integer typeId, int pageSize, int pageNo);
	
	public int updateSequence(int typeId, int sequence, int direct);
	
	public int replaceSequence(int typeId, int original, int target) ;
	
	public List<PrdRecommendation> findByTopNumber(int typeId, int number);
	public void updatePrdRecommendSeq(Integer typeId, Integer seq);
}
