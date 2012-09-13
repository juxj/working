package italk.commom;

import italk.App;

import java.io.File;

/**
 * 
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class SystemConfig {
  
    private static App app = App.shareInstance();
	
	/**
	 * 获取程序资源目录
	 * @return ResourceDir
	 */
	public static String getResourceDir() {
		return app.getConfiguration().getProperty("resource_dir_name");
	}
	/**
	 * 获取程序资源图片目录
	 * @return ImagesDir
	 */
	public static String getImagesDir() {
		return getResourceDir()+ File.separator  + app.getConfiguration().getProperty("images_dir_name");
	}
	
	/**
	 * 获取程序资源皮肤水印图片目录
	 * @return ImagesDir
	 */
	public static String getSkinWatermarkDir() {
		return getImagesDir() + File.separator + app.getConfiguration().getProperty("skin_watermark_dir");
	}
	
	/**
	 * 获取程序资源皮肤水印图片
	 * @return ImagesDir
	 */
	public static String getSkinWatermarkFile() {
		return getSkinWatermarkDir() + File.separator + app.getConfiguration().getProperty("skin_watermark_file");
	}
	
	/**
	 * 获取 i18n 目录
	 * @return i18n
	 */
	public static String getI18nDir() {
		return getResourceDir() + File.separator + app.getConfiguration().getProperty("i18n_dir");
	}
	
	/**
	 * 国际化资源文件
	 * @return I18nBundle
	 */
	public static String getI18nBundle() {
		return getI18nDir() + File.separator + app.getConfiguration().getProperty("i18n_bundle_name");
	}
	
	/**
	 * 是否启用皮肤
	 * @return isEnableSkin
	 */
	public static boolean isEnableSkin() {
		String isEnableSkinStr = app.getConfiguration().getProperty("isEnableSkin", "false");
		if(isEnableSkinStr.trim().equals("true")) {
			return true;
		}
		return false;
	}
	
	/**
	 * 是否启用水印 
	 * @return isEnableWatermark
	 */
	public static boolean isEnableWatermark() {
		String isEnableSkinStr = app.getConfiguration().getProperty("isEnableWatermark", "false");
		if(isEnableSkinStr.trim().equals("true")) {
			return true;
		}
		return false;
	}
}
