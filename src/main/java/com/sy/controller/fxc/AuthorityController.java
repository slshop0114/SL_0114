package com.sy.controller.fxc;

import com.sy.model.common.Role;
import com.sy.model.common.User;
import com.sy.service.common.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class AuthorityController {
    @Autowired
    RoleService roleService;

    @RequestMapping("/backend/authoritymanage.html")
    public String authorityManage(HttpSession session, Model model, User user){

        List<Role> roleList = null;
        try {
            roleList = roleService.getRoleList();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            roleList = null;
        }

        model.addAttribute(roleList);

            return "/backend/authoritymanage";
        }
    }

