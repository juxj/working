package com.zj198.service.loan.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.dao.DicCommonDAO;
import com.zj198.dao.OrdFaAttachListDAO;
import com.zj198.dao.OrdFinanceApplyAttachDAO;
import com.zj198.dao.OrdFinanceApplyCheckDAO;
import com.zj198.dao.OrdFinanceApplyDAO;
import com.zj198.dao.PrdExtendsPropertyDAO;
import com.zj198.dao.PrdExtendsValueDAO;
import com.zj198.dao.PrdFinanceDAO;
import com.zj198.dao.PrdPropertyDicDAO;
import com.zj198.dao.UsrCompanyDAO;
import com.zj198.model.NtyMessageQueue;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.OrdFinanceApplyCheck;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdExtendsValue;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.model.PrdPropertyDic;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.model.FindFinanceApplySpModel;
import com.zj198.util.Constants;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.OrderNOCreator;
import com.zj198.util.Pager;
import com.zj198.util.UploadUtil;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
 */
public class FinanceApplyServiceImpl implements FinanceApplyService {
	private PrdFinanceDAO prdFinanceDAO;
	private OrdFinanceApplyDAO ordFinanceApplyDAO;
	private OrdFinanceApplyAttachDAO ordFinanceApplyAttachDAO;
	private OrdFaAttachListDAO ordFaAttachListDAO;
	private OrdFinanceApplyCheckDAO ordFinanceApplyCheckDAO;
	private UsrCompanyDAO usrCompanyDAO;
	private DicCommonDAO dicCommonDAO;
	private PrdExtendsPropertyDAO prdExtendsPropertyDAO;
	private PrdPropertyDicDAO prdPropertyDicDAO;
	private PrdExtendsValueDAO prdExtendsValueDAO;

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public List<OrdFinanceApply> findUserApply(Integer userId) {
		return this.ordFinanceApplyDAO.findUserApply(userId);
	}

	public Pager orgFindFinanceApply(FinanceApplySpModel spModel) {
		return this.ordFinanceApplyDAO.orgFindFinanceApply(spModel);
	}

	public String saveAttach(File upload, String uploadFileName, String uploadContentType, Integer attachId, String path, Integer userId, Integer attachType, Integer applyId) {
		String result = "";
		String newFileName = UploadUtil.upload(upload, uploadFileName, "loan", Constants.UPLOAD_PRIVACY_PRIVATE);
		if (attachType.intValue() == 1) {
			OrdFinanceApply apply = ordFinanceApplyDAO.get(applyId);
			apply.setAgreeFileUpload(newFileName);
			ordFinanceApplyDAO.update(apply);
		} else {
			OrdFaAttachList fa = new OrdFaAttachList();
			fa.setAttachId(attachId);
			fa.setFileName(newFileName);
			fa.setOldFileName(uploadFileName);
			fa.setCreatedt(new Date());
			fa.setCreateUserId(userId);
			fa.setUploadPath(path);
			ordFaAttachListDAO.save(fa);
			OrdFinanceApplyAttach attach = ordFinanceApplyAttachDAO.get(attachId);
			attach.setUploadStatus(Integer.valueOf(213));
			ordFinanceApplyAttachDAO.saveOrUpdate(attach);
		}
		// try {
		// String newFileName = System.currentTimeMillis() + "";
		// path = path + "\\WEB-INF\\web\\upload\\";
		//
		// newFileName = newFileName + "." +
		// uploadFileName.substring(uploadFileName.lastIndexOf(".")+1,
		// uploadFileName.length());
		//
		// FileOutputStream output = new FileOutputStream(path + newFileName);
		// FileInputStream fis = new FileInputStream(upload);
		// byte[] buffer = new byte[1024];
		// int len = 0;
		// while ((len = fis.read(buffer)) > 0) {
		// output.write(buffer, 0, len);
		// }
		// output.close();
		// } catch (Exception e) {
		// e.printStackTrace();
		// result = "上传失败";
		// }
		return result;
	}

	public List<OrdFaAttachList> findAttachList(Integer attachId) {
		return ordFaAttachListDAO.findAttachList(attachId);
	}

