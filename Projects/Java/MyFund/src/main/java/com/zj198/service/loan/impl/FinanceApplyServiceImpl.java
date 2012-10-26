package com.zj198.service.loan.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.zj198.action.fund.model.FundIntention;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.dao.DicCommonDAO;
import com.zj198.dao.OrdCheckLogDAO;
import com.zj198.dao.OrdFaAttachListDAO;
import com.zj198.dao.OrdFinanceApplyAttachDAO;
import com.zj198.dao.OrdFinanceApplyDAO;
import com.zj198.dao.PrdExtendsPropertyDAO;
import com.zj198.dao.PrdExtendsValueDAO;
import com.zj198.dao.PrdFinanceDAO;
import com.zj198.dao.PrdPropertyDicDAO;
import com.zj198.dao.UsrCompanyDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.NtyMessageQueue;
import com.zj198.model.OrdCheckLog;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
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
import com.zj198.service.message.NtyMessageService;
import com.zj198.service.message.model.SendEmailMsgSpModel;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.OrderNOCreator;
import com.zj198.util.Pager;
import com.zj198.util.PropertiesUtil;
import com.zj198.util.UploadUtil;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
 */
public class FinanceApplyServiceImpl implements FinanceApplyService {
	private PrdFinanceDAO prdFinanceDAO;
	private OrdFinanceApplyDAO ordFinanceApplyDAO;
	private OrdFinanceApplyAttachDAO ordFinanceApplyAttachDAO;
	private OrdFaAttachListDAO ordFaAttachListDAO;
	private OrdCheckLogDAO ordCheckLogDAO;
	private UsrCompanyDAO usrCompanyDAO;
	private DicCommonDAO dicCommonDAO;
	private PrdExtendsPropertyDAO prdExtendsPropertyDAO;
	private PrdPropertyDicDAO prdPropertyDicDAO;
	private PrdExtendsValueDAO prdExtendsValueDAO;
	private UsrUserDAO usrUserDAO;
	private ProfileService profileService;
	private NtyMessageService ntyMessageService;

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
		apply.setApplyStatus(Integer.valueOf(301));// 待审核
		apply.setCreatedt(new Date());
		apply.setUserId(user.getId());
		apply.setIsdeleted(Integer.valueOf(0));
		if (user.getUserTypeGroup().intValue() == 1) {
			UsrCompany company = usrCompanyDAO.get(user.getId());
			if (company != null) {
				apply.setApplyUserName(company.getCompanyname());
			}
		} else {
			apply.setApplyUserName(user.getRealname());
		}
		ordFinanceApplyDAO.save(apply);

		String applyNum = OrderNOCreator.rapidFinanceApplyOrderNO(apply.getId().intValue());// 申请编号
		apply.setApplyNum(applyNum);
		ordFinanceApplyDAO.update(apply);

