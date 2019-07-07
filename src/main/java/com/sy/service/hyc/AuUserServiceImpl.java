package com.sy.service.hyc;

import com.sy.mapper.hyc.AuUserMapper;
import com.sy.model.hyc.AuUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class AuUserServiceImpl implements AuUserService {

    @Autowired
    private AuUserMapper mapper;

    @Override
    public List<AuUser> getBank(Integer id) throws Exception {
        return mapper.selectBank(id);
    }
}
