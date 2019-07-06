package com.sy.service.dc;

import com.sy.model.dc.Data_dictionary;

import java.util.List;

public interface data_dictionaryservice {
    //    查询数据字典表
    List<Data_dictionary> selectdatadictionaryall() throws Exception;
}
