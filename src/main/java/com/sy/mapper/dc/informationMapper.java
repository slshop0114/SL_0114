package com.sy.mapper.dc;

import com.sy.model.dc.Information;

import java.util.List;

public interface informationMapper {
////    新增资讯
    void insertinformation(Information information)throws Exception;
////    修改资讯
    void updateinformation(Information information)throws Exception;
//    删除资讯
    void deleteinformation(int id)throws Exception;
////    查询所有的资讯
    List<Information> selectInformation()throws Exception;
////    修改发布状态
    void updateInformationstate(Information information)throws Exception;

//    查询状态为发布的资讯信息
    List<Information> selectInformationstate()throws Exception;

//    查询指定id的资讯详情
    Information getinformationid(Information information)throws Exception;


//    下载次数加1
    void xiazai(Integer id)throws Exception;
}
