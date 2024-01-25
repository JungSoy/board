package com.board.user;

import java.util.List;

public interface UserService {
	
	
	void joinUser(UserVO uvo);
	
    UserVO loginUser(UserVO uvo) throws Exception;
	
	List<UserVO> getUserList();

	int idCheck(String userid);
}
