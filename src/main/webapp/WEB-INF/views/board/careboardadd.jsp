<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
	

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">
<br>
					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">게시글 등록</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	
	<section class="py-5 text-center container"></section><br><br>
	
<body>
<div class="container">
	<div class="row form-group" ></div>
	 <form action="/careboardadd" id="enroll_form" method="post" enctype="multipart/form-data">
    <input type="hidden" id="userid" name="userid" value="${user.userid}" class="form-control"/>
   <%--  <span>이름 : ${user.userid}</span> --%>
        
           <div class="col-sm-6">
           <label for=cno class="form-label">카테고리</label>
			<select id="cno" name="cno">								
				<c:forEach var="cBcate" items="${careBoardCateList}">
					<option value="${cBcate.DID}">${cBcate.DNAME}</option>
				</c:forEach> 							
			</select>
				
<!-- 		  <select name="cno" id="cno"> -->
<!-- 		 	<option value="none" selected>=== 선택 ===</option> -->
<!-- 		    <option value="01">공지</option> -->
<!-- 		    <option value="02">유머</option> -->
<!-- 		    <option value="03">뉴스</option> -->
<!-- 		    <option value="04">정치</option> -->
<!-- 		    <option value="05">국제</option> -->
<!-- 		    <option value="06">사회</option> -->
<!-- 		  </select> -->
           </div> 
		<br>
		
		<div class="col-12">
		<label></label>
		</div>
		<div class="col-12">
             <label for="btitle" class="form-label">제목</label>
            <input type="text" class="form-control" id="btitle" name="btitle" required>
        </div>
	     <br>
        <div class="col-12">
            <label for="bcontent" class="form-label">내용 <span class="text-body-secondary"></span></label>
            <textarea class="form-control" id="bcontent" name="bcontent" onkeyup="fn_chk_byte(this);" required></textarea>
	            <div style="margin-top:20px;">
					<span id="messagebyte">0</span><span>/ 2000 Byte</span>
<!-- 					<button  type="button" onclick="javascript:sms_send();"> -->
<!-- 					</button> -->
				</div>
        </div>
        <br> 
       	<div class="form_section">
  			<div class="form_section_title">
  				<label>파일 첨부</label>
  			</div>
  			<div class="form_section_content">
				<input type="file" multiple="multiple" id ="fileItem" name="uploadFile" style="height: 30px;">
					<div id="uploadResult">
<!-- 						<div id="result_card"> -->
<!-- 							<div class="imgDeleteBtn">x</div> -->
<!-- 							<img src="/board/display?fileName=test.jpg"> -->
<!-- 						</div> -->
					</div>
  			</div>
  		</div>  
      
        <hr class="my-4">
	<br>
	<button type="submit" class="btn btn-secondary" style="float: right; margin-right: 5px;" onclick="location.href='/board/boardlist'">목록</button>
	<button type="button" class="btn btn-primary" style="float:right; margin-right: 5px;" onclick="fn_addtoBoard()" id="submitBtn">글 등록</button>
	</form>
</div>


<section class="py-5 text-center container"></section><br><br><br><br>


<script>

	// 글쓰기
	function fn_addtoBoard() {
	    // 입력 필드에서 제목과 글 내용 가져오기
	    var userid = document.getElementById("userid").value;
	    var title = document.getElementById("btitle").value;
	    var cno = document.getElementById("cno").value; 
	    var content = document.getElementById("bcontent").value;
	
	    // 제목과 글 내용이 비어있지 않으면 폼을 제출
	    if (userid.trim() !== "" && title.trim() !== "" && content.trim() !== "") {
	    	
	    	if (sms_send()) {
	
	        var form = document.getElementById("enroll_form");
	        form.action = "<c:url value='/board/careboardadd'/>";
	        form.submit();
	        
	    	}
	    }
	}
	
	//텍스트 byte 체크
	var limitByte = 2000;
	var totalByte = 0;
	
	function fn_chk_byte(obj){
	    totalByte = 0;
	    var message = $(obj).val();
	
	    for(var i =0; i < message.length; i++) {
	            var currentByte = message.charCodeAt(i);
	            if(currentByte > 128){
	            	totalByte += 2;
	            }else {
	            	totalByte++;
	            }
	    }
	
	    $("#messagebyte").text(totalByte);
	}
	
	function sms_send(){
		if(totalByte > 2000){
			alert(limitByte+"Byte 까지 전송가능합니다.");
			
			return false;
		}
		
		return true;
	}
	
	// 목록
	function fn_cancel() {
	    var form = document.getElementById("enroll_form");
	    form.action = "<c:url value='/board/careboard'/>";
	    form.submit();
	}
	
	// 입력 필드 값 변경 감지 및 버튼 상태 변경
	var submitBtn = document.getElementById("submitBtn");
	var titleInput = document.getElementById("btitle");
	var contentInput = document.getElementById("bcontent");
	
	titleInput.addEventListener("input", checkInput);
	contentInput.addEventListener("input", checkInput);
	
	function checkInput() {
	    // 입력 필드에 내용이 있으면 버튼 활성화
	    if (titleInput.value.trim() !== "" && contentInput.value.trim() !== "") {
	        submitBtn.disabled = false;
	    } else {
	        submitBtn.disabled = true;
	    }
	}
	
	//파일 업로드
	$("input[type='file']").on("change", function(e){
		var formData = new FormData();
		var fileInput = $('input[name="uploadFile"]');
		var fileList = fileInput[0].files;
		var fileObj = fileList[0];
	
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
	// 	formData.append("uploadFile", fileObj); //파일 한개만 업로드 가능 
	
		for(let i = 0; i < fileList.length; i++){
			console.log(fileList[i]);
			formData.append("uploadFile", fileList[i]); //파일 여러개 가능 
		}
		$.ajax({
			url: '/board/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("업로드 가능한 파일 형식이 아닙니다.");
	    	}
		});	
	// 	console.log("fileList : " + fileList);
	// 	console.log("fileObj : " + fileObj);
	// 	console.log("fileName : " + fileObj.name);
	// 	console.log("fileSize : " + fileObj.size);
	// 	console.log("fileType(MimeType) : " + fileObj.type);
		
		
	});
	
	//파일 체크
	var regex = new RegExp("(.*?)\.(jpg|png|jpeg|doc|docx|txt|pdf|zip)$"); //RegExp : 정규표현식 객체
	var maxSize = 3 * 1024 * 1024; // 3MB
	
	function fileCheck(fileName, fileSize){
	
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	//이미지 출력 
	function showUploadImage(uploadResultArr){
		
		//전달받은 데이터 검증 
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);	
		
		str += "<div id='result_card'>";
		str += "<img src='/board/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='fileList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='fileList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='fileList[0].uploadPath' value='"+ obj.uploadPath +"'>";	
		str += "</div>";		
		
			uploadResult.append(str);     
	}
	
		//파일 삭제
		function deleteFile(){
			
			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url: '/board/deleteFile',
				data : {fileName : targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					
					targetDiv.remove();
					$("input[type='file']").val("");
					
				},
				error : function(result){
					console.log(result);
					
					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
		
		//이미지 삭제 버튼 동작 
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			
			deleteFile();
			
		});
	
</script>
 
<%@ include file="/WEB-INF/footer.jsp"%>