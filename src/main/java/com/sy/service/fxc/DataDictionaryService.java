package com.sy.service.fxc;


import com.sy.model.common.DataDictionary;
import com.sy.tools.PageSupport;

import java.util.List;

/**
 * DataDictionaryService

 */
public interface DataDictionaryService {
	/**
	 * getDataDictionaries
	 * @return dataDictionary
	 */
	public List<DataDictionary> getDataDictionaries(DataDictionary dataDictionary) throws Exception;

	public List<DataDictionary> getDataDictionariesWithpage(DataDictionary dataDictionary, PageSupport pageSupport) throws Exception;
	/**
	 * getDataDictionariesCategory
	 * @param
	 * @return
	 * @throws Exception
	 */
	public List<DataDictionary> getDataDictionariesCategory() throws Exception;
	/**
	 * getDataDictionariesNotIn
	 * @param
	 * @return
	 * @throws Exception
	 */
	public List<DataDictionary> getDataDictionariesNotIn(DataDictionary dataDictionary) throws Exception;
	/**
	 * addDataDictionary
	 * @param
	 * @return int
	 */
	public int addDataDictionary(DataDictionary dataDictionary) throws Exception;
	/**
	 * modifyDataDictionary
	 * @param
	 * @return int
	 */
	public int modifyDataDictionary(DataDictionary dataDictionary) throws Exception;
	/**
	 * deleteDataDictionary
	 * @param
	 * @return
	 */
	public int deleteDataDictionary(DataDictionary dataDictionary) throws Exception;
	
	/**
	 * modifyDataDictionarys
	 * @param
	 * @return
	 * @throws Exception
	 */
	public int modifyDataDictionarys(DataDictionary dataDictionary) throws Exception;
	
	/**
	 * typeCodeIsExit
	 * @param
	 * @return
	 * @throws Exception
	 */
	public int typeCodeOrValueIdIsExit(DataDictionary dataDictionary) throws Exception;
	/**
	 * maxValueId
	 * @param
	 * @return
	 * @throws Exception
	*/ 
	public int maxValueId(DataDictionary dataDictionary) throws Exception;
}
