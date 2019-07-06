package com.sy.controller.dc;

import com.sy.model.dc.Reply;
import com.sy.service.dc.Leave_messageservice;
import com.sy.service.dc.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ReplyController {
    @Autowired
    ReplyService service;
    @Autowired
    private Leave_messageservice leaveMessageservice;
    @RequestMapping("/message/reply.html")
    @ResponseBody
    public List<Reply> getreplyid(Integer id)throws Exception{
        List<Reply> list = service.getreplyall(id);

        return list;
    }

//    新增回复
    @RequestMapping("/insertreply")
    @ResponseBody
    public void insertreply(Reply reply, Integer id, String username)throws Exception{

        reply.setCreatedBy(username);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date date=df.parse(df.format(new Date()));//转换当前时间格式
        reply.setCreateTime(date);// 设置回复留言时间
        reply.setMessageid(id);
        System.out.println(reply);
        service.savereply(reply);
        leaveMessageservice.updatestate(id);
    }
}
