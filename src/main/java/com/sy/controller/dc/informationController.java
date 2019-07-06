package com.sy.controller.dc;

import com.sy.model.dc.Information;
import com.sy.service.dc.informationservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
    public class informationController {
    @Autowired
        private informationservice service;
    //进入资讯
    @RequestMapping("/informanage/information.html")
    public String goinformation(){
        return "dc/Information";
    }

//资讯下载页面
    @RequestMapping("/informanage/downloadcenter.html")
    public String godownload(){
    return "dc/download";
    }

//查看所有资讯
    @RequestMapping("/selectall")
    @ResponseBody
    public List<Information> selectall (Integer firstResult, Integer maxResults)throws Exception{
    List<Information> list = service.selectInformation(firstResult,maxResults);
    return list;
    }
//查询所有状态为发布的资讯
@RequestMapping("/selectstateall")
@ResponseBody
public List<Information> selectstateall(Integer firstResult, Integer maxResults)throws Exception{
    List<Information> list = service.selectInformationstate(firstResult,maxResults);
    return list;
}

//新增资讯
    @RequestMapping("/informanage/addInformation.html")
    @ResponseBody
    public void saveinformation(Information information) throws Exception {
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    Date date=df.parse(df.format(new Date()));//转换当前时间格式
    information.setUploadTime(date);//设置当前时间为发布时间
    information.setPublishTime(date);
    service.saveInformation(information);
    }


    //    上传
    @RequestMapping("/upinformanage")
    @ResponseBody
    public Map<String, Object> uploadUrl(MultipartFile uploadFile) {
        System.out.println("fasdfasdfasdfsdf");
        Map<String, Object> map = new HashMap<>();
        //1.保存图片到本地
        String fileoriname = null;//原名称
        String filenowname = null;//系统生成的名称
        if (uploadFile != null) {
            fileoriname = uploadFile.getOriginalFilename();//获取原名字
            System.out.println(fileoriname + "----fileoriname文件原名字");
            String uuid = UUID.randomUUID().toString().replace("-", "");
            //获得扩展名
            String suffix = fileoriname.substring(fileoriname.lastIndexOf(".") + 1);
            filenowname = uuid + "." + suffix;//UUID生成新的唯一名字+文件扩展名
            System.out.println(filenowname + "----filenowname新的唯一名字+文件扩展名");
        }

        try {
            String path = "D:/baidupan/" + filenowname;
            File newFile = new File(path);
            uploadFile.transferTo(newFile);
            map.put("file", newFile);//路径
            map.put("filename",fileoriname);//文件名
            map.put("filesize",uploadFile.getSize());//文件大小
        } catch (Exception e) {

        }
        return map;
    }

//更新状态
    @RequestMapping("/informanage/modifyInfoState.html")
    @ResponseBody
    public void updatestate(Integer id,Integer state) throws Exception{
        Information information=new Information();
        information.setId(id);
        information.setState(state);
        service.updatestate(information);
    }

    //删除资讯
    @ResponseBody
    @RequestMapping("/informanage/delInfo.html")
    public void removeinfo(Integer id) throws Exception{
        service.removeinformation(id);
    }

//    根据id查询资讯详情
    @RequestMapping("/informanagegetid")
    @ResponseBody
    public Information getinformanageid(Integer id)throws Exception{
        Information information=new Information();
        information.setId(id);
        Information information1 = service.getInformationstateid(information);
        return information1;
    }

    //修改资讯
    @RequestMapping("/informanage/modifyinformation.html")
    @ResponseBody
    public  void updateinf(Information information, Integer id)throws Exception{
        if (information.getFileName()==""){
            information.setFileName(null);
        }
        if (information.getFilePath()==""){
            information.setFilePath(null);
        }


        information.setId(id);
        System.out.println(information+"==================");
        service.updateInformation(information);
    }

}



