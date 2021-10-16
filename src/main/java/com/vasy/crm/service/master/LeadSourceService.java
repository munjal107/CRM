package com.vasy.crm.service.master;

import java.util.ArrayList;

import com.vasy.crm.model.master.LeadSource;

public interface LeadSourceService {

    ArrayList<LeadSource> getLeadSources();

    LeadSource addSource(LeadSource ld);

    void deleteSource(long id);

    LeadSource getLeadById(long id);

}
