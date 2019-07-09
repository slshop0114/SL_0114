package com.sy.service.ztw;

import com.sy.model.common.User;
import com.sy.model.common.UserAccountLog;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.SearchActivationZtw;

import java.util.List;

public interface ActivationService {
    int findCount();
    List<User> findAllU();
    List<OrderInfoZtw> findAllO();
    void saveUpdateBalance(UserAccountLog userAccountLog);
    List<User> findBySearchU(SearchActivationZtw searchActivationZtw);
    List<OrderInfoZtw> findBySearchO(SearchActivationZtw searchActivationZtw);
    void changeVip(int userId);
    List<OrderInfoZtw> findAll();
    void updateStat(int userid);
}
