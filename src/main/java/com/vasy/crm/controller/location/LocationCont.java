package com.vasy.crm.controller.location;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vasy.crm.model.location.City;
import com.vasy.crm.model.location.Country;
import com.vasy.crm.model.location.State;
import com.vasy.crm.service.location.CityService;
import com.vasy.crm.service.location.CountryService;
import com.vasy.crm.service.location.StateService;

//@Controller
@RestController
@RequestMapping("/location")
public class LocationCont {

    @Autowired
    private CountryService countryService;

    @Autowired
    private StateService stateService;

    @Autowired
    private CityService cityService;


    @RequestMapping("/countries")
    //@ResponseBody
    public ArrayList<Country> getCountryList(Model m) {


        ArrayList<Country> alist = countryService.getCountryList();

        return alist;
    }


    @RequestMapping("/states/{id}")
    public ArrayList<State> getStateList(@PathVariable() int id) {
        ArrayList<State> alist = stateService.getStateById(id);
        return alist;
    }


    @RequestMapping("/cities/{id}")
    public ArrayList<City> getCityList(@PathVariable() int id) {
        ArrayList<City> alist = cityService.getCitiesById(id);
        return alist;
    }


}
