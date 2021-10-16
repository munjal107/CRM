package com.vasy.crm.serviceImpl.invoice;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.invoice.Invoice;
import com.vasy.crm.repo.invoice.InvoiceRepo;
import com.vasy.crm.service.invoice.InvoiceService;

@Service
public class InvoiceServiceImpl implements InvoiceService {

    @Autowired
    InvoiceRepo invoiceRepo;

    @Override
    public long getMaxInvoiceNo() {
        // TODO Auto-generated method stub
        return invoiceRepo.findInvoiceNo();
    }

    @Override
    public Invoice addInvoice(Invoice invoice) {
        // TODO Auto-generated method stub
        return invoiceRepo.save(invoice);
    }

    @Override
    public ArrayList<Invoice> getAllInvoice() {

        return (ArrayList<Invoice>) invoiceRepo.findAll();
    }

    @Override
    public Invoice getInvoiceById(long id) {

        return invoiceRepo.findById(id).orElse(null);
    }

    @Override
    public Double getProfit() {

        return invoiceRepo.findTotalProfit();
    }

    @Override
    public Double getWeekProfit(Date d1, Date d2) {

        return invoiceRepo.findWeekTotalProfit(d1, d2);
    }

    @Override
    public List<Map<Double, String>> get15daySales() {
        return invoiceRepo.get15daySalesAll();
    }

    @Override
    public ArrayList<Invoice> getInvoiceByUser(String name) {
        return invoiceRepo.findByCreatedBy(name);
    }


    @Override
    public ArrayList<Invoice> getInvoiceByLeadId(long id) {
        return invoiceRepo.findByLeadId(id);
    }
}
