package com.board.user;

import java.sql.Date;

import lombok.Data;

@Data
public class UserVO {

	private String userid, uname, pw, uemail, phone, addr1, addr2, addr3;
	private int adminck, money, point;
	private Date uregdate;
}
