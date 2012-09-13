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
import italk.util.cache.Cache;

import java.awt.Image;
import java.io.File;

import javax.swing.ImageIcon;

/**
 * 图片管理
 * 加载的图片将会加入缓存当中
 * @author chenzhihui
 */
public class ImageManager {

	public static ImageIcon getImageIcon(String imageName) {
		return getImageIcon(imageName, null);
	}

	public static ImageIcon getImageIcon(String imageName, String description) {
		ImageIcon getImageIcon = (ImageIcon)Cache.get(imageName);
		if(getImageIcon == null) {
			getImageIcon = description == null ? new ImageIcon(ResouceLoader
					.getResouce(imageName)) : new ImageIcon(ResouceLoader
					.getResouce(imageName), description);
			Cache.add(imageName, getImageIcon);
		}
		return getImageIcon;
	}

	public static Image getImage(String imageName) {
		return getImageIcon(imageName).getImage();
	}
	
	/**
	 * use "resource/image" as the default directory
	 * 
	 * @param imageName
	 * 
	 * @return ImageIcon
	 * */
	public static ImageIcon getImageIconByShortName(String imageName) {
		return getImageIcon(SystemConfig.getImagesDir() + File.separator  + imageName);
	}
	
	/**
	 * use "resource/image" as the default directory
	 * 
	 * @param imageName
	 * 
	 * @return Image
	 * */
	public static Image getImageByShortName(String imageName) {
		return getImageIcon(SystemConfig.getImagesDir() + File.separator + imageName)
				.getImage();
	}

}
