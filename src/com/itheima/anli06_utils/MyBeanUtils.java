package com.itheima.anli06_utils;

import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

public class MyBeanUtils {
	/**
	 * 将数据封装给JavaBean，支持时间类型转换
	 * 例如：
	 * 	 User user = new User();
	 *   MyBeanUtils.populate( user , request.getParameterMap() );
	 * @param bean
	 * @param properties
	 */
	public static void populate(Object bean, Map<String,String[]> properties){
		
		try {
			//1 创建BeanUtils提供时间转换器
			DateConverter dateConverter = new DateConverter();
			//2 设置需要转换的格式
			dateConverter.setPatterns(new String[]{"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"});
			//3 注册转换器
			ConvertUtils.register(dateConverter, java.util.Date.class);
			//4 封装数据
			BeanUtils.populate(bean, properties);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}

}
