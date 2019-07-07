package com.sy.mapper.hyc;

import com.sy.model.hyc.UserRechargehyc;

public interface UserRechargeMapperhyc {

    UserRechargehyc selectByPrimaryKey(String rechargeId);

    public int addMoney(UserRechargehyc userRechargehyc) throws Exception;
}