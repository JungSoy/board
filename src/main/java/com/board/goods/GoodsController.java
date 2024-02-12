package com.board.goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.board.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value="/goods")
@Controller
public class GoodsController {
	
	@Autowired
	GoodsService goodsService;

	//상품 목록 페이지 이동
	@RequestMapping(value = "/goodslist", method = RequestMethod.GET)
	public String goodsListGET(Model model, Criteria cri) {
		
		log.info("전체 상품 목록 진입");
		
		model.addAttribute("cri", cri);
		
		List<GoodsVO> goodslist = goodsService.getGoodsList(cri);
		model.addAttribute("goodslist", goodslist);
		
//			int total = goodsService.getTotal();
		
		model.addAttribute("cri", cri);
		
		return "goods/goodslist";
	}
	
	//상품 목록 ajax
	@GetMapping("/getGoodsList")
	@ResponseBody
	public Map<String, Object> getGoodsList(@RequestParam(defaultValue = "1") int pageNum, Model model, Criteria cri) {
		
		int amount = 6;
		model.addAttribute("amount", amount);
		model.addAttribute("cri", cri);
		
		List<GoodsVO> goodslist = goodsService.getGoodsList(cri);
		model.addAttribute("goodslist", goodslist);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("goodslist", goodslist);
		resultMap.put("cri", cri);
		
		log.info("상품목록----------" + resultMap);
		return resultMap;
	
	}
	
}
