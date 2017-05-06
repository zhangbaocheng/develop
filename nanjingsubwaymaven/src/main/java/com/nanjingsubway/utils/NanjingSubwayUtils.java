package com.nanjingsubway.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class NanjingSubwayUtils {
	public static Map<String, Object>convertObjToMap(Object object){
		Map<String, Object> map = new HashMap<>();
		Field[] fields = object.getClass().getDeclaredFields();
		for (Field field : fields) {
			map.put(field.getName(), getFieldValueByName(field.getName(), object));
		}
		return map;
	}
	
//	根据属性名获取属性值
	public static Object getFieldValueByName(String fieldName, Object o) {  
	       try {    
	           String firstLetter = fieldName.substring(0, 1).toUpperCase();    
	           String getter = "get" + firstLetter + fieldName.substring(1);    
	           Method method = o.getClass().getMethod(getter, new Class[] {});    
	           Object value = method.invoke(o, new Object[] {});    
	           return value;    
	       } catch (Exception e) {    
	           return null;    
	       }    
	   } 
}
