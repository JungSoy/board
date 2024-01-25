package com.board.reply2;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Reply2RepositoryImpl implements Reply2Repository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void addReply2(Map<String, Object> map) {
		this.sqlSessionTemplate.insert("reply2.addReply2", map);
		
	}

	@Override
	public List<Reply2VO> getReplyById(int rid1) {
		return this.sqlSessionTemplate.selectList("reply2.select_reply2", rid1);
	}

	@Override
	public void updateReply2(Reply2VO r2vo) {
		this.sqlSessionTemplate.update("reply2.update", r2vo);

	}

	@Override
	public int deleteReply2(int rid2) {
		return this.sqlSessionTemplate.update("reply2.delete_reply2", rid2);
	}

//	@Override
//	public int deleteReply2(Reply2VO r2vo) {
//		return this.sqlSessionTemplate.update("reply2.delete_reply2", r2vo);
//
//	}

	
	
	
}
