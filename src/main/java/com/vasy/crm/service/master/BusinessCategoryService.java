package com.vasy.crm.service.master;

import java.util.ArrayList;

import com.vasy.crm.model.master.BusinessCategory;

public interface BusinessCategoryService {

    ArrayList<BusinessCategory> getBusinessCategories();

    BusinessCategory addBusinessCategory(BusinessCategory b);

    void deleteBusinessCategory(long id);

    BusinessCategory getCategoryById(long id);

}
