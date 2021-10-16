package com.vasy.crm.serviceImpl.location;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.location.State;
import com.vasy.crm.repo.location.StateRepo;
import com.vasy.crm.service.location.StateService;


@Service
public class StateServiceImpl implements StateService {

    @Autowired
    private StateRepo stateRepo;

    @Override
    public ArrayList<State> getStateById(long id) {
        // TODO Auto-generated method stub

        return (ArrayList<State>) stateRepo.findByCountryId(id);
    }

}
