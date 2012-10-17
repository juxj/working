package com.zj198.dao.hibernate;

import java.util.ArrayList;
import java.util.List;

import com.zj198.dao.DicCommonDAO;
import com.zj198.model.DicCommon;
import com.zj198.util.CacheUtil;

public class DicCommonDAOImpl extends HibernateDAO<DicCommon, Integer> implements DicCommonDAO{

	@Override
	public List<DicCommon> findByGroupId(int groupid) {
		Object object = CacheUtil.get("DicCommon_group_"+groupid);//查询缓存
		if(object==null){
			System.out.println("--DicCommon_group_"+groupid+"-- is null in memcached");
			String hql="from DicCommon as model where model.group=:groupid";
			List<DicCommon> list = list(hql,"groupid", groupid);
			CacheUtil.set("DicCommon_group_"+groupid, list);//存入缓存
			return list;
		}else{
			System.out.println("--got DicCommon_group_"+groupid+" from memcached--");
			return (List<DicCommon>)object;//从缓存取值
		}
//		if(Constants.COMMON_DATA_GROUP_MAP.get(groupid)==null){
//			String hql="from DicCommon as model where model.group=:groupid";
//			List<DicCommon> list = list(hql,"groupid", groupid);
//			Constants.COMMON_DATA_GROUP_MAP.put(groupid, list);
//		}
//		return Constants.COMMON_DATA_GROUP_MAP.get(groupid);
	}
	
	public List<DicCommon> findByIds(String ids) {
		String[] idss = ids.split(",");
		List<DicCommon> list = new ArrayList<DicCommon>();
		for(String s:idss){
			list.add(getById(Integer.parseInt(s.trim())));
		}
		return list;
	}
	
	public DicCommon getById(Integer id){
		Object object = CacheUtil.get("DicCommon_"+id);//查询缓存
		if(object==null){
			System.out.println("--DicCommon_"+id+"-- is null in memcached");
			DicCommon comm = get(id);
			CacheUtil.set("DicCommon_"+id, comm);//存入缓存
			return comm;
		}else{
			System.out.println("--got DicCommon_"+id+" from memcached--");
			return (DicCommon)object;
		}
//		if(Constants.COMMON_DATA_ID.get(id)==null){
//			Constants.COMMON_DATA_ID.put(id, super.get(id));
//		}
//		return Constants.COMMON_DATA_ID.get(id);
	}
	
}
