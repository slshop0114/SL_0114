package com.sy.controller.fxc;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mysql.cj.util.StringUtils;
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
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backend")
public class UserManageController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private DataDictionaryService dataDictionaryService;


    @RequestMapping("/userlist.html")
    public String userManager(Model model, HttpSession session) throws Exception {

        User user = (User) session.getAttribute(Constants.SESSION_USER);

        System.out.println(user + "userlisthtml");
        User user1 = new User();
        List<User> list = userService.getUserList(user1);
        model.addAttribute("list", list);
        DataDictionary dataDictionary = new DataDictionary();
        dataDictionary.setTypeCode("CARD_TYPE");
        List<Role> roleList = null;
        List<DataDictionary> cardTypeList = null;
        try {
            roleList = roleService.getRoleIdAndNameList();
            cardTypeList = dataDictionaryService.getDataDictionaries(dataDictionary);
        } catch (Exception e2) {
            // TODO Auto-generated catch block
            e2.printStackTrace();
        }

        if (null != user.getLoginCode())
            user.setLoginCode("%" + user.getLoginCode() + "%");
        if (null != user.getReferCode())
            user.setReferCode("%" + user.getReferCode() + "%");
        if (!StringUtils.isNullOrEmpty(user.getIsStart() + ""))
            user.setIsStart(Integer.valueOf(user.getIsStart()));
        else
            user.setIsStart(null);
        if (!StringUtils.isNullOrEmpty(user.getRoleId() + ""))
            user.setRoleId(Integer.valueOf(user.getRoleId()));
        else
            user.setRoleId(null);

        //pages
        PageSupport page = new PageSupport();

        List<User> userList = userService.getUserList(user);
        page.setItems(userList);
        model.addAttribute("page", page);
        model.addAttribute("s_loginCode", user.getLoginCode());
        model.addAttribute("s_referCode", user.getReferCode());
        model.addAttribute("s_isStart", user.getIsStart());
        model.addAttribute("s_roleId", user.getRoleId());
        model.addAttribute("roleList", roleList);
        model.addAttribute("cardTypeList", cardTypeList);


        return "backend/userlist";
    }

    @RequestMapping("/adduser.html")
    public ModelAndView addUser(HttpSession session, User addUser) {
        System.out.println(addUser + "adduser");
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
    public Object getUser(String id) {
        User user = new User();
        if (null == id || "".equals(id)) {
            return "nodata";
        } else {
            try {

                user.setId(Integer.valueOf(id));
                user = userService.getUserById(user);


            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                return "failed";
            }
            return user;
        }
    }
    @RequestMapping("/loadUserTypeList.html")
    @ResponseBody
    public Object loadUserTypeList( String roleId){
        try {
            DataDictionary dataDictionary = new DataDictionary();
            dataDictionary.setTypeCode("USER_TYPE");
            List<DataDictionary> userTypeList = dataDictionaryService.getDataDictionaries(dataDictionary);
            return userTypeList;

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
}
