package com.sy.mapper.hyc;

import com.sy.model.hyc.Leave_messagehyc;

public interface Leave_messageMapperhyc {
    Leave_messagehyc selectByPrimaryKey(Integer id);
    //新增留言
    public int addLeave_Message(Leave_messagehyc leave_messagehyc);
}