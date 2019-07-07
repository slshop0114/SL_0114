package com.sy.service.hyc;

import com.sy.model.hyc.AuUser;

import java.util.List;

public interface AuUserService {

    public List<AuUser> getBank(Integer id) throws Exception;
}
