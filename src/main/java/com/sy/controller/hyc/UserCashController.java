package com.sy.controller.hyc;

import com.sy.model.common.User;
import com.sy.model.hyc.AuUser;
import com.sy.model.hyc.UserAccountLog201404;
import com.sy.model.hyc.UserCash;
import com.sy.service.hyc.AuUserService;
import com.sy.service.hyc.UserAccountLog201404Service;
import com.sy.service.hyc.UserCashService;
import com.sy.tools.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/cash")
public class UserCashController {

    @Autowired
    private UserCashService userCashService;
    @Autowired
    private AuUserService auUserService;
    @Autowired
    private UserAccountLog201404Service userAccountLog201404Service;


    //申请提现
    @RequestMapping("/getCash.html")
    public String toGetCash(HttpSession session) throws Exception{
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        BigDecimal basebalance1 = userAccountLog201404Service.getBaseBalance(user.getId());
        System.out.println(user.getId()+"-----------------------------------");
        DecimalFormat df = new DecimalFormat("0.00");
        String basebalance = df.format(basebalance1);
        session.setAttribute("basebalance",basebalance);
        System.out.println(basebalance+"-------------------------------");
        return "hyc/applicationforcash";
    }


    //提现明细
    @RequestMapping("/detailForCash.html")
    public String toDetailCash(HttpSession session)throws Exception{
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        BigDecimal basebalance1 = userAccountLog201404Service.getBaseBalance(user.getId());
        DecimalFormat df = new DecimalFormat("0.00");
        String basebalance = df.format(basebalance1);
        System.out.println(basebalance+"--------jibenzhanghu");
        session.setAttribute("basebalance",basebalance);
        return "hyc/detailsforcash";
    }

    //提现明细查询
    @RequestMapping("/getdetailcash.html")
    @ResponseBody
    public List<UserCash> selectBaseBy(Integer userid, Date date1, Date date2,int firstResult, int maxResults) throws Exception{
        System.out.println("------------------------------------");
        List<UserCash> list = userCashService.getDetailList(userid,date1,date2,firstResult,maxResults);
        System.out.println(list);
        return list;
    }

    //系统自动带出信息
    @RequestMapping("/getbank.html")
    @ResponseBody
    public List<AuUser> selectBank(Integer id) throws Exception{
        System.out.println("-----------------2-------------------");
        List<AuUser> list = auUserService.getBank(id);
        System.out.println(list);
        return list;
    }

    //申请提现
    @RequestMapping("/addCash.html")
    @ResponseBody
    public String addCash(UserCash userCash,HttpSession session)throws Exception{
        System.out.println("-----------------3-------"+userCash);
        Integer i = userCash.getUserId();
        userCashService.addCash(userCash);
        UserAccountLog201404 userAccountLog201404 = new UserAccountLog201404();
        userAccountLog201404.setUserid(userCash.getUserId());
        userAccountLog201404.setBasein(BigDecimal.valueOf(0));
        userAccountLog201404.setBaseout(userCash.getCashMoney());
        userAccountLog201404.setActiondesc("提现");
        userAccountLog201404.setActiontype(1);
        BigDecimal b = userCash.getCashMoney().multiply(new BigDecimal(-1));
        userAccountLog201404.setBasebalance(b);
        userAccountLog201404Service.addMoneyForBase(userAccountLog201404);
        System.out.println("=======================================");
        return "1";
    }


}
