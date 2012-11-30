package com.zj198.dao;

import java.util.List;

import com.zj198.model.CfsRptProp;

public interface CfsRptPropDAO extends BaseDAO<CfsRptProp, Integer>{

		public List<CfsRptProp> getCfsRptPropListByType(String rptTypeCode);
}
