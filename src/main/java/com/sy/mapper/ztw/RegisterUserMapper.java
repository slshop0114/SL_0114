package com.sy.mapper.ztw;


import com.sy.model.common.User;

public interface RegisterUserMapper {
    User exsitLoginCode(String loginCode);
}
