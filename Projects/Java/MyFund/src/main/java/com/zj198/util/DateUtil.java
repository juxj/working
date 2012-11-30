package com.zj198.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.time.DateUtils;

//公用日期时间处理功能
public class DateUtil {
	private static final String patternDate = "yyyy-MM-dd";
	private static final String patternDateTime = "yyyy-MM-dd HH:mm:ss";
	private static final String patternYear = "yyyy年MM月";
	private static final String patternLastYear = "yyyy";

	public static void main(String[] args) {
		System.out.println(DateUtil.getStringByLastYear(new Date()));
	}

	// 转换字符串为日期时间(yyyy-MM-dd HH:mm:ss)
	public static Date getDateTimeByString(String dtstring) {
		return getDate(dtstring, patternDateTime);
	}

	// 转换字符串为日期(yyyy-MM-dd)
	public static Date getDateByString(String dtstring) {
		return getDate(dtstring, patternDate);
	}

	// 转换字符串为指定格式日期时间
	private static Date getDate(String dtstring, String pattern) {
		DateFormat df = new SimpleDateFormat(pattern);
		Date d = null;
		try {
			d = df.parse(dtstring);
		} catch (Exception e) {
		}
		return d;
	}

	// 转换日期为字符串(yyyy-MM-dd HH:mm:ss)
	public static String getStringByDateTime(Date date) {
		return formatDateTime(date, patternDateTime);
	}

	// 转换日期为字符串(yyyy-MM-dd)
	public static String getStringByDate(Date date) {
		return formatDateTime(date, patternDate);
	}

	// 转换日期为字符串(yyyy年MM月)
	public static String getStringByYearMonth(Date date) {
		return formatDateTime(date, patternYear);
	}

	// 计算去年的时间(yyyy)
	public static Integer getStringByLastYear(Date date) {
		Integer j = Integer.parseInt(formatDateTime(date, patternLastYear));
		return j - 1;

	}

	// 转换日期时间为指定格式字符串
	public static String formatDateTime(Date myDate, String pattern) {
		DateFormat fd = new SimpleDateFormat(pattern);
		return fd.format(myDate);
	}

	// 计算日期（向前或向后计算days天，允许跨月跨年）
	public static Date addDay(Date date, int days) {
		return DateUtils.addDays(date, days);
		// Calendar cal = Calendar.getInstance();
		// cal.setTime(date);
		// cal.add(Calendar.DAY_OF_YEAR,days);
		// return cal.getTime();
	}

	// 计算日期（向前或向后计算days天，允许跨月跨年）(yyyy-MM-dd)
	public static String addDay(String dtstring, int days) {
		return getStringByDate(addDay(getDateByString(dtstring), days));
	}

	// 计算date1与date2相差天数
	public static Integer differDays(Date date1, Date date2) {// TODO:检查是否正确
	// date1 = DateUtils.truncate(date1, Calendar.DAY_OF_MONTH);
	// date2 = DateUtils.truncate(date2, Calendar.DAY_OF_MONTH);
	// DateUtils.

		Integer days = 0;
		GregorianCalendar cal1 = new GregorianCalendar();
		GregorianCalendar cal2 = new GregorianCalendar();
		cal1.setTime(date1);
		cal2.setTime(date2);
		days = (int) ((cal2.getTimeInMillis() - cal1.getTimeInMillis()) / (1000 * 3600 * 24));
		return days;
	}

	// 验证date1是否在date2之前，如果任何一个为null，返回false
	public static boolean validDate(Date date1, Date date2) {
		if (date1 == null || date2 == null)
			return false;
		return date1.before(date2);
	}

	/** 验证时间不大于当前时间，如果date为null，返回false */
	public static boolean validRDate(Date date) {
		if (date == null)
			return false;
		return date.before(DateUtils.truncate(Calendar.getInstance().getTime(), Calendar.DAY_OF_MONTH));
	}

	/** 验证时间不大于当前时间，如果date为null，返回true */
	public static boolean validLDate(Date date) {
		if (date == null)
			return true;
		return date.before(DateUtils.truncate(Calendar.getInstance().getTime(), Calendar.DAY_OF_MONTH));
	}

	/*** 验证出生日期用必须大于18岁，如果任何一个为null，返回true */
	public static boolean validDate(Date date) {
		if (date == null)
			return true;
		String sDate = getStringByDate(date);
		Pattern p = Pattern.compile("^(?:19\\d{2}|1994)-(?:1[0-2]|0?[0-9])-(?:3[01]|[12][0-9]|0?[0-9])$");
		Matcher m = p.matcher(sDate);
		// System.out.println(m.matches());
		return m.matches();
	}
}
