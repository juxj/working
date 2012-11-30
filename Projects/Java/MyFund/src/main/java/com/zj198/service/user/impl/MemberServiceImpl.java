package com.zj198.service.user.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.zj198.dao.OrdMemberShipDAO;
import com.zj198.dao.UsrMemberPeroidDAO;
import com.zj198.model.OrdMembership;
import com.zj198.model.UsrMemberPeroid;
import com.zj198.service.user.MemberService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public class MemberServiceImpl implements MemberService {
	private OrdMemberShipDAO ordMemberShipDAO;
	private UsrMemberPeroidDAO usrMemberPeroidDAO;
	

	public UsrMemberPeroidDAO getUsrMemberPeroidDAO() {
		return usrMemberPeroidDAO;
	}
	public void setUsrMemberPeroidDAO(UsrMemberPeroidDAO usrMemberPeroidDAO) {
		this.usrMemberPeroidDAO = usrMemberPeroidDAO;
	}
	public OrdMemberShipDAO getOrdMemberShipDAO() {
		return ordMemberShipDAO;
	}
	public void setOrdMemberShipDAO(OrdMemberShipDAO ordMemberShipDAO) {
		this.ordMemberShipDAO = ordMemberShipDAO;
	}
	@Override
	public void saveOrdMP(OrdMembership ordMembership) {
		if(ordMembership.getId() == null){
			ordMembership.setIscancelled(0);
			ordMembership.setPayStatus(Constants.USER_VIPTYPE_PAYSTATUS_OFF);
			ordMembership.setCreateTime(Calendar.getInstance().getTime());
			ordMemberShipDAO.save(ordMembership);
		}else{
			ordMembership.setIscancelled(0);
			ordMembership.setPayStatus(Constants.USER_VIPTYPE_PAYSTATUS_OFF);
			ordMembership.setCreateTime(Calendar.getInstance().getTime());
			ordMemberShipDAO.update(ordMembership);
		}
	}
	@Override
	public void updateOrdMP(OrdMembership ordMembership) {
		ordMemberShipDAO.update(ordMembership);
	}
	@Override
	public void deleteOrdMPByIdUid(Integer id,Integer uid) {
		OrdMembership order = ordMemberShipDAO.get(id);
		if(order.getUserId()-uid==0){
			order.setIscancelled(Constants.USER_VIPTYPE_ISCANCELLED_OFF);
			ordMemberShipDAO.update(order);
		}
	}
	@Override
	public OrdMembership getOrdMPById(Integer id) {
		return ordMemberShipDAO.get(id);
	}
	@Override
	public List<OrdMembership> findOrdMPByUserid(Integer userid) {
		return ordMemberShipDAO.findOrdMSByUserid(userid);
	}
	@Override
	public Pager findAllOrdMP(Integer id,Integer userid,Integer pageNo, Integer pageSize) {
		return ordMemberShipDAO.findAllOrdMS(id, userid, pageNo, pageSize);
	}
	@Override
	public Pager findAllUsrMP(Integer ordId,String username,Integer status,Integer memberType,Date[] startdt,Date[] createdt,Integer pageNo, Integer pageSize) {
		return usrMemberPeroidDAO.findAllUsrMP(ordId, username, status, memberType, startdt, createdt, pageNo, pageSize);
	}
	@Override
	public void updateOrdMPStatus(Integer id, Integer status) {
		OrdMembership ordMembership = ordMemberShipDAO.get(id);
		if(ordMembership.getUserId().equals("")){
			
		}
		ordMembership.setPayStatus(status);
		ordMemberShipDAO.update(ordMembership);
	}
	@Override
	public void saveUsrMP(UsrMemberPeroid usrMemberPeroid) {
		
		usrMemberPeroidDAO.save(usrMemberPeroid);
	}
	@Override
	public UsrMemberPeroid getUsrMP(Integer userid) {
		return usrMemberPeroidDAO.getUsrMP(userid);
	}
	@Override
	public UsrMemberPeroid getUsrMPById(Integer id) {
		return usrMemberPeroidDAO.get(id);
	}
	
}
