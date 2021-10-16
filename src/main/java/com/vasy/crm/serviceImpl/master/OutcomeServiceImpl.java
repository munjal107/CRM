package com.vasy.crm.serviceImpl.master;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.master.Outcome;
import com.vasy.crm.repo.master.OutcomeRepo;
import com.vasy.crm.service.master.OutcomeService;

@Service
public class OutcomeServiceImpl implements OutcomeService {

    @Autowired
    OutcomeRepo outcomeRepo;

    @Override
    public ArrayList<Outcome> getOutcome() {
        // TODO Auto-generated method stub
        return outcomeRepo.findByIsDeleted(false);
    }

    @Override
    public void deleteOutcome(long id) {
        // TODO Auto-generated method stub

        Outcome obj = outcomeRepo.findById(id).orElse(null);
        obj.setDeleted(true);
        outcomeRepo.save(obj);

    }

    @Override
    public Outcome getOutcomeById(long id) {
        // TODO Auto-generated method stub
        return outcomeRepo.findById(id).orElse(null);
    }

    @Override
    public Outcome addOutcome(Outcome obj) {
        // TODO Auto-generated method stub
        return outcomeRepo.save(obj);
    }

}
