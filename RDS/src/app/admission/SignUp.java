package app.admission;

import java.sql.Connection;
import java.security.*;
import java.sql.PreparedStatement;
import java.util.Properties;

import javax.mail.PasswordAuthentication;
import java.io.IOException;
import javax.mail.Session;

import javax.mail.MessagingException;

import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUp {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email;
	private String msg;
	private String pwd;
	private String repwd;
	private int conf_user_id;
	private String status;

	
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		System.out.println(email);
		this.email = email;
	}
	public void setConf_user_id(int verfCode) {
		this.conf_user_id = verfCode;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		System.out.println(pwd);
		this.pwd = pwd;
	}

	public String getRepwd() {
		return repwd;
	}
	public void setRepwd(String repwd) {
		this.repwd = repwd;
	}
	public String getStatus() {
		return status;
	}
	public int getConf_user_id() {
		return conf_user_id;
	}

	
	public void modifyUserProfile(){
		System.out.println("Message from SignUp.modifyUserProfile :");
		System.out.println("\tname:"+email);
		System.out.println("\tpassword:"+pwd);
		User insertUser = new User();
		insertUser.setEmail(email);
		insertUser.setPwd(pwd);
		insertUser.setEmail(email);
	}

	//mail code=================================================>>>>>>>>>>>>>>>>>>>>>>>>>>..
	public static void mailConformation(int thedigest)
	{
	
		
		System.out.println("Sending mail!!!"+thedigest);
		User u=DB_access.getUser(thedigest);	
		String host = "smtp.gmail.com";
		String userid = "KODAMASIMHAM2112";
		String password = "KODAMASIMHAM2112"; 
		try
		{
			Properties props =new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.transport.protocol", "smtps");
			props.put("mail.smtp.user", userid);
			props.put("mail.smtp.password", password);
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			props.put("mail.debug", "false");


			props.put("mail.smtps.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");

			Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator()
			{

				protected PasswordAuthentication getPasswordAuthentication()
				{ return new PasswordAuthentication("pridhvi.bittu","KODAMASIMHAM2112"); }
			}); 
			session.setDebug(true);

			MimeMessage message = new MimeMessage(session);
			System.out.println("here4");
			InternetAddress fromAddress = null;
			InternetAddress toAddress = null;

			try {
				System.out.println("here5");
				fromAddress = new InternetAddress("pridhvi.bittu@gmail.com");//from address hard core
				toAddress = new InternetAddress(u.getEmail());// to
			} 
			catch (AddressException e) {

				e.printStackTrace();
			}

			message.setFrom(fromAddress);
			message.setRecipient(RecipientType.TO, toAddress);
			message.setSubject("Account Verification Link.");
			message.setText(" Please Click Here to Activate your account or copy paste this url http://192.168.12.36:8080/EDA/admission/activate.jsp?user_id="+thedigest);
			Transport.send(message);

		} 
		catch (MessagingException e) {
			System.out.println("exception caught from :signup.mailconfirmation()");
			e.printStackTrace();
		}

	}



	public void accountActivation()
	{
		DB_access.accountActivation(getConf_user_id());
		
	}
	
	public void copy(int  rowid)
	{
		
	}
}



