package com.zj198.dao.hibernate;
import java.util.List;

import com.zj198.dao.OrdFaLoanUploadDAO;
import com.zj198.model.OrdFaLoanUpload;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-25 16:37:43
 */
public class OrdFaLoanUploadDAOImpl extends HibernateDAO<OrdFaLoanUpload, Integer> implements OrdFaLoanUploadDAO {
	public List<OrdFaLoanUpload> findLoanUpload(Integer dataId){
		String hql = "from OrdFaLoanUpload t where t.dataId= :dataId";
		return this.list(hql, "dataId",dataId);
	}
}
