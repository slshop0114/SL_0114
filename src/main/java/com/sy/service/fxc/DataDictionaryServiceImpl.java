package com.sy.service.fxc;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sy.model.common.DataDictionary;
import com.sy.mapper.fxc.DataDictionaryMapper;
import com.sy.tools.PageSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * DataDictionaryServiceImpl
 * 
 */
@Service
@Transactional(readOnly = true)
public class DataDictionaryServiceImpl implements DataDictionaryService{
	@Resource
	private DataDictionaryMapper mapper;

	@Override
	public List<DataDictionary> getDataDictionariesWithpage(DataDictionary dataDictionary, Integer pagestar) throws Exception {


		Page page= PageHelper.startPage(pagestar,10);
		return mapper.getDataDictionariesWithpage(dataDictionary);
	}

	public List<DataDictionary> getDataDictionaries(DataDictionary dataDictionary) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getDataDictionaries(dataDictionary);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int addDataDictionary(DataDictionary dataDictionary)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.addDataDictionary(dataDictionary);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int modifyDataDictionary(DataDictionary dataDictionary)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.modifyDataDictionary(dataDictionary);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
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

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
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
