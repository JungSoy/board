package com.board.board;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.category.CategoryService;
import com.board.category.CategoryVO;
import com.board.reply1.Reply1VO;
import com.board.reply2.Reply2VO;
import com.board.user.UserVO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@RequestMapping(value="/board")
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	CategoryService categoryService;

	//게시글 등록 페이지 이동
	@RequestMapping(value = "/boardadd", method = RequestMethod.GET)
		public String addBoardGET(Model model) {
			
			log.info("게시글 등록 페이지 진입");
			 List<Map<String, Object>> boardCate = boardService.getBoardCate(); // getBoardCate() 메서드로 카테고리 목록을 가져옵니다.
			model.addAttribute("boardCateList", boardCate);// JSP로 카테고리 목록을 전달합니다.
			log.info("게시판 카테고리 " + boardCate);
				
			return "board/boardadd";
		
		}
	
    
    //게시글 등록
       @RequestMapping(value="/boardadd", method = RequestMethod.POST)
   	public String addBoardPOST(BoardVO bvo, HttpServletRequest request, Model model) throws Exception {
   		
       	log.info("addBoardPOST......" + bvo);
       
       	HttpSession session = request.getSession();
   		UserVO uvo = (UserVO)session.getAttribute("user");
       	
   		if(uvo == null) {
   			return "/user/login";
   		}
   		
   		boardService.addBoard(bvo);
   		

   		return "redirect:/board/boardlist";   		
   		
   		
   		
//   		//session에 저장된 userid를 userid(bwriter)로 저장
//   		String userid = (String) session.getAttribute("userid");
//   	        
//   		System.out.println("세션 아이디 : " + userid);
//   		
//   		session.setAttribute("userid", userid);
//   		bvo.setUserid(userid);
//   	   
//   		boardService.addBoard(bvo);
   	        
//   		  Map<String, Object> paramMap = new HashMap<>();
//   	        paramMap.put("userid", userid);
//   	        paramMap.put("btitle", bvo.getBtitle());
//   	        paramMap.put("bcontent", bvo.getBcontent());
//   	        paramMap.put("cno", bvo.getCno());
//   		rttr.addFlashAttribute("addBoard_result", bvo.getBid());
   		
//   		return "redirect:/board/boardlist";
   	}	
    
    /* 게시판 목록 페이지 접속 */
