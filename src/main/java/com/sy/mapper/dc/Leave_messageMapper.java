package com.sy.mapper.dc;

import com.sy.model.dc.Leave_message;

import java.util.List;

public interface Leave_messageMapper {
//    查询所有留言
    List<Leave_message> getLeavemessageall() throws Exception;
    //新增留言
    void insertLeave_messageMapper(Leave_message leave_message)throws Exception;
//    查询制定的留言
    Leave_message getLeave_messageid(Integer id)throws Exception;
    //更改留言回复状态
    void updatestate(Integer id)throws Exception;
//    删除留言
    void deleteLeave_message(Integer id)throws Exception;
}
