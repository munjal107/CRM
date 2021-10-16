package com.vasy.crm.repo.login;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.login.Role;


@Repository
public interface RoleRepo extends JpaRepository<Role, Long> {

    ArrayList<Role> findByIsDeleted(boolean b);

}
