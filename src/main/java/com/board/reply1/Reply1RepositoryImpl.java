package com.board.reply1;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.board.BoardVO;
import com.board.reply2.Reply2VO;

@Repository
public class Reply1RepositoryImpl implements Reply1Repository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void addReply1(Map<String, Object> map) {
		this.sqlSessionTemplate.insert("reply1.addReply1", map);
	}

	@Override
	public List<Reply1VO> getReplyById(int bid) {
		return this.sqlSessionTemplate.selectList("reply1.select_reply1", bid);
	}

//	@Override
//	public void updateReply(Map<String, Object> map) {
//		this.sqlSessionTemplate.update("reply1.update", map);
//		
//	}

	@Override
	public void updateReply1(Reply1VO r1vo) {
		this.sqlSessionTemplate.update("reply1.update", r1vo);
	}

//	@Override
//	public int deleteReply1(int rid1) {
//		return this.sqlSessionTemplate.update("reply1.delete_reply1", rid1);
//	}

	@Override
	public int deleteReply1(Reply1VO r1vo) {
		return this.sqlSessionTemplate.update("reply1.delete_reply1", r1vo);
		
	}

	@Override
	public List<Reply2VO> getReply2ById(int rid1) {
		return this.sqlSessionTemplate.selectList("reply1.select_reply2", rid1);
	}
	
	
//	@Override
//	public Integer checkReply(Reply1VO r1vo) {
//		return this.sqlSessionTemplate.selectOne("reply2.checkReply1", r1vo);
//	}
}
