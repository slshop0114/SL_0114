package com.sy.service.fxc;


import com.sy.model.common.DataDictionary;
import com.sy.mapper.fxc.DataDictionaryMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * DataDictionaryServiceImpl
 * 
 */
@Service
public class DataDictionaryServiceImpl implements DataDictionaryService{
	@Resource
	private DataDictionaryMapper mapper;

	public List<DataDictionary> getDataDictionaries(
			DataDictionary dataDictionary) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getDataDictionaries(dataDictionary);
	}

	public int addDataDictionary(DataDictionary dataDictionary)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.addDataDictionary(dataDictionary);
	}

	public int modifyDataDictionary(DataDictionary dataDictionary)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.modifyDataDictionary(dataDictionary);
	}

	public int deleteDataDictionary(DataDictionary dataDictionary)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.deleteDataDictionary(dataDictionary);
	}

	public List<DataDictionary> getDataDictionariesCategory() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getDataDictionariesCategory();
	}

	public List<DataDictionary> getDataDictionariesNotIn(
			DataDictionary dataDictionary) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getDataDictionariesNotIn(dataDictionary);
	}

	public int modifyDataDictionarys(DataDictionary dataDictionary)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.modifyDataDictionarys(dataDictionary);
	}

	public int typeCodeOrValueIdIsExit(DataDictionary dataDictionary) throws Exception {
		// TODO Auto-generated method stub
		return mapper.typeCodeOrValueIdIsExit(dataDictionary);
	}

	@Override
	public int maxValueId(DataDictionary dataDictionary) throws Exception {
		// TODO Auto-generated method stub
		return mapper.maxValueId(dataDictionary);
	}

}
