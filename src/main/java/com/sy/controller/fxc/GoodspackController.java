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
import java.util.*;


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
            goodsInfoList = goodsInfoService.getGoodsInfoList(goodsInfo, 0);
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
            goodsPack.setNum(100);
            goodsPack.setCreateTime(new Date());
            goodsPack.setLastUpdateTime(new Date());
            goodsPackService.addGoodsPack(goodsPack);
            System.out.println(goodsPack.getGoodsPackCode() + "getGoodsPackCode");
            GoodsPack goodsPack1 = goodsPackService.getlastgoodpackid(goodsPack);
            for (int i = goodsPack.getGoodsInfos().size() - 1; i >= 0; i--) {
                if (goodsPack.getGoodsInfos().get(i).getId() == null) {
                    goodsPack.getGoodsInfos().remove(i);
                    continue;
                }
                GoodsPackAffiliated goodsPackAffiliated = new GoodsPackAffiliated();
                goodsPackAffiliated.setGoodsInfoId(goodsPack.getGoodsInfos().get(i).getId());
                goodsPackAffiliated.setGoodsPackId(goodsPack1.getId());
                goodsPackAffiliated.setGoodsNum(goodsPack.getGoodsInfos().get(i).getNum());
                goodsPackAffiliatedService.addGoodsPackAffiliated(goodsPackAffiliated);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/backend/goodspacklist.html";
    }


    //查看功能
    @RequestMapping("/backend/modifygoodspack.html")
    @ResponseBody
    public Map<String, Object> modifyGoodsPack(Model model, GoodsPack goodsPack) {
        Map<String, Object> map = new HashMap<>();
        try {
            GoodsPack goodsPack1 = goodsPackService.getGoodsPackById(goodsPack);
            map.put("goodsPack1", goodsPack1);
            List<GoodsPackAffiliated> lista = goodsPackAffiliatedService.selectGoodsPackAffiliatedBygoodsPackId(goodsPack.getId());
            map.put("num", lista);

            List<GoodsInfo> listg = new ArrayList<>();
            for (GoodsPackAffiliated goodsPackAffiliated : lista) {
                GoodsInfo goodsInfo1 = new GoodsInfo();
                goodsInfo1.setId(goodsPackAffiliated.getGoodsInfoId());
                GoodsInfo goodsInfo = goodsInfoService.getGoodsInfoById(goodsInfo1);
                listg.add(goodsInfo);
            }
            map.put("list", listg);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;
    }


    @RequestMapping("/backend/savemodifygoodspack.html")
    public String savemodifygoodspack(GoodsPack goodsPack) {
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
            goodsPack.setLastUpdateTime(new Date());
            goodsPackService.modifyGoodsPack(goodsPack);
            GoodsPack goodsPack1 = goodsPackService.getlastgoodpackid(goodsPack);
            GoodsPackAffiliated goodsPackAffiliated = new GoodsPackAffiliated();
            goodsPackAffiliated.setGoodsPackId(goodsPack1.getId());
            goodsPackAffiliatedService.deleteGoodsPackAffiliated(goodsPackAffiliated);

            for (int i = goodsPack.getGoodsInfos().size() - 1; i >= 0; i--) {
                if (goodsPack.getGoodsInfos().get(i).getId() == null) {
                    goodsPack.getGoodsInfos().remove(i);

                }
            }
            for (GoodsInfo goodsInfo:goodsPack.getGoodsInfos()){

                GoodsPackAffiliated goodsPackAffiliated1 = new GoodsPackAffiliated();
                goodsPackAffiliated1.setGoodsPackId(goodsPack1.getId());
                goodsPackAffiliated1.setGoodsInfoId(goodsInfo.getId());
                goodsPackAffiliated1.setGoodsNum(goodsInfo.getNum());
                goodsPackAffiliatedService.addGoodsPackAffiliated(goodsPackAffiliated1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/backend/goodspacklist.html";
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

    @RequestMapping("/backend/searchgoodspackcode.html")
    @ResponseBody
    public String searchgoodspackcode(GoodsPack goodsPack){
        try {
           int i = goodsPackService.goodsPackCodeIsExit(goodsPack);
           if (i>0){
               return "1";
           }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "0";
    }

}




