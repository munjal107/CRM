package com.vasy.crm.service.invoice;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.vasy.crm.model.invoice.Invoice;

public interface InvoiceService {


    long getMaxInvoiceNo();

    Double getProfit();

    Invoice addInvoice(Invoice invoice);

    ArrayList<Invoice> getAllInvoice();

    Invoice getInvoiceById(long id);

    Double getWeekProfit(Date d1, Date d2);

    List<Map<Double, String>> get15daySales();

    ArrayList<Invoice> getInvoiceByUser(String name);

    ArrayList<Invoice> getInvoiceByLeadId(long id);

}
