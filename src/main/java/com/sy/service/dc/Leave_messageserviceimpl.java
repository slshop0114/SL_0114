package com.sy.service.dc;

import com.github.pagehelper.PageHelper;
import com.sy.mapper.dc.Leave_messageMapper;
import com.sy.model.dc.Leave_message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class Leave_messageserviceimpl implements Leave_messageservice {
    @Autowired
    private Leave_messageMapper mapper;
//    查询所有留言
    @Override
    public List<Leave_message> selectall(int firstResult, int maxResults) throws Exception {
        PageHelper.startPage(firstResult,maxResults);
        List<Leave_message> list = mapper.getLeavemessageall();
        return list;

    }

//    新增留言
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void saveLeave_messageservice(Leave_message leave_message) throws Exception {
        mapper.insertLeave_messageMapper(leave_message);
    }
//查询指定id留言
    @Override
    public Leave_message selectone(Integer id) throws Exception {
        Leave_message leaveMessage = mapper.getLeave_messageid(id);
        return leaveMessage;
    }
//    更改留言回复状态
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void updatestate(Integer id) throws Exception {
        mapper.updatestate(id);
    }
//    删除留言
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void deleteLeave_messageservice(Integer id) throws Exception {
        mapper.deleteLeave_message(id);
    }
}
