package com.board.reply1;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reply1")
public class Reply1Controller {

	@Autowired
	Reply1Service reply1service;
	
	//댓글 등록
	@PostMapping("/reply1add")
	public void enrollReplyPOST(@RequestParam Map<String, Object> map) {

		log.info("댓글등록 컨트롤러" + map);
		reply1service.addReply1(map);
	}
	
	 //댓글 수정
	@ResponseBody
    @RequestMapping(value = "/reply1update", method = RequestMethod.POST)
    public void updateReviewAjax(Reply1VO r1vo) {
    	log.info("댓글수정 컨트롤러" + r1vo);
        reply1service.updateReply1(r1vo);
        
    }
    
    //댓글 삭제
  @RequestMapping(value = "/reply1delete", method = RequestMethod.POST)
  public String deleteReply1POST(Reply1VO r1vo, @RequestParam int bid) {
  	
  	log.info("댓글삭제 bid" + bid);
  	log.info("댓글삭제 컨트롤러" + r1vo);
         
  	reply1service.deleteReply1(r1vo);
  	
  	return "redirect:/board/boarddetail?bid=" + bid;
  }
  
  
//@RequestMapping(value = "/reply1delete", method = RequestMethod.POST)
//public String deleteReply1POST(@RequestParam int rid1, @RequestParam int bid) {
//	
//	System.out.println(bid);
//	System.out.println("댓글삭제 컨트롤러" + rid1);
//	log.info("deleteReply1POST......" + rid1);
//       
//	reply1service.deleteReply1(rid1);
//	
//	return "redirect:/board/boarddetail?bid=" + bid;
//}
  
//    @RequestMapping(value = "/reply1delete", method = RequestMethod.POST)
//    public ModelAndView deleteReply1POST(@RequestParam int rid1, @RequestParam int bid) {
//    	
//    	System.out.println(bid);
//    	System.out.println("댓글삭제 컨트롤러" + rid1);
//    	log.info("deleteReply1POST......" + rid1);
//    	
//    	reply1service.deleteReply1(rid1);
//    	
//    	ModelAndView mav = new ModelAndView("redirect:/board/boarddetail?bid=" + bid);
//    	
//    	return mav;
//    }
    
    
	
}
