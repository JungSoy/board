package com.board.reply2;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reply2")
public class Reply2Controller {
	
	@Autowired
	Reply2Service reply2service;

		//대댓글 등록
		@PostMapping("/reply2add")
		public void enrollReply2POST(@RequestParam Map<String, Object> map) {

			log.info("대댓글 등록" + map);
			reply2service.addReply2(map);
		}
		
		 //대댓글 수정
		@ResponseBody
	    @RequestMapping(value = "/reply2update", method = RequestMethod.POST)
	    public void updateReply2(Reply2VO r2vo) {
	    	log.info("updateReply2 댓글수정" + r2vo);
	    	reply2service.updateReply2(r2vo);
	        
	    }
	    
	    //대댓글 삭제
//		@ResponseBody
//	    @RequestMapping(value = "/reply2delete", method = RequestMethod.POST)
//	    public void deleteReply2POST(Reply2VO r2vo) {
//	    	
////	    	log.info("대댓글 삭제 bid" + bid);
//	    	log.info("deleteReply2POST......" + r2vo);
//	           
//	    	reply2service.deleteReply2(r2vo);
//	    	
////	    	return "redirect:/board/boarddetail?bid=" + bid;
//	    }
		@ResponseBody
		@RequestMapping(value = "/reply2delete", method = RequestMethod.POST)
		public void deleteReply2POST(@RequestParam int rid2) {
			
//	    	log.info("대댓글 삭제 bid" + bid);
			log.info("deleteReply2POST......" + rid2);
			
			reply2service.deleteReply2(rid2);
			
//	    	return "redirect:/board/boarddetail?bid=" + bid;
		}
}
