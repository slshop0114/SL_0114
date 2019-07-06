package com.sy.service.dc;

import com.github.pagehelper.PageHelper;
import com.sy.mapper.dc.AfficheMapper;
import com.sy.model.dc.Affiche;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class Afficheserviceimpl implements Afficheservice {
    @Autowired
    private AfficheMapper mapper;
    //    查询所有有效期内的公告
    @Override
    public List<Affiche> getafficelist(int firstResult, int maxResults) throws Exception {
        PageHelper.startPage(firstResult,maxResults);
        List<Affiche> list = mapper.getafficelist();
        return list;
    }

//    新增公告
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void addaffice(Affiche affiche) throws Exception {
        mapper.insertaffice(affiche);
    }

//    修改公告
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void updateaffice(Affiche affiche) throws Exception {
        mapper.updateaffice(affiche);
    }


//删除公告
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public void deleteaffiche(int id) throws Exception {
        mapper.delectafficeid(id);
    }
//查询详细栏目
    @Override
    public Affiche getaffichexiangxi(int id) throws Exception {
        Affiche affiche = mapper.getaffichexx(id);
        return affiche;
    }
}
