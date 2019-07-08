package com.sy.controller.dc;

import com.sy.model.dc.Affiche;
import com.sy.service.dc.Afficheservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class AfficheController {
    @Autowired
    private Afficheservice afficheservice;
//公告管理业
    @RequestMapping("/informanage/affiche.html")
    public String goaffiche () throws Exception{
        return "dc/Announcements";
    }

//    获取有效期内的公告  分页展示
    @RequestMapping("/afficheselect.html")
    @ResponseBody
    public List<Affiche> getafficheselect (Integer firstResult, Integer maxResults) throws Exception{
        List<Affiche> list = afficheservice.getafficelist(firstResult,maxResults);
        System.out.println(list);
        return list;
    }

    //    新增公告公告
    @RequestMapping("/addaffiche.html")
         public String addaffiche(Affiche affiche , String username)throws Exception{
        System.out.println("afficheafficheafficheaffiche");
        System.out.println(affiche);
        affiche.setPublisher(username);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date date=df.parse(df.format(new Date()));//转换当前时间格式
        affiche.setPublishTime(date);// new Date()为获取当前系统时间
        System.out.println(affiche);
        if(affiche.getTitle()!=null&&affiche.getTitle()!=""&& affiche.getContent()!=null&&affiche.getContent()!=""){
            afficheservice.addaffice(affiche);
        }

        return "dc/Announcements";
    }
//修改公告
    @RequestMapping("/updateaffiche.html")
    @ResponseBody
    public void updateaffice(Affiche affiche, int id) throws Exception{
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date date=df.parse(df.format(new Date()));//转换当前时间格式
        affiche.setPublishTime(date);// new Date()为获取当前系统时间
        affiche.setId(id);
        afficheservice.updateaffice(affiche);
    }
//修改前渲染表单
    @RequestMapping("/getaffichexiangxi.html")
    @ResponseBody
    public Affiche getaffichexiangxiye(Integer id, Affiche affiche)throws Exception{
        Affiche affiche1 = afficheservice.getaffichexiangxi(id);

        return affiche1;
    }


//    删除公告
    @RequestMapping("/deleteaffiche")
    public void removeaffiche(Integer id) throws Exception{
        afficheservice.deleteaffiche(id);
    }

//获取  详细栏目
    @RequestMapping("/getaffichexiangxi")
    public String getaffichexiangxi(Integer id, Model model)throws Exception{
        Affiche affiche = afficheservice.getaffichexiangxi(id);
        model.addAttribute("affiche",affiche);
        return "dc/Announcementsxqy";
    }
}
