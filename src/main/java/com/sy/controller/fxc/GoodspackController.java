package com.sy.controller.fxc;


import com.sy.model.common.GoodsInfo;
import com.sy.model.common.GoodsPack;
import com.sy.model.common.GoodsPackAffiliated;
import com.sy.service.fxc.GoodsInfoService;
import com.sy.service.fxc.GoodsPackAffiliatedService;
import com.sy.service.fxc.GoodsPackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@Controller
public class GoodspackController {
    @Autowired
    GoodsPackService goodsPackService;
    @Autowired
    GoodsInfoService goodsInfoService;
    @Autowired
    GoodsPackAffiliatedService goodsPackAffiliatedService;

    @RequestMapping("/backend/goodspacklist.html")
    public String goodsPackList(HttpSession session, Model model, GoodsPack goodsPack) {
        List<GoodsPack> goodsPackList = null;
        List<GoodsInfo> goodsInfoList = null;


        try {
            GoodsInfo goodsInfo = new GoodsInfo();
            goodsInfoList = goodsInfoService.getGoodsInfoList(goodsInfo,0);
            goodsPackList = goodsPackService.getGoodsPackList(goodsPack);
            model.addAttribute("goodsPackList", goodsPackList);
            model.addAttribute("goodsInfoListforpack", goodsInfoList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/backend/goodspacklist";
    }

    @RequestMapping("/backend/addgoodspack.html")
    public String addGoodsPack(Model model, HttpSession session, GoodsPack goodsPack) {
        try {
            if ("报单购货".equals(goodsPack.getTypeName())) {
                goodsPack.setTypeId(1);
            }
            if ("辅销购货".equals(goodsPack.getTypeName())) {
                goodsPack.setTypeId(3);
            }
            if ("重销购货".equals(goodsPack.getTypeName())) {
                goodsPack.setTypeId(2);
            }
            goodsPack.setNum(1);
            goodsPack.setCreateTime(new Date());
            goodsPack.setLastUpdateTime(new Date());
            for (int i = goodsPack.getGoodsInfos().size() - 1; i >= 0; i--) {
                if (goodsPack.getGoodsInfos().get(i).getId() == null) {
                    goodsPack.getGoodsInfos().remove(i);
                    continue;
                }
                GoodsPackAffiliated goodsPackAffiliated = new GoodsPackAffiliated();
                goodsPackAffiliated.setGoodsInfoId(goodsPack.getGoodsInfos().get(i).getId());
                goodsPackAffiliated.setGoodsPackId(goodsPack.getId());
                goodsPackAffiliated.setGoodsNum(goodsPack.getGoodsInfos().get(i).getNum());
                goodsPackAffiliatedService.addGoodsPackAffiliated(goodsPackAffiliated);
            }

            goodsPackService.addGoodsPack(goodsPack);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/backend/goodspacklist.html";
    }

    @RequestMapping("/backend/modifygoodspack.html")
    @ResponseBody
    public GoodsPack modifyGoodsPack(Model model, GoodsPack goodsPack) {
        try {
            GoodsPack goodsPack1 = goodsPackService.getGoodsPackById(goodsPack);
            return goodsPack1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    @RequestMapping("/backend/delgoodspack.html")
    @ResponseBody
    public String delGoodsPack(GoodsPack goodsPack) {
        goodsPackService.deleteGoodsPack(goodsPack);
        GoodsPackAffiliated goodsPackAffiliated = new GoodsPackAffiliated();
        goodsPackAffiliated.setGoodsPackId(goodsPack.getId());
        goodsPackAffiliatedService.deleteGoodsPackAffiliated(goodsPackAffiliated);
        return "1";
    }


  /*  @RequestMapping("/backend/modifygoodspackstate.html")
    public String modifyGoodsPackState(HttpSession session,@RequestParam String state){
        return "redirect:/backend/goodspacklist.html";
        }*/
}




