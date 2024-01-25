package com.board.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.category.CategoryVO;
import com.board.reply1.Reply1VO;
import com.board.reply2.Reply2VO;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardRepository boardRepository;
	
	//게시글&파일 등록
	@Override
	public void addBoard(BoardVO bvo) {
		
		log.info("(service)addBoard..........");
		
		boardRepository.addBoard(bvo);
		
		//파일 업로드(다중 업로드 어려움..)
		 List<FileVO> fileList = bvo.getFileList();
		    
		    if (fileList != null && !fileList.isEmpty()) {
		        for (FileVO fvo : fileList) {
		        	if(fvo.getFileName().contains(",")) { //filename에 ,가 있다면
//		        		 List<FileVO> sFileList = bvo.getFileList();
		        		String [] sName = fvo.getFileName().split(","); //filename을 , 기준으로 잘라서 sName에 넣음
		        		String [] sUploadPath = fvo.getUploadPath().split(",");
		        		String [] sUuid = fvo.getUuid().split(",");
		        		
		        		log.info("sName" + sName[0]);
		        		
		        		for(int i=0; i<sName.length; i++) { //sName의 길이만큼 반복문 (첨부파일 2개 넣으면 sName.length는 '2')
		        			FileVO sFvo = new FileVO(); //sFvo에 반복문 출력한 것 담음 
		        			sFvo.setBid(bvo.getBid());
		        			sFvo.setFileName(sName[i]);
		        			sFvo.setUploadPath(sUploadPath[i]);
		        			sFvo.setUuid(sUuid[i]);
//		        			sFileList.add(sFvo);
		        			boardRepository.addFile(sFvo); // 여러 개의 파일 정보를 DB에 한 번에 삽입
		        		}
		        		
		        	} else { //filename에 , 없으면 그냥 등록
		        		boardRepository.addFile(fvo); //한 개의 파일 db 등록
		        	}
		        } 
		    }
		    
		//파일 업로드(파일 한 개)
//		if(bvo.getFileList() == null || bvo.getFileList().size() <= 0) {
//			return;
//		}
//   		
//   		for(FileVO fvo : bvo.getFileList()) { //BoardVO에 있는 fileList를 풀어서 fvo에 저장
//			fvo.setBid(bvo.getBid());
//			
//			boardRepository.addFile(fvo); //따라서 파일 업로드할 때 fvo 가져와야 함 
//			
//		}
	}

    
	@Override
	public List<BoardVO> getList() {
		return boardRepository.getList();
	}

	@Override
	public BoardVO getOne(int bid) {
		return boardRepository.getOne(bid);
	}

	@Override
	public int modifyBoard(BoardVO bvo) {
		return boardRepository.modifyBoard(bvo);
	}

	@Override
	public int deleteBoard(BoardVO bvo) {
		return boardRepository.deleteBoard(bvo);
	}

	@Override
	public BoardVO getBidName(int bid) {
		return boardRepository.getBidName(bid);
	}

	@Override
	public List<Reply1VO> getReplyById(int bid) {
		return boardRepository.getReplyById(bid);
	}

	@Override
	public List<BoardVO> getListPaging(Criteria cri) {
		return boardRepository.getListPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return boardRepository.getTotal(cri);
	}

	@Override
	public List<CategoryVO> getListCate() {
		return boardRepository.getListCate();
	}

	@Override
	public List<BoardVO> getBoardByCategory(Criteria cri) {
		return boardRepository.getBoardByCategory(cri);
	}

	@Override
	public List<Reply2VO> getReply2ById(int rid1) {
		return boardRepository.getReply2ById(rid1);
	}


	//게시글 목록 엑셀 다운로드
	@Override
	public List<BoardVO> getExcelList(Criteria cri) {

		return boardRepository.getExcelList(cri);
	}


	//첨부파일 조회
	@Override
	public List<FileVO> getFileById(int bid) {
		
		log.info("getFileById...........");
		
		return boardRepository.getFileById(bid);
	}


	@Override
	public void addFile(FileVO fvo) {
		boardRepository.addFile(fvo);
	}

//	@Override
//	public List<BoardVO> getCatePaging(Criteria cri) {
//		return boardRepository.getListPaging(cri);
//	}

	

}
