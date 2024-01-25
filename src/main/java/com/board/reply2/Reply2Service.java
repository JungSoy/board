package com.board.reply2;

import java.util.List;
import java.util.Map;


public interface Reply2Service {

	void addReply2(Map<String, Object> map);	
			
	List<Reply2VO> getReplyById(int rid1);
	
	void updateReply2(Reply2VO r2vo);	
	
//	int deleteReply2(Reply2VO r2vo);
	
	int deleteReply2(int rid2);
}
