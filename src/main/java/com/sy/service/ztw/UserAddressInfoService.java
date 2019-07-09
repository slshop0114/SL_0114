package com.sy.service.ztw;


import com.sy.model.common.User;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.UserPointZtw;


//ConsumptionMapper
public interface UserAddressInfoService {

    User findAddressInfo(String username);
    int saveAddressInfo(OrderInfoZtw orderInfoZtw);
    double findbalance(int userid);

    void saveUserPoint(UserPointZtw userPointZtw)throws Exception;

}
