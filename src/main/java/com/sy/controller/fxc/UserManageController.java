package com.sy.controller.fxc;


import com.sy.model.common.DataDictionary;
import com.sy.model.common.Role;
import com.sy.model.common.User;
import com.sy.service.common.RoleService;
import com.sy.service.fxc.DataDictionaryService;
import com.sy.service.common.UserService;
import com.sy.tools.Constants;
import com.sy.tools.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller

public class UserManageController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private DataDictionaryService dataDictionaryService;


    @RequestMapping("/backend/userlist.html")
    public String userManager(Model model, HttpSession session) throws Exception {
        System.out.println("sa");
        User user1 = new User();
        List<User> list = userService.getUserList(user1);
        model.addAttribute("list", list);

        return "backend/userlist";
    }

    @RequestMapping("/backend/adduser.html")
    public ModelAndView addUser(HttpSession session, User addUser) {
        if ("1".equals(addUser.getCardType())) {
            addUser.setCardTypeName("二代身份证");
        }
        if ("3".equals(addUser.getCardType())) {
            addUser.setCardTypeName("军官证");
        }
        if ("4".equals(addUser.getCardType())) {
            addUser.setCardTypeName("护照");
        }
        if (addUser.getRoleId() == 1) {
            addUser.setRoleName("管理员");
        }
        if (addUser.getRoleId() == 2) {
            addUser.setRoleName("会员");
        }
        if ("1".equals(addUser.getUserType())) {
            addUser.setUserTypeName("注册会员");
        }
        if ("2".equals(addUser.getUserType())) {
            addUser.setUserTypeName("消费会员");
        }
        if ("3".equals(addUser.getUserType())) {
            addUser.setUserTypeName("VIP会员");
        }
        if ("4".equals(addUser.getUserType())) {
            addUser.setUserTypeName("加盟店");
        }
        addUser.setIsStart(1);

        try {
            String idCard = addUser.getIdCard();

            addUser.setPassword("123456");
            addUser.setPassword2("123456");
            addUser.setCreateTime(new Date());
            addUser.setReferId(((User) session.getAttribute(Constants.SESSION_USER)).getId());
            addUser.setReferCode(((User) session.getAttribute(Constants.SESSION_USER)).getLoginCode());
            addUser.setLastUpdateTime(new Date());

            userService.addUser(addUser);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ModelAndView("redirect:/401.html");
        }
        return new ModelAndView("redirect:/backend/userlist.html");
    }

    //查询单个用户

    @RequestMapping("/backend/getuser.html")
    @ResponseBody
    public Object getUser(User user) {
        User user1 = new User();
        try {
            user1 = userService.getUserById(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user1;
    }


    @RequestMapping("/backend/deluser.html")
    @ResponseBody
    public String delUser(User user) {

        try {
            userService.deleteUser(user);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "success";
    }

    //搜索框搜索用户
    @RequestMapping("/backend/loadUserTypeList.html")
    public String getUserListBySearch(User user, Model model) {
        try {

            List<User> userList = userService.getUserListBySearch(user);
            model.addAttribute("list", userList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "backend/userlist";
    }


    @RequestMapping("/backend/upload.html")
    @ResponseBody
    public Map<String, Object> uploadUrl(MultipartFile uploadFile) {
        Map<String, Object> map = new HashMap<>();
        //1.保存图片到本地
        String fileoriname = null;//原名称
        String filenowname = null;//系统生成的名称
        if (uploadFile != null) {
            fileoriname = uploadFile.getOriginalFilename();//获取原名字
            System.out.println(fileoriname + "----fileoriname");
            String uuid = UUID.randomUUID().toString().replace("-", "");
            //获得扩展名
            String suffix = fileoriname.substring(fileoriname.lastIndexOf(".") + 1);
            filenowname = uuid + "." + suffix;//UUID生成新的唯一名字+文件扩展名
            System.out.println(filenowname + "----filenowname");
        }

        try {
            String path = "D:/roots/" + filenowname;
            File newFile = new File(path);
            uploadFile.transferTo(newFile);
            map.put("file", newFile);
        } catch (Exception e) {

        }
        return map;
    }

    @RequestMapping("/backend/modifyuser.html")
    public String modifyUser(User user) {

        if ("1".equals(user.getCardType())) {
            user.setCardTypeName("二代身份证");
        }
        if ("3".equals(user.getCardType())) {
            user.setCardTypeName("军官证");
        }
        if ("4".equals(user.getCardType())) {
            user.setCardTypeName("护照");
        }
        if (user.getRoleId() == 1) {
            user.setRoleName("管理员");
            user.setUserTypeName("");
        }
        if (user.getRoleId() == 2) {
            user.setRoleName("会员");
        }
        if ("1".equals(user.getUserType())) {
            user.setUserTypeName("注册会员");
        }
        if ("2".equals(user.getUserType())) {
            user.setUserTypeName("消费会员");
        }
        if ("3".equals(user.getUserType())) {
            user.setUserTypeName("VIP会员");
        }
        if ("4".equals(user.getUserType())) {
            user.setUserTypeName("加盟店");
        }

        userService.modifyUser(user);

        return "redirect:/backend/userlist.html";
    }

    @RequestMapping("/backend/searchUserIsExits")
    @ResponseBody
    public Map<String, String> searchUserIsExits(User user) {
        Map<String, String> map = new HashMap<>();
        try {
          int i = userService.loginCodeIsExit(user);
          if (i>0){
              map.put("key","exits");
              return map;
          }

        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("key","none");
        return map;
    }

}





