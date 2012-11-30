package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicBankDAO;
import com.zj198.model.DicBank;
import com.zj198.util.CacheUtil;

public class DicBankDAOImpl extends HibernateDAO<DicBank, Integer> implements DicBankDAO {
	@Override
	public List<DicBank> findAll(){
		Object object = CacheUtil.get("DicBank_all");
		if(object==null){
			List<DicBank> list = super.findAll();
			CacheUtil.set("DicBank_all",list);
			return list;
		}else{
			return (List<DicBank>)object;
		}
	}
	
	@Override
	public DicBank get(Integer id){
		Object object = CacheUtil.get("DicBank_"+id);
		if(object==null){
			DicBank dicBank = super.get(id);
			CacheUtil.set("DicBank_"+id,dicBank);
			return dicBank;
		}else{
			return (DicBank)object;
		}
	}
}
