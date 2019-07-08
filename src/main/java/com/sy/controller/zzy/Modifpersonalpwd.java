package com.sy.controller.zzy;

import com.sy.model.common.ResponseData;
import com.sy.model.common.User;
import com.sy.service.zzy.DataDictionaryzzyService;
import com.sy.service.zzy.MenuzzyService;
import com.sy.service.zzy.UserzzyService;
import com.sy.tools.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class Modifpersonalpwd {

    @Autowired
    private UserzzyService userService;
    @Autowired
    private MenuzzyService menuService;
    @Autowired
    private DataDictionaryzzyService dataDictionaryService;



    @RequestMapping("/member/modifypersonalpwd.html")
    public String toModifypersonalpwd() {

        return "zzy/modifypersonalpwd";

    }

    
    @RequestMapping("/member/modifyPwd.html")
    @ResponseBody
    public ResponseData modifyPwd (User user, HttpSession session, String password) throws Exception {
        System.out.println("modifyPwdmodifyPwdmodifyPwdmodifyPwd");
        user.setId(((User) session.getAttribute(Constants.SESSION_USER)).getId());
      
        ResponseData responseData = new ResponseData();
        
        if(user!=null){
            responseData.setCode(200);
            responseData.setMessage("OK");
            userService.modifyPwd(user);
        }else if(password!=((User) session.getAttribute(Constants.SESSION_USER)).getPassword()){

            responseData.setCode(400);

        }else {
            responseData.setCode(500);
        }

        System.out.println(responseData);
        return responseData;
    }



    @RequestMapping("/member/savesecondpwd.html")
    @ResponseBody
    public ResponseData savesecondpwd (User user, HttpSession session, String password2) throws Exception {
        
        user.setId(((User) session.getAttribute(Constants.SESSION_USER)).getId());

        ResponseData responseData = new ResponseData();

        if(user!=null){
            responseData.setCode(200);
            responseData.setMessage("OK");
            userService.savesecondpwd(user);
        }else if(password2!=((User) session.getAttribute(Constants.SESSION_USER)).getPassword2()){

            responseData.setCode(400);

        }else {
            responseData.setCode(500);
        }

        System.out.println(responseData);
        return responseData;
    }




}
