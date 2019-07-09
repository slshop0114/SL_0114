package com.sy.service.ztw;

import com.sy.mapper.ztw.RegisterUserMapper;
import com.sy.model.common.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterUserServiceImpl implements RegisterUserService {
    @Autowired
    private RegisterUserMapper mapper;
    @Override
    public User judgeExistLoginName(String loginName) {
        User user =mapper.exsitLoginCode(loginName);
        return user;
    }
}
