package com.board.reply2;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Reply2ServiceImpl implements Reply2Service {

	@Autowired
	Reply2Repository reply2Repository;

	@Override
	public void addReply2(Map<String, Object> map) {
		reply2Repository.addReply2(map);
	}

	@Override
	public List<Reply2VO> getReplyById(int rid1) {
		return reply2Repository.getReplyById(rid1);
	}

	@Override
	public void updateReply2(Reply2VO r2vo) {
		reply2Repository.updateReply2(r2vo);
	}

	@Override
	public int deleteReply2(int rid2) {
		return reply2Repository.deleteReply2(rid2);
	}

//	@Override
//	public int deleteReply2(Reply2VO r2vo) {
//		return reply2Repository.deleteReply2(r2vo);
//	}
	
}
