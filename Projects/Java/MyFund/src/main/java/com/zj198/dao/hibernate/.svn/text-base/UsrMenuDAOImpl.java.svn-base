package com.zj198.dao.hibernate;

import java.util.ArrayList;
import java.util.List;

import com.zj198.dao.UsrMenuDAO;
import com.zj198.model.UsrMenu;
import com.zj198.util.CacheUtil;
import com.zj198.util.NumberUtil;

public class UsrMenuDAOImpl extends HibernateDAO<UsrMenu, Integer> implements UsrMenuDAO {

	@Override
	public List<UsrMenu> findMenuListByGroupType(Integer userTypeGroup) {
		Object object = CacheUtil.get("UC_MENU_"+userTypeGroup);
		if(object==null){
			List<UsrMenu> all = findAll();
			List<UsrMenu> list = new ArrayList<UsrMenu>();
			for(UsrMenu menu:all){
				if(NumberUtil.ifExist(menu.getRights(),(2<<userTypeGroup)/4)){
					list.add(menu);
				}
			}
			CacheUtil.set("UC_MENU_"+userTypeGroup, list);
			return list;
		}else{
			return (List<UsrMenu>)object;
		}
	}

}
