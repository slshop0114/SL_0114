package com.sy.service.ztw;

import com.sy.model.common.User;
import com.sy.model.ztw.OrderInfoZtw;

import java.util.List;

public interface OrderMangerService {
    List<OrderInfoZtw> findByOrdersn(String ordersn, String quiz1);
    List<User> findByLoginCode(String _parameter);
    void doDelete(String _parameter);

}
