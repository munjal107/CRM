package com.vasy.crm.service.support;

import org.springframework.stereotype.Service;

import com.vasy.crm.model.support.Support;

import java.util.ArrayList;
import java.util.Date;


public interface SupportService {

    Support addSupport(Support s);

    Long getSupportCount();

    Long getWeekSupportCount(Date d1, Date d2);

    ArrayList<Support> getSupport();

    Support getSupportById(long id);

    ArrayList<Support> getUserByCreatedBy(String uname);
}
