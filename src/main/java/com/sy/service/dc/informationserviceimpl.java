package com.sy.service.dc;

import com.github.pagehelper.PageHelper;
import com.sy.mapper.dc.informationMapper;
import com.sy.model.dc.Information;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class informationserviceimpl implements informationservice {
    @Autowired
    private informationMapper mapper;
//    查询所有资讯
    @Override
    public List<Information> selectInformation(Integer firstResult, Integer maxResults) throws Exception {

        PageHelper.startPage(firstResult,maxResults);
        List<Information> list = mapper.selectInformation();
        return list;
    }
//    新增资讯
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void saveInformation(Information information) throws Exception {
        mapper.insertinformation(information);
    }
//  修改资讯状态
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void updatestate(Information information) throws Exception {
        mapper.updateInformationstate(information);
    }
//    删除资讯
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void removeinformation(Integer id) throws Exception {
        mapper.deleteinformation(id);
    }
//查询发布状态为发布的的所有资讯
    @Override
    public List<Information> selectInformationstate(Integer firstResult, Integer maxResults) throws Exception {
        PageHelper.startPage(firstResult,maxResults);
        List<Information> list = mapper.selectInformationstate();
        return list;
    }

    @Override
    public Information getInformationstateid(Information information) throws Exception {
        Information information1 = mapper.getinformationid(information);
        return information1;
    }
//    修改资讯
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void updateInformation(Information information) throws Exception {
        mapper.updateinformation(information);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void updatedownload(Integer id) throws Exception {
        mapper.xiazai(id);
    }
}
