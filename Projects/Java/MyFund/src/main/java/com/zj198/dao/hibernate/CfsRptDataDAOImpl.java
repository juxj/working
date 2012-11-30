package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import org.springframework.util.StringUtils;

import com.google.gson.Gson;
import com.zj198.dao.CfsRptDataDAO;
import com.zj198.model.CfsRptData;
import com.zj198.model.vo.ReportAmount;
import com.zj198.util.CacheUtil;

public class CfsRptDataDAOImpl extends HibernateDAO<CfsRptData, Integer> implements CfsRptDataDAO {

	@Override
	public CfsRptData getCfsRptDataByCode(String code, Integer userid,
			String typeCode) {
		String hql="from CfsRptData as model where 1=1";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(userid!=null && userid!=-1){
			hql+=" and model.usrId=:userid";
			paramMap.put("userid", userid);
		}
		if(StringUtils.hasText(code)){
			hql+=" and model.code=:code";
			paramMap.put("code", code);
		}
		if(StringUtils.hasText(typeCode)){
			hql+=" and model.cfsRptTypeCode=:typeCode";
			paramMap.put("typeCode", typeCode);
		}
		List<CfsRptData> dataLs = listByTable(hql, paramMap);
		if(dataLs.size()==1){
			return dataLs.get(0);
		}
		return null;
	}

	@Override
	public List<CfsRptData> findCfsRptDataByUseridTypeCode(Integer userid,String code) {
		String hql="from CfsRptData as model where model.usrId=:userid and model.cfsRptTypeCode=:code";
		if(StringUtils.hasText(code)){
			List<CfsRptData> dataLs = list(hql,"userid",userid,"code",code);
			if(dataLs.size() > 0){
				return dataLs;
			}
		}
		return null;
	}

	@Override
	public Double getRptCellData(Integer userId, String cfsRptTypeCode,
			String itemCode, Integer year) {
		Double result = 0.0;
		String key = "RPT_DATA_"+String.valueOf(userId)+"_"+cfsRptTypeCode+"_"+itemCode;
		Object obj = CacheUtil.get(key);
		if (obj == null) {
			List<CfsRptData> list = this.findCfsRptDataByUseridTypeCode(userId, cfsRptTypeCode);
			for (CfsRptData data : list){
				key = "RPT_DATA_"+String.valueOf(userId)+"_"+cfsRptTypeCode+"_"+data.getCode();
				CacheUtil.set(key, data.getAmount());
			}
			obj = CacheUtil.get(key);
		}
		
		Gson gson = new Gson();
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<ReportAmount>>() {}.getType();
		List<ReportAmount> amounts = gson.fromJson((String)obj, type);
		for (ReportAmount amount : amounts) {
			if (amount.getYear().intValue() == year.intValue()) {
				result = amount.getValue();
			}
		}
		return result;
	}
	
	


}
