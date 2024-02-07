<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<style>
/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}
	
	/* 유효성 검사 문구 */
 
	.final_id_ck{
	    display: none;
	}
	.final_pw_ck{
	    display: none;
	}
	.final_pwck_ck{
	    display: none;
	}
	.final_name_ck{
	    display: none;
	}
	.final_phone_ck{
	    display: none;
	}
	.final_mail_ck{
	    display: none;
	}
	.final_addr_ck{
	    display: none;
	}
	
	/* 비밀번호 확인 일치 유효성검사 */
	.pwck_input_re_1{
	        color : green;
	        display : none;    
	}
	.pwck_input_re_2{
	        color : red;
	        display : none;    
	}   
</style>  

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">
					<br>
					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">마이페이지</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	
	<section class="py-5 text-center container"></section><br><br><br>
	
<!-- Tab panes -->
									<div class="tab-content">
									 <div role="tabpanel" class="tab-pane active" id="hotels">
									 	<div class="row">
									 	<form id="join_form" method="post">
											<div class="col-xxs-12 col-xs-12 mt">
												<div class="input-field">
													<label for="from">ID:</label>
													<input type="text" name="userid" class="id_input form-control" id="from-place" placeholder="ID"/>
												</div>
												<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
												<span class="id_input_re_2">이미 존재하는 아이디입니다.</span>
												<span class="final_id_ck">아이디를 입력해주세요.</span>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-start">PW:</label>
													<input type="text" name="pw" class="form-control" id="from-place" placeholder="PW"/>
												</div>
												<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
												<span class="pwd_blank1"></span>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-end">PW Check:</label>
													<input type="text" name="pwck" class="form-control" id="from-place" placeholder="PW Check"/>
												</div>
												<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
												<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                								<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                								<span class="pwdck_blank"></span>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-start">NAME:</label>
													<input type="text" name="uname" class="form-control" id="from-place" placeholder="NAME"/>
												</div>
												<span class="final_name_ck">이름을 입력해주세요.</span>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-end">PHONE:</label>
													 <input type="text" id="txtPhone" name="phone" class="form-control" value="" maxlength="13" placeholder="0 0 0 - 0 0 0 0 - 0 0 0 0 0" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}"/>
<!-- 													<input type="text" name="phone" class="form-control" id="from-place" placeholder="PHONE"/> -->
												</div>
												<span class="final_phone_ck">전화번호를 입력해주세요.</span>
											</div>
											<br>
											<br>
											<div class="col-xxs-12 col-xs-12 mt">
												<div class="input-field">
													<label for="from">Email:</label>
													<input type="text" name="uemail" class="form-control" id="from-place" placeholder="Email"/>
												</div>
												<span class="final_mail_ck">이메일을 입력해주세요.</span>
												<sapn class="mail_input_box_warn"></sapn>
											</div>
										<div class="mail_check_wrap">
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<div class="mail_check_input_box" id="mail_check_input_box_false">
														<input class="form-control" id="mail_check_input" disabled>
													</div>
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<input type="button" class="btn btn-primary btn-block"  id="mail_check_button" value="인증번호 전송">
												</div>
												<span id="mail_check_input_box_warn"></span>
											</div>
										</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
													<label for="date-start">ADDRESS:</label>
													<input type="text" name="addr1" class="form-control" id="from-place" placeholder="ADDRESS" readonly/>
												</div>
											</div>
											<div class="col-xxs-12 col-xs-6 mt alternate">
												<div class="input-field">
												<div class="address_button" onclick="execution_daum_address()">
													<label for="date-end"> <!-- 주소검색 버튼 --> </label>
														<input type="button" class="btn btn-primary btn-block" value="주소 찾기">
													</div>
												</div>
											</div>
											<div class="col-xxs-12 col-xs-12 mt">
												<div class="input-field">
													<input type="text" name="addr2" class="form-control" id="from-place" readonly/>
												</div>
											</div>
											<div class="col-xxs-12 col-xs-12 mt">
												<div class="input-field">
													<input type="text" name="addr3" class="form-control" id="from-place" readonly/>
												</div>
												<span class="final_addr_ck">주소를 입력해주세요.</span>
											</div>
											<div class="col-xs-12">
												<input type="submit" class="btn btn-primary btn-block" value="Join">
											</div>
										</form>
									</div>
								 </div>
								</div>
