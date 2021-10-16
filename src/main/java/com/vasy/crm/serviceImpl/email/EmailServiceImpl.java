package com.vasy.crm.serviceImpl.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.login.UserLogin;

@Service
public class EmailServiceImpl {

    @Autowired
    public JavaMailSender emailSender;

    @Async
    public void sendSimpleMessage(String email, String username, String password) throws MessagingException {

        /*
         * SimpleMailMessage message = new SimpleMailMessage();
         *
         * message.setTo(email); message.setSubject("User Credentials");
         * message.setText("Username: "+username+"\n Password: "+password);
         */

        MimeMessage message = emailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setTo(email);
        helper.setSubject("User Credentials");

        helper.setText("Username: " + username + "\nPassword: " + password);


        emailSender.send(message);
    }
}