package com.sy.mapper.hyc;

import com.sy.model.hyc.UserCash;

import java.util.Date;
import java.util.List;

public interface UuserCashMapper {
    //查询提现明细
    public List<UserCash> selectBy(Integer userid, Date date1, Date date2);
    //申请提现，增加提现记录；
    public int addCash(UserCash userCash);
}