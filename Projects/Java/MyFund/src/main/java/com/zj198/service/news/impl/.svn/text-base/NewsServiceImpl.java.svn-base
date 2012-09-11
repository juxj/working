package com.zj198.service.news.impl;

import java.util.Calendar;
import java.util.List;

import com.zj198.dao.KnwTitleDAO;
import com.zj198.dao.KnwTypeDAO;
import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;
import com.zj198.service.news.NewsService;
import com.zj198.util.Pager;

public class NewsServiceImpl implements NewsService {

	private KnwTypeDAO knwTypeDAO;
	private KnwTitleDAO knwTitleDAO;
//	private KnwContentDAO knwContentDAO;
	
	public List<KnwTitle> findKnwTitleByType(Integer typeId){
		return this.knwTitleDAO.findKnwTitleByType(typeId);
	}
	
//	@Override
//	public List<KnwTitle> findKnwTitleByTypeId(Integer type, int pageSize, int pageNo) {
//		Pager pager = this.knwTitleDAO.findKnwTitleByType(type, pageSize, pageNo, Short.valueOf("1").shortValue());
//		List list = pager.getData();
//		return list;
//	}
	
//	/**融资案例*/
//	public List<KnwTitle> findFiancingCase(int pageSize, int pageNo){
//		Pager pager = this.knwTitleDAO.findKnwTitleByType(Constants.FINANCING_CASE, pageSize, pageNo, Short.valueOf("1").shortValue());
//		return (List)pager.getData();
//	}
	
	
//	/**首页上要显示的新闻类型,现在已经不用*/
//	@Override
//	public List<KnwType> findHomePageNewsType() {
//		return this.knwTypeDAO.findHomePageNewsType();
//	}

	/**新闻类型*/
	@Override
	public KnwType getKnwTypeById(Integer id) {
		return this.knwTypeDAO.get(id);
	}
	
	
	
	/**所有新闻类型*/
	@Override
	public List<KnwType> findAllKnwType() {
		return this.knwTypeDAO.findAll();
	}
	/**保存新闻类型*/
	@Override
	public void saveKnwType(KnwType instance) {
		this.knwTypeDAO.saveOrUpdate(instance);
	}
	
	/**删除新闻类型*/
	@Override
	public void deleteKnwType(KnwType instance) {
		this.knwTypeDAO.deleteObject(instance);
	}
	
	/**新闻标题*/
	@Override
	public KnwTitle getKnwTitleById(Integer id) {
		return this.knwTitleDAO.get(id);
	}
	
	
//	/**获取全部新闻标题*/
//	@Override
//	public List<KnwTitle> findAllKnwTitle() {
//		return this.knwTitleDAO.findAll();
//	}
	/**根据新闻类型查询相关新闻标题*/
	@Override
	public Pager findKnwTitleByType(Integer typeId, int pageSize, int pageNo, short isAuthenticated, int isActive) {
		return this.knwTitleDAO.findKnwTitleByType(typeId, pageSize, pageNo, isAuthenticated, isActive);
	}
	
	
	/**根据新闻类别查找最新的num条已发布记录*/
	public List<KnwTitle> findLastestByType(Integer typeId,Integer num){
		return knwTitleDAO.findLastestByType(typeId,num);
	}
	/**未经审核的新闻标题*/
	@Override
	public Pager findUnAuthenticatedTitleList(int pageSize, int pageNo) {
		return this.knwTitleDAO.findUnAuthenticatedList(pageSize, pageNo);
	}
	/**保存新闻标题*/
	@Override
	public void saveKnwTitle(KnwTitle instance) {
		
		if (instance.getIssuedDate() == null) {
			instance.setIssuedDate(Calendar.getInstance().getTime());
		}
		
		if (instance.getId()==null) {
			instance.setIsAuthenticated(Short.valueOf("1"));
			instance.setTotalPages(0);
			this.knwTitleDAO.save(instance);
		} else {
			this.knwTitleDAO.update(instance);
		}
		
	}
	/**删除新闻标题*/
	@Override
	public void deleteKnwTitle(KnwTitle instance) {
		instance.setIsActive(0);
		this.knwTitleDAO.update(instance);
	}
//	/**新闻内容*/
//	@Override
//	public KnwContent getKnwContentById(Integer id) {
//		return this.knwContentDAO.get(id);
//	}
//	/**根据标题查询新闻内容*/
//	@Override
//	public List<KnwContent> findKnwContentByTitle(Integer titleId) {
//		return this.knwContentDAO.findKnwContentByTitle(titleId);
//	}
//	/**保存新闻内容*/
//	@Override
//	public void saveKnwContent(KnwContent instance) {
//		if (instance.getId() == null) {
//			this.knwContentDAO.save(instance);
//		} else {
//			this.knwContentDAO.update(instance);//TODO:丢失部分字段
//		}
// 		
//	}
//	/**删除新闻内容*/
//	@Override
//	public void deleteKnwContent(KnwContent instance) {
//		this.knwContentDAO.deleteObject(instance);
//	}
//	/**根据新闻标题与内容页码查询指定内容*/
//	@Override
//	public KnwContent getKnwContentByTitle(Integer titleId,
//			Integer pageId) {
//		return this.knwContentDAO.getKnwContentByPageId(titleId, pageId);
//	}
	
	/**Setter and Getter.*/
	public void setKnwTypeDAO(KnwTypeDAO knwTypeDAO) {
		this.knwTypeDAO = knwTypeDAO;
	}
	public void setKnwTitleDAO(KnwTitleDAO knwTitleDAO) {
		this.knwTitleDAO = knwTitleDAO;
	}
//	public void setKnwContentDAO(KnwContentDAO knwContentDAO) {
//		this.knwContentDAO = knwContentDAO;
//	}

}
