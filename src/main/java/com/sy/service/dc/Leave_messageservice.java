package com.sy.service.dc;

import com.sy.model.dc.Leave_message;

import java.util.List;

public interface Leave_messageservice {
//    查询所有留言
    List<Leave_message> selectall(int firstResult, int maxResults)throws Exception;

//    新增留言
    void saveLeave_messageservice(Leave_message leave_message)throws Exception;

    //查询指定id的留言
    Leave_message selectone(Integer id)throws Exception;

//    更改留言回复状态
    void updatestate(Integer id)throws Exception;

//    删除留言
    void deleteLeave_messageservice(Integer id)throws Exception;
}
