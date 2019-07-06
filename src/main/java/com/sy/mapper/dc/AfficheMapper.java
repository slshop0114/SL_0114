package com.sy.mapper.dc;



import com.sy.model.dc.Affiche;

import java.util.List;

//公告表
public interface AfficheMapper {
//    查询所有有效期内的公告
    List<Affiche> getafficelist() throws Exception;
//新增公告
    void insertaffice(Affiche affiche)throws Exception;
//    修改公告
    void updateaffice(Affiche affiche)throws Exception;
//    删除用户
    void delectafficeid(int id)throws Exception;
    Affiche getaffichexx(int id)throws Exception;
}