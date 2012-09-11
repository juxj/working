package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FudHisvalueDAO;
import com.zj198.model.FudHisvalue;
import com.zj198.util.Pager;


public class FudHisvalueDAOImpl extends HibernateDAO<FudHisvalue, Integer> implements FudHisvalueDAO {

	/**Log4j*/
//    private static final Logger log = LoggerFactory.getLogger(FudHisvalueDAOImpl.class);
    
	@Override
	public List<FudHisvalue> findRecentlyList() {
		String hql = "select new com.zj198.model.FudHisvalue(model.id, model.fundcode, model.levelcode,model.unitvalue, model.accumulatvalue, model.dayincrease,model.day, model.totalvalue, Base.fundname) from FudHisvalue as model,FudBase as Base where Base.fundcode=model.fundcode and model.day = (select max(day) from FudHisvalue)";
		return list(hql);
	}

	@Override
	public List<FudHisvalue> findByFundCode(String fundCode) {
		String hql = "select new com.zj198.model.FudHisvalue(model.id, model.fundcode, model.levelcode,model.unitvalue, model.accumulatvalue, model.dayincrease,model.day, model.totalvalue, Base.fundname) from FudHisvalue as model,FudBase as Base where Base.fundcode=model.fundcode and model.fundcode = :fundCode)";
		return list(hql, "fundCode", fundCode);
	}
	
	public Pager findAllByFundCode(String fundCode, int pageSize,int pageNo){
		String hql = "select new com.zj198.model.FudHisvalue(model.id, model.fundcode, model.levelcode,model.unitvalue, model.accumulatvalue, model.dayincrease,model.day, model.totalvalue, Base.fundname) from FudHisvalue as model,FudBase as Base where Base.fundcode=model.fundcode and model.fundcode = :fundCode)";
		return pagedQuery(hql,pageNo,pageSize, "fundCode", fundCode);
	}

	@Override
	public Pager findRecentlyList(String typeName, int pageSize, int pageNo) {
		String hql = "select new com.zj198.model.FudHisvalue(model.id, model.fundcode, model.levelcode,model.unitvalue, model.accumulatvalue, model.dayincrease,model.day, model.totalvalue, Base.fundname) from FudHisvalue as model, FudBase as  Base where  Base.type= :type and Base.fundcode=model.fundcode and model.day = (select max(day) from FudHisvalue)";
		return pagedQuery(hql,pageNo,pageSize,"type", typeName);
	}

}
