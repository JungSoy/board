package com.board.category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryRepositoryImpl implements CategoryRepository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
//	@Override
//	public List<CategoryVO> getListCate() {
//		return this.sqlSessionTemplate.selectList("category.select_cate");
//	}

}
