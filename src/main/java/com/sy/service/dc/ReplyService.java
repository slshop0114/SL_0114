package com.sy.service.dc;

import com.sy.model.dc.Reply;

import java.util.List;

public interface ReplyService {
//    查询回复
    List<Reply> getreplyall(Integer id)throws Exception;

//    新增回复
    void savereply(Reply reply)throws Exception;

//    删除回复
    void deletereply(Reply reply)throws Exception;
}
