package com.sy.mapper.ztw;

import com.sy.model.common.User;
import com.sy.model.common.UserAccountLog;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.SearchActivationZtw;

import java.util.List;

public interface ActivationMapper {
    int selectCount();
    List<User> selectAllU();
    List<OrderInfoZtw> selectAllO();
    int updateBalance(UserAccountLog userAccountLog);
    List<User> selectBySearchU(SearchActivationZtw searchActivationZtw);
    List<OrderInfoZtw> selectBySearchO(SearchActivationZtw searchActivationZtw);
    //更改注册会员其他，为会员
    void updateVip(int userId);
    //获取购货管理的orderInfo数据
    List<OrderInfoZtw> selectAll();
    //激活时将state的状态变成1
    void updateState(int userid);
}
