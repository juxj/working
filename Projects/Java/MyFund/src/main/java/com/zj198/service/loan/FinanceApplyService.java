package com.zj198.service.loan;

import java.io.File;
import java.util.List;

import com.itextpdf.text.Document;
import com.zj198.action.fund.model.FundIntention;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.OrdCheckLog;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.PrdExtendsValue;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.loan.model.FindFinanceApplySpModel;
import com.zj198.service.loan.model.SaveAttachListSpModel;
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
	public void saveApplyStatus(OrdFinanceApply apply, OrdCheckLog check);
	public void saveNewAttach(OrdFinanceApplyAttach attach);
	public List<OrdFaAttachList> findAttachList(Integer attachId);
	public OrdFaAttachList getOrdFaAttachList(Integer id);
	public OrdFinanceApplyAttach getOrdFinanceApplyAttach(Integer id);
	public void savefinanceAttach(OrdFinanceApplyAttach attach);

	OrdFinanceApply findById(Integer id);
	public List<OrdFinanceApply> findFinanceApply(FindFinanceApplySpModel spModel);
	public List<OrdCheckLog> findApplyCheck(Integer applyId);
	public List<OrdCheckLog> findApplyCheck(Integer applyId, Integer num);
	public List<PrdExtendsValue> getFinanceApplyExtendsValue(Integer applyId);
	public void saveFundIntention(FundIntention fi);
	public OrdFinanceApply countAttachApply(OrdFinanceApply apply);
	
	public void deleteAttach(Integer[] ids);
	/*********************************************第二期 订单相关操作*************************************************************/
	/**
	 * 初审客户信息和申请信息
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-25|上午11:51:57
	 * @param apply
	 * @param check
	 * @param l
	 * @param r
	 */
	public void updateChuShen(OrdFinanceApply apply, OrdCheckLog check, String l, String r, String realName);
	
	/**
	 * 复审变更订单状态
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-25|上午11:52:34
	 * @param apply
	 * @param check
	 */
	public void updateOrdStatus(OrdFinanceApply apply, OrdCheckLog check, String realName, Integer status);
	
	/**
	 * 退回申请，客户信息和申请信息需要修改
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-25|下午3:02:06
	 * @param apply
	 * @param check
	 * @param left
	 * @param right
	 * @param realName
	 */
	public void updateTuiHui(OrdFinanceApply apply, OrdCheckLog check, String left, String right, String realName, Integer status) ;
	
	/**
	 * 提交修改，客户修改资料重新提交审核
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|上午11:01:23
	 * @param apply
	 * @param left
	 * @param right
	 */
	public void updateAppInfo(OrdFinanceApply apply, OrdCheckLog log, String left, String right, String realname);
	
	/**
	 * 资金网审核通过以及提交给资金方
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午2:08:39
	 * @param apply
	 * @param log
	 * @param realName
	 */
	public void updateFinalCheck(OrdFinanceApply apply, OrdCheckLog log, String realName, Integer status);
	
	
	/**
	 * 资金方审核通过或者不通过
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-29|下午2:00:05
	 * @param apply
	 * @param log
	 * @param status
	 */
	public void updateCheckStatus(OrdFinanceApply apply, OrdCheckLog log, String realname, Integer status);
	
	/**
	 * 批量更改申贷材料状态
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|下午1:39:50
	 * @param ids
	 * @param postid
	 * @param status
	 */
	public void updateMaterialStatus(Integer[] ids,String postid, Integer status);
	
	/**
	 * 删除已上传的资料
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-1|上午11:20:53
	 * @param id
	 */
	public void deleteAttachListById(Integer id);
	
	/**
	 * 生成企业pdf
	 * @author zeroleavebaoyang@gmail.com
	 * @param apply
	 * @param product
	 * @param loanOrgName
	 * @return
	 */
	public String generatePdf(OrdFinanceApply apply, PrdFinance product, OrdApplyUsrCompany ordCompany, String loanOrgName, String addressForward);
	
	/**
	 * 生成个人pdf
	 * @author zeroleavebaoyang@gmail.com
	 * @param apply
	 * @param product
	 * @param loanOrgName
	 * @return
	 */
	public String generatePersonPdf(OrdFinanceApply apply, PrdFinance product, String loanOrgName);
	
	/**
	 * 企业或者个人查看全部日志记录(checkLogType='01' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findAllLogByComOrPle(Integer applyId);
	
	/**
	 * 企业或者个人显示前三条日志记录(checkLogType='01' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findTopLogByComOrPle(Integer applyId, Integer num);
	
	/**
	 * 金融机构查看全部日志记录(checkLogType='10' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findAllLogByLoan(Integer applyId);
	
	/**
	 * 金融机构显示前三条日志记录(checkLogType='10' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findTopLogByLoan(Integer applyId, Integer num);
	
	public void updateFinanceApply(OrdFinanceApply apply, UsrUser user, FinanceApplySpModel spModel) ;
	
	public void saveAttachList(SaveAttachListSpModel spModel);
	public OrdFinanceApplyAttach updateOfflineAttach(OrdFinanceApplyAttach attach, Integer status);
	public OrdFinanceApply updateOffLineAgree(OrdFinanceApplyAttach attach,OrdFinanceApply apply, Integer status);
	public OrdFinanceApply updateOffLineAgreeCheck(OrdFinanceApply apply, Integer status);

}
