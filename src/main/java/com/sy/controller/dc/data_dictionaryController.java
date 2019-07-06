package com.sy.controller.dc;

import com.sy.model.dc.Data_dictionary;
import com.sy.service.dc.data_dictionaryservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class data_dictionaryController {
    @Autowired
    private data_dictionaryservice service;
    @RequestMapping("/selectdatadictionary")
    @ResponseBody
    public List<Data_dictionary> getall() throws Exception{
        List<Data_dictionary> list = service.selectdatadictionaryall();
        return list;
    }
}
