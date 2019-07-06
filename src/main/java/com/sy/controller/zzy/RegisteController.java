package com.sy.controller.zzy;

import com.sy.model.common.User;
import com.sy.service.zzy.MenuzzyService;
import com.sy.service.zzy.UserzzyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class RegisteController {

    

    @Autowired
    private UserzzyService userService;
    @Autowired
    private MenuzzyService menuService;


    @RequestMapping("/member/registrule.html")
    public String toRegiste() {
        return "zzy/registmember";
   /*     return "zzy/registrule";*/

    }

    @RequestMapping("/member/registmember.html")
    public String toRegistmember() {
      /*  return "zzy/registmember";*/
        return "zzy/registrule";
    }
    @RequestMapping("/member/registok.html")
    public String toRegistok() {
        return "zzy/registok";

    }
    
    @RequestMapping("/member/cheakUser.html")
    @ResponseBody
    public User cheakUser(String loginCode) throws Exception {
        User user =  userService.getUserById(loginCode);
                
        return user;
    }
    
    @RequestMapping("/member/saveregistmember.html")
    public String addregistmember(User user, HttpSession session) {
        System.out.println("2222");
        try {
             userService.addUser(user);
            System.out.println(user);
            if(user != null){
                session.setAttribute("sessionUser", user);
           
            }
        } catch (Exception e) {
            e.printStackTrace();
           
        }
        return "zzy/registok";

    }

  
}
