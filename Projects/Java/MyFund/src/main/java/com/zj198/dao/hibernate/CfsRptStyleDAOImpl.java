package com.zj198.dao.hibernate;

import java.util.List;

import org.springframework.util.StringUtils;

import com.zj198.dao.CfsRptStyleDAO;
import com.zj198.model.CfsRptStyle;

public class CfsRptStyleDAOImpl extends HibernateDAO<CfsRptStyle, Integer> implements CfsRptStyleDAO {

	@Override
	public List<CfsRptStyle> findRptStyleByVersionTypeCode(String version,String code) {
		String hql="from CfsRptStyle as model where model.cfsRptTypeCode=:code and model.version=:version";
		if(StringUtils.hasText(code) && StringUtils.hasText(version)){
			List<CfsRptStyle> styles=list(hql,"code",code,"version",version);
			if(styles.size()>0){
				return styles;
			}
		}
		return null;
	}
}
