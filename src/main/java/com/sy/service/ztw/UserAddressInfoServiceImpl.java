package com.sy.service.ztw;

import com.sy.mapper.ztw.ConsumptionMapper;
import com.sy.model.common.User;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.UserPointZtw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserAddressInfoServiceImpl implements UserAddressInfoService {

    @Autowired
    private ConsumptionMapper mapper;
    @Override
    @Transactional(readOnly = true)
    public User findAddressInfo(String username) {
        User user = mapper.getAddressInfo(username);
        return user;
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int saveAddressInfo(OrderInfoZtw orderInfoZtw) {
        return mapper.insertOrderInfo(orderInfoZtw);
    }

    @Override
    @Transactional(readOnly = true)
    public double findbalance(int userid) {
        double balance = mapper.getBalance(userid);
        return balance;
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public void saveUserPoint(UserPointZtw userPointZtw) throws Exception {
        mapper.insertUserPoint(userPointZtw);
    }
}
