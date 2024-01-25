<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
select{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.mbtn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 160px;
    height: 55px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
	
}
#delete_btn{
    background-color: #f3e3e7;
}

</style>
</head>
<body>
<h1>게시글 수정</h1>
 <form id="modifyForm" action="/board/boardmodify" method="post">
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bid" readonly="readonly" value='<c:out value="${pageInfo.bid}"/>' >
	</div>
	<div class="input_wrap">
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
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="btitle" value='<c:out value="${pageInfo.btitle}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="bcontent"><c:out value="${pageInfo.bcontent}"/></textarea>
	</div>
	 <div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="userid" readonly="readonly" value='<c:out value="${pageInfo.userid}"/>' >
	</div> 
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="bregdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bregdate}"/>' >
	</div>
	 <div class="input_wrap">
		<label>게시판 수정일</label>
		<input name="bupdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bupdate}"/>' >
	</div>		 
	
	<div class="btn_wrap">
	  	<a class="btn" id="list_btn">목록 페이지</a> 
	  	<button class="mbtn">수정완료</button>
<!--         <a class="btn" id="modify_btn">수정 완료</a> -->
        <a class="btn" id="delete_btn">삭제</a>
        <a class="btn" id="cancel_btn">수정 취소</a>
	</div>
	</form>
	
	<form id="infoForm" action="/board/boardmodify" method="get">
		<input type="hidden" id="bid" name="bid" value='<c:out value="${pageInfo.bid}"/>'>
	</form>
	
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
</body>
</html>