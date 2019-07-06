package com.sy.service.dc;

import com.sy.model.dc.Affiche;

import java.util.List;

public interface Afficheservice {
    //    查询所有有效期内的公告
    List<Affiche> getafficelist(int firstResult, int maxResults) throws Exception;

    //新增公告
    void addaffice(Affiche affiche)throws Exception;

//    修改公告
    void updateaffice(Affiche affiche)throws Exception;


//    删除公告
    void deleteaffiche(int id)throws Exception;


//    查询详细栏目
    Affiche getaffichexiangxi(int id)throws Exception;
}
