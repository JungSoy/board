package com.board.user;

import java.util.List;

public interface UserRepository {
	
	//회원가입
	void joinUser(UserVO uvo);

	//로그인
	UserVO loginUser(UserVO uvo);
	
	List<UserVO> selectUserList();
	
	//아이디 중복 검사
	int idCheck(String userid);
	
}
