package com.sy.mapper.ztw;

import com.sy.model.common.GoodsPack;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.OrderListZtw;

import java.util.List;

public interface RePurchaseMapper {
    /**
     *
     * @return
     * @throws Exception
     */
    List<GoodsPack> getGoodsPackAll(GoodsPack goodsPack)throws Exception;

    /**
     * 根据id获得对应的商品信息
     * @param _parameter
     * @return
     * @throws Exception
     */
    GoodsPack selectByGoodsId(Integer _parameter) throws Exception;

    void insertAddGoods(OrderListZtw orderListZtw);

    List<OrderListZtw> selectAllByUserId(Integer userId);

    void delByListId(String _parameter)throws Exception;

    void updateNum(OrderListZtw orderListZtw)throws Exception;


    //支付
    //删除对应id的购物车
    void delByBuyId(Integer id)throws Exception;
    //添加对应的购货信息
    void InsertOrderInformation(OrderInfoZtw orderInfoZtw)throws Exception;


}
