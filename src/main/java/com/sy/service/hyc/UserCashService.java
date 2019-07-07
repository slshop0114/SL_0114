package com.sy.service.hyc;

import com.sy.model.hyc.UserCash;

import java.util.Date;
import java.util.List;

public interface UserCashService {
    //查询提现明细
    public List<UserCash> getDetailList(Integer userid, Date date1, Date date2, int firstResult, int maxResults) throws Exception;
    //申请提现
    public int addCash(UserCash userCash) throws Exception;
}
