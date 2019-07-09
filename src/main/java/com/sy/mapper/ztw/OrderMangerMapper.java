package com.sy.mapper.ztw;

import com.sy.model.common.User;
import com.sy.model.ztw.OrderInfoZtw;

import java.util.List;

public interface OrderMangerMapper {
    List<OrderInfoZtw> getByOrdersn(String ordersn, String quiz1);
    List<User> getByLoginCode(String _parameter);
    void doDel(String _parameter);
}
