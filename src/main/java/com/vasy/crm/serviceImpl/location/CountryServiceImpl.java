package com.vasy.crm.serviceImpl.location;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.location.Country;
import com.vasy.crm.repo.location.CountryRepo;
import com.vasy.crm.service.location.CountryService;


@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryRepo countryRepo;


    @Override
    public ArrayList<Country> getCountryList() {
        // TODO Auto-generated method stub
        return (ArrayList<Country>) countryRepo.findAll();
    }

}
