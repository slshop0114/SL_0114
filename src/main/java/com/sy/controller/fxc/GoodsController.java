package com.sy.controller.fxc;

import com.alibaba.fastjson.JSONObject;
import com.sy.model.common.GoodsInfo;
import com.sy.model.common.Role;
import com.sy.model.common.User;
import com.sy.service.fxc.GoodsInfoService;
import com.sy.tools.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class GoodsController {
    @Autowired
    GoodsInfoService goodsInfoService;

    @RequestMapping("/backend/getgoodsinfo.html")
    @ResponseBody
    public GoodsInfo getGoodsInfo(GoodsInfo goodsInfo, Model model) {
        GoodsInfo goodsInfo1 = new GoodsInfo();
        try {
            goodsInfo1 = goodsInfoService.getGoodsInfoById(goodsInfo);
            model.addAttribute(goodsInfo1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return goodsInfo1;
    }


    @RequestMapping("/backend/goodsinfolist.html")
    public String goodsList(GoodsInfo goods, Model model) {
        List<GoodsInfo> goodsInfoList = null;

        GoodsInfo goodsInfo = new GoodsInfo();
        if (goods.getGoodsName()!=null){
            goodsInfo.setGoodsName("%"+goods.getGoodsName()+"%");
        }

        try {
            goodsInfoList = goodsInfoService.getGoodsInfoList(goodsInfo);
            model.addAttribute(goodsInfoList);
        } catch (Exception e) {
            e.printStackTrace();

        }
        return "/backend/goodsinfolist";
    }

    @RequestMapping("/backend/addgoodsinfo.html")
    public String addGoodsInfo(HttpSession session, GoodsInfo addGoodsInfo) {
        addGoodsInfo.setCreateTime(new Date());
        addGoodsInfo.setCreatedBy(((User) session.getAttribute(Constants.SESSION_USER)).getLoginCode());
        addGoodsInfo.setLastUpdateTime(new Date());
        try {
            goodsInfoService.addGoodsInfo(addGoodsInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/backend/goodsinfolist.html";
    }


    @RequestMapping("/backend/modifygoodsinfo.html")
    public String modifyGoodsInfo(GoodsInfo modifyGoodsInfo) {
        try {
            modifyGoodsInfo.setLastUpdateTime(new Date());
            goodsInfoService.modifyGoodsInfo(modifyGoodsInfo);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "forward:/backend/goodsinfolist.html";
    }

    @RequestMapping("/backend/delgoodsinfo.html")
    @ResponseBody
    public String delGoodsInfo(GoodsInfo goodsInfo) {
        System.out.println("delgoodsinfodelgoodsinfo");
        try {
          goodsInfoService.deleteGoodsInfo(goodsInfo);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "1";
    }
}


