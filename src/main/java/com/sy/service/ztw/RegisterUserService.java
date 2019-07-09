package com.sy.service.ztw;

import com.sy.model.common.User;

public interface RegisterUserService {
    User judgeExistLoginName(String loginName);
}
