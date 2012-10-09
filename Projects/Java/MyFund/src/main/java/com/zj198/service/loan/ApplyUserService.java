package com.zj198.service.loan;

import com.zj198.model.OrdApplyUsrCompany;


/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:58
 */
public interface ApplyUserService {
	
	public void addCompDetail(OrdApplyUsrCompany auc);
	
	public void updateCompDetail(OrdApplyUsrCompany auc);
	
	public OrdApplyUsrCompany getByApplyId(Integer id);
	
	public OrdApplyUsrCompany getOrdApplyUsrCompanyById(Integer id);

}
