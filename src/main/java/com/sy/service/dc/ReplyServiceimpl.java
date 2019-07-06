package com.sy.service.dc;

import com.sy.mapper.dc.ReplyMapper;
import com.sy.model.dc.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ReplyServiceimpl implements ReplyService {
    @Autowired
    private ReplyMapper mapper;
//    查询回复
    @Override
    public List<Reply> getreplyall(Integer id) throws Exception {
        List<Reply> list = mapper.getReplyall(id);
        return list;
    }
//新增回复
@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void savereply(Reply reply) throws Exception {
        mapper.insertreply(reply);
    }
//删除回复
    @Override
    public void deletereply(Reply reply) throws Exception {
        mapper.deleteReply(reply);
    }
}