<section class="py-5 text-center container"></section><br><br><br><br>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	var code = "";	//이메일 전송 인증번호 저장 코드
	
	 // 유효성 검사 통과유무 변수
	 var idCheck = false;            // 아이디
	 var idckCheck = false;            // 아이디 중복 검사
	 var pwCheck = false;            // 비번
	 var pwckCheck = false;            // 비번 확인
	 var pwckcorCheck = false;        // 비번 확인 일치 확인
	 var nameCheck = false;            // 이름
	 var phoneCheck = false;
	 var mailCheck = false;            // 이메일
	 var mailnumCheck = false;        // 이메일 인증번호 확인
	 var addressCheck = false         // 주소
	 
	 
	$(document).ready(function(){
		
		//전화번호 입력 형식
		  $("#txtPhone").on("input", function(event) {
                inputPhoneNumber($(this));
            });
		
		//회원가입 버튼(회원가입 기능 작동)
		$(".join_button").click(function(){
			
			// 입력값 변수 
	        var id = $('input[name="userid"]').val();	// id 입력란
	        var pw = $('input[name="pw"]').val();		// 비밀번호 입력란
	        var pwck = $('input[name="pwck"]').val();	// 비밀번호 확인 입력란
	        var name = $('input[name="uname"]').val();	// 이름 입력란
	        var phone = $('input[name="phone"]').val();	// 전화번호 입력란
	        var mail = $('input[name="uemail"]').val();	// 이메일 입력란
	        var addr = $('input[name="addr3"]').val();	// 주소 입력란
	        var pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; //비밀번호 유효성 검사
	        
	        // 아이디 유효성검사 
	        if(id == ""){
	            $('.final_id_ck').css('display','block');
	            idCheck = false;
	        }else{
	            $('.final_id_ck').css('display', 'none');
	            idCheck = true;
	        }
	        
	        // 비밀번호 유효성 검사 
	        if(pw == ""){
	            $('.final_pw_ck').css('display','block');
	            pwCheck = false;
	        }else if(!pwdCheck.test($('input[name="pw"]').val())){
	        	 $("#pwd_blank").css("color", "red");
			     $("#pwd_blank").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
			     password = false;
	        }else{
	            $('.final_pw_ck').css('display', 'none');
	            pwCheck = true;
	        }
	        
	        // 비밀번호 확인 유효성 검사  
	        if(pwck == ""){
	            $('.final_pwck_ck').css('display','block');
	            pwckCheck = false;
	        }else{
	        	$('.final_pwck_ck').css('display', 'none');
	            pwckCheck = true;
	        }
	        
	        // 이름 유효성 검사 
	        if(name == ""){
	            $('.final_name_ck').css('display','block');
	            nameCheck = false;
	        }else{
	            $('.final_name_ck').css('display', 'none');
	            nameCheck = true;
	        }
	 
	        // 이메일 유효성 검사 
	        if(mail == ""){
	            $('.final_mail_ck').css('display','block');
	            mailCheck = false;
	        }else{
	            $('.final_mail_ck').css('display', 'none');
	            mailCheck = true;
	        }
	        
	        // 주소 유효성 검사 
	        if(addr == ""){
	            $('.final_addr_ck').css('display','block');
	            addressCheck = false;
	        }else{
	            $('.final_addr_ck').css('display', 'none');
	            addressCheck = true;
	        }
	        
	        // 최종 유효성 검사 
	        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){
				$("#join_form").attr("action", "/user/join");
				$("#join_form").submit();
	        } 
	        	return false;
			
		});
	});

	//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function(){

