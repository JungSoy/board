package com.board.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;
	
	@Override
	public void joinUser(UserVO uvo) {
		userRepository.joinUser(uvo);
	}

	@Override
	public UserVO loginUser(UserVO uvo) throws Exception {
		return userRepository.loginUser(uvo);
	}

	@Override
	public List<UserVO> getUserList() {
		return userRepository.selectUserList();
	}

	@Override
	public int idCheck(String userid) {
		return userRepository.idCheck(userid);
	}



	



	
//	@Override
//	public String loginUser(UserVO uvo, HttpSession session) {
//		String name = userRepository.loginUser(uvo);
//		 if (name != null) { // 세션 변수 저장
//		  session.setAttribute("userid", uvo.getUserid());
//		  session.setAttribute("name", name);
//		}
//		return name;
//	}



}
