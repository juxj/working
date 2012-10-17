package com.zj198.service.loan;

import java.io.File;
import java.util.List;

import com.zj198.action.fund.model.FundIntention;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.OrdFinanceApplyCheck;
import com.zj198.model.PrdExtendsValue;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.loan.model.FindFinanceApplySpModel;
import com.zj198.util.Pager;

/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:58
 */
public interface FinanceApplyService {

	public List<OrdFinanceApply> findUserApply(Integer userId);
	public void searchDateFile();
	public void updateFinanceAttach();
	public Pager findFinanceApply(FinanceApplySpModel spModel);
	public OrdFinanceApply getFinanceApply(Integer appId);
	public String saveFinanceApply(OrdFinanceApply apply, Integer productId, UsrUser user, FinanceApplySpModel spModel) ;
	public List<FinanceApplyAttachModel> findApplyAttach(Integer applyId);
	public String saveAttach(File upload,String uploadFileName, String uploadContentType, Integer attachId, String path, Integer userId, Integer attachType, Integer applyId);
	public Pager orgFindFinanceApply(FinanceApplySpModel spModel);
	public void saveApplyStatus(OrdFinanceApply apply, OrdFinanceApplyCheck check);
	public void saveNewAttach(OrdFinanceApplyAttach attach);
	public List<OrdFaAttachList> findAttachList(Integer attachId);
	public OrdFaAttachList getOrdFaAttachList(Integer id);
	public OrdFinanceApplyAttach getOrdFinanceApplyAttach(Integer id);
	public void savefinanceAttach(OrdFinanceApplyAttach attach);

	OrdFinanceApply findById(Integer id);
	public List<OrdFinanceApply> findFinanceApply(FindFinanceApplySpModel spModel);
	public List<OrdFinanceApplyCheck> findApplyCheck(Integer applyId);
	public List<OrdFinanceApplyCheck> findApplyCheck(Integer applyId, Integer num);
	public List<PrdExtendsValue> getFinanceApplyExtendsValue(Integer applyId);
	public void saveFundIntention(FundIntention fi);
	public OrdFinanceApply countAttachApply(OrdFinanceApply apply);
	
	public void deleteAttach(Integer[] ids);
}
