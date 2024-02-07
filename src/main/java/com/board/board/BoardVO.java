package com.board.board;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private int bid, rid1, rid2, rn;
	private String cno, userid, btitle, bcontent, del;
	private Date bregdate, bupdate;
	private String did, cid, dname;
	
	//파일 정보
	private List<FileVO> fileList;
}
