package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.MchChargeDAO;
import com.zj198.model.MchCharge;

public class MchChargeDAOImpl extends HibernateDAO<MchCharge, Integer> implements MchChargeDAO {

	@Override
	public List<MchCharge> getMchChargeByType(Integer typeId) {
		String hql = "from MahCharge where typeId = :typeId";
		return list(hql, "typeId", typeId);
	}
}
