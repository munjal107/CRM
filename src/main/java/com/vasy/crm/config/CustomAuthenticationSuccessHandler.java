package com.vasy.crm.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.service.login.UserLoginService;


@Configuration
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    UserLoginService userLoginService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        HttpSession session = request.getSession();
        User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        session.setAttribute("username", authUser.getUsername());

        String auth = "";
        /*
         * authentication.getAuthorities().forEach((a)-> {
         * auth=a.getAuthority();
         * });
         */
        for (GrantedAuthority i : authentication.getAuthorities()) {

            auth = i.getAuthority();
        }

        session.setAttribute("authorities", auth);

        UserLogin userLogin = userLoginService.getUserByUsername(authUser.getUsername());
        session.setAttribute("userLogin", userLogin);
        //set our response to OK status
        response.setStatus(HttpServletResponse.SC_OK);

        //since we have created our custom success handler, its up to us to where
        //we will redirect the user after successfully login
        response.sendRedirect("/");


    }

}
