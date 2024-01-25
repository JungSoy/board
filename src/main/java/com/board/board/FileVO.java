package com.board.board;

import lombok.Data;

@Data
public class FileVO {

	private int bid;
	
	//경로
	private String uploadPath;
	
	//uuid
	private String uuid;
	
	//파일 이름 
	private String fileName;
	
}
