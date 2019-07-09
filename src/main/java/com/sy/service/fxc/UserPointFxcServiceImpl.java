package com.sy.service.fxc;

import com.sy.mapper.fxc.UserPointFxcMapper;
import com.sy.model.fxc.UserPointFxc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class UserPointFxcServiceImpl implements UserPointFxcService {
    @Autowired
    UserPointFxcMapper mapper;

    @Override
    public List<UserPointFxc> serachUserPointByUserId(int i) {
        return mapper.serachUserPointByUserId(i);
    }
}
