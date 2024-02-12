package com.board.goods;

import java.util.List;

import com.board.board.Criteria;

public interface GoodsRepository {

	//상품 목록(페이징 적용)
	List<GoodsVO> getGoodsList(Criteria cri);
	
	//상품 목록 총 개수
	int getTotal(Criteria cri);
	
	//신상품 세가지
	List<GoodsVO> getNewGoods();
		
}
