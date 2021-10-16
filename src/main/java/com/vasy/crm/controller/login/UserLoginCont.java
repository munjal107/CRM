package com.vasy.crm.controller.login;

import java.util.ArrayList;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import com.vasy.crm.util.UserAccessController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.service.login.UserLoginService;
import com.vasy.crm.serviceImpl.email.EmailServiceImpl;

@Controller
@RequestMapping("/master")
public class UserLoginCont {

    /*
     * @Autowired BCryptPasswordEncoder bCryptPasswordEncoder;
     */
    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    EmailServiceImpl emailServiceImpl;

    @Autowired
    UserLoginService userService;

    @Autowired
    UserAccessController userAccessController;

    @RequestMapping("/showUser")
    public ModelAndView showser() {
        ModelAndView mv = new ModelAndView("master/user");

        ArrayList<UserLogin> alist = userService.getUsers();
        mv.addObject("alist", alist);

        return mv;

    }

    @PostMapping("/addUser")
    public String addUser(@ModelAttribute() UserLogin u) throws MessagingException {


        Random rand = new Random();
        int rand_int1 = rand.nextInt(1000000);

        String passString = Integer.toString(rand_int1);
        u.setPassword(passString);
        System.out.println("\n\n" + u.getPassword());
        /* PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); */
        emailServiceImpl.sendSimpleMessage(u.getUserEmail(), u.getUsername(), u.getPassword());

        String password = passwordEncoder.encode(passString);
        u.setPassword(password);
		/*String password = passwordEncoder.encode(u.getPassword());
		//System.out.println("\n\n"+password);
		u.setPassword(password);*/
        userService.addUser(u);
        return "redirect:/master/showUser";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(Long id) {

        userService.deleteUser(id);

        return "redirect:/master/showUser";
    }

    @RequestMapping("/editUser")
    public String editUser(@ModelAttribute() UserLogin u) {

        UserLogin uobj = userService.getUserById(u.getId());
        uobj.setUsername(u.getUsername());
        uobj.setRole(u.getRole());
        uobj.setUserEmail(u.getUserEmail());
        userService.addUser(uobj);

        return "redirect:/master/showUser";
    }

    @ResponseBody
    @RequestMapping("/sendPassword")
    @Async
    public String sendPasswrod(@RequestParam() String email) throws MessagingException {

        //System.out.println("\n----------"+email+"---------\n");

        UserLogin ul = userService.getUserByUserEmail(email);
        if (ul != null) {
            Random rand = new Random();

            // Generate random integers in range 0 to 1000000
            int rand_int1 = rand.nextInt(1000000);

            String passString = Integer.toString(rand_int1);
            //System.out.println("\n\n"+passString+"\n\n   720464");
            emailServiceImpl.sendSimpleMessage(ul.getUserEmail(), ul.getUsername(), passString);

            String password = passwordEncoder.encode(passString);
            ul.setPassword(password);

            userService.addUser(ul);

            return "true";
        }

        //return "redirect:/invoice/new";
        return "false";
    }


    @RequestMapping("/getUsers")
    @ResponseBody
    public ArrayList<UserLogin> getUser(HttpSession session) {

        String auth = (String) session.getAttribute("authorities");
        if (auth.equalsIgnoreCase("ROLE_ADMIN")) {
            return userService.getUsers();
        } else {

            UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");

            return userAccessController.getUsers(userLogin);

        }


    }

    @ResponseBody
    @PostMapping("/changePassword")
    public String changePassword(@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword, HttpSession session) {
        //System.out.println("\n"+oldPassword+"   "+newPassword+"  "+session.getAttribute("username"));

        UserLogin ul = userService.getUserByUsername((String) session.getAttribute("username"));

        if (passwordEncoder.matches(oldPassword, ul.getPassword())) {

            ul.setPassword(passwordEncoder.encode(newPassword));
            userService.addUser(ul);
            session.invalidate();
            return "true";
        }
        //System.out.println("\n\n"+passwordEncoder.matches(oldPassword, ul.getPassword()));

        return "false";
    }

    @ResponseBody
    @PostMapping("/checkUser")
    public String checkUname(@RequestParam(defaultValue = "", value = "username") String name) {

        UserLogin ul = userService.getUserByUsername(name);
        //System.out.println(ul);
        if (ul != null) {
            return "{ \"valid\": false}";
        } else {
            return "{ \"valid\": true}";
        }

    }

    @ResponseBody
    @PostMapping("/checkUserEmail")
    public String checkUserEmail(@RequestParam(defaultValue = "", value = "userEmail") String email) {

        UserLogin ul = userService.getUserByUserEmail(email);
        System.out.println(ul);
        if (ul != null) {
            return "{ \"valid\": false}";
        } else {
            return "{ \"valid\": true}";
        }

    }

}
