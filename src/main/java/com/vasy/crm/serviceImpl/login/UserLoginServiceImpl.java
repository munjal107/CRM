package com.vasy.crm.serviceImpl.login;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.repo.login.UserLoginRepo;
import com.vasy.crm.service.login.UserLoginService;


@Service
@Transactional
public class UserLoginServiceImpl implements UserLoginService {

    @Autowired
    UserLoginRepo userRepo;

    @Override
    public ArrayList<UserLogin> getUsers() {

        return userRepo.findByIsDeleted(false);
    }

    @Override
    public UserLogin addUser(UserLogin u) {

        return userRepo.save(u);
    }

    @Override
    public void deleteUser(long id) {

        UserLogin u = userRepo.findById(id).orElse(null);
        u.setDeleted(true);

        userRepo.save(u);

    }

    @Override
    public UserLogin getUserById(long id) {

        return userRepo.findById(id).orElse(null);
    }

    @Override
    public UserLogin getUserByUsername(String username) {

        return userRepo.findByUsername(username);
    }

    @Override
    public UserLogin getUserByUserEmail(String userEmail) {
        return userRepo.findByUserEmail(userEmail);
    }


    @Override
    public ArrayList<UserLogin> getUserByRole(String name) {
        return userRepo.findByRoleName(name);
    }
}
