package com.sy.mapper.fxc;



import com.sy.model.common.GoodsInfo;
import java.util.List;

/**
 * GoodsInfoMapper
 *
 */
public interface GoodsInfoMapper {

	public List<GoodsInfo> getGoodsInfoList(GoodsInfo goodsInfo) throws Exception;
	

	public int count(GoodsInfo goodsInfo) throws Exception;

	public int isExitInPack(GoodsInfo goodsInfo) throws Exception;
	

	public int addGoodsInfo(GoodsInfo goodsInfo) throws Exception;
	

	public int goodsSNIsExit(GoodsInfo goodsInfo) throws Exception;
	

	public GoodsInfo getGoodsInfoById(GoodsInfo goodsInfo) throws Exception;
	
	

	public int modifyGoodsInfo(GoodsInfo goodsInfo) throws Exception;
	

	public int deleteGoodsInfo(GoodsInfo goodsInfo) throws Exception;
}
