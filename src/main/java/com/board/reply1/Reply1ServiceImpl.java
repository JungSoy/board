package com.board.reply1;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.reply2.Reply2VO;

@Service
public class Reply1ServiceImpl implements Reply1Service {

	@Autowired
	Reply1Repository reply1repository;

	@Override
	public void addReply1(Map<String, Object> map) {
		reply1repository.addReply1(map);
	}

	@Override
	public List<Reply1VO> getReplyById(int bid) {
		return reply1repository.getReplyById(bid);
	}

//	@Override
//	public void updateReply(Map<String, Object> map) {
//		reply1repository.updateReply(map);
//		
//	}

	@Override
	public void updateReply1(Reply1VO r1vo) {
		reply1repository.updateReply1(r1vo);		
	}

//	@Override
//	public int deleteReply1(int rid1) {
//		return reply1repository.deleteReply1(rid1);
//	}

	@Override
	public int deleteReply1(Reply1VO r1vo) {
		return reply1repository.deleteReply1(r1vo);
	}

	@Override
	public List<Reply2VO> getReply2ById(int rid1) {
		return reply1repository.getReply2ById(rid1);
	}

	
	
	
//	@Override
//	public int addReply1(Reply1VO r1vo) {
//		
//		int result = reply1repository.addReply1(r1vo);
//		
//		return result;
//	}

}
