package com.board.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.board.Criteria;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsRepository goodsRepository;
	
	@Override
	public List<GoodsVO> getGoodsList(Criteria cri) {
		return goodsRepository.getGoodsList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return goodsRepository.getTotal(cri);
	}

	@Override
	public List<GoodsVO> getNewGoods() {
		return goodsRepository.getNewGoods();
	}




}
