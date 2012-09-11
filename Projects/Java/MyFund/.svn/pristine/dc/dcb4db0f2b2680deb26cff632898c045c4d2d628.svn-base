package com.zj198.service.message;

import java.util.List;

import com.zj198.model.NtyMessage;
import com.zj198.service.message.model.AddMessageSpModel;
import com.zj198.util.Pager;

public interface NtyMessageService {
	public void addNewMessage(AddMessageSpModel spModel);

	public List<NtyMessage> findTopMsgs(Integer uid);

	public Pager findComMsgs(Integer pageNo, Integer pageSize, Integer uid);

	public Pager findComMsgsNoRead(Integer pageNo, Integer pageSize, Integer uid);

	public Pager findComMsgsRead(Integer pageNo, Integer pageSize, Integer uid);

	public void deleteAll(String[] msgIds);

	public void updateIsRead(Long mid);

	public Integer getMsgNo(Integer uid);
}
