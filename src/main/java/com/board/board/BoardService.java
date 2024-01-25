package com.board.board;

import java.util.List;

import com.board.category.CategoryVO;
import com.board.reply1.Reply1VO;
import com.board.reply2.Reply2VO;

public interface BoardService {
	
	void addBoard(BoardVO bvo);
	
	List<BoardVO> getList();
	
	List<BoardVO> getListPaging(Criteria cri);
	
	List<CategoryVO> getListCate();
	
//	List<BoardVO> getCatePaging(Criteria cri);
	
	int getTotal(Criteria cri);
	
	BoardVO getOne(int bid);
	
	int modifyBoard(BoardVO bvo);
	
	int deleteBoard(BoardVO bvo);
	
	List<Reply1VO> getReplyById(int bid);
	
	List<Reply2VO> getReply2ById(int rid1);
	
	BoardVO getBidName(int bid);
	
	List<BoardVO> getBoardByCategory(Criteria cri);

	void addFile(FileVO fvo);
	
	List<BoardVO> getExcelList(Criteria cri);
	
	List<FileVO> getFileById(int bid);
	
}
