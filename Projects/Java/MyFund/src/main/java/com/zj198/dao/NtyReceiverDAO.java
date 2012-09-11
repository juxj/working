package com.zj198.dao;

import com.zj198.model.NtyReceiver;

public interface NtyReceiverDAO extends BaseDAO<NtyReceiver, Long> {

	public void upIsRead(Long mid);
}
