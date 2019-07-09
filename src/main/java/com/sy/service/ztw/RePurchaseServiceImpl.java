package com.sy.service.ztw;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sy.mapper.ztw.RePurchaseMapper;
import com.sy.model.common.GoodsPack;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.OrderListZtw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RePurchaseServiceImpl implements RePurchaseService {
    @Autowired
    private RePurchaseMapper mapper;
    @Override
    @Transactional(readOnly = true)
    public List<GoodsPack> findGoodsPack(GoodsPack goodsPack, Integer pagestar) throws Exception {
        Page page = PageHelper.startPage(pagestar,3);
        List<GoodsPack> list = mapper.getGoodsPackAll(goodsPack);
        return list;
    }

    @Override
    @Transactional(readOnly = true)
    public GoodsPack findByGoodsId(int _parameter) throws Exception {
        GoodsPack goodsPack = mapper.selectByGoodsId(_parameter);
        return goodsPack;
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public void insertToCart(OrderListZtw orderListZtw) throws Exception {
        mapper.insertAddGoods(orderListZtw);
    }

    @Override
    @Transactional(readOnly = true)
    public List<OrderListZtw> findAllByUserId(Integer userId) throws Exception {
        List<OrderListZtw> list =mapper.selectAllByUserId(userId);
        return list;
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public void deleteByListId(String _parameter) throws Exception {
        mapper.delByListId(_parameter);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public void changeNum(OrderListZtw orderListZtw) throws Exception {
        mapper.updateNum(orderListZtw);
    }

    @Override
    @Transactional(isolation =Isolation.DEFAULT ,propagation = Propagation.REQUIRED)
    public void deleteByBuyId(Integer id) throws Exception {
        mapper.delByBuyId(id);
    }

    @Override
    @Transactional(isolation =Isolation.DEFAULT ,propagation = Propagation.REQUIRED)
    public void saveOrderInfomation(OrderInfoZtw orderInfoZtw) throws Exception {
        mapper.InsertOrderInformation(orderInfoZtw);
    }
}
