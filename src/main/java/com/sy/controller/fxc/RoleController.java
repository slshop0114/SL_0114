package com.sy.controller.fxc;

import com.sy.model.common.Role;
import com.sy.service.common.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RoleController {
    @Autowired
    RoleService roleService;


    @RequestMapping("/backend/rolelist.html")
    public String roleList(HttpSession session, Model model) {

        List<Role> roleList = null;
        try {
            roleList = roleService.getRoleList();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            roleList = null;
        }

        model.addAttribute(roleList);

        return "/backend/rolelist";
    }


    @RequestMapping("/backend/addRole.html")
    public String addRole(HttpSession session, Role role) {
        role.setCreateDate(new Date());
        role.setIsStart(1);
        try {
            roleService.addRole(role);
        } catch (Exception e) {
            e.printStackTrace();
            return "sadf";
        }

        return "forward:/backend/rolelist.html";
    }

    @RequestMapping("/backend/modifyRole.html")
    public String modifyRole(HttpSession session, Role role) {
        try {
            roleService.modifyRole(role);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return "failed";
        }
        return "forward:/backend/rolelist.html";
    }

    @RequestMapping("/backend/delRole.html")
    @ResponseBody
    public String delRole(Role role) {
        try {
            roleService.deleteRole(role);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "1";
    }
    @RequestMapping("/backend/blurrole.html")
    @ResponseBody
    public  Map<String,Object> blurrole(Role role){
        Map<String,Object> map = new HashMap<>();
        try {
            Role role1=roleService.getRole(role);
            if (role1!=null){
                map.put("key","fault");
                map.put("role",role1);
                return map;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("key","success");

        return map;
    }
}

