package com.zj198.service.loan;

import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.OrdApplyUsrPerson;


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
	
	/**linm*/
	public void addPersDetail(OrdApplyUsrPerson aup);
	
	public void updateCompDetail(OrdApplyUsrPerson aup);
	
	public OrdApplyUsrPerson getByApplyUsrPerId(Integer id);
	
	public OrdApplyUsrPerson getOrdApplyUsrPersonById(Integer id);

}
