package com.sy.controller.dc;

import com.sy.model.dc.Leave_message;
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
public class Leave_messageController {
    @Autowired
    private Leave_messageservice leaveMessageservice;
    @Autowired
    private ReplyService replyService;
    @RequestMapping("/message/messagelist.html")
    public String gotoLeave_message(){
        return "dc/Leave_message";
    }

//查询留言及回复
    @RequestMapping("/message/getmessage.html")
    @ResponseBody
    public List<Leave_message>  getLeave_messageall(int firstResult, int maxResults) throws Exception{
        List<Leave_message> list = leaveMessageservice.selectall(firstResult,maxResults);
        for (int i=0;i<list.size();i++){
          int id=  list.get(i).getId();
             list.get(i).setReply(replyService.getreplyall(id));
        }
        return list;
    }
    //添加留言
    @RequestMapping("/message/addmessage.html")
    @ResponseBody
    public void saveLeave_messageservice(Leave_message leave_message, String username)throws Exception{
        leave_message.setCreatedBy(username);//模拟一个用户

        leave_message.setState(0);//发布留言默认未回复
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date date=df.parse(df.format(new Date()));//转换当前时间格式
        leave_message.setCreateTime(date);// 设置留言时间
        leaveMessageservice.saveLeave_messageservice(leave_message);
    }

    //查询指定id留言回复
    @RequestMapping("/message/getmessageone")
    @ResponseBody
    public Leave_message getone(Integer id)throws Exception {
        Leave_message leaveMessage = leaveMessageservice.selectone(id);
        leaveMessage.setReply(replyService.getreplyall(id));
            return leaveMessage;
    }

    //更改留言回复状态
    @RequestMapping("/updatestate")
    @ResponseBody
    public void updatestate(Integer id)throws Exception{
        leaveMessageservice.updatestate(id);
    }

//    删除留言以及回复
    @RequestMapping("/deleteLeave")
    @ResponseBody
    public void deleteall(Integer id)throws Exception{
        Reply reply=new Reply();
        reply.setMessageid(id);
        leaveMessageservice.deleteLeave_messageservice(id);
        replyService.deletereply(reply);
    }
}
