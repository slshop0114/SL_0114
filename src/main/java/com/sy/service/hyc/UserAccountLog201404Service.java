package com.sy.service.hyc;

import com.sy.model.hyc.UserAccountLog201404;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface UserAccountLog201404Service {

    public List<UserAccountLog201404> getBaseList(Integer userid, Date date1, Date date2, int firstResult, int maxResults) throws Exception;
    public List<UserAccountLog201404> getRepeatList(Integer userid, Date date1, Date date2, int firstResult, int maxResults) throws Exception;

    //汇款充值
    //基本账户
    public int addMoneyForBase(UserAccountLog201404 userAccountLog201404) throws Exception;
    //消费账户
    public int addMoneyForRepeat(UserAccountLog201404 userAccountLog201404) throws Exception;
    /*//更新进账余额
    public int modifyInBalance(BigDecimal basebalance, Integer userid) throws Exception;
    //更新出账余额
    public int modifyOutBalance(BigDecimal basebalance, Integer userid) throws Exception;*/
    //查询基本账户余额
    public BigDecimal getBaseBalance(Integer userid) throws Exception;
    //查询消费账户余额
    public BigDecimal getRepeatBalance(Integer userid) throws Exception;
}
