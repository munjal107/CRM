package com.vasy.crm.service.login;

import java.util.ArrayList;

import com.vasy.crm.model.login.UserLogin;

public interface UserLoginService {

    UserLogin addUser(UserLogin u);

    void deleteUser(long id);

    ArrayList<UserLogin> getUsers();

    UserLogin getUserById(long id);

    UserLogin getUserByUsername(String username);

    UserLogin getUserByUserEmail(String userEmail);

    ArrayList<UserLogin> getUserByRole(String name);

}
