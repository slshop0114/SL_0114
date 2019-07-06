package com.sy.service.dc;

import com.sy.model.dc.Information;

import java.util.List;

public interface informationservice {
    //查询所有资讯
    List<Information> selectInformation(Integer firstResult, Integer maxResults)throws Exception;

    //新增资讯
    void saveInformation(Information information)throws Exception;

    //修改发布状态
    void updatestate(Information information)throws Exception;

    //删除资讯
    void removeinformation(Integer id)throws Exception;



    //查询所有资讯为发布状态的
    List<Information> selectInformationstate(Integer firstResult, Integer maxResults)throws Exception;


//    查询id资讯详情
    Information getInformationstateid(Information information)throws Exception;

//    修改资讯
    void updateInformation(Information information)throws Exception;

    //下载次数+1
    void updatedownload(Integer id)throws Exception;
}

