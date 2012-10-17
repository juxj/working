package com.zj198.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
	public static String getByKey(String key) {
		Properties props = new Properties();
		try {
			String realPath = ApplicationContextUtil.getContext().getResource("/WEB-INF/classes").getFile().getAbsolutePath();
			InputStream in = new BufferedInputStream(new FileInputStream(realPath + "/config.properties"));
			props.load(in);
			return props.getProperty(key,"");
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}