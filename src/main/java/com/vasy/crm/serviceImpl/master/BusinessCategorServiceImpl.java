package com.vasy.crm.serviceImpl.master;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vasy.crm.model.master.BusinessCategory;
import com.vasy.crm.repo.master.BusinessCategoryRepo;
import com.vasy.crm.service.master.BusinessCategoryService;


@Service
@Transactional
public class BusinessCategorServiceImpl implements BusinessCategoryService {

    @Autowired
    BusinessCategoryRepo businessCategoryRepo;


    @Override
    public ArrayList<BusinessCategory> getBusinessCategories() {
        // TODO Auto-generated method stub
        return businessCategoryRepo.findByIsDeleted(false);
    }

    @Override
    public BusinessCategory addBusinessCategory(BusinessCategory b) {
        // TODO Auto-generated method stub
        return businessCategoryRepo.save(b);
    }

    @Override
    public void deleteBusinessCategory(long id) {

        BusinessCategory bd = businessCategoryRepo.findById(id).orElse(null);
        bd.setDeleted(true);

        businessCategoryRepo.save(bd);


    }

    @Override
    public BusinessCategory getCategoryById(long id) {

        return businessCategoryRepo.findById(id).orElse(null);
    }

}
