package com.board.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.goods.GoodsService;
import com.board.goods.GoodsVO;
import com.board.user.UserService;
import com.board.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/")
@Controller
public class MainController {

	@Autowired
	UserService userService;
	
	@Autowired
	GoodsService goodsService;
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPageGET(Model model) {
		
		log.info("메인 페이지 진입");
		
		List<GoodsVO> newgoods = goodsService.getNewGoods();
		model.addAttribute("newgoods", newgoods);
		
		
		return "/main";
		
	}
		
	@GetMapping("/test")
	public String test(Model model) {
	  List<UserVO> list = userService.getUserList();	
	  model.addAttribute("userlist", list);
	  return "user/test";
	}
	
	@RequestMapping("")
	public String main() {
		return "/main";
	}
}
