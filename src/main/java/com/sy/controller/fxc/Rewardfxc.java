package com.sy.controller.fxc;

import com.sy.model.common.User;
import com.sy.service.common.UserService;
import com.sy.tools.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class Rewardfxc {
    @Autowired
    UserService userService;


    @RequestMapping("/instructions/reward.html")
    public String ToOperational(HttpSession session, Model model){
        User user = (User)session.getAttribute(Constants.SESSION_USER);
        User user1 = new User();
        user1.setReferId(user.getId());

        try {
            int count = userService.selectCountvip(user);
            List<User> list=userService.searchUserbyReferId(user1);
            for (int i =list.size()-1;i>0;i--){
                if (list.get(i).getUserType()=="1"){
                    list.remove(i);
                    count--;
                }
            }
            model.addAttribute("refernum",list);
            model.addAttribute("refercount",count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fxc/reward";
    }

}
