package com.sy.service.fxc;

import com.sy.model.fxc.UserBuyBonusFxc;

import java.util.List;

public interface UserBuyBonusFxcService {
    List<UserBuyBonusFxc> searchUserBuyBonusByUserId(int i);
    List<UserBuyBonusFxc> searchUserBuyBonusMonthByUserId(int i);
}
