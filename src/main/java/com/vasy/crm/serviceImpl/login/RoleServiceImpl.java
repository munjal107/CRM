package com.vasy.crm.serviceImpl.login;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.login.Role;

import com.vasy.crm.repo.login.RoleRepo;

import com.vasy.crm.service.login.RoleService;


@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleRepo roleRepo;

    @Override
    public ArrayList<Role> getRoles() {
        // TODO Auto-generated method stub
        return roleRepo.findByIsDeleted(false);

    }

    @Override
    public void deleteRole(long id) {
        // TODO Auto-generated method stub
        Role role = roleRepo.findById(id).orElse(null);
        role.setDeleted(true);

        roleRepo.save(role);
    }

    @Override
    public Role addRole(Role al) {
        // TODO Auto-generated method stub
        return roleRepo.save(al);
    }

    @Override
    public Role getRoleById(long id) {
        // TODO Auto-generated method stub
        return roleRepo.findById(id).orElse(null);
    }


}
