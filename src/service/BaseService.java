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

import java.util.List;

/**
 * @author 雷霄骅
 * 对Object的Service
 * 包含了一些通用的方法
 */
public interface BaseService {
	/**
	 * 保存一个对象
	 * @param object 一个对象
	 */
	 public void save(Object object);
	 /**
	  * 更新一个对象
	  * @param object 一个对象
	  */
	 public void update(Object object);
	 /**
	  * 删除一个对象
	  * @param object 一个对象
	  */
	 public void delete(Object object);
	 /**
	  * 根据ID读取一个指定名称的对象
	  * @param targetName 对象的名称
	  * @param id 对象的ID
	  * @return 一个对象
	  */
	 public Object ReadByID(String targetName,int id);
	 
	 @SuppressWarnings("rawtypes")
	 /**
	  * 获取指定类型的所有对象
	  * @param targetName 对象类型名称
	  * @return 对象的列表
	  */
	 public List ReadAll(String targetName);
	 
	 @SuppressWarnings("rawtypes")
	 /**
	  * 根据“属性-值”获取多个指定类型的对象
	  * @param targetName 对象类型名称
	  * @param propertyName 对象中属性的名称
	  * @param propertyValue 对象中属性的值
	  * @return 对象的列表
	  */
	 public List ReadByProperty(String targetName,String propertyName,Object propertyValue);

	 /**
	  * 根据“属性-值”获取一个指定类型的对象
	  * @param targetName 对象类型名称
	  * @param propertyName 对象中属性的名称
	  * @param propertyValue 对象中属性的值
	  * @return 一个对象
	  */
	 public Object ReadSingle(String targetName,String propertyName,Object propertyValue);
	 
	 /**
	  * 获取多个指定类型的对象，可以限定获取对象数目的多少，并且根据特定的属性进行排序。
	  * @param targetName 对象类型名称
	  * @param propertyName 对象中属性的名称，用于排序
	  * @param num 结果对象列表的最大数目
	  * @param order 排序方式，可以选择“asc”或者“desc”
	  * @return 对象的列表
	  */
	 public List ReadLimitedByOrder(String targetName,String propertyName,int num,String order);
	 
	 /**
	  * 获取指定类型的对象的数量。
	  * @param targetName 对象类型名称
	  * @return 数量
	  */
	 public int ReadCount(String targetName);
	 /**
	  * 根据“属性-值”为条件，获取指定类型的对象的数量。
	  * @param targetName 对象类型名称
	  * @param propertyName 对象中属性的名称
	  * @param propertyValue 对象中属性的值
	  * @return 数量
	  */
	public int ReadCountByProperty(final String targetName,String propertyName, Object value);
	/**
	 * 两个功能：
	 * 1.根据“属性-值”获取多个指定类型的对象
	 * 2.限定获取对象数目的多少，并且根据特定的属性进行排序。
	 * @param targetName 对象类型名称
	 * @param readpropertyName 对象中属性的名称，用于获取对象
	 * @param readvalue 对象中属性的值
	 * @param orderpropertyName 对象中属性的名称，用于排序
	 * @param num 结果对象列表的最大数目
	 * @param order 排序方式，可以选择“asc”或者“desc”
	 * @return
	 */
	public List ReadByPropertyAndLimitedByOrder(final String targetName, final String readpropertyName,
			final Object readvalue,final String orderpropertyName, final int num, final String order);

}
