package com.sy.service.fxc;

import com.sy.mapper.fxc.UserBuyBonusFxcMapper;
import com.sy.model.fxc.UserBuyBonusFxc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class UserBuyBonusFxcServiceImpl implements UserBuyBonusFxcService {
    @Autowired
    UserBuyBonusFxcMapper mapper;

    @Override
    public List<UserBuyBonusFxc> searchUserBuyBonusByUserId(int i) {
        List<UserBuyBonusFxc> list =mapper.searchUserBuyBonusByUserId(i);

        return list;
    }

    @Override
    public List<UserBuyBonusFxc> searchUserBuyBonusMonthByUserId(int i) {
        return mapper.searchUserBuyBonusMonthByUserId(i);
    }
}
