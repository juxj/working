package com.zj198.dao.hibernate;
import java.util.List;

import com.zj198.dao.PrdFinanceDatafileDAO;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.model.PrdFinanceInducty;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 14:54:57
 */
public class PrdFinanceDatafileDAOImpl extends HibernateDAO<PrdFinanceDatafile, Integer> implements PrdFinanceDatafileDAO {
	public PrdFinanceDatafile findDataFile(Integer financeId, Integer dataId){
		String hql = "from PrdFinanceDatafile t where t.financeId=" + financeId + " and t.datafileId=" + dataId;
		List<PrdFinanceDatafile> list = this.list(hql);
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}
}
