package com.sy.service.ztw;

import com.sy.mapper.ztw.ActivationMapper;
import com.sy.model.common.User;
import com.sy.model.common.UserAccountLog;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.SearchActivationZtw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ActivationServiceImpl implements ActivationService {
    @Autowired
    private ActivationMapper mapper;
    @Override
    @Transactional(readOnly = true)
    public int findCount() {
        int i =mapper.selectCount();
        return i;
    }

    @Override
    @Transactional(readOnly = true)
    public List<User> findAllU() {
        List list = mapper.selectAllU();
        return list;
    }

    @Override
    @Transactional(readOnly = true)
    public List<OrderInfoZtw> findAllO() {
        List list1 = mapper.selectAllO();
        return list1;
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public void saveUpdateBalance(UserAccountLog userAccountLog) {
        mapper.updateBalance(userAccountLog);
    }

    @Override
    @Transactional(readOnly = true)
    public List<User> findBySearchU(SearchActivationZtw searchActivationZtw) {
        return mapper.selectBySearchU(searchActivationZtw);

    }

    @Override
    @Transactional(readOnly = true)
    public List<OrderInfoZtw> findBySearchO(SearchActivationZtw searchActivationZtw) {
        return mapper.selectBySearchO(searchActivationZtw);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public void changeVip(int userId) {
        mapper.updateVip(userId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<OrderInfoZtw> findAll() {
        List list1 = mapper.selectAll();
        return list1;
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public void updateStat(int userid) {
        mapper.updateState(userid);
    }

}
