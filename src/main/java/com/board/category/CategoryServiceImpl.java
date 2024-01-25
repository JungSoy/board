package com.board.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryRepository categoryRepository;

//	@Override
//	public List<CategoryVO> getListCate() {
//		return categoryRepository.getListCate();
//	}
}
