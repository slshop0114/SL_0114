package com.sy.controller.fxc;

import com.sy.model.common.User;
import com.sy.service.common.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/backend")
public class UserManageController {
    @Autowired
    private UserService userService;


    @RequestMapping("/userlist.html")
    public String userManager(User user, Model model) throws Exception {
        System.out.println("123123123");
        List<User> list = userService.getUserList(user);
        model.addAttribute("list",list);
        return "/pages/fxc/userManage.jsp";
    }
}
