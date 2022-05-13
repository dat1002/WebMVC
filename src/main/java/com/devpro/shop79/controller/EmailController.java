package com.devpro.shop79.controller;


import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmailController {
    @RequestMapping(value = "/sendemail")
    public String sendEmail() throws AddressException, MessagingException, IOException {
        sendmail();
        System.out.println("Gửi thành công");
        return "redirect:/index";
    }

    private void sendmail() throws AddressException, MessagingException, IOException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("nvdat1002@gmail.com", "gfwyjioawdetqpyi"); //cấu hình mail gửi đi
            }
        });
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("nvdat1002@gmail.com", false)); //gửi từ mail nào

        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("datwanby@gmail.com")); //mail đc nhận
        msg.setSubject("Hiệp đây!");//tiêu đề
        msg.setContent("Bạn cút đi nhá :))", "text/plain; charset=UTF-8");
        msg.setSentDate(new Date());

        //Gửi thêm file
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent("Cút đi cho tao :v:v", "text/plain; charset=UTF-8"); //content này sẽ thay thế khi gửi file

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
        MimeBodyPart attachPart = new MimeBodyPart();

        attachPart.attachFile("D:\\1. DEVPRO\\BE\\Hoc\\com.devpro.shop79\\src\\main\\resources\\images\\2917202131755_1_thumb.jpg"); //đường dẫn đến file
        multipart.addBodyPart(attachPart);
        msg.setContent(multipart);
        Transport.send(msg);
    }
}
