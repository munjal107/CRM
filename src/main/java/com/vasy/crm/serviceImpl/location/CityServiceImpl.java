package com.vasy.crm.serviceImpl.location;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.location.City;
import com.vasy.crm.repo.location.CityRepo;
import com.vasy.crm.service.location.CityService;


@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private CityRepo cityRepo;


    @Override
    public ArrayList<City> getCitiesById(long id) {

        return (ArrayList<City>) cityRepo.findByStateId(id);
    }

}
