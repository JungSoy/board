<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Insert title here</title>
    <style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
        a {
            text-decoration: none;
        }

        table {
            border-collapse: collapse;
            width: 1000px;
            margin-top: 20px;
            text-align: center;
        }

        td,
        th {
            border: 1px solid black;
            height: 50px;
        }

        th {
            font-size: 17px;
        }

        thead {
            font-weight: 700;
        }

        .table_wrap {
            margin: 50px 0 0 50px;
        }

        .bno_width {
            width: 12%;
        }

        .writer_width {
            width: 20%;
        }

        .regdate_width {
            width: 15%;
        }

        .updatedate_width {
            width: 15%;
        }

        .top_btn {
            font-size: 20px;
            padding: 6px 12px;
            background-color: #fff;
            border: 1px solid #ddd;
            font-weight: 600;
        }

        .pageInfo {
            list-style: none;
            display: inline-block;
            margin: 50px 0 0 100px;
        }

        .pageInfo li {
            float: left;
            font-size: 20px;
            margin-left: 18px;
            padding: 7px;
            font-weight: 500;
        }

        a:link {
            color: black;
            text-decoration: none;
        }

        a:visited {
            color: black;
            text-decoration: none;
        }

        a:hover {
            color: black;
            text-decoration: underline;
        }

        .active {
            background-color: #cdd5ec;
        }

        .search_area {
            display: inline-block;
            margin-top: 30px;
            margin-left: 260px;
        }

        .search_area input {
            height: 30px;
            width: 250px;
        }

        .search_area button {
            width: 100px;
            height: 36px;
        }

        .search_area select {
            height: 35px;
        }

        .container {
            text-align: center;
        }

        .py-5 {
            padding-top: 3rem;
            padding-bottom: 3rem;
        }

        .form-label {
            font-size: 20px;
            font-weight: 500;
        }

        .form-control {
            font-size: 20px;
            width: 80%;
        }

        .form-select {
            font-size: 20px;
        }

        .btn_section {
            margin-top: 20px;
        }
        
         .btn-lg {
        padding: 10px 30px;
        font-size: 15px;
    }
    </style>
</head>
<body>
 <main>
<div class="container">
    <div class="py-5 text-center">
      <h2>게시글 등록</h2>
    </div>
      </div>
      
<div class="col-md-7 col-lg-8">
    <form action="/boardadd" id="enroll_form" method="post" enctype="multipart/form-data">
    <input type="hidden" id="userid" name="userid" value="${user.userid}" class="form-control"/>
   <%--  <span>이름 : ${user.userid}</span> --%>
        
           <div class="col-sm-6">
           <label for=cno class="form-label">카테고리</label>
		  <select name="cno" id="cno">
		 	<option value="none" selected>=== 선택 ===</option>
		    <option value="01">공지</option>
		    <option value="02">유머</option>
		    <option value="03">뉴스</option>
		    <option value="04">정치</option>
		    <option value="05">국제</option>
		    <option value="06">사회</option>
		  </select>
           </div> 
		<br>
		 <div class="col-12">
            <label for="btitle" class="form-label">제목</label>
            <input type="text" class="form-control" id="btitle" name="btitle" required>
            <div class="invalid-feedback">
            </div>
        </div>
	        <br>
        <div class="col-12">
            <label for="bcontent" class="form-label">내용 <span class="text-body-secondary"></span></label>
            <textarea class="form-control" id="bcontent" name="bcontent" required></textarea>
            <div class="invalid-feedback">
        
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

        <div class="btn_section">
            <input type="button" class="btn-lg" value="글 등록" onClick="fn_addtoBoard()" id="submitBtn">
            <input type="button" class="btn-lg" value="목록" onClick="location.href='/board/boardlist'">
        </div>
    </form>
</div>
</main>

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
        var form = document.getElementById("enroll_form");
        form.action = "<c:url value='/board/boardadd'/>";
        form.submit();
    }
}

// 목록
function fn_cancel() {
    var form = document.getElementById("enroll_form");
    form.action = "<c:url value='/board/boardlist'/>";
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
 
</body>
</html>