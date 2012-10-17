package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.KnwTitleDAO;
import com.zj198.model.KnwTitle;
import com.zj198.util.CacheUtil;
import com.zj198.util.Pager;

public class KnwTitleDAOImpl extends HibernateDAO<KnwTitle, Integer> implements KnwTitleDAO {
	
	/**
	 * 当isAuthenticated为<0时,表示取全部记录.
	 */
	@Override
	public Pager findKnwTitleByType(Integer typeId, int pageSize, int pageNo, short isAuthenticated, int isActive) {
		
		Hashtable<String,Object> params = new Hashtable<String, Object>();
		String hql = "from KnwTitle where 1=1 ";
		
		if (isAuthenticated >=0) {
			hql = hql + "and isAuthenticated = :isAuthenticated ";
			params.put("isAuthenticated", isAuthenticated);
		}
		
		if (isActive >=0) {
			hql = hql + "and isActive = :isActive";
			params.put("isActive", isActive);
		}
		
		if (typeId != null && typeId>0) {
			hql = hql + " and  typeId = :typeId ";
			params.put("typeId", typeId);
		}
		hql = hql + " order by issuedDate desc";
		return pagedQuery(hql, pageNo, pageSize, params);
	}

	@Override
	public Pager findUnAuthenticatedList(int pageSize, int pageNo) {
		String hql = "from KnwTitle where isAuthenticated = 0";
		return pagedQuery(hql, pageNo, pageSize);
	}

	@Override
	public List<KnwTitle> findKnwTitleByType(Integer typeId) {
		String hql = "from KnwTitle where isAuthenticated=1 and isActive=1 and typeId = :typeId";
		return list(hql, "typeId", typeId);
	}

	@Override
	public List<KnwTitle> findLastestByType(Integer typeId, Integer num) {
		Object object = CacheUtil.get("KnwTitle_last_typeId_"+typeId);
		if(object==null){
			String hql = "from KnwTitle as model where typeId=:typeId and isAuthenticated=1 and isActive=1 order by issuedDate desc";
			List<KnwTitle> result = findTopRows(hql, num, "typeId",typeId);
			CacheUtil.set("KnwTitle_last_typeId_"+typeId, result);
			return result;
		}else{
			return (List<KnwTitle>)object;
		}
		
//		List<KnwTitle> result = Constants.NEWS_MAP.get(typeId);
//		
//		if(result == null || result.size()<1) {
//			String hql = "from KnwTitle as model where typeId=:typeId and isAuthenticated=1 and isActive=1 order by issuedDate desc";
//			result = findTopRows(hql, num, "typeId",typeId);
//			Constants.NEWS_MAP.put(typeId, result);
//		}
//		
//		return result;
	}

}
