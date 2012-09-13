/*
 * ipassbook 0.6.0
 * Copyright (C)2009 wateray and contributors
 * wateray@gmail.com
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

package italk.commom;


/**
 * @author wateray
 * @create 2009-5-17
 */
public class CommomTool {

	
	public static boolean isNumber(String value){
		
		if(value == null){
			return false;
		}
		
		try {
			Double.parseDouble(value.trim());
		} catch (NumberFormatException nfe) {
			return false;
		}
		
		return true;
	}
	
	public static String fillZero(String value, int bit) {
		String zeros = "";
		value = value==null?"0" : value.trim().equals("")?"0" :value;
		
		if (value.length() < bit) {
			for (int i = 0; i < bit; i++) {
				zeros += "0";
			}

			value = zeros.substring(value.length()) + value;
		}
		return value;
	}
	public static String plusOneFillZero(String value, int bit) {
		value = value==null?"0" : value.trim().equals("")?"0" :value;
		// +1
		value = String.valueOf(Integer.parseInt(value) + 1);
		
		return fillZero(value, bit);
	}
	
	/**
	 * Returns a string with concatenation of argument array.
	 * 
	 * @param strings
	 *            strings
	 * 
	 * @return concatenation of argument array
	 */
	public static String getString(Object... strings) {
		StringBuilder objStringBuilder = new StringBuilder();

		for (Object element : strings) {
			objStringBuilder.append(element);
		}

		return objStringBuilder.toString();
	}
}
