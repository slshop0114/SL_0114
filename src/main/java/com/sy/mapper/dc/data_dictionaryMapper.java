package com.sy.mapper.dc;

import com.sy.model.dc.Data_dictionary;

import java.util.List;

public interface data_dictionaryMapper {
//    查询数据字典表
    List<Data_dictionary>  selectdatadictionaryall() throws Exception;
}
