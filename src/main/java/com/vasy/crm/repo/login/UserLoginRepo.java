package com.vasy.crm.repo.login;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.login.UserLogin;


@Repository
public interface UserLoginRepo extends JpaRepository<UserLogin, Long> {

    ArrayList<UserLogin> findByIsDeleted(boolean b);


    @Query("select u from UserLogin u where u.username=?1 and u.isDeleted=false")
    UserLogin findByUsername(String username);

    @Query("select u from UserLogin u where u.userEmail=?1 and u.isDeleted=false")
    UserLogin findByUserEmail(String userEmail);

    ArrayList<UserLogin> findByRoleName(String name);

}
