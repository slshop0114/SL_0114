package com.sy.mapper.fxc;



import com.sy.model.common.GoodsPack;

import java.util.List;

/**
 * GoodsPackMapper
 
 */
public interface GoodsPackMapper {
	/**
	 * getGoodsInfoList
	 * @return
	 */
	public List<GoodsPack> getGoodsPackList(GoodsPack goodsPack) throws Exception;
	
	/**
	 * count
	 * @param goodsPack
	 * @return
	 * @throws Exception
	 */
	public int count(GoodsPack goodsPack) throws Exception;
	
	/**
	 * addGoodsPack
	 * @param goodsPack
	 * @return
	 */
	public int addGoodsPack(GoodsPack goodsPack) throws Exception;
	
	/**
	 * goodsPackCodeIsExit
	 * @param goodsPack
	 * @return
	 * @throws Exception
	 */
	public int goodsPackCodeIsExit(GoodsPack goodsPack) throws Exception;
	
	/**
	 * getGoodsPackById
	 * @param goodsPack
	 * @return
	 */
	public GoodsPack getGoodsPackById(GoodsPack goodsPack) throws Exception;
	
	
	/**
	 * modifyGoodsPack
	 * @param goodsPack
	 * @return
	 */
	public int modifyGoodsPack(GoodsPack goodsPack);
	
	/**
	 * deleteGoodsPack
	 * @param goodsPack
	 * @return
	 */
	public int deleteGoodsPack(GoodsPack goodsPack);
	
	/**
	 * getAddGoodsPackId
	 * @return
	 */
	public int getAddGoodsPackId() throws Exception;

	public GoodsPack getlastgoodpackid(GoodsPack goodsPack)throws Exception;
}
