/*
 * ikakeibo 0.6.0
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

package italk.util;

import italk.commom.Constant;

import java.net.MalformedURLException;
import java.net.URL;

/**
*
* @author chenzhihui
*/
public class ResouceLoader {

	public static URL getFileURL(String url_name) {
		try {
			return new URL(Constant.PROTOCOL_FILE + url_name);
		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw new RuntimeException("Malformed URL " + url_name, e);
		}
	}

	public static String getFilePath(String filePath) {
		return getFileURL(filePath).getPath();
	}

	/**
	 * @param url_name
	 * @return url
	 * */
	public static URL getClassLoaderResouce(String url_name) {
		return ClassLoader.getSystemResource(url_name);
	}
	
	/**
	 * @param url_name
	 * @return url
	 * */
	public static URL getResouce(String url_name) {
		return getFileURL(url_name);
	}
}
