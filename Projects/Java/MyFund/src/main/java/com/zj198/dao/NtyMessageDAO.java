package com.zj198.dao;

import java.util.List;

import com.zj198.model.NtyMessage;
import com.zj198.util.Pager;

public interface NtyMessageDAO extends BaseDAO<NtyMessage, Long> {

	public List<NtyMessage> findTopMsgs(Integer uid);

	public Pager findComMsgs(Integer pageNo, Integer pageSize, Integer uid);

	public Pager findComMsgsNoRead(Integer pageNo, Integer pageSize, Integer uid);

	public Pager findComMsgsRead(Integer pageNo, Integer pageSize, Integer uid);

	public Integer getMsgNo(Integer uid);

}
