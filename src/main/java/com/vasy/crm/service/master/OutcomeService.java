package com.vasy.crm.service.master;

import java.util.ArrayList;

import com.vasy.crm.model.master.Outcome;

public interface OutcomeService {

    ArrayList<Outcome> getOutcome();

    void deleteOutcome(long id);

    Outcome getOutcomeById(long id);

    Outcome addOutcome(Outcome obj);


}
