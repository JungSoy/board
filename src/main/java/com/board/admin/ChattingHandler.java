package com.board.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.board.user.UserVO;

import lombok.extern.java.Log;


@Log
@RequestMapping(value="/chat")
@Component //ChattingHandler를 Spring 빈으로 등록
public class ChattingHandler extends TextWebSocketHandler{

	//세션 리스트(웹소켓서버에 연결한 클라이언트 사용자들을 저장하는 리스트)
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	//클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.info("웹소켓 연결------------ #ChattingHandler, afterConnectionEstablished");

		UserVO uvo = (UserVO) session.getAttributes().get("user");
	    String userId = uvo.getUserid();
	    log.info("userId----------------" + userId);
	        
		sessionList.add(session);

		log.info("채팅 참가 아이디----------------- " + session.getId());
		log.info("채팅 참가 속성-----------------" + session.getAttributes() + "님이 입장하셨습니다.");
		
		 for (WebSocketSession s : sessionList) {
		        
		        s.sendMessage(new TextMessage("[ " + userId + " 님이 입장하셨습니다. ] "));
		 }
	}
	
	//클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	    UserVO sender = (UserVO) session.getAttributes().get("user");
	    String senderId = sender.getUserid();
	    
	    log.info("senderId----------------" + senderId);
	    
	    for (WebSocketSession s : sessionList) {
//	        UserVO receiver = (UserVO) s.getAttributes().get("user");
//	        String receiverId = receiver.getUserid();
//	        
//	        log.info("receiverId----------------" + receiverId);
	        
	        s.sendMessage(new TextMessage(senderId + ":" + message.getPayload()));
	    }
	}
	
	//클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionClosed");
		
		UserVO uvo = (UserVO) session.getAttributes().get("user");
	    String userId = uvo.getUserid();
	    
		sessionList.remove(session);
		
		 for (WebSocketSession s : sessionList) {
		        
		        s.sendMessage(new TextMessage("[ " + userId + " 님이 퇴장하셨습니다. ] "));
		    }
		 
		log.info("채팅 퇴장 " + session.getId() + "님이 퇴장하셨습니다.");
	}
}
