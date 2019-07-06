package com.sy.service.fxc;


import com.sy.mapper.fxc.GoodsPackAffiliatedMapper;
import com.sy.model.common.GoodsPackAffiliated;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * GoodsPackAffiliatedServiceImpl
 * 
 */
@Service
@Transactional(readOnly = true)
public class GoodsPackAffiliatedServiceImpl implements GoodsPackAffiliatedService{
	
	@Resource
	private GoodsPackAffiliatedMapper mapper;

	public List<GoodsPackAffiliated> getGoodsPackAffiliatedListById(
			GoodsPackAffiliated goodsPackAffiliated) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getGoodsPackAffiliatedListById(goodsPackAffiliated);
	}

	@Override
	public List<GoodsPackAffiliated> selectGoodsPackAffiliatedBygoodsPackId(int i) throws Exception {
		return mapper.selectGoodsPackAffiliatedBygoodsPackId(i);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int addGoodsPackAffiliated(GoodsPackAffiliated goodsPackAffiliated)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.addGoodsPackAffiliated(goodsPackAffiliated);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int modifyGoodsPackAffiliated(GoodsPackAffiliated goodsPackAffiliated) {
		// TODO Auto-generated method stub
		return mapper.modifyGoodsPackAffiliated(goodsPackAffiliated);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int deleteGoodsPackAffiliated(GoodsPackAffiliated goodsPackAffiliated) {
		// TODO Auto-generated method stub
		return mapper.deleteGoodsPackAffiliated(goodsPackAffiliated);
	}


}
