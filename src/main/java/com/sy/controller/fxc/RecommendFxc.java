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
public class RecommendFxc {
    @Autowired
    UserService userService;

    @RequestMapping("/instructions/recommend.html")
    public String ToRecommend(HttpSession session, Model model){
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        try {
            User user1 = new User();
            user1.setReferId(user.getId());
            List<User> list=userService.searchUserbyReferId(user1);
            System.out.println(list);
            model.addAttribute("userreferlist",list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/fxc/recommend";
    }
}
