package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;

import com.zj198.dao.PrdRecommendationDAO;
import com.zj198.model.PrdRecommendation;
import com.zj198.util.Pager;

public class PrdRecommendationDAOImpl extends HibernateDAO<PrdRecommendation, Integer> implements PrdRecommendationDAO {

	@Override
	public Pager getPrdRecommedationListByType(Integer typeId, int pageSize, int pageNo) {
		String hql = "from PrdRecommendation where typeId = :typeId";
		return this.pagedQuery(hql, pageNo, pageSize, "typeId", typeId);
	}

	
	/**
	 * @typeId: 推荐新闻类别
	 * ＠sequence: 序号
	 * @param: direct，变动方向， 1表示增加，其他表示减少.
	 */
	@Override
	public int updateSequence(int typeId, int sequence, int direct) {
		String hql = "";
		
		if (direct == 1) {
		  hql = "update PrdRecommendation set sequence = sequence + 1 " +
				" where sequence >= :sequence and typeId = :typeId and status = 1";
		} else {
		  hql = "update PrdRecommendation set sequence = sequence - 1 " +
					" where sequence >= :sequence and typeId = :typeId and status = 1";	
		}
		Query query = this.getQuery(hql, "sequence", sequence, "typeId", typeId);
		return query.executeUpdate();
	}
	
	
	public int replaceSequence(int typeId, int original, int target) {
		String hql = "update PrdRecommendation set sequence = :original" +
					" where sequence = :target and typeId = :typeId";
		Query query = this.getQuery(hql, "target", target,  "original", original, "typeId", typeId);
		return query.executeUpdate();
	}


	@Override
	public PrdRecommendation getPrdRecommendationByProduct(int typeId,
			int prodId) {
		
		PrdRecommendation result = null;
		
		String hql = "from PrdRecommendation where typeId = :typeId and prodId = :prodId";
		List<PrdRecommendation> list = this.list(hql, "typeId", typeId, "prodId", prodId);
		
		if (list.size()>0) {
			result = list.get(0);
		}
		return result;
	}
	
	
	public PrdRecommendation getPrdRecommendationBySequence(int typeId, int sequence) {
		PrdRecommendation result = null;
		String hql = "from PrdRecommendation where status != 0 and typeId = :typeId and sequence = :sequence";
		List<PrdRecommendation> list = this.list(hql, "typeId", typeId, "sequence", sequence);
		if (list.size()>0) {
			result = list.get(0);
		}
		return result;
	}


	@Override
	public List<PrdRecommendation> findByTopNumber(int typeId, int number) {
		String hql = "from PrdRecommendation where typeId = :typeId and status=1 order by sequence";
		return this.findTopRows(hql, number, "typeId", typeId);
	}
	
	public void updatePrdRecommendSeq(Integer typeId, Integer seq){
		String sql = "update PRD_RECOMMENDATION t set t.sequence = t.sequence +1 where t.status != 0 and t.type_id=" + typeId + " and t.sequence >= " + seq;
		SQLQuery query = this.getSession().createSQLQuery(sql);
		query.executeUpdate();
	}
}
