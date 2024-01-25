package com.board.reply2;

import java.util.List;
import java.util.Map;


public interface Reply2Repository {

	//댓글등록
		void addReply2(Map<String, Object> map);	
		
		//댓글 목록
		List<Reply2VO> getReplyById(int rid1);
		
		//댓글 수정
		void updateReply2(Reply2VO r2vo);	
		
		//댓글 삭제
//		int deleteReply2(Reply2VO r2vo);
		int deleteReply2(int rid2);
			
}
