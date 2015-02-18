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
package service;

import java.util.ArrayList;
import java.util.List;

import dao.BaseDao;
/**
 * @author 雷霄骅
 * 对Object的Service
 * 包含了一些通用的方法
 */
public class BaseServiceImpl implements BaseService {
	
	private BaseDao baseDao;
	@Override
	public void save(Object object) {
		// TODO Auto-generated method stub
		baseDao.save(object);
	}

	@Override
	public void update(Object object) {
		// TODO Auto-generated method stub
		baseDao.update(object);
	}

	@Override
	public void delete(Object object) {
		// TODO Auto-generated method stub
		baseDao.delete(object);
	}

	@Override
	public Object ReadByID(String targetName,int id) {
		// TODO Auto-generated method stub
		return baseDao.ReadSingle(targetName,"id", id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List ReadAll(String targetName) {
		// TODO Auto-generated method stub
		return baseDao.ReadAll(targetName);
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List ReadByProperty(String targetName, String propertyName,
			Object propertyValue) {
		// TODO Auto-generated method stub
		return baseDao.ReadByProperty(targetName, propertyName, propertyValue);
	}

	@Override
	public Object ReadSingle(String targetName, String propertyName,
			Object propertyValue) {
		// TODO Auto-generated method stub
		return baseDao.ReadSingle(targetName, propertyName, propertyValue);
	}

	@Override
	public List ReadLimitedByOrder(String targetName, String propertyName,
			int num, String order) {
		return baseDao.ReadLimitedByOrder(targetName,propertyName,num,order);
	}
	
	@Override
	public int ReadCount(String targetName) {
		// TODO Auto-generated method stub
		return baseDao.ReadCount(targetName);
	}

	@Override
	public int ReadCountByProperty(String targetName,String propertyName, Object value) {
		// TODO Auto-generated method stub
		return baseDao.ReadCountByProperty(targetName,propertyName,value);
	}

	@Override
	public List ReadByPropertyAndLimitedByOrder(String targetName,
			String readpropertyName, Object readvalue,
			String orderpropertyName, int num, String order) {
		return baseDao.ReadByPropertyAndLimitedByOrder(targetName, readpropertyName, readvalue,
				orderpropertyName, num, order);
	}

}
