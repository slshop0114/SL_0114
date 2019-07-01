package com.sy.mapper.fxc;

import com.sy.model.common.DataDictionary;
import java.util.List;

/**
 * DataDictionaryMapper
 *
 */
public interface DataDictionaryMapper {
	
	
	/**
	 * getDataDictionaries
	 * @return dataDictionary
	 */
	public List<DataDictionary> getDataDictionaries(DataDictionary dataDictionary) throws Exception;
	/**
	 * getDataDictionariesNotIn
	 * sql:SELECT * FROM data_dictionary WHERE  typeCode = 'CARD_TYPE' AND typeCode NOT IN (SELECT typecode FROM data_dictionary WHERE typecode = 'INFO_TYPE')
	 * @param dataDictionary
	 * @return
	 * @throws Exception
	 */
	public List<DataDictionary> getDataDictionariesNotIn(DataDictionary dataDictionary) throws Exception;
	/**
	 * getDataDictionariesCategory
	 * @param
	 * @return
	 * @throws Exception
	 */
	public List<DataDictionary> getDataDictionariesCategory() throws Exception;
	
	
	/**
	 * addDataDictionary
	 * @param dataDictionary
	 * @return int
	 */
	public int addDataDictionary(DataDictionary dataDictionary) throws Exception;
	/**
	 * modifyDataDictionary
	 * @param dataDictionary
	 * @return int
	 */
	public int modifyDataDictionary(DataDictionary dataDictionary) throws Exception;
	/**
	 * modifyDataDictionarys
	 * @param dataDictionary
	 * @return
	 * @throws Exception
	 */
	public int modifyDataDictionarys(DataDictionary dataDictionary) throws Exception;
	/**
	 * deleteDataDictionary
	 * @param dataDictionary
	 * @return
	 */
	public int deleteDataDictionary(DataDictionary dataDictionary) throws Exception;
	
	/**
	 * typeCodeOrValueIdIsExit
	 * @param dataDictionary
	 * @return
	 * @throws Exception
	 */
	public int typeCodeOrValueIdIsExit(DataDictionary dataDictionary) throws Exception;
	/**
	 * maxValueId
	 * @param dataDictionary
	 * @return
	 * @throws Exception
	 */
	public int maxValueId(DataDictionary dataDictionary) throws Exception;
	
}
