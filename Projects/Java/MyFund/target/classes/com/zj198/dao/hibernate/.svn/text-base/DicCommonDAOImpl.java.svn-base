package com.zj198.dao.hibernate;

import java.util.ArrayList;
import java.util.List;

import com.zj198.dao.DicCommonDAO;
import com.zj198.model.DicCommon;
import com.zj198.util.Constants;

public class DicCommonDAOImpl extends HibernateDAO<DicCommon, Integer> implements DicCommonDAO{

	@Override
	//应用内缓存
	public List<DicCommon> findByGroupId(int groupid) {
		if(Constants.COMMON_DATA_GROUP_MAP.get(groupid)==null){
			String hql="from DicCommon as model where model.group=:groupid";
			List<DicCommon> list = list(hql,"groupid", groupid);
			Constants.COMMON_DATA_GROUP_MAP.put(groupid, list);
		}
		return Constants.COMMON_DATA_GROUP_MAP.get(groupid);
	}
	
	public List<DicCommon> findByIds(String ids) {
		String[] idss = ids.split(",");
		List<DicCommon> list = new ArrayList<DicCommon>();
		for(String s:idss){
			list.add(this.get(Integer.parseInt(s.trim())));
		}
//      String hql = "from DicCommon as model where model.id in (" + ids + ")";
//		return list(hql);
		return list;
	}
	
	public DicCommon get(Integer id){
		if(Constants.COMMON_DATA_ID.get(id)==null){
			Constants.COMMON_DATA_ID.put(id, super.get(id));
		}
		return Constants.COMMON_DATA_ID.get(id);
	}
	
}
