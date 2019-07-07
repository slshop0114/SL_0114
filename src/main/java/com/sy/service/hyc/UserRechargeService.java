package com.sy.service.hyc;

import com.sy.model.hyc.UserRechargehyc;

public interface UserRechargeService {
    //汇款充值
    public int addMoney(UserRechargehyc userRechargehyc) throws Exception;
}
