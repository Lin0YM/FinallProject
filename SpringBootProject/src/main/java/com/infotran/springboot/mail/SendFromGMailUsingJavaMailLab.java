package com.infotran.springboot.mail;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class SendFromGMailUsingJavaMailLab {
	// GMail user name (just the part before "@gmail.com")
	private String USER_NAME = "eeit13305@gmail.com";
	// GMail password
	// 如果你有開兩步驟，需要另外建立一個「應用程式密碼」
	// 如果沒有開兩步驟，需要開起「允許安全性較低的應用程式」
//	private String PASSWORD = "slnjqmyyechawkvd";
//	private String RECIPIENT = "eeit13305@gmail.com";

//	private String from = USER_NAME;
//	private String pass = PASSWORD;
//	private String[] to = { RECIPIENT }; // list of recipient email addresses
	private String password;
	private String subject = "方便購會員查收";
	private String body ;
	
//	sendFromGMail(from, pass, to, subject, body);

	public void sendFromGMail(String RECIPIENT,String password) {
		String from = "eeit13305@gmail.com";
		String pass = "slnjqmyyechawkvd";
//		String RECIPIENT = "eeit13305@gmail.com";
		String[] to = { RECIPIENT };
		String subject = "方便購會員查收";
		String body = "您已通過忘記密碼驗證<br/>"+
				"=================================<br/><br/>"
				+ "請查收密碼: " + password;
        //---------------------------------------------
		Properties props = System.getProperties();
		String host = "smtp.gmail.com";
		// 下面設定是根據GMail官方文件所寫的，開啟TLS以及SMTP AUTH
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.password", pass);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props);
		MimeMessage message = new MimeMessage(session);

		try {
			message.setFrom(new InternetAddress(from));
			InternetAddress[] toAddress = new InternetAddress[to.length];

			// To get the array of addresses
			for (int i = 0; i < to.length; i++) {
				toAddress[i] = new InternetAddress(to[i]);
			}

			for (int i = 0; i < toAddress.length; i++) {
				message.addRecipient(Message.RecipientType.TO, toAddress[i]);
			}
			message.setSubject(subject);
			message.setText(body);
			message.setContent(body, "text/html;charset=UTF-8");
			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (AddressException ae) {
			ae.printStackTrace();
		} catch (MessagingException me) {
			me.printStackTrace();
		}
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
