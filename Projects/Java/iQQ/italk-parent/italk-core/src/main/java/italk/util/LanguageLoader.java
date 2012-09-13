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

import italk.commom.SystemConfig;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
*
* @author chenzhihui
*/
public class LanguageLoader {

	/** Language file resource bundle. */
	private static ResourceBundle languageBundle;

	/** Language selected in dialog. */
	private static Locale languageSelected;
	
	/** Class loader for finding resources in working directory. */
	private static final ClassLoader WD_CLASS_LOADER;

	static {
		WD_CLASS_LOADER = AccessController.doPrivileged(new PrivilegedAction<ClassLoader>() {
			@Override
			public ClassLoader run() {
				return new ClassLoader() {
					@Override
					public URL getResource(String name) {
						try {
							URL result = super.getResource(name);
							if (result != null) {
								return result;
							}
							return (new File(name)).toURI().toURL();
						} catch (MalformedURLException ex) {
							return null;
						}
					}
				};
			}
		});
	}
	
	/**
	 * Sets language to use in application.
	 * 
	 * @param locale
	 *            the locale
	 */
	public static void setLanguage(Locale locale) {
		if (locale == null) {
			languageBundle = ResourceBundle.getBundle(SystemConfig.getI18nBundle(), Locale.getDefault(),WD_CLASS_LOADER);
		} else {
			languageBundle = ResourceBundle.getBundle(SystemConfig.getI18nBundle(), locale,WD_CLASS_LOADER);
		}
		languageSelected = languageBundle.getLocale();
	}
	
	/**
	 * Return the name of the selected language.
	 * 
	 * @return the language selected
	 */
	public static Locale getLanguageSelected() {
		return languageSelected;
	}
	
	/**
	 * Get a string for a given key for current language.
	 * 
	 * @param key
	 *            the key
	 * 
	 * @return the string
	 */
	public static String getString(String key) {
		if (languageBundle != null) {
			String result;
			try {
				result = languageBundle.getString(key);
			} catch (MissingResourceException e) {
				return key;
			}
			return result;
		}
		return key;
	}
	
	
	
}
