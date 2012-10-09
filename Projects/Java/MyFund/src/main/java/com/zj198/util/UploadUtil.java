package com.zj198.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.struts2.ServletActionContext;


public class UploadUtil {
	private static final int BUFFER_SIZE = 16 * 1024;
	public final static SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
	
	/**
	 * 上傳文件並生成新的文件名
	 * @param upload
	 * @param uploadFileName
	 * @param fileName
	 * @return
	 */
	public static String upload(File upload, String uploadFileName, String module, int privacy){
		String imageFileName = UploadUtil.getNewFileName() + uploadFileName.substring(uploadFileName.lastIndexOf("."));
		String path = getUploadPath(module,privacy);
		String realPath = ServletActionContext.getServletContext().getRealPath(path);
		File testFile = new File(realPath);
		if (!testFile.exists()) {
			testFile.mkdirs();
		}
		File imageFile = new File(realPath + "/" +imageFileName);
		UploadUtil.copy(upload, imageFile);
		return path + imageFileName;
	}
	
	/**
	 * 下载文件
	 * @param pathFile 相对路径+文件名
	 * @return
	 */
	public static InputStream getFileStream(String pathFile){
		String realpath = ServletActionContext.getServletContext().getRealPath(pathFile).replace('\\', '/');
		File file = new File(realpath);
		FileInputStream instream = null;
		try {
			instream = new FileInputStream(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  instream;
	}

	/**
	 * 刪除文件
	 * @param path
	 */
	public static void deleteFile(String fileName, String photoName) {
		String path = ServletActionContext.getServletContext().getRealPath("/").replace('\\', '/') + fileName + photoName;
		File file = new File(path);
		if (file.exists()) {
			file.delete();
		}
	}

	/**
	 * 生成文件名
	 * @return
	 */
	private static String getNewFileName() {
		return System.currentTimeMillis() + "_" + new Random().nextInt(100);
	}

	/**
	 * 上傳文件
	 * @param src
	 * @param dst
	 */
	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				int num = 0;
				in = new BufferedInputStream(new FileInputStream(src),BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while((num=in.read(buffer))!=-1){  
	                out.write(buffer,0,num);  
	            }  
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//计算上传相对路径 (不含文件名)
	private static String getUploadPath(String module,int privacy){
		StringBuffer name=new StringBuffer();
		if(privacy==Constants.UPLOAD_PRIVACY_PRIVATE){
			name.append("/WEB-INF/upload/");
		}else{
			name.append("/upload/");
		}
		name.append(module);
		name.append(DateUtil.formatDateTime(new Date(),"/yyyy/MM/dd/"));
		return name.toString();
	}
	
	//生成上传文件名 
	//TODO:需要同步 ,需要加.再加扩展名?
	private static String getRandomFileName(String extName){
		return String.valueOf(System.currentTimeMillis())+extName;
	}
	
	//获得上传文件扩展名
	public static String getFileExtName(String userFileName){
		int pos = userFileName.indexOf('.');
		if(pos==-1){
			return "";
		}
		return userFileName.substring(pos);
	}
}
