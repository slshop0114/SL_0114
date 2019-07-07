package com.sy.service.hyc;

import com.sy.mapper.hyc.Leave_messageMapperhyc;
import com.sy.model.hyc.Leave_messagehyc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class Leave_messageServiceImpl implements Leave_messageService {

    @Autowired
    private Leave_messageMapperhyc mapper;

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int addLeave_message(Leave_messagehyc leave_messagehyc) throws Exception {
        return mapper.addLeave_Message(leave_messagehyc) ;
    }
}
