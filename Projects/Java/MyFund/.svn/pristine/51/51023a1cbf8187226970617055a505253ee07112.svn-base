package com.zj198.service.mch.impl;

import java.util.Calendar;
import java.util.List;

import com.zj198.dao.MchBankDAO;
import com.zj198.dao.MchChargeDAO;
import com.zj198.dao.MchTypeDAO;
import com.zj198.model.MchBank;
import com.zj198.model.MchCharge;
import com.zj198.model.MchType;
import com.zj198.service.mch.MemberChargeService;

public class MemberChargeServiceImpl implements MemberChargeService {

	private MchTypeDAO mchTypeDAO;
	private MchBankDAO mchBankDAO;
	private MchChargeDAO mchChargeDAO;
	
	@Override
	public MchType getMchType(Integer id) {
		return this.mchTypeDAO.get(id);
	}

	@Override
	public List<MchType> getMchTypeList() {
		return this.mchTypeDAO.findAll();
	}

	@Override
	public void saveMchType(MchType instance) {
		instance.setEffectiveDate(Calendar.getInstance().getTime());
		instance.setExpiredDate(Calendar.getInstance().getTime());
		this.mchTypeDAO.saveOrUpdate(instance);
	}

	@Override
	public void deleteMchType(MchType instance) {
		this.mchTypeDAO.deleteObject(instance);
	}

	@Override
	public MchCharge getMchCharge(Integer id) {
		return this.mchChargeDAO.get(id);
	}

	@Override
	public List<MchCharge> getMchChargeList() {
		return this.mchChargeDAO.findAll();
	}

	@Override
	public void saveMchCharge(MchCharge instance) {
		this.mchChargeDAO.saveOrUpdate(instance);
	}

	@Override
	public void deleteMchCharge(MchCharge instance) {
		this.mchChargeDAO.deleteObject(instance);
	}

	@Override
	public List<MchCharge> getMchChargeByType(Integer typeId) {
		return this.mchChargeDAO.getMchChargeByType(typeId);
	}

	@Override
	public MchBank getMchBankById(Integer id) {
		return this.mchBankDAO.get(id);
	}

	@Override
	public List<MchBank> getMchBankList() {
		return this.mchBankDAO.findAll();
	}

	@Override
	public void saveMchBank(MchBank instance) {
		this.mchBankDAO.saveOrUpdate(instance);
	}

	@Override
	public void deleteMchBank(MchBank instance) {
		this.mchBankDAO.deleteObject(instance);
	}

	public MchTypeDAO getMchTypeDAO() {
		return mchTypeDAO;
	}

	public void setMchTypeDAO(MchTypeDAO mchTypeDAO) {
		this.mchTypeDAO = mchTypeDAO;
	}

	public MchBankDAO getMchBankDAO() {
		return mchBankDAO;
	}

	public void setMchBankDAO(MchBankDAO mchBankDAO) {
		this.mchBankDAO = mchBankDAO;
	}

	public MchChargeDAO getMchChargeDAO() {
		return mchChargeDAO;
	}

	public void setMchChargeDAO(MchChargeDAO mchChargeDAO) {
		this.mchChargeDAO = mchChargeDAO;
	}

	
}
