package com.sy.controller.fxc;


import com.alibaba.fastjson.JSONObject;
import com.sy.model.common.DataDictionary;
import com.sy.service.fxc.DataDictionaryService;
import com.sy.tools.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DicmanageController {
    @Autowired
    DataDictionaryService dataDictionaryService;

    private static int pagestar = 1;

    @RequestMapping("/backend/dicmanage.html")
    public String Todicmanage(DataDictionary dataDictionary, Model model, Integer pagechange) {

        if (pagechange != null) {

            if (pagechange == 1) {
                pagestar+=1;
                System.out.println(pagestar);
            }
            if (pagechange == 2) {
                pagestar-=1;
                if (pagestar < 1) {
                    pagestar=1;
                }
            }
        }
        List<DataDictionary> dicmanagelist = null;
        try {
            dicmanagelist = dataDictionaryService.getDataDictionariesWithpage(dataDictionary, pagestar);
            if (dicmanagelist.size() == 0) {
                pagestar-=1;
                dicmanagelist = dataDictionaryService.getDataDictionariesWithpage(dataDictionary, pagestar);
            }

            model.addAttribute("dicmanagelist", dicmanagelist);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/backend/dicmanage";
    }


 /*   @RequestMapping("/backend/getJsonDic.html")
    @ResponseBody
    public Object getJsonDic(@RequestParam String tcode, PageSupport pageSupport) {

        List<DataDictionary> ddList = null;
        DataDictionary dataDictionary = new DataDictionary();
        dataDictionary.setTypeCode(tcode);
        try {
            ddList = dataDictionaryService.getDataDictionariesWithpage(dataDictionary, pageSupport);
            return ddList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "failed";
    }*/


    @RequestMapping("/backend/addDic.html")
    public String addDic(HttpSession session, DataDictionary dataDictionary) {
        try {
            dataDictionaryService.addDataDictionary(dataDictionary);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "failed";
        }
        return "redirect:/backend/dicmanage.html";
    }

    //    选择修改填充信息
    @RequestMapping("/backend/typecodeisexit.html")
    @ResponseBody
    public DataDictionary getiDicWithId(HttpSession session, DataDictionary dataDictionary) {
        try {
            List<DataDictionary> list = dataDictionaryService.getDataDictionaries(dataDictionary);
            return list.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    @RequestMapping("/backend/modifylDic.html")
    public String modifylDic(HttpSession session, DataDictionary dataDictionary) {

        try {
            dataDictionaryService.modifyDataDictionarys(dataDictionary);
            return "redirect:/backend/dicmanage.html";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "dsf";
    }
    @RequestMapping("/backend/delMainDic.html")
    @ResponseBody
    public String deleteDic(HttpSession session, DataDictionary dataDictionary) {
        try {
            dataDictionaryService.deleteDataDictionary(dataDictionary);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fault";
    }

}


