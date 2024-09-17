/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mail;

import dal.AccountDAO;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author nhatk
 */
public class Email {
    // email : sunshop6428@gmail.com
    // pass : djpdzbvyjtnvelbk
    public void sendEmail(String email){
        String from = "sunshop6428@gmail.com";
        String pass = "djpdzbvyjtnvelbk";
        AccountDAO accdao = new AccountDAO();
        
        //Khai bao cac thuoc tinh de gui Email
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        
        //Dang nhap vao gmail ban dau de gui tin nhan cho cac gmail khac
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass); 
            }
        };
        
        
        //Tao phien lam viec cho gmail
        Session session = Session.getInstance(props,auth);
        
        String oldPass=accdao.retrievePassword(email); ;
        //Gui email:
        String to = email;
        
        MimeMessage msg = new MimeMessage(session); //Tao tin nhan de gui
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(from); //Nguoi gui
            //Nguoi Nhan
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));  
            
            //Tieu de email:
            msg.setSubject("Retrieve password from Sunshop");
            
            //Quy dinh ngay gui:
            msg.setSentDate(new Date());
            
            //Quy dinh email nhan phan hoi, su dung trong TH muon gui den 1 email
            // khac email nhan ban dau
            //msg.setReplyTo(InternetAddress.parse(to, false)); 
            
            //Noi dung 
            msg.setText("Your password is: "+oldPass , "UTF-8");
            
            //Gui email
            Transport.send(msg);
            
            
        } catch (MessagingException ex) {
            System.out.println("Can not send");
        }
    }
}
