package com.zj198.util;

import java.util.ArrayList;
import java.util.List;

public class NumberUtil {
	public static Long[] splitArray(long args) {
		List<Long> a = split(args);
		return a.toArray(new Long[a.size()]);
	}
	
	// 分解
	public static List<Long> split(long i) {
		List<Long> a = new ArrayList<Long>();
		for (long j = 1; j <= i; j=j*2) {
			if ((i & j) > 0) {
				a.add(j);
			}
		}
		return a;
	}

	// 是否包含
	public static boolean ifExist(long comp, long single) {
		return (comp & single) > 0;
	}
	
}