package com.sy.mapper.dc;

import com.sy.model.dc.Reply;

import java.util.List;

public interface ReplyMapper {
    //查询回复
    List<Reply> getReplyall(Integer id)throws Exception;

    //新增回复
    void insertreply(Reply reply)throws Exception;

    //删除回复
    void deleteReply(Reply reply)throws Exception;
}
