package com.sy.controller.dc;

import com.sy.model.dc.Information;
import com.sy.service.dc.informationservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

@Controller
public class download {
    @Autowired
    private informationservice service;
    @RequestMapping("/fileDownLoad")
    public ResponseEntity<byte[]> fileDownLoad(Integer id ,HttpServletRequest request) throws Exception{
        Information information=new Information();
        information.setId(id);
        Information information1 = service.getInformationstateid(information);
        service.updatedownload(id);
        String fileName=information1.getFileName();//得到文件名
        String realPath =information1.getFilePath();//得到文件所在位置
        InputStream in=new FileInputStream(new File(realPath));//将该文件加入到输入流之中
        byte[] body=null;
        body=new byte[in.available()];// 返回下一次对此输入流调用的方法可以不受阻塞地从此输入流读取（或跳过）的估计剩余字节数
        in.read(body);//读入到输入流里面

        fileName=new String(fileName.getBytes("gbk"),"iso8859-1");//防止中文乱码
        HttpHeaders headers=new HttpHeaders();//设置响应头
        headers.add("Content-Disposition", "attachment;filename="+fileName);
        HttpStatus statusCode = HttpStatus.OK;//设置响应吗
        ResponseEntity<byte[]> response=new ResponseEntity<byte[]>(body, headers, statusCode);
        return response;

    }
}
