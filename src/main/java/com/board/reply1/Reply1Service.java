package com.board.reply1;

import java.util.List;
import java.util.Map;

import com.board.board.BoardVO;
import com.board.reply2.Reply2VO;

public interface Reply1Service {

	void addReply1(Map<String, Object> map); 
	
	List<Reply1VO> getReplyById(int bid);
	
//	void updateReply(Map<String, Object> map);	
	void updateReply1(Reply1VO r1vo);	
	
//	int deleteReply1(int rid1);
	int deleteReply1(Reply1VO r1vo);
		
//	int addReply1(Reply1VO r1vo);
	
	List<Reply2VO> getReply2ById(int rid1);
	
}
