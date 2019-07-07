package com.sy.service.hyc;

import com.sy.mapper.hyc.UserRechargeMapperhyc;
import com.sy.model.hyc.UserRechargehyc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class UserRechargeServiceImpl implements UserRechargeService {

    @Autowired
    private UserRechargeMapperhyc mapper;

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int addMoney(UserRechargehyc userRechargehyc) throws Exception {
        return mapper.addMoney(userRechargehyc);
    }
}
