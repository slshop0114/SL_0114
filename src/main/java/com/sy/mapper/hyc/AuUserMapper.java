package com.sy.mapper.hyc;

import com.sy.model.hyc.AuUser;

import java.util.List;

public interface AuUserMapper {
	//查询银行开户名，卡号
	public List<AuUser> selectBank(Integer id);
}