// 		console.log("keyup 테스트");	
	
		var userid = $('.id_input').val();			// .id_input에 입력되는 값
		var data = {"userid" : userid}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		
		console.log('아이디: ' + userid);
		
		$.ajax({
			type : "post",
			url : "/user/userIdChk",
			data : data,
			success : function(result){
				
				console.log("성공 여부" + result);
				
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");			
					idckCheck = true; //아이디 중복이 없는 경우
					
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");				
					idckCheck = false; //아이디 중복된 경우 
				}
			}
		}); 
	});
	
	//전화번호 입력형식
	  function inputPhoneNumber($phone) {
		
            if (event.keyCode !== 8) {  // 백스페이스 키가 아닌 경우
                const regExp = /^[0-9|-]*$/;
                
                if (regExp.test($phone.val())) {
                    const number = $phone.val().replace(/[^0-9]/g, "");
                    const tel = formatPhoneNumber(number);
                    $phone.val(tel);
                } else {
                    const regExp = /[^0-9|-]*$/;
                    $phone.val($phone.val().replace(regExp, ""));
                }
            }
        }

        function formatPhoneNumber(number) {
            let tel = "";
            const seoul = number.substring(0, 2) === "02" ? 1 : 0;
            
            if (number.length < (4 - seoul)) {
                return number;
            } else if (number.length < (7 - seoul)) {
                tel += number.substr(0, 3 - seoul) + "-";
                tel += number.substr(3 - seoul);
            } else if (number.length < (11 - seoul)) {
                tel += number.substr(0, 3 - seoul) + "-";
                tel += number.substr(3 - seoul, 3) + "-";
                tel += number.substr(6 - seoul);
            } else {
                tel += number.substr(0, 3 - seoul) + "-";
                tel += number.substr(3 - seoul, 4) + "-";
                tel += number.substr(7 - seoul);
            }

            return tel;
        }
        
	// 인증번호 이메일 전송 
	$("#mail_check_button").click(function(){
	   
		var email = $('input[name="uemail"]').val();
		var checkkBox = $("#mail_check_input");        // 인증번호 입력란
	    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
	    var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
	    
	    /* 이메일 형식 유효성 검사 */
	    if(mailFormCheck(email)){
	        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	        warnMsg.css("display", "inline-block");
	    } else {
	        warnMsg.html("올바르지 못한 이메일 형식입니다.");
	        warnMsg.css("display", "inline-block");
	        return false; //false 반환하여 if문 다음 코드인 ajax가 실행되지 않고 이메일 전송 메서드 벗어남
	    }    
	    
		$.ajax({
	        
	        type:"GET",
	        url:"/user/mailCheck?uemail=" + email,
	        success: function(data){
	        	
	        	console.log("data: " + data);
	        	checkkBox.attr("disabled", false);
	        	boxWrap.attr("id", "mail_check_input_box_true");
	        	code = data;
	        }
	    });
	});	    
		
	/* 인증번호 비교 */
	$("#mail_check_input").blur(function(){
	    
		var inputCode = $("#mail_check_input").val();        // 입력코드    
	    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
	    
	    if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");        
	        mailnumCheck = true;     // 일치할 경우

	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        mailnumCheck = false;    // 일치하지 않을 경우
	    }    
	    
	});
	
	//다음 주소 api 연동 
	function execution_daum_address(){
		 new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                  
	                    // 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
	   	                
	                } else {
	                	addr += ' ';
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            $("[name=addr1]").val(data.zonecode);    
		            $("[name=addr2]").val(addr);            
					
		            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동
		            $("[name=addr3]").attr("readonly",false);
		             $("[name=addr3]").focus();
		        }
		    }).open();    
	}
	 
	//비밀번호 확인 일치 유효성 검사 
	$('input[name="pwck"]').on("propertychange change keyup paste input", function(){
	
		var pw = $('input[name="pw"]').val();
	    var pwck = $('input[name="pwck"]').val();
	    $('.final_pwck_ck').css('display', 'none');
	    
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    }        
	    
	});

	// 입력 이메일 형식 유효성 검사 
	function mailFormCheck(email){
		
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(email); //test는 javascript제공 메서드(eamil이 정규표현식 form과 일치하는 지 여부 확인 boolean)
	 
	}
	
</script>
<%@ include file="/WEB-INF/footer.jsp"%>
