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

import javax.servlet.http.HttpSession;

@Controller
public class modifypersonalinfoController {

    @Autowired
    private UserzzyService userService;
    @Autowired
    private MenuzzyService menuService;
    @Autowired
    private DataDictionaryzzyService dataDictionaryService;


    @RequestMapping("/member/modifypersonalinfo.html")
    public String toModifypersonalinfo() {

        return "zzy/modifypersonalinfo";

    }


/*修改本人资料*/
    @RequestMapping("/member/savepersonalinfo.html")

    public String modifypersonalinfo11 (User user, HttpSession session, String password) throws Exception {
        System.out.println("111111");

      user.setId(((User) session.getAttribute(Constants.SESSION_USER)).getId());
     
        ResponseData responseData = new ResponseData();
        
            responseData.setCode(200);
            responseData.setMessage("OK");
            userService.modifyUser(user);
       
        System.out.println(responseData);
        return "zzy/modifypersonalinfo";
        
    }


}
