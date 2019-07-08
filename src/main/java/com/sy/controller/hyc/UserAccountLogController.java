package com.sy.controller.hyc;

import com.sy.model.common.User;
import com.sy.model.hyc.Leave_messagehyc;
import com.sy.model.hyc.UserAccountLog201404;
import com.sy.service.common.UserService;
import com.sy.service.hyc.Leave_messageService;
import com.sy.service.hyc.UserAccountLog201404Service;
import com.sy.tools.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/account")
public class UserAccountLogController {

    @Autowired
    private UserAccountLog201404Service service;
    @Autowired
    private UserService userService;
    @Autowired
    private Leave_messageService leave_messageService;


    //基本账户
    @RequestMapping("/baseAccount.html")
    public String getBase(HttpSession session)throws Exception{
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        BigDecimal basebalance1 = service.getBaseBalance(user.getId());
        DecimalFormat df = new DecimalFormat("0.00");
        String basebalance = df.format(basebalance1);
        System.out.println(basebalance+"--------jibenzhanghu");
        session.setAttribute("basebalance",basebalance);
        return "hyc/baseAccount";
    }
    //消费账户
    @RequestMapping("/repeatAccount.html")
    public String getRepeat(HttpSession session)throws Exception{
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        BigDecimal repeatlance1 = service.getRepeatBalance(user.getId());
        DecimalFormat df = new DecimalFormat("0.00");
        String repeatlance = df.format(repeatlance1);
        System.out.println(repeatlance+"--------zhanghu");
        session.setAttribute("repeatbalance",repeatlance);
        return "hyc/repeatAccount";
    }
    //内部转账
    @RequestMapping("/internalTransfer.html")
    public String toTransfer(HttpSession session) throws Exception {
       User user = (User) session.getAttribute(Constants.SESSION_USER);
        BigDecimal basebalance = service.getBaseBalance(user.getId());
        System.out.println(user.getId()+"-----------------------------------");
        session.setAttribute("basebalance",basebalance);
        System.out.println(basebalance+"-------------------------------");
        return "hyc/internalTransfer";
    }
    //留言
    @RequestMapping("/addleavemessage.html")
    public String toLeaveMessage(){
        return "hyc/addleavemessage";
    }





    //基本账户查询
    @RequestMapping("/getbase.html")
    @ResponseBody
    public List<UserAccountLog201404> selectBaseBy(Integer userid, Date date1,Date date2,int firstResult, int maxResults) throws Exception{
        System.out.println("------------------------------------");
        List<UserAccountLog201404> list = service.getBaseList(userid,date1,date2,firstResult,maxResults);
        System.out.println(list);
        return list;
    }
    //消费账户查询
    @RequestMapping("/getrepeat.html")
    @ResponseBody
    public List<UserAccountLog201404> selectBalance(Integer userid, Date date1, Date date2,int firstResult, int maxResults) throws Exception{
        System.out.println("------------------------------------");
        List<UserAccountLog201404> list = service.getRepeatList(userid,date1,date2,firstResult,maxResults);
        System.out.println(list);
        return list;
    }
    //验证是否存在转账的登录用户
    @RequestMapping("/existName")
    @ResponseBody
    public Integer existName(String loginCode,HttpSession session) throws Exception {
        System.out.println("-----------------3-------");
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        user.setLoginCode(loginCode);
        int i = userService.loginCodeIsExit(user);
        return i;
    }
    //验证二级密码
    @RequestMapping("/selectpw")
    @ResponseBody
    public String getPw(User user, HttpSession session) throws Exception {
        System.out.println("//////////////////////");
        User user1 = userService.getUserByIdAndPw2(user);
        if (user1 != null){
            return "1";
        }else {
            return "0";
        }
    }

    //内部转账
    @RequestMapping("/dotransfer.html")
    @ResponseBody
    public String internalTransfer(Integer userid,BigDecimal baseout,String loginCode)throws Exception{
        System.out.println("/////////////////////----------------------");
        //自己基本账户出账
       UserAccountLog201404 userAccountLog201404 = new UserAccountLog201404();
       userAccountLog201404.setUserid(userid);
       userAccountLog201404.setActiondesc("转账支出");
       userAccountLog201404.setActiontype(1);
       userAccountLog201404.setBaseout(baseout);
        BigDecimal b = baseout.multiply(new BigDecimal(-1));
        userAccountLog201404.setBasebalance(b);
        service.addMoneyForBase(userAccountLog201404);
        //别人基本账户进账
        Integer userid2 = userService.getId(loginCode);
        UserAccountLog201404 userAccountLog2014041 = new UserAccountLog201404();
        System.out.println("------------shouru");
        System.out.println(userid2+"--------------------------");
        userAccountLog2014041.setUserid(userid2);
        userAccountLog2014041.setActiondesc("转账收入");
        userAccountLog2014041.setActiontype(1);
        userAccountLog2014041.setBasein(baseout);
        userAccountLog2014041.setBasebalance(baseout);
        service.addMoneyForBase(userAccountLog2014041);
        return "1";
    }

    //汇款充值未到账，发送留言
    @RequestMapping("/sendmessage.html")
    @ResponseBody
    public String sendMessage(String rechargeNum,BigDecimal rechargeMoney,String date,HttpSession session)throws Exception {
        System.out.println(".......................................");
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        Leave_messagehyc leave_messagehyc = new Leave_messagehyc();
        leave_messagehyc.setCreatedby(user.getLoginCode());
        leave_messagehyc.setMessagecontent("您好："+date+"单号为"+rechargeNum+"金额为"+rechargeMoney+"的汇款充值未到账，速查！");
        leave_messagehyc.setState(0);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //用来标明解析开始位
        ParsePosition pos = new ParsePosition(0);
        Date strtodate = formatter.parse(date, pos);
        leave_messagehyc.setCreatetime(strtodate);
        leave_messageService.addLeave_message(leave_messagehyc);
        return "1";
    }

}

