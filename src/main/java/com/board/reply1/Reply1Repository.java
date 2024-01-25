package com.board.reply1;

import java.util.List;
import java.util.Map;

import com.board.board.BoardVO;
import com.board.reply2.Reply2VO;


public interface Reply1Repository {

	//댓글등록
	void addReply1(Map<String, Object> map);	
	
	//댓글 목록
	List<Reply1VO> getReplyById(int bid);
	
	//댓글 수정
	void updateReply1(Reply1VO r1vo);	
//	void updateReply(Map<String, Object> map);	
	
	//댓글 삭제
//	int deleteReply1(int rid1);
	int deleteReply1(Reply1VO r1vo);
		
	//댓글체크
//	Integer checkReply(Reply1VO r1vo);
	
	//대댓글 목록
	List<Reply2VO> getReply2ById(int rid1);
	
}
