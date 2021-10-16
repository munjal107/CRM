package com.vasy.crm.controller.invoice;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.util.UserAccessController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.invoice.Invoice;
import com.vasy.crm.model.lead.Lead;
import com.vasy.crm.service.invoice.InvoiceService;
import com.vasy.crm.service.lead.LeadService;
import com.vasy.crm.util.JasperExporter;

@Controller
@RequestMapping("/invoice")
public class InvoiceCont {

    @Autowired
    UserAccessController userAccessController;

    @Autowired
    LeadService leadService;

    @Autowired
    InvoiceService invoiceService;

    HashMap jasperParameter;

    @RequestMapping("/new/{id}")
    public ModelAndView addInvoice(@PathVariable() long id) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("invoice/new-invoice");

        long invoiceNo = invoiceService.getMaxInvoiceNo();
        invoiceNo++;

        Lead l = leadService.getCustomerByID(id);
        mv.addObject("cust", l);
        mv.addObject("invoiceNo", invoiceNo);

        return mv;
    }

    @RequestMapping("/new")
    public ModelAndView newInvoice() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("invoice/new-invoice");

        long invoiceNo = invoiceService.getMaxInvoiceNo();
        invoiceNo++;
        mv.addObject("invoiceNo", invoiceNo);
        return mv;
    }


    @RequestMapping("/getCustomer/{id}")
    @ResponseBody
    public Lead getCustomer(@PathVariable() long id) {
        return leadService.getCustomerByID(id);
    }

    @PostMapping("/addInvoice")
    public String addInvoice(@ModelAttribute() Invoice invoice, @RequestParam("dDate") String dDate) throws Exception {

        Date dueDate = new SimpleDateFormat("dd/MM/yyyy").parse(dDate);
        String dueDate1 = new SimpleDateFormat("dd/MM/yyyy").format(dueDate);//   parse("20/12/2019");
        //System.out.println("\n "+ invoice.getInvoicePackages().size());
        //System.out.println("\n " + dueDate+ "    "+dueDate1 );
        invoice.setDueDate(dueDate);

        invoiceService.addInvoice(invoice);
        return "redirect:/invoice/view";

    }

    @ResponseBody
    @RequestMapping("/getAllInvoice")
    public ArrayList<Invoice> getInvoice(HttpSession session) {

        String auth = (String) session.getAttribute("authorities");


        if (auth.equalsIgnoreCase("ROLE_ADMIN")) {
            return invoiceService.getAllInvoice();
        } else {

            UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");

            return userAccessController.getUserInvoice(userLogin);
        }


    }

    @RequestMapping("/view")
    public String viewInvoice() {
        return "invoice/view-invoice";
    }

    @RequestMapping("/viewInvoice/{id}")
    public ModelAndView customerInvoice(@PathVariable() long id) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("invoice/customer-invoice");

        Invoice invoice = invoiceService.getInvoiceById(id);

        String[] plist = invoice.getPackageName().split(",");
        String[] rlist = invoice.getPackageAmount().split(",");

        mv.addObject("iData", invoice);
        mv.addObject("plist", plist);
        mv.addObject("rlist", rlist);

        return mv;
    }

    @GetMapping("/print-invoice/{paymentId}")
    public void printInvoice(@PathVariable(value = "paymentId") Integer paymentId, HttpServletRequest request, HttpServletResponse response) throws IOException {
        jasperParameter = new HashMap();
        jasperParameter.put("payment_id", paymentId);

        JasperExporter jasperexport = new JasperExporter();
        String url = request.getSession().getServletContext().getRealPath("/") + "report" + System.getProperty("file.separator") + "Invoice_Table_Based.jrxml";
        try {

            jasperexport.jasperExporterPDF(jasperParameter, url.toString(), "invoice", response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