//    @GetMapping("/boardlist")
//    public String boardListGET(Model model) {
//        
//        log.info("게시판 목록 페이지 진입");
//        
//        model.addAttribute("boardlist", boardService.getList());
//        
//        return "board/boardlist";
//    }
    
    /* 게시판 목록 페이지 접속 (페이징 적용)*/
    @GetMapping("/boardlist")
    public String boardListGET(Model model, Criteria cri) {
        
        log.info("게시판 목록 페이지 진입");

        log.info("cri : " +cri);
        
        List<BoardVO> boardlist = boardService.getListPaging(cri);
        model.addAttribute("boardlist", boardlist);
        
        // 검색 조건을 유지하기 위해 필요한 데이터 전달
        model.addAttribute("cri", cri);
        
        //후)카테고리
        List<Map<String, Object>> boardCate = boardService.getBoardCate(); // getBoardCate() 메서드로 카테고리 목록을 가져옵니다.
		model.addAttribute("boardCateList", boardCate);// JSP로 카테고리 목록을 전달합니다.
		
		log.info("카테고리리스트" + boardCate);

//기존 카테고리(category테이블)        
//        List<CategoryVO> categorylist = boardService.getListCate(); // getCategoryList() 메서드로 카테고리 목록을 가져옵니다.
//        model.addAttribute("categorylist", categorylist); // JSP로 카테고리 목록을 전달합니다.
//        log.info("카테고리리스트" + categorylist);

//카테고리별        model.addAttribute("catepaginglist", boardService.getCatePaging(cri));
//        model.addAttribute("categorylist", categoryService.getListCate());
        
//        CategoryVO cvo = new CategoryVO();
//        model.addAttribute("categorylist", cvo);
        
        int total = boardService.getTotal(cri);
        
        PageMakeVO pageMake = new PageMakeVO(cri, total);
 
        model.addAttribute("pageMake", pageMake);
        
        System.out.println(pageMake);
        
		return "/board/boardlist";
        
    
     }
    
  //ajax 게시판 목록(json)
    @RequestMapping(value="/getboardlist", method=RequestMethod.GET)
    @ResponseBody // JSON 데이터를 반환
    public Map<String, Object> getBoardList(@RequestParam(defaultValue = "1") int pageNum, Model model, Criteria cri) {

    	//전)카테고리 데이터
//	   List<CategoryVO> categorylist = boardService.getListCate(); 
//	   model.addAttribute("categorylist", categorylist); 

//    	//후)자유 카테고리 데이터
//    	List<Map<String, Object>> boardCate = boardService.getBoardCate(); // getBoardCate() 메서드로 카테고리 목록을 가져옵니다.
//		model.addAttribute("boardCateList", boardCate);// JSP로 카테고리 목록을 전달합니다.
//		
//		//케어 카테고리 목록
//		List<Map<String, Object>> careBoardCate = boardService.geCaretBoardCate();
//		model.addAttribute("careBoardCateList", careBoardCate);
//		
		
	   List<BoardVO> boardlist = boardService.getListPaging(cri);
	   model.addAttribute("boardlist", boardlist);
	   
	   model.addAttribute("cri", cri);
	
	   int total = boardService.getTotal(cri);

	   PageMakeVO pageMake = new PageMakeVO(cri, total);
	   model.addAttribute("pageMake", pageMake);
	   
	   Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("boardlist", boardlist);
	    resultMap.put("pageMake", pageMake);
	    resultMap.put("cri", cri);
//	    resultMap.put("boardCateList", boardCate);
//	    resultMap.put("careBoardCateList", careBoardCate);
	    
	    return resultMap;
    	
    }

    //게시글 목록 엑셀 다운
    @RequestMapping("/excelDown")
    public void excelDownload(HttpServletResponse response, @ModelAttribute("cri")Criteria cri) throws IOException{
    	XSSFWorkbook wb=null;
    	Sheet sheet=null;
    	Row row=null;
    	Cell cell=null; 
    	wb = new XSSFWorkbook();
    	sheet = wb.createSheet("freeBoard");
    	
    	List<BoardVO> excelBoardList=boardService.getExcelList(cri);
    	log.info("엑셀다운컨트롤러"+excelBoardList);
    	log.info("cri...." + cri);
    	
    	//첫행   열 이름 표기 
    	int cellCount=0;
    	row = sheet.createRow(0); //0번째 행
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("번호");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("작성자");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("카테고리");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("제목");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("작성일");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("수정일");
    	cell=row.createCell(cellCount++);
    	
    	for(int i=0; i < excelBoardList.size() ; i++  ) {
    		row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
    		cellCount=0; //열 번호 초기화
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getBid());
    		cell=row.createCell(cellCount++); 
    		cell.setCellValue(excelBoardList.get(i).getUserid());
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getDname());
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getBtitle());
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getBregdate());
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getBupdate());
    		cell=row.createCell(cellCount++);
    		
    	}
    	
    	// 컨텐츠 타입과 파일명 지정
    	response.setContentType("ms-vnd/excel");
    	response.setHeader("Content-Disposition", "attachment;filename=boardExcelDown.xlsx");  //파일이름지정.
    	//response OutputStream에 엑셀 작성
    	wb.write(response.getOutputStream());
    }
    
  	//케어 게시판 : 게시글 등록 페이지 이동
  	@RequestMapping(value = "/careboardadd", method = RequestMethod.GET)
	public String addCareBoardGET(Model model) {
		
		log.info("게시글 등록 페이지 진입");
		
		List<Map<String, Object>> careBoardCate = boardService.geCaretBoardCate();
		model.addAttribute("careBoardCateList", careBoardCate);
		log.info("케어 카테고리리스트" + careBoardCate);
		
		return "board/careboardadd";
	
	}

  
	//케어 게시판 : 게시글 등록
	@RequestMapping(value="/careboardadd", method = RequestMethod.POST)
	public String addCareBoardPOST(BoardVO bvo, HttpServletRequest request, Model model) throws Exception {
 		
     	log.info("addCareBoardPOST......" + bvo);
     
     	HttpSession session = request.getSession();
 		UserVO uvo = (UserVO)session.getAttribute("user");
     	
 		if(uvo == null) {
 			return "/user/login";
 		}
 		
 		boardService.addBoard(bvo);
 		

 		return "redirect:/board/careboard";   		
 		
     }
     		
    // 케어 게시판 : 무한스크롤 - 게시판 목록 페이지 접속 (페이징 적용)
    @GetMapping("/careboard")
    public String careboardGET(Model model, Criteria cri) {
        
        log.info("케어 게시판 목록 페이지 진입");

        log.info("cri : " +cri);
        
        List<BoardVO> boardlist = boardService.getCareList(cri);
        model.addAttribute("boardlist", boardlist);
        
        List<Map<String, Object>> careBoardCate = boardService.geCaretBoardCate();
		model.addAttribute("careBoardCateList", careBoardCate);
		
		log.info("케어 카테고리리스트" + careBoardCate);
		
        // 검색 조건을 유지하기 위해 필요한 데이터 전달
        model.addAttribute("cri", cri);

        int total = boardService.getTotal(cri);
        
		return "/board/careboard";
    
     }
    
  //케어 게시판 : ajax 게시판 목록(json)
    @RequestMapping(value="/getcarelist", method=RequestMethod.GET)
    @ResponseBody // JSON 데이터를 반환
    public Map<String, Object> getCareList(@RequestParam(defaultValue = "1") int pageNum, Model model, Criteria cri) {

	   List<BoardVO> boardlist = boardService.getCareList(cri);
	   model.addAttribute("boardlist", boardlist);
	   
	   model.addAttribute("cri", cri);
	
//	   int total = boardService.getTotal(cri);
//
//	   PageMakeVO pageMake = new PageMakeVO(cri, total);
//	   model.addAttribute("pageMake", pageMake);
	   
	   Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("boardlist", boardlist);
//	    resultMap.put("pageMake", pageMake);
	    resultMap.put("cri", cri);
//	    resultMap.put("boardCateList", boardCate);
//	    resultMap.put("careBoardCateList", careBoardCate);
	    
	    return resultMap;
    	
    }

    //케어 게시판 : 게시글 목록 엑셀 다운
    @RequestMapping("/cardExcelDown")
    public void careExcelDownload(HttpServletResponse response, @ModelAttribute("cri")Criteria cri) throws IOException{
    	XSSFWorkbook wb=null;
    	Sheet sheet=null;
    	Row row=null;
    	Cell cell=null; 
    	wb = new XSSFWorkbook();
    	sheet = wb.createSheet("careBoard");
    	
    	List<BoardVO> excelBoardList=boardService.getExcelCareList(cri);
    	log.info("엑셀다운컨트롤러"+excelBoardList);
    	log.info("cri...." + cri);
    	
    	//첫행   열 이름 표기 
    	int cellCount=0;
    	row = sheet.createRow(0); //0번째 행
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("번호");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("작성자");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("카테고리");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("제목");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("작성일");
    	cell=row.createCell(cellCount++);
    	cell.setCellValue("수정일");
    	cell=row.createCell(cellCount++);
    	
    	for(int i=0; i < excelBoardList.size() ; i++  ) {
    		row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
    		cellCount=0; //열 번호 초기화
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getBid());
    		cell=row.createCell(cellCount++); 
    		cell.setCellValue(excelBoardList.get(i).getUserid());
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getDname());
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getBtitle());
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getBregdate());
    		cell=row.createCell(cellCount++);
    		cell.setCellValue(excelBoardList.get(i).getBupdate());
    		cell=row.createCell(cellCount++);
    		
    	}
    	
    	// 컨텐츠 타입과 파일명 지정
    	response.setContentType("ms-vnd/excel");
    	response.setHeader("Content-Disposition", "attachment;filename=boardExcelDown.xlsx");  //파일이름지정.
    	//response OutputStream에 엑셀 작성
    	wb.write(response.getOutputStream());
    }
    
    

    //게시판 상세조회 -- 어려움...
    @GetMapping("/boarddetail")
    public void boardGetPageGET(int bid, Model model) {
        //주게시물 조회
        model.addAttribute("pageInfo", boardService.getOne(bid));
        
//        //첨부파일 조회
//        List<FileVO> flist = boardService.getFileById(bid);
//        	model.addAttribute("flist", flist);
        
        //댓글 & 대댓글 조회
    	List<Reply1VO> list = boardService.getReplyById(bid); //댓글 list
		int cnt = list.size();
		model.addAttribute("reply1List",list);
		model.addAttribute("cnt", cnt);
		
		List<Map<String, Object>> reply2list = new ArrayList<Map<String, Object>>(); //댓글 + 댓글에 해당하는 대댓글 = 전체 list
		for(Reply1VO vo : list) { //댓글 list 출력 반복문
			
			List<Reply2VO> list2 = boardService.getReply2ById(vo.getRid1()); //대댓글 list / vo.getRid1() : 댓글id 가져옴
			
			if(list2.size() > 0) { //대댓글 있으면(=size > 0) 
				Map<String, Object> map = new HashMap<String, Object>(); //map은 객체로 저장하므로 외부에서도 볼 수 있음
				//map = [ {rid1, list2=[]}, {rid1, list2 =[]} ]
				map.put("rid1", vo.getRid1()); //list는 외부에서 rid1가 뭔지 바로 안보여서 까봐야 함. 따라서 map 사용 
				map.put("list2", list2); //대댓글 list도 map 저장
				map.put("cnt2", list2.size()); // 대댓글 갯수

				  
				reply2list.add(map); //전체 list에 map 담기
			}
		}
		
		if(reply2list.size()>0 ) {
			model.addAttribute("reply2list", reply2list);
		}
		
		log.info("댓글조회........" + list);
		log.info("댓글 & 대댓글 조회......." + reply2list);
		
//		//대댓글 조회
//		model.addAttribute("reply2List",list2);
//		
//		log.info("댓글조회" + list2);
		
    }
    
    //첨부파일 조회
	@GetMapping(value="/getFileById", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<FileVO>> getFileById(int bid){
		
		log.info("getFileById.........." + bid);
		
		return new ResponseEntity<List<FileVO>>(boardService.getFileById(bid), HttpStatus.OK);
		
	}
    
    /* 수정 페이지 이동 */
    @GetMapping("/boardmodify")
    public void boardModifyGET(int bid, Model model) {
        
        model.addAttribute("pageInfo", boardService.getOne(bid));
        
    }
			
    /* 페이지 수정 */
    @PostMapping("/boardmodify")
    public String boardModifyPOST(BoardVO bvo, RedirectAttributes rttr) {
        
    	boardService.modifyBoard(bvo);
        
       rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/board/boardlist";
        
    }
    
    /* 페이지 삭제 */
    @PostMapping("/boarddelete")
    public String boardDeletePOST(BoardVO bvo, RedirectAttributes rttr) {

    	log.info("deleteBoardPOST......" + bvo);
        
        boardService.deleteBoard(bvo);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/board/boardlist";
    }
    
    //로그인 체크
	public boolean loginChk(HttpServletRequest request) {

		  HttpSession session = request.getSession();
		  
		  return session.getAttribute("userid") != null;
	}
    
	//파일 업로드(어렵..)
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<FileVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		// 이미지 파일 체크 
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<FileVO> flist = null;
				return new ResponseEntity<>(flist, HttpStatus.BAD_REQUEST);
				
			}
			
		}
		
		log.info("uploadAjaxActionPOST..........");

		String uploadFolder = "C:\\upload";
		
		//날짜별 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);

		//폴더 생성
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		// 파일 정보 담는 객체 
		List<FileVO> flist = new ArrayList<FileVO>();
		
		for(MultipartFile multipartFile : uploadFile) {

			//파일 정보 객체
			FileVO fvo = new FileVO();
			
			// 파일 이름 
			String uploadFileName = multipartFile.getOriginalFilename();			
			fvo.setFileName(uploadFileName);
			fvo.setUploadPath(datePath);
			
			// uuid 적용 파일 이름 
			String uuid = UUID.randomUUID().toString();
			fvo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			// 파일 위치, 파일 이름을 합친 File 객체 
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 파일 저장 
			try {
				multipartFile.transferTo(saveFile);
				
				//썸네일 방법2
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
			flist.add(fvo);
			
		} //for문 끝

		ResponseEntity<List<FileVO>> result = new ResponseEntity<List<FileVO>>(flist, HttpStatus.OK);
		
		return result;
	}
	
	//파일 이미지 출력
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		log.info("getImage()........" + fileName);
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	//이미지 파일 삭제 
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		log.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			
			//썸네일 파일 삭제
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			//원본 파일 삭제 
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			log.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	

	
//	//썸네일 방법1
//	File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
//	
//	BufferedImage bo_image = ImageIO.read(saveFile);
//	
//		//비율 
//		double ratio = 3;
//		
//		//넓이 높이
//		int width = (int) (bo_image.getWidth() / ratio);
//		int height = (int) (bo_image.getHeight() / ratio);	
//	
//	BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
//
//	Graphics2D graphic = bt_image.createGraphics();
//	
//	graphic.drawImage(bo_image, 0, 0,width,height, null);
//		
//	ImageIO.write(bt_image, "jpg", thumbnailFile);
}
