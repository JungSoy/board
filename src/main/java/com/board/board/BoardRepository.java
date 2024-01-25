package com.board.board;

import java.util.List;

import com.board.category.CategoryVO;
import com.board.reply1.Reply1VO;
import com.board.reply2.Reply2VO;

public interface BoardRepository {

	//게시글 등록
	void addBoard(BoardVO bvo);
	
	//게시글 목록
	List<BoardVO> getList();
	
	//게시글 목록(페이징 적용)
	List<BoardVO> getListPaging(Criteria cri);
	
	//게시글 목록(카테고리 리스트)
	List<CategoryVO> getListCate();

	//게시글 목록(카테고리별 목록)
//	List<BoardVO> getCatePaging(Criteria cri);
	
	//카테고리별 조회
	List<BoardVO> getBoardByCategory(Criteria cri);
	
	//게시글 총 개수
	int getTotal(Criteria cir);
	
	//게시글 조회
	BoardVO getOne(int bid);

	//게시글 수정
	int modifyBoard(BoardVO bvo);
	
	//게시글 삭제
	int deleteBoard(BoardVO bvo);
	
	//댓글 목록
	List<Reply1VO> getReplyById(int bid);
	
	//대댓글 목록
	List<Reply2VO> getReply2ById(int rid1);
	
	//(댓글) 게시글 id 
	BoardVO getBidName(int bid);
	
	//파일 등록
//	void addFile(List<FileVO> fileList);
	
	//목록 엑셀 다운
	List<BoardVO> getExcelList(Criteria cri);
	
	//파일 조회
	List<FileVO> getFileById(int bid);

	void addFile(FileVO fvo);
	
	
}
