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
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">게시글 수정</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>


<section class="py-5 text-center container"></section><br><br><br><br>

<body>
<div class="container">
	<div class="row form-group" ></div>
	 <form id="modifyForm" action="/board/boardmodify" method="post">
	<div class="col-12">
		<label>게시판 번호 : ${pageInfo.bid}</label>
		<input type="hidden" name="bid" readonly="readonly" value='<c:out value="${pageInfo.bid}"/>' >
	
	</div>
	<br>
	<div class="col-12">
		<label>게시판 작성자 : ${pageInfo.userid}</label>
		<input type="hidden" class="form-control" name="userid" readonly="readonly" value='<c:out value="${pageInfo.userid}"/>' >
	</div> 
	<br>
	<div class="col-12">
		<label>게시판 등록일  : <fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bregdate}"/></label>
		<input type="hidden" class="form-control" name="bregdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bregdate}"/>' >
	</div>
	<br>
	 <div class="col-12">
		<label>게시판 수정일 : <fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bupdate}"/></label>
		<input type="hidden" class="form-control" name="bupdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bupdate}"/>' >
	</div>	
	<br>
	<div class="col-12">
           <label for=cno class="form-label">카테고리</label>
		  <select name="cno" id="cno" required>
		 	<option value="" selected>==${pageInfo.cate}==</option>
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
		<label for="btitle" class="form-label">제목  </label>
		<input class="form-control" name="btitle" value='<c:out value="${pageInfo.btitle}"/>' >
            <div class="invalid-feedback">
            </div>
	</div>
	<br>
	<div class="col-12">
		   <label for="bcontent" class="form-label">내용  <span class="text-body-secondary"></span></label>
		<textarea class="form-control" name="bcontent"><c:out value="${pageInfo.bcontent}"/></textarea>
	</div>
	<br>
 	<div class="form_section">
 			<div class="form_section_title">
 				<label>파일 첨부</label>
 			</div>
 			<div class="form_section_content">
			<input type="file" multiple="multiple" id ="fileItem" name="uploadFile" style="height: 30px;">
				<div id="uploadResult">
				
				</div>
		</div>
	</div>  
	
  	<hr class="my-4">
  	
  	<br>
  	
	<div class="btn_wrap">
	  	<button class="btn btn-primary">수정완료</button>
        <a class="btn btn-primary" id="cancel_btn">수정 취소</a>
        <a class="btn btn-primary" id="delete_btn">삭제</a>
	  	<a class="btn btn-primary" id="list_btn">목록 페이지</a> 
	</div>
	</form>
	
	<form id="infoForm" action="/board/boardmodify" method="get">
		<input type="hidden" id="bid" name="bid" value='<c:out value="${pageInfo.bid}"/>'>
	</form>
	</div>
	
	
	
	
	
	
<section class="py-5 text-center container"></section><br><br><br><br>
	
<script>
var form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
var mForm = $("#modifyForm");    // 페이지 데이터 수정 from
	
	console.log(mForm);

/* 목록 페이지 이동 버튼 */
$("#list_btn").on("click", function(e){
		form.find("#bid").remove();
		form.attr("action", "/board/boardlist");
		form.submit();
	});
	

/* 수정 하기 버튼 - 왜 submit 안될까????*/
$("#modify_btn").on("click", function(e){
    mForm.submit();
});
// mForm.submit(function(event) {
// 	  event.preventDefault(); // 폼 제출 기본 동작을 중지하고 대신 이 코드가 실행됩니다.
// 	  console.log("폼이 제출되었습니다.");
// 	});

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
	  if (confirm("게시글을 삭제하시겠습니까?")) {
    form.attr("action", "/board/boarddelete");
    form.attr("method", "post");
    form.submit();
	}
});

/* 취소 버튼 */
$("#cancel_btn").on("click", function(e){
    form.attr("action", "/board/boarddetail");
    form.submit();
});    


</script>	

<%@ include file="/WEB-INF/footer.jsp"%>
