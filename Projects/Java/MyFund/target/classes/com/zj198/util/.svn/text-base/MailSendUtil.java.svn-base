package com.zj198.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


//公用邮件发送
public class MailSendUtil {
	public static void sendMail(String subject, String body, String tomail,String...bcc) throws AddressException, MessagingException {
		Properties props = new Properties();
		props.put("mail.smtp.host",PropertiesUtil.getByKey("mail.smtp.host"));
		props.put("mail.smtp.auth",PropertiesUtil.getByKey("mail.smtp.auth"));
		Session session = Session.getInstance(props);
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(PropertiesUtil.getByKey("mail.smtp.sender")));
		InternetAddress to = new InternetAddress(tomail);
		msg.setRecipient(Message.RecipientType.TO, to);	
		if(bcc!=null && bcc.length>0){//暗送
			msg.setRecipients(Message.RecipientType.BCC,InternetAddress.parse(bcc[0]));
		}
		msg.setSubject(subject, "UTF-8");
		MimeBodyPart mbp = new MimeBodyPart();
		mbp.setContent(body, "text/html;charset=UTF-8");
		Multipart mp = new MimeMultipart();
		mp.addBodyPart(mbp);
		msg.setContent(mp);
		Transport transport=session.getTransport("smtp");
		transport.connect(PropertiesUtil.getByKey("mail.smtp.host"), PropertiesUtil.getByKey("mail.smtp.sender"), PropertiesUtil.getByKey("mail.smtp.password"));
		transport.sendMessage(msg,msg.getAllRecipients());
		transport.close();
	}
		
}