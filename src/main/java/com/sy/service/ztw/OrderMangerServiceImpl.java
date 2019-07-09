package com.sy.service.ztw;

import com.sy.mapper.ztw.OrderMangerMapper;
import com.sy.model.common.User;
import com.sy.model.ztw.OrderInfoZtw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderMangerServiceImpl implements OrderMangerService {
    @Autowired
    private OrderMangerMapper mangerMapper;
    @Override
    @Transactional(readOnly = true)
    public List<OrderInfoZtw> findByOrdersn(String ordersn, String quiz1) {
        return mangerMapper.getByOrdersn(ordersn,quiz1);
    }

    @Override
    public List<User> findByLoginCode(String _parameter) {
        return mangerMapper.getByLoginCode(_parameter);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public void doDelete(String _parameter) {
        mangerMapper.doDel(_parameter);
    }
}
