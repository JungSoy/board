package com.board.goods;

import java.util.List;

import com.board.board.Criteria;

public interface GoodsService {

	List<GoodsVO> getGoodsList(Criteria cri);
	
	int getTotal(Criteria cri);
	
	List<GoodsVO> getNewGoods();
	
	
}
