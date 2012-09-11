package com.zj198.util;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class GetConditionsUtil {

    /**
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description 组合条件语句,将条件封装成Object,通过反射来获取有值的属性键值对
     * @param obj 传入一个对象
     * @return
     */
    public static Map<Object, Object[]> conditions(Object obj) {
        Map<Object, Object[]> m = new HashMap<Object, Object[]>();
        if (obj != null) {
            try {
                Class<?> clazz = obj.getClass();
                Field[] fields = clazz.getDeclaredFields();
                Map<Object, Object> cons = new HashMap<Object, Object>();
                for (int i = 0; i < fields.length; i++) {
                    Field field = fields[i];
                    PropertyDescriptor p = new PropertyDescriptor(field.getName(), clazz);
                    Method getMethod = p.getReadMethod();
                    Object j = getMethod.invoke(obj);
                    if (j == null || "".equals(j)) {
                        continue;
                    } else {
                        cons.put(field.getName(), j);
                    }
                }
                m.put("name", cons.keySet().toArray());
                m.put("value", cons.values().toArray());
            } catch (SecurityException e) {
                e.printStackTrace();
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IntrospectionException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        return m;
    }
}
