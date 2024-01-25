package com.board.user;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping(value="/user")
@Slf4j
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void loginGET() {
		
		log.info("회원가입 페이지 진입");
		
	}
	
	//회원가입 로직(비번 암호화 적용)
	//회원정보 담긴 uvo -> uvo에 저장된 비번 꺼냄 -> encode() 메서드를 통해 꺼낸 비번 인코딩 
	//-> 인코딩 된 비번을 uvo 객체에 다시 저장 -> joinUser(uvo)를 호출하여 회원가입 쿼리 실행
	
	//회원가입
		@RequestMapping(value="/join", method=RequestMethod.POST)
		public String joinPOST(UserVO uvo) throws Exception{
			
			//비번 인코딩 적용 코드
			String rawPw = "";		//인코딩 전 비번
			String encodePw = "";	//인코딩 후 비번
			
			rawPw = uvo.getPw();				//비번 데이터 얻음
			encodePw = pwEncoder.encode(rawPw);	//비번 인코딩
			uvo.setPw(encodePw);				//인코딩된 비번 uvo 객체에 다시 저장
					
			userService.joinUser(uvo);			//회원가입 쿼리 실행
			
//			//기존 코드
//			log.info("join 진입");
//			
//			// 회원가입 서비스 실행
//			userService.joinUser(uvo);
//			
//			log.info("join Service 성공");
			
			return "redirect:/main";
			
		}
	
		// 아이디 중복 검사
		@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String userIdChkPOST(String userid) throws Exception{
			
			log.info("userIdChkPOST 진입");
			
			int result = userService.idCheck(userid);
			log.info("아이디 = " + userid);
			log.info("결과값 = " + result);
			
			if(result != 0) {
				
				return "fail";	// 중복 아이디가 존재
				
			} else {
				
				return "success";	// 중복 아이디 x
				
			}	
		}
		
		//회원가입 메일 인증
		@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	    public void sendMailTest() throws Exception{
	        
	        String subject = "test 메일";
	        String content = "메일 테스트 내용";
//	        String content = "메일 테스트 내용" + "<img src=\"이미지 경로\">"; //이미지 첨부
	        String from = "jmailtest22@gmail.com";
	        String to = "jungsoyy@gmail.com";
	        
	        try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8"); // true는 멀티파트 메세지를 사용하겠다는 의미
	            
	            /*
	             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
	             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	             */
	            
	            mailHelper.setFrom(from);
	            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
	            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
	            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
	            mailHelper.setTo(to);
	            mailHelper.setSubject(subject);
	            mailHelper.setText(content, true); // true는 html을 사용하겠다는 의미입니다.
	            
	            //업로드 파일 전송시 추가 코드
//	            FileSystemResource file = new FileSystemResource(new File("경로\업로드할파일.형식")); 
//	            helper.addAttachment("업로드파일.형식", file);

	            
	            /*
	             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
	             */
	            
	            mailSender.send(mail);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	    }
		
		//메일 인증번호 발송
		@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	    @ResponseBody
	    public String mailCheckGET(String uemail) throws Exception{
	        
	        log.info("이메일 데이터 전송 확인");
	        log.info("인증번호 : " + uemail);
	        
	        // 인증번호(난수) 생성 
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        log.info("인증번호 : " + checkNum);
	 
	        //이메일 보내기 
	        String setFrom = "jmailtest22@gmail.com";
	        String toMail = uemail;
	        String title = "회원가입 인증 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	 
	        try {
	            //이메일 전송하는 코드
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        String num = Integer.toString(checkNum);
	        
	        return num;
	    }
		
		// 로그인 
	    @RequestMapping(value="login.do", method=RequestMethod.POST)
	    public String loginPOST(HttpServletRequest request, UserVO uvo, RedirectAttributes rttr) throws Exception{
	        
//	        System.out.println("login 메서드 진입");
//	        System.out.println("전달된 데이터 : " + uvo);
	        
	    	//인코딩 적용 후 로그인
	    	HttpSession session = request.getSession();
	    	String rawPw = "";
	    	String encodePw = "";
	    	
	    	UserVO lvo = userService.loginUser(uvo);	//제출한아이디와 일치하는 아이디있는지 
	        
	        if(lvo != null) {            //일치하는 아이디 존재시
	            
	        	rawPw = uvo.getPw();	//사용자가 제출한 비번
	        	encodePw = lvo.getPw();	//DB에 저장한 인코딩된 비번
	        	
	        	if(true == pwEncoder.matches(rawPw, encodePw)) {        //비밀번호 일치여부 판단
	        		 lvo.setPw("");                    // 인코딩된 비밀번호 정보 지움, 굳이 비번 노출시킬 필요 없기 때문
	                 session.setAttribute("user", lvo);     // session에 사용자의 정보 저장
	                 return "redirect:/main";        // 메인페이지 이동
	                 
	        	} else {
	        		rttr.addFlashAttribute("result", 0);
		        	return "redirect:/user/login";
	        	}
	        	
	        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
	            
	        	rttr.addFlashAttribute("result", 0);
	        	return "redirect:/user/login";
	        }
	
	    	
//			//기존 로그인
//	        HttpSession session = request.getSession();
//	        UserVO lvo = userService.loginUser(uvo);
//	        
//	        if(lvo == null) {           //일치하지 않는 아이디, 비번 입력한 경우                     
//	            
//	            int result = 0;
//	            rttr.addFlashAttribute("result", result);
//	            return "redirect:/user/login";
//	            
//	        }
//	        
//	        session.setAttribute("user", lvo);	//일치하는 아이디, 비번 입력한 경우(로그인 성공)
//	        
//	        return "redirect:/main";
	    }
		
		//로그인 페이지 이동
		@RequestMapping(value = "login", method = RequestMethod.GET)
		public void joinGET() {
			
			log.info("로그인 페이지 진입");
			
		}
		
		//비동기방식 로그아웃 메서드 
	    @RequestMapping(value="logout", method=RequestMethod.POST)
	    @ResponseBody
	    public void logoutPOST(HttpServletRequest request) throws Exception{
	        
	        log.info("비동기 로그아웃 메서드 진입");
	        
	        HttpSession session = request.getSession();
	        
	        session.invalidate();
	        
	    }
	    
		
//		//로그아웃
//		@RequestMapping(value="logout", method=RequestMethod.GET)
//	    public String logoutMainGET(HttpServletRequest request) throws Exception{
//		   log.info("logoutMainGET 진입");
//	        
//	        HttpSession session = request.getSession();
//	        
//	        //세션삭제
//	        session.invalidate();
//	        
//	        return "redirect:/main";
//	    }
}
