package com.sy.controller.fxc;

import com.alibaba.fastjson.JSONArray;
import com.sy.model.common.*;
import com.sy.service.common.AuthorityService;
import com.sy.service.common.FunctionService;
import com.sy.service.common.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
public class AuthorityController {
    @Autowired
    RoleService roleService;
    @Autowired
    FunctionService functionService;
    @Autowired
    AuthorityService authorityService;

    @RequestMapping("/backend/authoritymanage.html")
    public String authorityManage(HttpSession session, Model model, User user) {

        List<Role> roleList = null;
        List<Function> functionList = null;
        try {
            functionList = functionService.getAllFunction();
            roleList = roleService.getRoleList();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            roleList = null;
        }

        model.addAttribute(roleList);
        model.addAttribute("functionlist", functionList);
        return "/backend/authoritymanage";
    }


    @RequestMapping("/backend/functions.html")
    public String functions(Integer[] functionid, Integer roleid) {
        Authority authority = new Authority();
        authority.setRoleId(roleid);
        authority.setCreatedBy("admin");
        authority.setCreationTime(new Date());
        authority.setUserTypeId(0);
        try {
            authorityService.deleteAuthority(authority);
            for (Integer i : functionid) {
                authority.setFunctionId(i);
                authorityService.addAuthority(authority);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "forward:/backend/authoritymanage.html";
    }

    @RequestMapping("/backend/getAuthorityDefault.html")
    @ResponseBody
    public List<Authority> authorithDefault(Authority authority) {
        List<Authority> list = null;
        try {
            list = authorityService.getList(authority);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}

