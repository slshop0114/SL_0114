package com.sy.controller.hyc;

import com.sy.model.hyc.UserAccountLog201404;
import com.sy.model.hyc.UserRechargehyc;
import com.sy.service.hyc.UserAccountLog201404Service;
import com.sy.service.hyc.UserRechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;

@Controller
@RequestMapping("/recharge")
public class UserRechargeController {

    @Autowired
    private UserRechargeService userRechargeService;
    @Autowired
    private UserAccountLog201404Service userAccountLog201404Service;

    //汇款充值
    @RequestMapping("/recharge.html")
    public String toRecharge(){
        return "hyc/recharge";
    }

    @RequestMapping("/rechargeMoney.html")
    @ResponseBody
    public String addMoney(UserRechargehyc userRechargehyc)throws Exception {
        System.out.println(userRechargehyc + "-----------------------------------------------------");
        Integer i = userRechargehyc.getRecharge_account();
        userRechargeService.addMoney(userRechargehyc);
        if (i == 1){
            System.out.println("---------------"+i);
            UserAccountLog201404 userAccountLog201404 = new UserAccountLog201404();
            userAccountLog201404.setUserid(userRechargehyc.getUserId());
            userAccountLog201404.setActiontime(userRechargehyc.getRechargeTime());
            userAccountLog201404.setActiondesc(userRechargehyc.getNote());
            userAccountLog201404.setActiontype(userRechargehyc.getRecharge_account());
            userAccountLog201404.setBasein(userRechargehyc.getRechargeMoney());
            userAccountLog201404.setBaseout(BigDecimal.valueOf(0));
           userAccountLog201404.setBasebalance(userRechargehyc.getRechargeMoney());
            userAccountLog201404Service.addMoneyForBase(userAccountLog201404);

           /* BigDecimal basebalance = userRechargehyc.getRechargeMoney();
            Integer userid = userRechargehyc.getUserId();
         *//*
            List<UserAccountLog201404> list = userAccountLog201404Service.getBaseList(userid);
            UserAccountLog201404 userAccountLog2014041 = new UserAccountLog201404();
            BigDecimal a = userAccountLog201404.getBasebalance();
            if ()*//*
            userAccountLog201404Service.modifyInBalance(basebalance,userid);*/
        }
        if (i == 0){
            System.out.println("--------------------"+i);
            UserAccountLog201404 userAccountLog201404 = new UserAccountLog201404();
            userAccountLog201404.setUserid(userRechargehyc.getUserId());
            userAccountLog201404.setActiontime(userRechargehyc.getRechargeTime());
            userAccountLog201404.setActiondesc(userRechargehyc.getNote());
            userAccountLog201404.setActiontype(userRechargehyc.getRecharge_account());
            userAccountLog201404.setRepeatin(userRechargehyc.getRechargeMoney());
            userAccountLog201404.setRepeatbalance(userRechargehyc.getRechargeMoney());
            userAccountLog201404Service.addMoneyForRepeat(userAccountLog201404);
        }
        return "1";
    }


}
