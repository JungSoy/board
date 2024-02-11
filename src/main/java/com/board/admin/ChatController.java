package com.board.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chatPageGET(HttpServletRequest request) {
	 	
		HttpSession session = request.getSession();
   		UserVO uvo = (UserVO)session.getAttribute("user");
       
		log.info("채팅 페이지 진입");
		
		return "/chat";
		
	}
	
	
	
	
}