package com.vasy.crm.serviceImpl.login;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.repo.login.UserLoginRepo;

@Service
@Transactional
public class UserDetailServiceImpl implements UserDetailsService {


    @Autowired
    UserLoginRepo userLoginRepo;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {


        UserLogin ul = userLoginRepo.findByUsername(username);
        //System.out.println("\nHELLO\n\n");
        if (ul == null)
            throw new UsernameNotFoundException("user 404");

        System.out.println("\n\n" + ul.getRole().getName() + "\n\n");
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(ul.getRole().getName()));


        return new org.springframework.security.core.userdetails.User(ul.getUsername(), ul.getPassword(), grantedAuthorities);
    }

}
