/**
 * 最简单的视频网站
 * Simplest Video Website
 *
 * 雷霄骅 Lei Xiaohua
 * 
 * leixiaohua1020@126.com
 * 中国传媒大学/数字电视技术
 * Communication University of China / Digital TV Technology
 * http://blog.csdn.net/leixiaohua1020
 *
 * 本程序是一个最简单的视频网站视频。它支持
 * 1.直播
 * 2.点播
 * This software is the simplest video website.
 * It support: 
 * 1. live broadcast 
 * 2. VOD 
 */
package dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;



/**
 * @author 雷霄骅
 * HibernateTemplate提供非常多的常用方法来完成基本的操作，比如通常的增加、删除、修改、查询等操作，
 * Spring 2.0更增加对命名SQL查询的支持，也增加对分页的支持。大部分情况下，就可完成大多数DAO对象的CRUD操作。
 */
public class BaseDaoImpl extends HibernateDaoSupport implements BaseDao{

	@Override
	public void save(Object object) {
		getHibernateTemplate().save(object);
	}

	@Override
	public void delete(Object object) {
		getHibernateTemplate().delete(object);
	}

	@Override
	public void update(Object object) {
		getHibernateTemplate().update(object);
	}

	@Override
	public Object ReadSingle(final String targetName,final String propertyName, final Object value) {
		// TODO Auto-generated method stub
		return (Object) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			/*doInHibernate()。session的创建和销毁，一切都在程序内部完成。*/
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from "+targetName+" as "+targetName+" where "+targetName+"." + propertyName + "=:value";
				Query query = session.createQuery(hql);
				query.setParameter("value", value);
				return query.uniqueResult();
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> ReadAll(String targetName) {
		// TODO Auto-generated method stub
		String hql="from "+targetName;
		return getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> ReadByProperty(final String targetName, final String propertyName,
			final Object value) {
		// TODO Auto-generated method stub
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			/*doInHibernate()。session的创建和销毁，一切都在程序内部完成。*/
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from "+targetName+" as "+targetName+" where "+targetName+"." + propertyName + "=:value";
				Query query = session.createQuery(hql);
				query.setParameter("value", value);
				return query.list();
			}
		});
	}
	

	@Override
	public List<Object> ReadByPropertyList(String targetName,
			String propertyName, Object value) {
		// TODO Auto-generated method stub
		return null;
	}
//这里在Hibernate2.0之前版本list.get(0)返回的是Integer类型. 
//但是在Hibernate3.0以后版本list.get(0)返回的是Long类型. 
//所以在这里不可以由Long型强转成Integer类型. 
//Integer属于不可更改类型，而且Long和Integer没有任何继承关系，当然不能这样转换。
	@Override
	public Integer ReadCount(final String targetName) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			/*doInHibernate()。session的创建和销毁，一切都在程序内部完成。*/
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "select count(*) from "+targetName;
				//System.out.println(hql);
				//注:java.lang.Number是Integer,Long的父类.
				return ((Number)session.createQuery(hql).iterate().next()).intValue();
			}
		});
	}
	
	@Override
	public Integer ReadCountByProperty(final String targetName,final String propertyName, final Object value) {
		// TODO Auto-generated method stub
		return (Integer) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			/*doInHibernate()。session的创建和销毁，一切都在程序内部完成。*/
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "select count(*) from "+targetName+" as "+targetName+" where "+targetName+"." + propertyName + "=:value";
				
				Query query = session.createQuery(hql);
				query.setParameter("value", value);
				//System.out.println(query);
				
				return ((Number)query.iterate().next()).intValue();
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> ReadLimitedByOrder(final String targetName,
			final String propertyName, final int num, final String order) {
		// TODO Auto-generated method stub
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			/*doInHibernate()。session的创建和销毁，一切都在程序内部完成。*/
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				String hql ="from "+targetName+" as "+targetName+ " order by "+targetName+"." + propertyName+ " " + order;
				Query query = session.createQuery(hql);
				query.setMaxResults(num);
				//当返回的数据不是一条的时候，不用uniqueresult()，而用list()
				return query.list();
			}
		});
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> ReadByPropertyAndLimitedByOrder(final String targetName, final String readpropertyName,
			final Object readvalue,final String orderpropertyName, final int num, final String order) {
		// TODO Auto-generated method stub
		return (List<Object>) getHibernateTemplate().execute(new HibernateCallback<Object>() {
			/*doInHibernate()。session的创建和销毁，一切都在程序内部完成。*/
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from "+targetName+" as "+targetName+" where "+targetName+"." + readpropertyName + "=:value"+
						" order by "+targetName+"." + orderpropertyName+ " " + order;
				Query query = session.createQuery(hql);
				query.setParameter("value", readvalue);
				query.setMaxResults(num);
				return query.list();
			}
		});
	}

}
