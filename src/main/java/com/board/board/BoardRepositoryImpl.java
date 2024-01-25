package com.board.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.category.CategoryVO;
import com.board.reply1.Reply1VO;
import com.board.reply2.Reply2VO;

@Repository
public class BoardRepositoryImpl implements BoardRepository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void addBoard(BoardVO bvo) {
		 this.sqlSessionTemplate.insert("board.addBoard", bvo);
	}

	@Override
	public List<BoardVO> getList() {
		return this.sqlSessionTemplate.selectList("board.select_list");
	}

	@Override
	public BoardVO getOne(int bid) {
		return this.sqlSessionTemplate.selectOne("board.select_one", bid);
	}

	@Override
	public int modifyBoard(BoardVO bvo) {
		return this.sqlSessionTemplate.update("board.update", bvo);
	}

	@Override
	public int deleteBoard(BoardVO bvo) {
		return this.sqlSessionTemplate.update("board.delete", bvo);
	}

	@Override
	public BoardVO getBidName(int bid) {
		return this.sqlSessionTemplate.selectOne("board.getBidName", bid);
	}

	@Override
	public List<Reply1VO> getReplyById(int bid) {
		return this.sqlSessionTemplate.selectList("board.select_reply1", bid);
	}

	@Override
	public List<Reply2VO> getReply2ById(int rid1) {
		return this.sqlSessionTemplate.selectList("board.select_reply2", rid1);
	}
	
	@Override
	public List<BoardVO> getListPaging(Criteria cri) {
		return this.sqlSessionTemplate.selectList("board.select_listpaging", cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return this.sqlSessionTemplate.selectOne("board.getTotal", cri);
	}

	@Override
	public List<CategoryVO> getListCate() {
		return this.sqlSessionTemplate.selectList("board.select_listcate");
	}

	@Override
	public List<BoardVO> getBoardByCategory(Criteria cri) {
		return this.sqlSessionTemplate.selectList("board.select_catepaging", cri);
	}


	//게시글 목록 엑셀 다운로드
	@Override
	public List<BoardVO> getExcelList(Criteria cri) {
		return this.sqlSessionTemplate.selectList("board.select_listexcel", cri);
	}

	@Override
	public List<FileVO> getFileById(int bid) {
		return this.sqlSessionTemplate.selectList("board.select_file", bid);

	}

	@Override
	public void addFile(FileVO fvo) {
		this.sqlSessionTemplate.insert("board.addFile", fvo);		
	}


	

//	@Override
//	public List<BoardVO> getCatePaging(Criteria cri) {
//		return this.sqlSessionTemplate.selectList("board.select_catepaging", cri);
//
//	}
}