		OrdCheckLog check = new OrdCheckLog();
		check.setOrdId(apply.getId());
		check.setCheckStatus(301);// 待审核
		check.setCreatedt(new Date());
		check.setCheckView("提交申请");
		check.setOrdType(Constants.ORD_CHECK_TYPE_APPLY);
		ordCheckLogDAO.save(check);

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
		// 发送Email给客服人员和客户
		Map<String, Object> m = new HashMap<String, Object>();
		Map<String, Object> n = new HashMap<String, Object>();
		String body;
		String since = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		try {
			m.put("currentTime", since);
			m.put("applyNum", applyNum);
			body = FreemarkerUtil.getContent("applyFinanceTemplate.htm", m, false, null, null);
			SendEmailMsgSpModel j = new SendEmailMsgSpModel();
			j.setTitle("融资产品申请 - 中国资金网");
			j.setSendType(1);// 内部邮件
			j.setContent(body);
			j.setReceiver(PropertiesUtil.getByKey("loan.servicer.shixl"));
			ntyMessageService.sendEmailMsg(j);
			n.put("userName", user.getRealname());
			n.put("applyTime", since);
			n.put("productName", product.getFinanceName());
			n.put("checkInfo", PropertiesUtil.getByKey("apply.msg.check.applyinfo"));
			n.put("applyNum", applyNum);
			n.put("pointContent", PropertiesUtil.getByKey("apply.msg.check.customer"));
			body = FreemarkerUtil.getContent("financeApplyCheck.htm", n, false, null, null);
			SendEmailMsgSpModel sp = new SendEmailMsgSpModel();
			sp.setTitle("融资产品申请 - 中国资金网");
			sp.setSendType(0);// 外部邮件
			sp.setContent(body);
			sp.setReceiver(PropertiesUtil.getByKey("loan.servicer.shixl"));
			ntyMessageService.sendEmailMsg(sp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/**
		 * 保存扩展属性
		 */
		this.saveExtendsParamater(apply.getId(), productId, spModel.getParamap());
		return applyNum;
	}

	public void saveExtendsParamater(Integer applyId, Integer productId, Map<?,?> param) {
		List<PrdExtendsProperty> extendsPropertyList = prdExtendsPropertyDAO.getFinancePropertys(productId);

		if (extendsPropertyList != null && extendsPropertyList.size() > 0) {
			String valueName = "epValue";
			for (PrdExtendsProperty p : extendsPropertyList) {
				String[] values = (String[]) param.get(valueName + p.getId());
				PrdExtendsValue value = new PrdExtendsValue();
				value.setExtendsType(p.getExtendsType());
				value.setRowId(applyId);
				value.setPropertyId(p.getId());
				value.setFieldCode(p.getFieldCode());
				value.setFieldName(p.getFieldName());
				value.setCreateDt(new Date());
				if (p.getFieldType() == 1 || p.getFieldType() == 2) {
					if (values.length > 0) {
						value.setEntityValue(values[0]);
					}
				} else {
					if (values.length > 0) {
						String vstr = "";
						for (String v : values) {
							vstr += v + ",";
						}
						vstr = vstr.substring(0, vstr.length() - 1);
						if (vstr.length() > 0) {
							value.setDicValue(vstr);
							List<PrdPropertyDic> diclist = prdPropertyDicDAO.findPropertyDic(p.getId(), vstr);
							String vcn = "";
							for (PrdPropertyDic dic : diclist) {
								vcn += dic.getDicName() + ",";
							}
							vcn = vcn.substring(0, vcn.length() - 1);
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

	/**
	 * 融资申请审核
	 */
	public void saveApplyStatus(OrdFinanceApply apply, OrdCheckLog check) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setApplyStatus(apply.getApplyStatus());
		if (apply.getAgreeNum() != null && apply.getAgreeNum().trim().length() > 0) {
			ofa.setAgreeNum(apply.getAgreeNum());
		}
		ordFinanceApplyDAO.saveOrUpdate(ofa);

		if (check == null) {
			check = new OrdCheckLog();
		}
		check.setOrdId(apply.getId());
		check.setCheckStatus(apply.getApplyStatus());
		check.setCreatedt(new Date());
		if (check.getCheckView() == null || check.getCheckView().trim().equals("")) {
			check.setCheckView(dicCommonDAO.get(apply.getApplyStatus()).getName());
		}
		check.setOrdType(Constants.ORD_CHECK_TYPE_APPLY);
		ordCheckLogDAO.save(check);
	}
	
	public void updateChuShen(OrdFinanceApply apply, OrdCheckLog log, String left, String right, String realName) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setBaseCheckStatus(left + right);
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		if (log == null) {
			log = new OrdCheckLog();
		}
		log.setOrdId(apply.getId());
		log.setCreateUserName(realName);
		log.setCheckLogType("00");
		log.setCreateUserType(0);
		log.setCheckStatus(apply.getApplyStatus());
		log.setCreatedt(new Date());
		if (log.getCheckView() == null || log.getCheckView().trim().equals("")) {
			log.setCheckView(dicCommonDAO.get(apply.getApplyStatus()).getName());
		}
		log.setOrdType(Constants.ORD_CHECK_TYPE_APPLY);
		ordCheckLogDAO.save(log);
	}
	

	public void updateFuShen(OrdFinanceApply apply, OrdCheckLog log, String realName) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		Integer j = apply.getApplyStatus();
		if(j == 302){
			ofa.setBaseCheckStatus("11");
		}
		ofa.setApplyStatus(apply.getApplyStatus());
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		if (log == null) {
			log = new OrdCheckLog();
		}
		log.setCreateUserName(realName);
		log.setOrdId(apply.getId());
		log.setCheckLogType("10");
		log.setCreateUserType(0);//0：admin   1：金融机构
		log.setCheckStatus(apply.getApplyStatus());
		log.setCreatedt(new Date());
		if (log.getCheckView() == null || log.getCheckView().trim().equals("")) {
			log.setCheckView(dicCommonDAO.get(apply.getApplyStatus()).getName());
		}
		log.setOrdType(Constants.ORD_CHECK_TYPE_APPLY);
		ordCheckLogDAO.save(log);
	}
	
	public void updateTuiHui(OrdFinanceApply apply, OrdCheckLog log, String left, String right, String realName) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setBaseCheckStatus(left+right);
		ofa.setApplyStatus(apply.getApplyStatus());
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		if (log == null) {
			log = new OrdCheckLog();
		}
		log.setCreateUserName(realName);
		log.setOrdId(apply.getId());
		log.setCheckLogType("10");
		log.setCreateUserType(0);//0：admin   1：金融机构
		log.setCheckStatus(apply.getApplyStatus());
		log.setCreatedt(new Date());
		if (log.getCheckView() == null || log.getCheckView().trim().equals("")) {
			log.setCheckView(dicCommonDAO.get(apply.getApplyStatus()).getName());
		}
		log.setOrdType(Constants.ORD_CHECK_TYPE_APPLY);
		ordCheckLogDAO.save(log);
	}
	
	public void updateFinalCheck(OrdFinanceApply apply, OrdCheckLog log, String realName){
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setApplyStatus(apply.getApplyStatus());
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		if (log == null) {
			log = new OrdCheckLog();
		}
		log.setCreateUserName(realName);
		log.setOrdId(apply.getId());
		log.setCheckLogType("11");
		log.setCreateUserType(0);//0：admin   1：金融机构
		log.setCheckStatus(apply.getApplyStatus());
		log.setCreatedt(new Date());
		if (log.getCheckView() == null || log.getCheckView().trim().equals("")) {
			log.setCheckView(dicCommonDAO.get(apply.getApplyStatus()).getName());
		}
		log.setOrdType(Constants.ORD_CHECK_TYPE_APPLY);
		ordCheckLogDAO.save(log);
	}
	
	public void updateAppInfo(OrdFinanceApply apply, String left, String right) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		if("2".equals(left)){
			left = "0";
		}
		if("2".equals(right)){
			right = "0";
		}
		ofa.setBaseCheckStatus(left+right);
		ofa.setApplyStatus(301);
		ordFinanceApplyDAO.saveOrUpdate(ofa);
	}
//
//	/**
//	 * 发送邮件
//	 * 
//	 * @param apply 申请单
//	 * @param check 审核单
//	 */
//	private void sendCheckEmail(OrdFinanceApply apply, OrdCheckLog check) {
//		try {
//			Map<String, Object> pm = new HashMap<String, Object>();
//			UsrUser user = usrUserDAO.get(apply.getUserId());
//			int groupid = profileService.getGroupidByUserType(user.getType());
//			if (groupid == Constants.USERTYPE_GROUP_COMPANY) {
//				UsrCompany usrCompany = (UsrCompany) profileService.getProfiles(user.getId());
//				pm.put("userName", usrCompany.getCompanyname());
//			} else if (groupid == Constants.USERTYPE_GROUP_PERSONAL) {
//				pm.put("userName", user.getRealname());
//			}
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//			String applyTime = sdf.format(apply.getCreatedt());
//			pm.put("applyTime", applyTime);// 申请时间
//			// apply.getApplyStatus();//申请状态
//			String checkInfo = "";
//			if (apply.getApplyStatus() == 180) {
//				checkInfo = "通过资金网预审";
//			} else if (apply.getApplyStatus() == 188) {
//				checkInfo = "未通过资金网预审";
//			} else if (apply.getApplyStatus() == 182) {
//				checkInfo = "资金方已接受申请";
//			} else if (apply.getApplyStatus() == 187) {
//				checkInfo = "未能被资金方受理";
//			} else if (apply.getApplyStatus() == 183) {
//				checkInfo = "需补充资料";
//			} else if (apply.getApplyStatus() == 185) {
//				checkInfo = "通过资金方审核";
//			} else if (apply.getApplyStatus() == 186) {
//				checkInfo = "资金方已放款";
//			}
//			pm.put("applyNum", apply.getApplyNum());
//			pm.put("checkInfo", checkInfo);
//			String body = FreemarkerUtil.getContent("financeApplyCheck.htm", pm, false, null, null);
//			NtyMessageQueue j = new NtyMessageQueue();
//			j.setTitle("融资申请 " + checkInfo + "- 中国资金网");
//			j.setContent(body);
//			j.setReceiver(user.getEmail());
//			j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
//			notifyQueueService.addNewMessage(j);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	public void saveNewAttach(OrdFinanceApplyAttach attach) {
		attach.setAttachType(Integer.valueOf(1));
		attach.setUploadStatus(Integer.valueOf(212));
		attach.setSupplyCreatedt(new Date());
		attach.setIsdeleted(Integer.valueOf(0));
		ordFinanceApplyAttachDAO.save(attach);

		OrdFinanceApply apply = ordFinanceApplyDAO.get(attach.getApplyId());
		//update finance status
		apply.setApplyStatus(Constants.ORD_FINANCE_STATUS_ORG_WAIT_UPLOAD);
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

	public List<OrdCheckLog> findApplyCheck(Integer applyId) {
		return ordCheckLogDAO.findApplyCheck(applyId);
	}

	public List<PrdExtendsValue> getFinanceApplyExtendsValue(Integer applyId) {
		return prdExtendsValueDAO.getFinanceApplyExtendsValue(applyId);
	}

	public void saveFundIntention(FundIntention fi) {
		try {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("userName", fi.getUserName());
			if (fi.getGender() != null) {
				if (fi.getGender() == 0) {
					m.put("gender", "先生");
				} else {
					m.put("gender", "女士");
				}
			}
			m.put("mobile", fi.getMobile());
			m.put("email", fi.getEmail());
			if (fi.getServiceTime() != null) {
				if (fi.getServiceTime() == 1) {
					m.put("serviceTime", "双休日白天");
				} else if (fi.getServiceTime() == 2) {
					m.put("serviceTime", "工作日上午");
				} else if (fi.getServiceTime() == 3) {
					m.put("serviceTime", "工作日中午");
				} else if (fi.getServiceTime() == 4) {
					m.put("serviceTime", "工作日晚间");
				}
			}
			switch (fi.getJtype()) {
			case 1:
				m.put("financeName", "圣迈鑫源投资基金低风险高收益计划");
				break;
			case 2:
				m.put("financeName", "中铁信托集合资金信托计划");
				break;
			case 3:
				m.put("financeName", "中融-中天城投基础设施1号财产权投资集合资金信托计划");
				break;
			default:
				m.put("financeName", "");
				break;
			}
			m.put("serviceContent", fi.getServiceContent());
			String body = FreemarkerUtil.getContent("fundIntentionTemplate.htm", m, false, null, null);
			NtyMessageQueue j = new NtyMessageQueue();
			j.setTitle("基金预约 - 中国资金网");
			j.setContent(body);
			j.setReceiver(Constants.LOAN_EMAIL);
			j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(j);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public OrdFinanceApply countAttachApply(OrdFinanceApply apply) {
		List<FinanceApplyAttachModel> attachList = this.findApplyAttach(apply.getId());

		int uploadNum = attachList.size();
		int needNum = 0;
		for (FinanceApplyAttachModel m : attachList) {
			if (m.getUploadStatus().intValue() == 1) {
				needNum++;
			}
		}
		apply.setUploadAttachNum(uploadNum);
		apply.setNeedAttachNum(needNum);

		return apply;
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

	public void setUsrCompanyDAO(UsrCompanyDAO usrCompanyDAO) {
		this.usrCompanyDAO = usrCompanyDAO;
	}

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

	public void setNtyMessageService(NtyMessageService ntyMessageService) {
		this.ntyMessageService = ntyMessageService;
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

	public List<OrdCheckLog> findApplyCheck(Integer applyId, Integer num) {
		return ordCheckLogDAO.findApplyCheck(applyId, num);
	}

	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public void deleteAttach(Integer[] ids) {
		ordFinanceApplyAttachDAO.deleteAttach(ids);
	}

	public void setOrdCheckLogDAO(OrdCheckLogDAO ordCheckLogDAO) {
		this.ordCheckLogDAO = ordCheckLogDAO;
	}



	

}
