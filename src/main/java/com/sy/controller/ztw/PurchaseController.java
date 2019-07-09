package com.sy.controller.ztw;


import com.sy.model.common.GoodsPack;
import com.sy.model.common.User;
import com.sy.model.common.UserAccountLog;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.OrderListZtw;
import com.sy.model.ztw.SearchActivationZtw;
import com.sy.model.ztw.UserPointZtw;
import com.sy.service.common.UserService;
import com.sy.service.ztw.*;
import com.sy.tools.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class PurchaseController {
    private static int pagestar = 1;

    @Autowired
    private RegisterUserService service;

    @Autowired
    private UserAddressInfoService userAddressInfoService;
    @Autowired
    private ActivationService activationService;
    @Autowired
    private RePurchaseService rePurchaseService;

    @Autowired
    private OrderMangerService orderMangerService;
    @Autowired
    private UserService userService;

    @RequestMapping("/shopManger/orderPurchaseOne.html")
    public String toOrder() {
        return "shopManger/orderPurchaseOne";
    }

    @RequestMapping("/shopManger/orderPurchaseTwo.html")
    public String toOrderTwo() {
        return "shopManger/orderPurchaseTwo";
    }

    @RequestMapping("/shopManger/confirmActivation.html")
    public String toConfirmActivation(Model model) {
        List<OrderInfoZtw> list = activationService.findAllO();
        System.out.println(list);
        List<User> list1 = activationService.findAllU();
        model.addAttribute("list0", list);
        model.addAttribute("list1", list1);
        return "/shopManger/confirmActivation";
    }

    @RequestMapping("/shopManger/orderPurchaseThree.do")
    public String toOrderThreeDo(String username, Model model) {
        User user = userAddressInfoService.findAddressInfo(username);
        System.out.println(user.getId()+"sadfasdf132sddsf");
        double balance = userAddressInfoService.findbalance(user.getId());
        model.addAttribute("balance", balance);
        model.addAttribute("udf", user);
        return "shopManger/orderPurchaseThree";
    }

    @RequestMapping("/shopManger/existName.html")
    @ResponseBody
    public ResponseData judgeExistName(String username) {
        ResponseData responseData = new ResponseData();
        User user = service.judgeExistLoginName(username);
        if (user == null) {
            responseData.setCode(400);
            return responseData;
        }
        responseData.setCode(200);
        responseData.setData(user);
        return responseData;
    }

    @RequestMapping("/shopManger/confirmActivation.html1")
    @ResponseBody
    public ResponseData saveOrderInfo(int userId, String username, int pv, int costMoney, String deliveryAddress, Integer zipCode, String
            postType) {
        ResponseData responseData = new ResponseData();
        OrderInfoZtw orderInfoZtw = new OrderInfoZtw();
        orderInfoZtw.setPickuserid(userId);
        orderInfoZtw.setBuyuserid(userId);
        orderInfoZtw.setServicefee(Math.abs(costMoney));
        Date date = new Date();
        orderInfoZtw.setOrdertime(date);
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        orderInfoZtw.setOrdersn(uuid);
        orderInfoZtw.setOrderid(uuid);
        orderInfoZtw.setBasepv(pv);
        User user = service.judgeExistLoginName(username);
        System.out.println(user.getCountry());
        orderInfoZtw.setCountry(user.getCountry());
        orderInfoZtw.setMobile(user.getMobile());
        orderInfoZtw.setPostcode(zipCode);
        orderInfoZtw.setShiptype(postType);
        orderInfoZtw.setUseraddress(deliveryAddress);
        int i = userAddressInfoService.saveAddressInfo(orderInfoZtw);
        System.out.println(i);
        if (i == 0) {
            responseData.setCode(400);
            return responseData;
        } else {
            responseData.setCode(200);
            return responseData;
        }
    }

    @RequestMapping("/shopManger/confirmActivation.do")
    public String toActivation(Integer userId, Integer costMoney,Double pv, String userLoginName,Model model) {
        int i = activationService.findCount();
        List<OrderInfoZtw> list = activationService.findAllO();
        System.out.println(list);
        List<User> list1 = activationService.findAllU();
        model.addAttribute("count", i);
        model.addAttribute("list0", list);
        model.addAttribute("list1", list1);
        //确认激活同时，更改账户的余额（实际log表中是插入语句）
        UserAccountLog userAccountLog = new UserAccountLog();
        userAccountLog.setBaseOut(Math.abs(costMoney));
        userAccountLog.setBaseBalance(costMoney);
        userAccountLog.setUserId(userId);
        try {
            activationService.saveUpdateBalance(userAccountLog);
            //同时，登录用户拿奖金
            User user = new User();
            user.setLoginCode(userLoginName);
            List<User> users=userService.getUserList(user);
            UserPointZtw userPointZtw = new UserPointZtw();
            userPointZtw.setBonusUserId(users.get(0).getId());
            Date date = new Date();
            userPointZtw.setBuytime(date);
            userPointZtw.setUserId(userId);
            userPointZtw.setBuyPv(pv);
            System.out.println(pv);
            userPointZtw.setBonusPv(0.5*pv);
            userPointZtw.setBonusRate(0.5);
            userAddressInfoService.saveUserPoint(userPointZtw);
            return "/shopManger/confirmActivation";
        } catch (Exception e) {
            e.printStackTrace();
            return "401";
        }
    }

    @RequestMapping("/shopManger/confirmActivation.search")
    public String searchActivation(SearchActivationZtw searchActivationZtw, Model model) {
        List<OrderInfoZtw> list = activationService.findBySearchO(searchActivationZtw);
        System.out.println(list);
        List<User> list1 = activationService.findBySearchU(searchActivationZtw);
        System.out.println(list1);
        model.addAttribute("list0", list);
        model.addAttribute("list1", list1);
        return "/shopManger/confirmActivation";
    }

    //点击激活按钮，更新其他 为会员，重新查询语句，刷新页面
    @RequestMapping("/shopManger/confirmActivation.go")
    public String sureActivation(int userId, Model model) {
        try {
            activationService.changeVip(userId);
            activationService.updateStat(userId);
            List<OrderInfoZtw> list = activationService.findAllO();
            List<User> list1 = activationService.findAllU();
            model.addAttribute("list0", list);
            model.addAttribute("list1", list1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "shopManger/confirmActivation";
    }

    @RequestMapping("/shopManger/rePurchase.html")
    public String toRePurchase(Model model, Integer pageChange) {
        if (pageChange != null) {

            if (pageChange == 1) {
                pagestar += 1;
                System.out.println(pagestar);
            }
            if (pageChange == 2) {
                pagestar -= 1;
                if (pagestar < 1) {
                    pagestar = 1;
                }
            }
        }
        GoodsPack goodsPack = new GoodsPack();
        goodsPack.setState(1);
        goodsPack.setTypeId(2);
        List<GoodsPack> list = null;
        try {
            list = rePurchaseService.findGoodsPack(goodsPack, pagestar);
            if (list.size() == 0) {
                pagestar -= 1;
                list = rePurchaseService.findGoodsPack(goodsPack, pagestar);
            }
            model.addAttribute("goodsPack", list);
            return "/shopManger/rePurchaseOne";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "401";
    }

    @RequestMapping("/shopManger/rePurchase.form")
    public String toSearchPurchase(GoodsPack goodsPack, Model model, Integer pageChange) {
        if (pageChange != null) {

            if (pageChange == 1) {
                pagestar += 1;
                System.out.println(pagestar);
            }
            if (pageChange == 2) {
                pagestar -= 1;
                if (pagestar < 1) {
                    pagestar = 1;
                }
            }
        }
        if (goodsPack.getGoodsPackCode() == "") {
            goodsPack.setGoodsPackCode(null);
        }

        if (goodsPack.getGoodsPackName() == "") {
            goodsPack.setGoodsPackName(null);
        }

        goodsPack.setState(1);
        goodsPack.setTypeId(2);
        List<GoodsPack> list = null;
        try {
            list = rePurchaseService.findGoodsPack(goodsPack, pagestar);
            if (list.size() == 0) {
                pagestar -= 1;
                list = rePurchaseService.findGoodsPack(goodsPack, pagestar);
            }
            model.addAttribute("goodsPack", list);
            return "/shopManger/rePurchaseOne";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "401";
    }

    @RequestMapping("/shopManger/orderManger.html")
    public String toOrderManger(Model model) {
        List<OrderInfoZtw> list = activationService.findAll();
        List<User> list1 = activationService.findAllU();
        model.addAttribute("list0", list);
        model.addAttribute("list1", list1);
        return "/shopManger/orderManger";
    }

    @RequestMapping("/shopManger/rePurchase.doSearch")
    public String searchOrderManger(String ordersn, String loginCode, String quiz1, Model model) {
        if (ordersn == "") {
            ordersn = null;
        }
        if (loginCode == "") {
            loginCode = null;
        }
        if (quiz1 == "") {
            quiz1 = null;
        }
        List<OrderInfoZtw> list = orderMangerService.findByOrdersn(ordersn, quiz1);
        System.out.println(list);
        List<User> list1 = orderMangerService.findByLoginCode(loginCode);
        System.out.println(list1);
        model.addAttribute("list0", list);
        model.addAttribute("list1", list1);
        return "/shopManger/orderManger";
    }

    @RequestMapping("/shopManger/rePurchase.dodel")
    @ResponseBody
    public ResponseData doDelete(String orderid) {
        System.out.println(orderid);
        ResponseData responseData = new ResponseData();
        try {
            orderMangerService.doDelete(orderid);
            responseData.setCode(200);
            return responseData;
        } catch (Exception e) {
            e.printStackTrace();
            responseData.setCode(400);
            return responseData;
        }
    }
    //一个用户一个购物车，单独测试写了一个固定用户，整合后应该获取当前的用户
    @RequestMapping("/shopManger/rePurchaseTwo.add")
    @ResponseBody
    public ResponseData doAdd(Integer goodsPackId,Integer num,String loginCode){
//        User user = new User();
//        user.getId();
        System.out.println(num);
        ResponseData responseData = new ResponseData();
        OrderListZtw orderListZtw = new OrderListZtw();
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        orderListZtw.setListId(uuid);
        orderListZtw.setGoodsId(goodsPackId);
        orderListZtw.setGoodsNum(num);
        try {
            //查询对应的套餐信息，塞到orderList实体类中
            GoodsPack goodsPack =rePurchaseService.findByGoodsId(goodsPackId);
            Integer i = (new Double(goodsPack.getTotalPrice())).intValue();
            System.out.println(i);
            orderListZtw.setEachPrice(i);
            int a = i*num;
            System.out.println(a);
            orderListZtw.setSumPrice(a);
            orderListZtw.setGoodsName(goodsPack.getGoodsPackName());
            Integer i1 = (int)(i*num*0.1);//pv奖金率0.1
            orderListZtw.setRealPv(i1);
            User user =new User();
            user.setLoginCode(loginCode);
            List<User> users=userService.getUserList(user);
            orderListZtw.setBuy_userid(users.get(0).getId());//获取tou de 信息
            if (num >=1){
                rePurchaseService.insertToCart(orderListZtw);
                responseData.setCode(200);
                return responseData;
            }else {
                responseData.setCode(400);
                return responseData;
            }
        } catch (Exception e) {
            e.printStackTrace();
            responseData.setCode(500);
            return responseData;
        }
    }
    @RequestMapping("/shopManger/rePurchaseTwo.show")
    public String toShowShopList(Model model, User user){
        //获得当前的登录用户Id,现用固定值74，tou
        List<OrderListZtw> orderListZtw = null;
        try {
            List<User> users=userService.getUserList(user);
            orderListZtw =rePurchaseService.findAllByUserId(users.get(0).getId());
            System.out.println(orderListZtw);
            if (orderListZtw.size()==0){
                pagestar-=1;
                orderListZtw =rePurchaseService.findAllByUserId(users.get(0).getId());
            }
            model.addAttribute("orderList", orderListZtw);
            return "/shopManger/rePurchaseTwo";
        } catch (Exception e) {
            e.printStackTrace();
            return "401";
        }
    }
    @RequestMapping("/shopManger/rePurchaseThree.html")
    public String toGoPay(Model model, User user){
        //测试根据固定的loginCode去查询
        List<User> list1 = orderMangerService.findByLoginCode(user.getLoginCode());
        model.addAttribute("list1",list1);
        String uuid = UUID.randomUUID().toString().replace("-","");
        model.addAttribute("uuid",uuid);
        Date date = new Date();
        String date1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
        model.addAttribute("time",date1);
        List<OrderListZtw> orderListZtw = null;
        try {
            List<User> users=userService.getUserList(user);
            orderListZtw = rePurchaseService.findAllByUserId(users.get(0).getId());
            if (orderListZtw.size()!=0){
                User user1 = userAddressInfoService.findAddressInfo(users.get(0).getLoginCode());
                model.addAttribute("user1",user1);
                model.addAttribute("orderList", orderListZtw);
                double balance = userAddressInfoService.findbalance(users.get(0).getId());
                model.addAttribute("balance",balance);
                return "/shopManger/rePurchaseThree";
            }else{
                return "/shopManger/shopCartNull";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "401";
        }
    }
    @RequestMapping("/shopManger/rePurchaseTwo.dodel")
    public String toDelete(String listId,String loginCode){
        System.out.println(listId);
        try {
            rePurchaseService.deleteByListId(listId);
            return "redirect:/shopManger/rePurchaseTwo.show?loginCode="+loginCode+"";
        } catch (Exception e) {
            e.printStackTrace();
            return "401";
        }
    }
    @RequestMapping("/shopManger/rePurchaseTwo.changenum")
    @ResponseBody
    public ResponseData toChangeNum(OrderListZtw orderListZtw){
        System.out.println(orderListZtw.getListId());
        ResponseData responseData = new ResponseData();
        try {
            rePurchaseService.changeNum(orderListZtw);
            responseData.setCode(200);
            return responseData;
        } catch (Exception e) {
            e.printStackTrace();
            responseData.setCode(400);
            return responseData;
        }
    }
    @RequestMapping("/shopManger/rePurchaseThree.dopay")
    @ResponseBody
    public ResponseData payMoney(Integer repeatOut,Integer pv,Integer id,String shipNumber,String address,String postType,Integer zipCode){
        ResponseData responseData = new ResponseData();
        try {
            //删除对应id的购物车信息
            rePurchaseService.deleteByBuyId(id);
            //查询对应的user信息
            User user = new User();
            user.setId(id);
            User user1 = userService.getUserById(user);
            //将对应的user信息塞到orderInfo 中
            OrderInfoZtw orderInfoZtw = new OrderInfoZtw();
            String uuid = UUID.randomUUID().toString().replace("-","");
            orderInfoZtw.setOrderid(uuid);
            Date date = new Date();
            orderInfoZtw.setOrdertime(date);
            orderInfoZtw.setOrdersn(uuid);
            System.out.println(pv);
            orderInfoZtw.setRepeatpv(pv);
            orderInfoZtw.setCountry(user1.getCountry());
            orderInfoZtw.setServicefee(repeatOut);
            orderInfoZtw.setMobile(user1.getMobile());
            orderInfoZtw.setUseraddress(address);
            orderInfoZtw.setPostcode(zipCode);
            orderInfoZtw.setShiptype(postType);
            orderInfoZtw.setShipnum(shipNumber);
            orderInfoZtw.setSata(2);
            orderInfoZtw.setPickuserid(id);
            orderInfoZtw.setBuyuserid(id);
            orderInfoZtw.setTel("重消购货");
            rePurchaseService.saveOrderInfomation(orderInfoZtw);
            //总账中要更改余额
            UserAccountLog userAccountLog = new UserAccountLog();
            userAccountLog.setUserId(id);
            userAccountLog.setRepeatOut(repeatOut);
            Date date1 = new Date();
            userAccountLog.setActionTime(date1);
            Integer balance = repeatOut*(-1);
            System.out.println(balance);
            userAccountLog.setBaseBalance(balance);
            activationService.saveUpdateBalance(userAccountLog);
            responseData.setCode(200);
            return responseData;
        } catch (Exception e) {
            e.printStackTrace();
            responseData.setCode(400);
            return responseData;
        }
    }
}