	public void savefinanceAttach(OrdFinanceApplyAttach attach) {
		OrdFinanceApplyAttach oaa = ordFinanceApplyAttachDAO.get(attach.getId());
		oaa.setUploadStatus(attach.getUploadStatus());
		ordFinanceApplyAttachDAO.update(oaa);
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public String saveFinanceApply(OrdFinanceApply apply, Integer productId, UsrUser user, FinanceApplySpModel spModel) {
		PrdFinance product = prdFinanceDAO.get(productId);
		apply.setFinanceId(productId);
		apply.setApplyType(product.getFinanceType());
		apply.setApplyStatus(Integer.valueOf(177));//待审核
		apply.setCreatedt(new Date());
		apply.setUserId(user.getId());
		apply.setIsdeleted(Integer.valueOf(0));
		if (user.getUserTypeGroup().intValue() == 1) {
			UsrCompany company = usrCompanyDAO.get(user.getId());
			if(company != null){				
				apply.setApplyUserName(company.getCompanyname());
			}
		} else {
			apply.setApplyUserName(user.getRealname());
		}
		ordFinanceApplyDAO.save(apply);

		String applyNum = OrderNOCreator.rapidFinanceApplyOrderNO(apply.getId().intValue());// 申请编号
		apply.setApplyNum(applyNum);
		ordFinanceApplyDAO.update(apply);
		
		OrdFinanceApplyCheck check = new OrdFinanceApplyCheck();
		check.setFinanceApplyId(apply.getId());
		check.setCheckStatus(177);//待审核
		check.setCreatedt(new Date());
		check.setCheckView("提交申请");
		ordFinanceApplyCheckDAO.save(check);

		Set<PrdFinanceDatafile> dfs = product.getDataFiles();
		for (PrdFinanceDatafile df : dfs) {
			OrdFinanceApplyAttach ofaa = new OrdFinanceApplyAttach();
			ofaa.setApplyId(apply.getId());
			ofaa.setDatalistId(df.getDatafileId());
			ofaa.setFinanceDataId(df.getId());
			ofaa.setUploadStatus(Integer.valueOf(212));// 未递交
			ofaa.setIsdeleted(Integer.valueOf(0));
			ofaa.setSupplyWay(product.getUploadWay());
			ofaa.setAttachType(Integer.valueOf(0));
			ordFinanceApplyAttachDAO.save(ofaa);
		}
		// 发送Email
		Map<String, Object> m = new HashMap<String, Object>();
		String body;
		try {
			m.put("currentTime", new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
			m.put("applyNum", applyNum);
			body = FreemarkerUtil.getContent("applyFinanceTemplate.htm", m, false, null, null);
			NtyMessageQueue j = new NtyMessageQueue();
			j.setTitle("融资产品申请 - 中国资金网");
			j.setContent(body);
			j.setReceiver(Constants.LOAN_EMAIL);
			j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(j);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/**
		 * 保存扩展属性
		 */
		this.saveExtendsParamater(apply.getId(), productId, spModel.getParamap());
		return applyNum;
	}
	
	public void saveExtendsParamater(Integer applyId, Integer productId, Map param){
		List<PrdExtendsProperty> extendsPropertyList = prdExtendsPropertyDAO.getFinancePropertys(productId);
		
		if(extendsPropertyList != null && extendsPropertyList.size() > 0){
			String valueName = "epValue";
			for(PrdExtendsProperty p : extendsPropertyList){
				String[] values = (String[]) param.get(valueName + p.getId());
				PrdExtendsValue value = new PrdExtendsValue();
				value.setExtendsType(p.getExtendsType());
				value.setRowId(applyId);
				value.setPropertyId(p.getId());
				value.setFieldCode(p.getFieldCode());
				value.setFieldName(p.getFieldName());
				value.setCreateDt(new Date());
				if(p.getFieldType() == 1 || p.getFieldType() == 2){
					if(values.length > 0){
						value.setEntityValue(values[0]);
					}
				}else{
					if(values.length > 0){
						String vstr = "";
						for(String v : values){
							vstr += v + ",";
						}
						vstr = vstr.substring(0,vstr.length() -1);
						if(vstr.length() > 0){
							value.setDicValue(vstr);
							List<PrdPropertyDic> diclist= prdPropertyDicDAO.findPropertyDic(p.getId(), vstr);
							String vcn = "";
							for(PrdPropertyDic dic : diclist){
								vcn += dic.getDicName() + ",";
							}
							vcn = vcn.substring(0,vcn.length()-1);
							value.setEntityValue(vcn);
						}
					}
				}
				prdExtendsValueDAO.save(value);
			}
		}
	}

	public List<FinanceApplyAttachModel> findApplyAttach(Integer applyId) {
		List<FinanceApplyAttachModel> attachList = ordFinanceApplyAttachDAO.findApplyAttach(applyId);
		attachList.addAll(ordFinanceApplyAttachDAO.findApplyAttachSupply(applyId));
		return attachList;
	}

	public OrdFaAttachList getOrdFaAttachList(Integer id) {
		return ordFaAttachListDAO.get(id);
	}

	public OrdFinanceApplyAttach getOrdFinanceApplyAttach(Integer id) {
		return ordFinanceApplyAttachDAO.get(id);
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public void searchDateFile() {
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public void updateFinanceAttach() {
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public Pager findFinanceApply(FinanceApplySpModel spModel) {
		return this.ordFinanceApplyDAO.findFinanceApply(spModel);
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public OrdFinanceApply getFinanceApply(Integer appId) {
		return ordFinanceApplyDAO.get(appId);
	}

	public void saveApplyStatus(OrdFinanceApply apply, OrdFinanceApplyCheck check) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setApplyStatus(apply.getApplyStatus());
		if (apply.getAgreeNum() != null && apply.getAgreeNum().trim().length() > 0) {
			ofa.setAgreeNum(apply.getAgreeNum());
		}
		ordFinanceApplyDAO.saveOrUpdate(ofa);

		if (check == null) {
			check = new OrdFinanceApplyCheck();
		}
		check.setFinanceApplyId(apply.getId());
		check.setCheckStatus(apply.getApplyStatus());
		check.setCreatedt(new Date());
		if(check.getCheckView() == null || check.getCheckView().trim().equals("")){
			check.setCheckView(dicCommonDAO.get(apply.getApplyStatus()).getName());
		}
		ordFinanceApplyCheckDAO.save(check);
	}

	public void saveNewAttach(OrdFinanceApplyAttach attach) {
		attach.setAttachType(Integer.valueOf(1));
		attach.setUploadStatus(Integer.valueOf(212));
		attach.setSupplyCreatedt(new Date());
		attach.setIsdeleted(Integer.valueOf(0));
		ordFinanceApplyAttachDAO.save(attach);

		OrdFinanceApply apply = ordFinanceApplyDAO.get(attach.getApplyId());
		apply.setApplyStatus(Integer.valueOf(183));
		ordFinanceApplyDAO.saveOrUpdate(apply);
	}

	public List<OrdFinanceApply> findFinanceApply(FindFinanceApplySpModel spModel) {
		UsrUser user = spModel.getUser();
		List<OrdFinanceApply> applyList = null;
		if (user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3) {// 银行或其它贷款机构
			applyList = ordFinanceApplyDAO.findApplyByOrg(user.getId(), spModel.getShowNumber());
		} else if (user.getUserTypeGroup().intValue() == 1 || user.getUserTypeGroup().intValue() == 5) {// 个人与企业
			applyList = ordFinanceApplyDAO.findApplyByUserId(user.getId(), spModel.getShowNumber());
		}
		return applyList;
	}
	public List<OrdFinanceApplyCheck> findApplyCheck(Integer applyId){
		return ordFinanceApplyCheckDAO.findApplyCheck(applyId);
	}
	public List<PrdExtendsValue> getFinanceApplyExtendsValue(Integer applyId){
		return prdExtendsValueDAO.getFinanceApplyExtendsValue(applyId);
	}
	
	// setter and getter
	public void setPrdFinanceDAO(PrdFinanceDAO prdFinanceDAO) {
		this.prdFinanceDAO = prdFinanceDAO;
	}

	public void setOrdFinanceApplyDAO(OrdFinanceApplyDAO ordFinanceApplyDAO) {
		this.ordFinanceApplyDAO = ordFinanceApplyDAO;
	}

	public void setOrdFinanceApplyAttachDAO(OrdFinanceApplyAttachDAO ordFinanceApplyAttachDAO) {
		this.ordFinanceApplyAttachDAO = ordFinanceApplyAttachDAO;
	}

	public void setOrdFaAttachListDAO(OrdFaAttachListDAO ordFaAttachListDAO) {
		this.ordFaAttachListDAO = ordFaAttachListDAO;
	}

	public void setOrdFinanceApplyCheckDAO(OrdFinanceApplyCheckDAO ordFinanceApplyCheckDAO) {
		this.ordFinanceApplyCheckDAO = ordFinanceApplyCheckDAO;
	}

	public void setUsrCompanyDAO(UsrCompanyDAO usrCompanyDAO) {
		this.usrCompanyDAO = usrCompanyDAO;
	}

	@Override
	public OrdFinanceApply findById(Integer id) {
		return ordFinanceApplyDAO.findById(id);
	}

	private NotifyQueueService notifyQueueService;

	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}

	public void setDicCommonDAO(DicCommonDAO dicCommonDAO) {
		this.dicCommonDAO = dicCommonDAO;
	}

	public void setPrdExtendsPropertyDAO(PrdExtendsPropertyDAO prdExtendsPropertyDAO) {
		this.prdExtendsPropertyDAO = prdExtendsPropertyDAO;
	}

	public void setPrdPropertyDicDAO(PrdPropertyDicDAO prdPropertyDicDAO) {
		this.prdPropertyDicDAO = prdPropertyDicDAO;
	}

	public void setPrdExtendsValueDAO(PrdExtendsValueDAO prdExtendsValueDAO) {
		this.prdExtendsValueDAO = prdExtendsValueDAO;
	}
}
