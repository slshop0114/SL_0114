package com.sy.service.dc;

import com.sy.mapper.dc.data_dictionaryMapper;
import com.sy.model.dc.Data_dictionary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class data_dictionaryserviceimpl implements data_dictionaryservice{
    @Autowired
    private data_dictionaryMapper mapper;
    @Override
    public List<Data_dictionary> selectdatadictionaryall() throws Exception {
        List<Data_dictionary> list = mapper.selectdatadictionaryall();
        return list;
    }
}
