package com.sy.controller.fxc;

import com.sy.model.common.User;
import com.sy.model.fxc.UserBuyBonusFxc;
import com.sy.model.fxc.UserPointFxc;
import com.sy.service.common.UserService;
import com.sy.service.fxc.UserBuyBonusFxcService;
import com.sy.service.fxc.UserPointFxcService;
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
    @Autowired
    UserPointFxcService userPointFxcService;
    @Autowired
    UserBuyBonusFxcService userBuyBonusFxcService;


    @RequestMapping("/instructions/reward.html")
    public String ToOperational(HttpSession session, Model model) {
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        User user1 = new User();
        user1.setReferId(user.getId());

        try {
            int count = userService.selectCountvip(user);
            List<User> list = userService.searchUserbyReferId(user1);
            for (int i = list.size() - 1; i > 0; i--) {
                if (list.get(i).getUserType() == "1") {
                    list.remove(i);
                    count--;
                }
            }

            List<UserPointFxc> list1 = userPointFxcService.serachUserPointByUserId(user.getId());
            List<UserBuyBonusFxc> list2 = userBuyBonusFxcService.searchUserBuyBonusByUserId(user.getId());
            List<UserBuyBonusFxc> list3 = userBuyBonusFxcService.searchUserBuyBonusMonthByUserId(user.getId());
            model.addAttribute("Userpointlist", list1);
            model.addAttribute("UserBuyBonuslist", list2);
            model.addAttribute("UserBuyMonthBonuslist", list3);


            model.addAttribute("refernum", list);
            model.addAttribute("refercount", count);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fxc/reward";
    }

}
