package com.sy.service.hyc;

import com.github.pagehelper.PageHelper;
import com.sy.mapper.hyc.UserAccountLog201404Mapper;
import com.sy.model.hyc.UserAccountLog201404;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class UserAccountLog201404ServiceImpl implements UserAccountLog201404Service {

    @Autowired
    private UserAccountLog201404Mapper mapper;

    @Override
    public List<UserAccountLog201404> getBaseList(Integer userid, Date date1, Date date2, int firstResult, int maxResults) throws Exception {
        PageHelper.startPage(firstResult,maxResults);
        return mapper.selectBase(userid,date1,date2);
    }

    @Override
    public List<UserAccountLog201404> getRepeatList(Integer userid, Date date1, Date date2, int firstResult, int maxResults) throws Exception {
        PageHelper.startPage(firstResult,maxResults);
        return mapper.selectRepeat(userid,date1,date2);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int addMoneyForBase(UserAccountLog201404 userAccountLog201404) throws Exception {
        return mapper.addMoneyForBase(userAccountLog201404);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int addMoneyForRepeat(UserAccountLog201404 userAccountLog201404) throws Exception {
        return mapper.addMoneyForRepeat(userAccountLog201404);
    }

    @Override
    public BigDecimal getRepeatBalance(Integer userid) throws Exception {
        return mapper.selectRepeatBalance(userid);
    }

    @Override
    public BigDecimal getBaseBalance(Integer userid) throws Exception {
        return mapper.selectBaseBalance(userid);
    }

   /* @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int modifyInBalance(BigDecimal basebalance, Integer userid) throws Exception {
        return mapper.modifyInBalance(basebalance,userid);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int modifyOutBalance(BigDecimal basebalance, Integer userid) throws Exception {
        return mapper.modifyOutBalance(basebalance,userid);
    }*/
}
