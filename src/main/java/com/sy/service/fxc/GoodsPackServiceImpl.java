package com.sy.service.fxc;

import com.sy.mapper.fxc.GoodsPackAffiliatedMapper;
import com.sy.mapper.fxc.GoodsPackMapper;
import com.sy.model.common.GoodsPack;
import com.sy.model.common.GoodsPackAffiliated;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class GoodsPackServiceImpl implements GoodsPackService{
	@Resource
	private GoodsPackMapper mapper;
	@Resource
	private GoodsPackAffiliatedMapper gpaMapper;

	public List<GoodsPack> getGoodsPackList(GoodsPack goodsPack)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.getGoodsPackList(goodsPack);
	}

	public int count(GoodsPack goodsPack) throws Exception {
		// TODO Auto-generated method stub
		return mapper.count(goodsPack);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int addGoodsPack(GoodsPack goodsPack) throws Exception {
		// TODO Auto-generated method stub
		return mapper.addGoodsPack(goodsPack);
	}

	public int goodsPackCodeIsExit(GoodsPack goodsPack) throws Exception {
		// TODO Auto-generated method stub
		return mapper.goodsPackCodeIsExit(goodsPack);
	}

	public GoodsPack getGoodsPackById(GoodsPack goodsPack) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getGoodsPackById(goodsPack);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int modifyGoodsPack(GoodsPack goodsPack) {
		// TODO Auto-generated method stub
		return mapper.modifyGoodsPack(goodsPack);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public int deleteGoodsPack(GoodsPack goodsPack) {
		// TODO Auto-generated method stub
		return mapper.deleteGoodsPack(goodsPack);
	}

	@Override
	public GoodsPack getlastgoodpackid(GoodsPack goodsPack) throws Exception {

		return mapper.getlastgoodpackid(goodsPack);
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public boolean hl_addGoodsPack(GoodsPack goodsPack,List<GoodsPackAffiliated> apaList) throws Exception {
		// TODO Auto-generated method stub
		int addGoodsPackId = 0;
		mapper.addGoodsPack(goodsPack);
		addGoodsPackId = mapper.getAddGoodsPackId();
		if(null != apaList && apaList.size() > 0 && addGoodsPackId != 0){
			for(int i = 0; i <  apaList.size(); i++){
				if(null != apaList.get(i)){
					apaList.get(i).setGoodsPackId(addGoodsPackId);
					gpaMapper.addGoodsPackAffiliated(apaList.get(i));
				}
			}
		}
		return true;
	}

	@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
	public boolean hl_modifyGoodsPack(GoodsPack goodsPack,List<GoodsPackAffiliated> apaList) throws Exception {
		// TODO Auto-generated method stub
		mapper.modifyGoodsPack(goodsPack);
		int goodsPackId = goodsPack.getId();
		GoodsPackAffiliated goodsPackAffiliated = new GoodsPackAffiliated();
		goodsPackAffiliated.setGoodsPackId(goodsPackId);
		gpaMapper.deleteGoodsPackAffiliated(goodsPackAffiliated);
		if(null != apaList){
			for(int i = 0; i < apaList.size(); i++){
				if(null != apaList.get(i)){
					apaList.get(i).setGoodsPackId(goodsPackId);
					gpaMapper.addGoodsPackAffiliated(apaList.get(i));
				}
			}
		}
		return true;
	}

}
