package com.sy.service.zzy;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sy.mapper.zzy.DataDictionaryzzyMapper;
import com.sy.model.common.DataDictionary;
import com.sy.tools.PageSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * DataDictionaryServiceImpl
 * 
 */
@Service
public class DataDictionaryzzyServiceImpl implements DataDictionaryzzyService {
	@Resource
	private DataDictionaryzzyMapper mapper;

	public List<DataDictionary> getDataDictionaries(DataDictionary dataDictionary, PageSupport pageSupport) throws Exception {
		// TODO Auto-generated method stub
		Page page= PageHelper.startPage(pageSupport.getPage(),pageSupport.getPageSize());
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
