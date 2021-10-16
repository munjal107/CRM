package com.vasy.crm.controller.login;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.login.Role;

import com.vasy.crm.service.login.RoleService;


@Controller
@RequestMapping("/master")
public class RoleCont {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/showRole")
    public ModelAndView getUserRole() {
        ModelAndView mv = new ModelAndView("master/userrole");

        ArrayList<Role> alist = new ArrayList<>();
        alist = roleService.getRoles();
        mv.addObject("alist", alist);
        return mv;
    }

    @RequestMapping("/addRole")
    public String addUserRole(@ModelAttribute() Role b) {

        roleService.addRole(b);

        return "redirect:/master/showRole";
    }

    @RequestMapping("/deleteRole")
    public String deleteUserRole(@RequestParam() long id) {
        roleService.deleteRole(id);
        return "redirect:/master/showRole";
    }

    @RequestMapping("/editRole")
    public String editCategory(@ModelAttribute() Role b) {

        Role role = roleService.getRoleById(b.getId());
        role.setName(b.getName());

        roleService.addRole(role);

        return "redirect:/master/showRole";

    }

    @RequestMapping("/getRole")
    @ResponseBody
    public ArrayList<Role> GetUserRole() {
        return roleService.getRoles();
    }


}
