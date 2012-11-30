package com.zj198.dao.hibernate;

import java.lang.reflect.ParameterizedType;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zj198.dao.BaseDAO;
import com.zj198.util.Pager;


public abstract class HibernateDAO<T extends java.io.Serializable, PK extends java.io.Serializable> implements BaseDAO<T, PK> {
	
	/**泛型传入的类*/
    private final Class<T> entityClass;
    /**SessionFactory*/
    private SessionFactory sessionFactory;
    /**Log4j*/
    private static final Logger log = LoggerFactory.getLogger(HibernateDAO.class);
    /**参数传递的Hashtable*/
    
    @SuppressWarnings("unchecked")
	public HibernateDAO() {
        this.entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
	@Override
	public PK save(T model) {
        return (PK) getSession().save(model);
    }
    
    public void saveOrUpdate(T model) {
    	this.getSession().saveOrUpdate(model);
    }

    @Override
    public void update(T model) {
        getSession().update(model);
    }

    @Override
    public void delete(PK id) {
    	T m = get(id);
    	if(m!=null){
    		deleteObject(m);
    	}
    }

    @Override
    public void deleteObject(T model) {
        getSession().delete(model);
    }

    @Override
    public boolean exists(PK id) {
        return get(id) != null;
    }
   
    @SuppressWarnings("unchecked")
	@Override
    public T get(PK id) {
        return (T) getSession().get(this.entityClass, id);
    }
    
	public List<T> list(String hql, Object... params) {
		return getQuery(hql,params).list();
	}
	
	public List<T> listByTable(String hql, Hashtable<String, Object> paramMap) {
		return getQuery(hql, paramMap).list();
	}

	public List<T> findAll(){
    	String hql = "from "+ entityClass.getName();
    	return getQuery(hql).list();
	}
	
	protected List<T> findTopRows(String hql, int limitNum, Object... values) {
		Query query = getQuery(hql, values);
		return query.setFirstResult(0).setMaxResults(limitNum).list();
	}

	public Pager pagedQuery(String hql, Integer pageNo, Integer pageSize, Object... values) {
		if(pageSize == 0)pageSize = 10;
		if(pageNo==null || pageNo<1)pageNo=1;
		int totalRows = getTotalRows(hql, values);
		int start = (pageNo - 1) * pageSize;
		Query query = getQuery(hql, values);
		List<Object> list = query.setFirstResult(start).setMaxResults(pageSize).list();
		return new Pager(totalRows, pageNo, pageSize, list);
	}
	
//	public Pager pagedQuery(String hql, Integer pageNo, Integer pageSize, final Hashtable<String, Object> paramMap) {
//		if(pageSize == 0)pageSize = 10;
//		if(pageNo==null || pageNo<1)pageNo=1;
//		int totalRows = getTotalRows(hql, paramMap);		
//		int start = (pageNo - 1) * pageSize;
//		Query query = getQuery(hql, paramMap);
//		List<Object> list = query.setFirstResult(start).setMaxResults(pageSize).list();
//		return new Pager(totalRows, pageNo, pageSize, list);
//	}
	
	protected int getTotalRows(String hql, Object... values){
		String altHql = " select count(*) " + removeSelect(removeOrders(hql));
		List<Long> countlist = getQuery(altHql,values).list();
		if(countlist == null || countlist.isEmpty())return 0;
		return countlist.get(0).intValue();
	}
	
//	private int getTotalRows(String hql, final Hashtable<String, Object> paramMap){
//		String altHql = " select count(*) " + removeSelect(removeOrders(hql));
//		List<Long> countlist = getQuery(altHql,paramMap).list();
//		if(countlist == null || countlist.isEmpty())return 0;
//		return countlist.get(0).intValue();
//	}
	
	private String removeSelect(String hql) {
		int beginPos = hql.toLowerCase().indexOf("from");
		return hql.substring(beginPos);
	}
	
	private static String removeOrders(String hql) {
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(hql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}
	
	protected Query getQuery(final String hql, Object... params) {
		Query query = getSession().createQuery(hql);
		if(params!=null){
			if(params.length==1 && params[0] instanceof Hashtable){
				Hashtable<String, Object> map = (Hashtable<String, Object>)params[0];
				Enumeration<String> keys = map.keys();
				while (keys.hasMoreElements()) {
					String key = keys.nextElement();
					query.setParameter(key, map.get(key));
				}
			}else if(params.length%2==0){
				for (int i = 0; i < params.length; i=i+2) {
					query.setParameter(params[i].toString(), params[i+1]);
				}
			}else{
				System.out.println("HibernateDAO调用错误:"+hql);
				return null;
			}
		}
		return query;
		
	}
	
	public Pager pagedComplexSqlQuery(String sql,Map<String,Class> entityClassMap, Integer pageNo, Integer pageSize, Object... values) {
		if(pageSize == 0)pageSize = 10;
		if(pageNo==null || pageNo<1)pageNo=1;
		int totalRows = getSqlTotalRows(sql, values);
		int start = (pageNo - 1) * pageSize;
		Query query = getComplexSqlQueryEntity(sql,entityClassMap, values);
		List<Object> list = query.setFirstResult(start).setMaxResults(pageSize).list();
		return new Pager(totalRows, pageNo, pageSize, list);
	}
	
	public Pager pagedSqlQuery(String sql,Class entityClass, Integer pageNo, Integer pageSize, Object... values) {
		if(pageSize == 0)pageSize = 10;
		if(pageNo==null || pageNo<1)pageNo=1;
		int totalRows = getSqlTotalRows(sql, values);
		int start = (pageNo - 1) * pageSize;
		Query query = getSqlQueryEntity(sql,entityClass, values);
		List<Object> list = query.setFirstResult(start).setMaxResults(pageSize).list();
		return new Pager(totalRows, pageNo, pageSize, list);
	}
	protected Query getComplexSqlQueryEntity(final String sql,Map<String,Class> entityClassMap, Object... params){
		SQLQuery query = getSession().createSQLQuery(sql); 
		Iterator<String> i = entityClassMap.keySet().iterator();
		while(i.hasNext()){
			String key =i.next();
			query.addEntity(key,entityClassMap.get(key));
		}
		
		return this.getQueryParams(query, params);
	}
	protected Query getSqlQueryEntity(final String sql,Class entityClass, Object... params) {
		Query query = getSession().createSQLQuery(sql).addEntity(entityClass);
		return this.getQueryParams(query, params);
	}
	
	protected int getSqlTotalRows(String sql, Object... values){
		String altHql = " select count(*) " + removeSelect(removeOrders(sql));
		List<Long> countlist = getSqlQuery(altHql,values).list();
		if(countlist == null || countlist.isEmpty())return 0;
		Object obj = countlist.get(0);
		return Integer.parseInt(obj.toString());
	}
	
	protected Query getQueryParams(Query query, Object... params) {
		if(params!=null){
			if(params.length==1 && params[0] instanceof Hashtable){
				Hashtable<String, Object> map = (Hashtable<String, Object>)params[0];
				Enumeration<String> keys = map.keys();
				while (keys.hasMoreElements()) {
					String key = keys.nextElement();
					query.setParameter(key, map.get(key));
				}
			}else if(params.length%2==0){
				for (int i = 0; i < params.length; i=i+2) {
					query.setParameter(params[i].toString(), params[i+1]);
				}
			}else{
				System.out.println("HibernateDAO调用错误:");
				return null;
			}
		}
		return query;
		
	}
	protected Query getSqlQuery(final String sql,Object... params) {
		Query query = getSession().createSQLQuery(sql);
		if(params!=null){
			if(params.length==1 && params[0] instanceof Hashtable){
				Hashtable<String, Object> map = (Hashtable<String, Object>)params[0];
				Enumeration<String> keys = map.keys();
				while (keys.hasMoreElements()) {
					String key = keys.nextElement();
					query.setParameter(key, map.get(key));
				}
			}else if(params.length%2==0){
				for (int i = 0; i < params.length; i=i+2) {
					query.setParameter(params[i].toString(), params[i+1]);
				}
			}else{
				System.out.println("HibernateDAO调用错误:"+sql);
				return null;
			}
		}
		return query;
		
	}
	
}
