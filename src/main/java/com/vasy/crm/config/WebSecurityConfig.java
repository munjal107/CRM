package com.vasy.crm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {


    @Qualifier("userDetailServiceImpl")
    @Autowired
    UserDetailsService userDetailService;

    @Autowired
    CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;

    @Bean
    public PasswordEncoder passEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailService).passwordEncoder(passEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/login").permitAll()
                .antMatchers("/master/sendPassword").permitAll()
                .antMatchers("/location/**", "/assets/**", "/image/**", "/img/**", "/public/**", "/resources/**", "/resources/public/**").permitAll()
                .antMatchers("/master/get**", "/master/get**/**", "/master/changePassword").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
                .antMatchers("/master/**").access("hasRole('ROLE_ADMIN') ")

                .anyRequest().authenticated()
                .and()
                .formLogin().usernameParameter("email")
                .loginPage("/login").permitAll()
                .successHandler(customAuthenticationSuccessHandler)
                //.successForwardUrl("/")
                //.defaultSuccessUrl("/")
                .and()
                .logout().invalidateHttpSession(true)
                .clearAuthentication(true)
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/login").permitAll()
                .and()
                .csrf().disable();
    }

}
