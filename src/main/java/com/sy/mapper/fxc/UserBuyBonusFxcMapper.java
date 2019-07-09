package com.sy.mapper.fxc;

import com.sy.model.fxc.UserBuyBonusFxc;

import java.util.List;

public interface UserBuyBonusFxcMapper {
    public  List<UserBuyBonusFxc> searchUserBuyBonusByUserId(int i);
    public  List<UserBuyBonusFxc> searchUserBuyBonusMonthByUserId(int i);
}
