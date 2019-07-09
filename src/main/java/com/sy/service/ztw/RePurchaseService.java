package com.sy.service.ztw;

import com.sy.model.common.GoodsPack;
import com.sy.model.ztw.OrderInfoZtw;
import com.sy.model.ztw.OrderListZtw;

import java.util.List;

public interface RePurchaseService {
    /**
     *
     * @return
     * @throws Exception
     */
    List<GoodsPack> findGoodsPack(GoodsPack goodsPack, Integer pagestar)throws Exception;

    GoodsPack findByGoodsId(int _parameter)throws  Exception;

    void insertToCart(OrderListZtw orderListZtw)throws Exception;

    List<OrderListZtw> findAllByUserId(Integer userId)throws Exception;

    void deleteByListId(String _parameter)throws Exception;

    void changeNum(OrderListZtw orderListZtw)throws Exception;

    void deleteByBuyId(Integer id) throws Exception;
    void saveOrderInfomation(OrderInfoZtw orderInfoZtw)throws Exception;


}
