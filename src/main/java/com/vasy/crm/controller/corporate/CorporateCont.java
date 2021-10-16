package com.vasy.crm.controller.corporate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/corporate")
public class CorporateCont {


    @RequestMapping("/new")
    public String go() {

        return "corporate/new-customer";
    }


    @RequestMapping("/view")
    public String show() {

        return "corporate/view-customer";

    }


}
