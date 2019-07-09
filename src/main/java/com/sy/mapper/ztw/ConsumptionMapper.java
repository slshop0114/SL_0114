package com.sy.mapper.ztw;

import com.sy.model.common.User;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.UserPointZtw;

public interface ConsumptionMapper {
    User getAddressInfo(String username);
    int insertOrderInfo(OrderInfoZtw orderInfoZtw);
    double getBalance(int userid);
    //推荐用户得到奖金
    void insertUserPoint(UserPointZtw userPointZtw);
}
