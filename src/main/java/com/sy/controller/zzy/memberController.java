package com.sy.controller.zzy;


import com.sy.model.common.ResponseData;
import com.sy.model.common.User;
import com.sy.service.zzy.DataDictionaryzzyService;
import com.sy.service.zzy.MenuzzyService;
import com.sy.service.zzy.UserzzyService;
import com.sy.tools.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class memberController {


    @Autowired
    private UserzzyService userService;
    @Autowired
    private MenuzzyService menuService;
    @Autowired
    private DataDictionaryzzyService dataDictionaryService;

   

    @RequestMapping("/member/memberlist.html")
    public String toMemberlist() {

        return "zzy/memberlist";

    }
    @RequestMapping("/member/getlist.html")
    @ResponseBody
    public ResponseData doList (User user, final Integer starNum, final Integer pageSize, HttpSession session) throws Exception {
        user.setId(((User) session.getAttribute(Constants.SESSION_USER)).getId());

        ResponseData responseData = new ResponseData();
        responseData.setCode(200);
        responseData.setMessage("OK");
        List<User> list = userService.getUserList(user,starNum,pageSize);
        if (list.size()==0){
            responseData.setCode(400);
        }
        System.out.println("444444444");

        Map<String,Object> map=new HashMap<>();
        map.put("list",list);
        responseData.setData(map);
        System.out.println(map+"111");
        return responseData;
    }

    @RequestMapping("/member/finduser.html")
    @ResponseBody
    public Object getUser(User user, HttpSession session) throws Exception {
       
        System.out.println("141411"+user);
        User user1 =new User();
        try {
            user1=userService.getUserById(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("141422"+user1);
        return user1;
      
      
      
        }
    

    @RequestMapping("/member/delet.html")
    @ResponseBody
    public ResponseData doDelet (User user) throws Exception {
        System.out.println(user);
        System.out.println("555"+user.getId());
        ResponseData responseData = new ResponseData();
        
        System.out.println(user.getUserType()+"+5555");
        String str = user.getUserType() ;
     
        if(Integer.valueOf(str)<=2){ 
            responseData.setCode(200);
            responseData.setMessage("OK");
            userService.deleteUser(user);
        }else if(Integer.valueOf(str) > 2){
            
           responseData.setCode(400);
           
       }

        System.out.println(responseData);
        return responseData;
    }


    @RequestMapping("/member/loadUserType.html")
    public String getUserBySearch(User user, Model model){
        try {

            List<User> userList=userService.getUserListBySearch(user);
            model.addAttribute("list",userList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "zzy/memberlist";
    }

    /*修改会员资料*/
    @RequestMapping("/member/saveMember.html")
    public String saveMember (User user, HttpSession session, String password) throws Exception {
        System.out.println("111111");
        
        System.out.println(user.getId()+"wwww");
        userService.modifyUser(user);

        System.out.println(user+"zzzzz");
        return "zzy/memberlist";

    }


    @RequestMapping("/member/upload.html")
    @ResponseBody
    public Map<String, Object> upload1(MultipartFile uploadFile) {

        System.out.println("111111----uplode");
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


}
