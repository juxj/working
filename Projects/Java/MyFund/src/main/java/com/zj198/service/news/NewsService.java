package com.zj198.service.news;

import java.util.List;

import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;
import com.zj198.util.Pager;

public interface NewsService {
	
	public List<KnwTitle> findKnwTitleByType(Integer typeId);
	/**根据ID查找相应的新闻类型*/
	public KnwType getKnwTypeById(Integer id);
	/**查找所有的类别,供管理员操作*/
	public List<KnwType> findAllKnwType();
	/**保存管理对新闻类别的新增或改动*/
	public void saveKnwType(KnwType instance);
	/**删除(只做逻辑删除,将deletedFlag标记为1.*/
	public void deleteKnwType(KnwType instance);
//	/**获取首页新闻类别*/
//	public List<KnwType> findHomePageNewsType();
	
	
	/**根据Id查找某条具体新闻主题*/
	public KnwTitle getKnwTitleById(Integer id);
//	/**查找全部的新闻*/
//	public List<KnwTitle> findAllKnwTitle();
	/**根据新闻类别查找,并分页*/
	public Pager findKnwTitleByType(Integer typeId, int pageSize, int pageNo, short isAuthenticated, int isActive);
	/**根据新闻类别查找最新的num条已发布记录*/
	public List<KnwTitle> findLastestByType(Integer typeId,Integer num);
	/**查找未经审核的新闻*/
	public Pager findUnAuthenticatedTitleList(int pageSize, int pageNo);
	/**保存*/
	public void saveKnwTitle(KnwTitle instance);
	/**删除*/
	public void deleteKnwTitle(KnwTitle instance);
	
//	public List<KnwTitle> findKnwTitleByTypeId(Integer type, int pageSize, int pageNo);//TODO：用findLastestByType替代？
	
//	/**Get By Id*/
//	public KnwContent getKnwContentById(Integer id);
//	public KnwContent getKnwContentByTitle(Integer titleId, Integer pageId);
//	
//	/**根据新闻主题查找相应的内容*/
//	public List<KnwContent> findKnwContentByTitle(Integer titleId);
//	/**保存*/
//	public void saveKnwContent(KnwContent instance);
//	/**删除*/
//	public void deleteKnwContent(KnwContent instance);
	
}
