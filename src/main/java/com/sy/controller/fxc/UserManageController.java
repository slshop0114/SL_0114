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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
        //1.保存图片到本地
        String fileoriname = null;//原名称
        String filenowname = null;//系统生成的名称
        if (uploadFile != null) {
            fileoriname = uploadFile.getOriginalFilename();//获取原名字
            System.out.println(fileoriname+"----fileoriname");
            String uuid = UUID.randomUUID().toString().replace("-", "");
            //获得扩展名
            String suffix = fileoriname.substring(fileoriname.lastIndexOf(".") + 1);
            filenowname = uuid + "." + suffix;//UUID生成新的唯一名字+文件扩展名
            System.out.println(filenowname+"----filenowname");
        }

        try {
            String path = "D:/roots/" + filenowname;
            System.out.println(path);
            File newFile=new File(path);
            uploadFile.transferTo(newFile);
        } catch (Exception e) {

        }

        Map<String, Object> map = new HashMap<>();
        map.put("success","success");
        return map;
    }
}





