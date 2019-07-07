package com.sy.mapper.hyc;

import com.sy.model.hyc.UserAccountLog201404;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface UserAccountLog201404Mapper {
    //基本账户查询
    public List<UserAccountLog201404> selectBase(Integer userid, Date date1, Date date2);
    //消费账户查询
    public List<UserAccountLog201404> selectRepeat(Integer userid, Date date1, Date date2);
    //基本账户充值,内部转账
    public int addMoneyForBase(UserAccountLog201404 userAccountLog201404);
    //消费账户充值
    public int addMoneyForRepeat(UserAccountLog201404 userAccountLog201404);
   /* //更新进账余额
    public int modifyInBalance(BigDecimal basebalance, Integer userid);
    //更新出账余额
    public int modifyOutBalance(BigDecimal basebalance, Integer userid);*/
    //查询基本账户余额
    public BigDecimal selectBaseBalance(Integer userid);
    //查询消费账户余额
    public BigDecimal selectRepeatBalance(Integer userid);


}