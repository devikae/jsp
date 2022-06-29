package com.study.member.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {
    @Autowired
    private JavaMailSenderImpl mailSender;
    private String getKey(int size) {
    	
    	String pass ="";
    	
    	for(int i =0; i<size; i++) {
    		int num =(int) (Math.random() * 10);
    		String strnum = Integer.toString(num);
    		pass += strnum;
    	}
    	
        return pass;  //6개 숫자 랜덤 만들어보세요
        
        
    }
    
    
    
    public String sendAuthMail(String mail)  throws MessagingException{
        String authKey = getKey(6);
        MimeMessage mailMessage = mailSender.createMimeMessage();
        String mailContent = "인증번호:   "+authKey ;     //보낼 메시지 
        try {
            mailMessage.setSubject("회원가입 인증 메일 입니다..", "utf-8"); 
            mailMessage.setText(mailContent, "utf-8", "html");  
            mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
            mailSender.send(mailMessage);
            // send 메소드를 호출할 때 실제로 메일을 보냄 
        } catch (MessagingException e) {
        	e.printStackTrace();  //error도 보는데 
            return "fail to send mail";
        }
          return authKey;
    }
}
