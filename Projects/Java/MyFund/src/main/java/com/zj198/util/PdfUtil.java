package com.zj198.util;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;


public class PdfUtil {


	public static String generatePdf(Document document) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH");
		String path = "/pdf/" + sdf.format(new Date());
		String realpath = ServletActionContext.getServletContext().getRealPath(path);
		File j = new File(realpath);
		if (!j.exists()) {
			j.mkdirs();
		}
		String filename = UUID.randomUUID().toString() + ".pdf";
		String realFileName = realpath + "/" + filename;
		String downPath = path + "/" + filename;
		try {
			PdfWriter.getInstance(document, new FileOutputStream(realFileName));
			document.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return downPath;
	}
}
