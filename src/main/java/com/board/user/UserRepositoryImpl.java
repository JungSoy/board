package com.board.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepositoryImpl implements UserRepository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//회원가입
	@Override
	public void joinUser(UserVO uvo) {
		
		this.sqlSessionTemplate.insert("user.insert", uvo);
		
	}
	
	//로그인
	@Override
	public UserVO loginUser(UserVO uvo) {
		return this.sqlSessionTemplate.selectOne("user.loginUser", uvo);
	}

	
	@Override
	public List<UserVO> selectUserList() {
		return this.sqlSessionTemplate.selectList("user.select_list");
	}

	@Override
	public int idCheck(String userid) {
		return this.sqlSessionTemplate.selectOne("user.idCheck", userid);
	}


	

//	@Override
//	public String loginUser(UserVO uvo) {
//		return this.sqlSessionTemplate.selectOne("user.login_check", uvo);
//	}



}
