package com.sy.service.hyc;

import com.github.pagehelper.PageHelper;
import com.sy.mapper.hyc.UuserCashMapper;
import com.sy.model.hyc.UserCash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class UserCashServiceImpl implements UserCashService {

    @Autowired
    private UuserCashMapper mapper;

    @Override
    public List<UserCash> getDetailList(Integer userid, Date date1, Date date2, int firstResult, int maxResults) throws Exception {
        PageHelper.startPage(firstResult,maxResults);
        return mapper.selectBy(userid,date1,date2);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int addCash(UserCash userCash) throws Exception {
        return mapper.addCash(userCash);
    }
}
