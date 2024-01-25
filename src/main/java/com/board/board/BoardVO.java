package com.board.board;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private int bid, cno, rid1, rid2, rn;
	private String userid, btitle, bcontent, cate, del;
	private Date bregdate, bupdate;
	
	//파일 정보
	private List<FileVO> fileList;
}
