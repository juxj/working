package com.zj198.util;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfUtil {

	public static void main(String[] args) {
		generatePdf();
	}

	public static String generatePdf() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH");
		String path = "/pdf/" + sdf.format(new Date());
		String realpath = ServletActionContext.getServletContext().getRealPath(
				path);
		File j = new File(realpath);
		if (!j.exists()) {
			j.mkdirs();
		}
		String filename = UUID.randomUUID().toString() + ".pdf";
		String realFileName = realpath + "/" + filename;
		String downPath = path + "/" + filename;
		Document document = new Document(PageSize.A4, 10, 10, 10, 10);
		try {
			PdfWriter.getInstance(document, new FileOutputStream(realFileName));
			document.open();
			BaseFont bfChinese = BaseFont.createFont("STSong-Light",
					"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
			Font f12 = new Font(bfChinese, 12, Font.BOLD);

			PdfPTable table = new PdfPTable(8);
			PdfPCell cell = new PdfPCell(new Paragraph("申请信息", f12));
			cell.setColspan(3);
			table.addCell(cell);
			table.addCell("1.1");
			table.addCell("2.1");
			table.addCell("3.1");
			table.addCell("1.2");
			table.addCell("2.2");
			table.addCell("3.2");

			cell = new PdfPCell(new Paragraph("红色边框", f12));
			cell.setBorderColor(new BaseColor(255, 0, 0));
			table.addCell(cell);

			cell = new PdfPCell(new Paragraph("合并单2个元格", f12));
			cell.setColspan(2);
			cell.setBackgroundColor(new BaseColor(0xC0, 0xC0, 0xC0));
			table.addCell(cell);

			table.setWidthPercentage(50);

			document.add(new Paragraph("订单详情：", f12));
			document.add(table);
			document.add(table);

			document.newPage();
			table.setSpacingBefore(15f);
			document.add(table);
			document.add(table);
			document.add(table);
			document.add(table);
			table.setSpacingAfter(15f);

			document.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return downPath;
	}
	
}
