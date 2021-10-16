package com.vasy.crm.repo.master;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.master.BusinessCategory;


@Repository
public interface BusinessCategoryRepo extends JpaRepository<BusinessCategory, Long> {

    ArrayList<BusinessCategory> findByIsDeleted(boolean b);

}
