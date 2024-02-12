package com.board.goods;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.board.Criteria;

@Repository
public class GoodsRepositoryImpl implements GoodsRepository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<GoodsVO> getGoodsList(Criteria cri) {
		return this.sqlSessionTemplate.selectList("goods.goodslist", cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return this.sqlSessionTemplate.selectOne("goods.getTotal");
	}

	@Override
	public List<GoodsVO> getNewGoods() {
		return this.sqlSessionTemplate.selectList("goods.newgoods");
	}


}
