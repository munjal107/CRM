package com.vasy.crm.service.login;

import java.util.ArrayList;

import com.vasy.crm.model.login.Role;

public interface RoleService {

    ArrayList<Role> getRoles();

    void deleteRole(long id);

    Role addRole(Role al);

    Role getRoleById(long id);

}
