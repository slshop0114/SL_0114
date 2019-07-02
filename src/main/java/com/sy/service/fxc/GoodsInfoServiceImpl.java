package com.sy.service.fxc;


import com.sy.mapper.fxc.GoodsInfoMapper;
import com.sy.model.common.GoodsInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * GoodsInfoServiceImpl
 *
 */
@Service
@Transactional(readOnly = true)
public class GoodsInfoServiceImpl implements GoodsInfoService{
	@Resource
	private GoodsInfoMapper mapper;

	public List<GoodsInfo> getGoodsInfoList(GoodsInfo goodsInfo)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.getGoodsInfoList(goodsInfo);
	}

	public int count(GoodsInfo goodsInfo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.count(goodsInfo);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int addGoodsInfo(GoodsInfo goodsInfo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.addGoodsInfo(goodsInfo);
	}

	public int goodsSNIsExit(GoodsInfo goodsInfo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.goodsSNIsExit(goodsInfo);
	}

	public GoodsInfo getGoodsInfoById(GoodsInfo goodsInfo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getGoodsInfoById(goodsInfo);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int modifyGoodsInfo(GoodsInfo goodsInfo) throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyGoodsInfo(goodsInfo);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int deleteGoodsInfo(GoodsInfo goodsInfo) throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteGoodsInfo(goodsInfo);
	}

	public int isExitInPack(GoodsInfo goodsInfo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.isExitInPack(goodsInfo);
	}
	
	
}
