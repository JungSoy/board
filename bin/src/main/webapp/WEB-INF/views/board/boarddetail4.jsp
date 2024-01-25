<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 대댓글 화면 출력 조건 넣기 전 --> 
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<!-- 되는 것 -->
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
    margin-right: 5px; /* 오른쪽과의 간격 조절 */
    margin-bottom: 5px; /* 아래와의 간격 조절 */
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
 	text-align: right; /* 텍스트를 오른쪽 정렬합니다. */
}
.btn-primary{
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
    margin-right: 5px; /* 오른쪽과의 간격 조절 */
    margin-bottom: 5px; /* 아래와의 간격 조절 */
}
.modal-footer{
	padding-left : 80px;
	margin-top : 50px;
 	text-align: right; /* 텍스트를 오른쪽 정렬합니다. */
}

.modal-footer button.btn-primary{
  	display: inline-block;
    padding: 5px 10px;
    font-size: 16px;
    background-color: #fff;
    border: 1px solid #ddd;
    cursor: pointer;
    text-decoration: none;
    margin-right: 5px; /* 오른쪽과의 간격 조절 */
    margin-bottom: 5px; /* 아래와의 간격 조절 */
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
 	text-align: right; /* 텍스트를 오른쪽 정렬합니다. */
}

/* 댓글 컨테이너 스타일 */
.panel-default {
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12);
}

.panel-heading {
    background-color: #f5f5f5;
    border-bottom: 1px solid #ddd;
    padding: 10px;
}

.panel-heading h2 {
    font-size: 20px;
    margin: 0;
    color: #333;
}

.panel-body {
    padding: 15px;
}

/* 댓글 작성자 스타일 */
.rwriter {
    font-size: 18px;
    font-weight: bold;
    color: #333;
}

/* 댓글 내용 스타일 */
.rcontent {
    font-size: 16px;
    color: #555;
    margin: 10px 0;
}

/* 댓글 등록일 스타일 */
.rregdate {
    font-size: 14px;
    color: #888;
}

/* 수정 및 삭제 버튼 스타일 */
.btn_wrap {
    margin-top: 10px;
    text-align: right; /* 텍스트를 오른쪽 정렬합니다. */
}

.btn_wrap a.rbtn {
	display: inline-block;
    padding: 5px 10px;
    font-size: 16px;
    background-color: #fff;
    border: 1px solid #ddd;
    cursor: pointer;
    text-decoration: none;
    margin-right: 5px; /* 오른쪽과의 간격 조절 */
    margin-bottom: 5px; /* 아래와의 간격 조절 */
}
.btn_wrap button.rbtn {
	display: inline-block;
    padding: 5px 10px;
    font-size: 16px;
    background-color: #fff;
    border: 1px solid #ddd;
    cursor: pointer;
    text-decoration: none;
    margin-right: 5px; /* 오른쪽과의 간격 조절 */
    margin-bottom: 5px; /* 아래와의 간격 조절 */
}

.btn_wrap a.rbtn.delete {
    background-color: #d9534f;
}


</style>
</head>
<body>
<h1>게시글 조회</h1>
	<div class="input_wrap">
		<label>게시글 번호</label>
		<input name="bid" readonly="readonly" value='<c:out value="${pageInfo.bid}"/>' >
	</div>
	<div class="input_wrap">
		<label>카테고리</label>
		<input name="cate" readonly="readonly" value='<c:out value="${pageInfo.cate}"/>' >
	</div>
	<div class="input_wrap">
		<label>제목</label>
		<input name="btitle" readonly="readonly" value='<c:out value="${pageInfo.btitle}"/>' >
	</div>
	<div class="input_wrap">
		<label>내용</label>
		<textarea rows="3" name="bcontent" readonly="readonly"><c:out value="${pageInfo.bcontent}"/></textarea>
	</div>
	 <div class="input_wrap">
		<label>작성자</label>
		<input name="userid" readonly="readonly" value='<c:out value="${pageInfo.userid}"/>' >
	</div> 
	<div class="input_wrap">
		<label>등록일</label>
		<input name="bregdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bregdate}"/>' >
	</div>
	 <div class="input_wrap">
		<label>수정일</label>
		<input name="bupdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bupdate}"/>' >
	</div>		 
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
		<c:if test="${user.userid == pageInfo.userid}">
			<a class="btn" id="modify_btn">수정 하기</a>  
		</c:if>
	</div>
	<form id="infoForm" action="/board/boardmodify" method="get">
		<input type="hidden" id="bid" name="bid" value='<c:out value="${pageInfo.bid}"/>'>
	</form>
	
	
		<!-- 댓글 등록 -->
	    <input id="bid" type="hidden" name="bid" value="${pageInfo.bid}">
	    <input id="rwriter1" type="hidden" name="rwriter1" value="${user.userid}">
 
	    <div class="panel panel-default">
	      <div class="panel-heading"><h2>댓글 등록</h2></div>
	      <div class="panel-body">
	        <textarea name="rcontent1" id="rcontent1" rows="3" class="form-control"></textarea>
	        <br>
	        <div class="btn_wrap">
	        	<button class="btn btn-primary pull-right" id="rSubmit">등록</button>
	        </div>
	      </div>
	    </div> 
	    
<br>
	    	<!-- 댓글 게시물 -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h2>댓글 리스트</h2>
    </div>
    <div class="panel-body">
        <p><b>${cnt}개의 댓글이 있습니다.</b></p>
        <c:forEach items="${reply1List}" var="r">
          <input type="hidden" id="rid1" name="rid1" class="rid1" value="${r.rid1 }"> 
            <div id="rep1_${r.rid1 }" class="panel panel-default">
                <div class="panel-body" id="replybody">
                    <p class="rwriter">${r.rwriter1}</p>
                    <p class="rcontent">${r.rcontent1}</p>
                    <p class="rregdate">
                        <fmt:formatDate pattern="yyyy/MM/dd" value="${r.rregdate1}"/>
                    </p>
                </div>
                <div class="panel-footer">
                    <div class="btn_wrap">
                        <c:if test="${user.userid == r.rwriter1}">
                            <a class="rbtn" id="r1modify_btn" onclick="javascript:updateModal(${r.rid1}, ${r.rcontent1} )">수정</a>  
                            <button class="rbtn" id="r1delete">삭제</button>
                        </c:if>
                        <c:if test="${user.userid != null}">
                            <a class="rbtn" id="r2add_btn" onclick="javascript:add2Modal(${r.rid1})">대댓글</a>  
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- 대댓글 목록 -->
            
        </c:forEach>
    </div>
    
<!--      대댓글 목록 ajax -->
<!--    <div class="reply2Section"> -->
   
<!--    </div> -->
    
   <!-- 대댓글 목록 --> 
<!--     <div class="panel panel-default"> -->
<!--     <div class="panel-heading"> -->
<!--         <h2>대댓글 리스트</h2>  -->
<!--     </div> -->
<!--     <div class="panel-body"> -->
<%--         <p><b>${cnt2}개의 대댓글이 있습니다.</b></p> --%>
<%--         <c:forEach items="${reply2List}" var="r2"> --%>
<%--           <input type="hidden" id="rid2" name="rid2" class="rid2" value="${r2.rid2 }">  --%>
<%--             <div id="rep2_${r2.rid2 }" class="panel panel-default"> --%>
<!--                 <div class="panel-body" id="reply2body"> -->
<%--                     <p class="rwriter">${r2.rwriter2}</p> --%>
<%--                     <p class="rcontent">${r2.rcontent2}</p> --%>
<!--                     <p class="rregdate"> -->
<%--                         <fmt:formatDate pattern="yyyy/MM/dd" value="${r2.rregdate2}"/> --%>
<!--                     </p> -->
<!--                 </div> -->
<!--                 <div class="panel-footer"> -->
<!--                     <div class="btn_wrap"> -->
<%--                         <c:if test="${user.userid == r2.rwriter2}"> --%>
<%--                             <a class="rbtn" id="r2modify_btn" onclick="javascript:update2Modal(${r2.rid2}, ${r2.rcontent2} )">수정</a>   --%>
<!--                             <button class="rbtn" id="r2delete">삭제</button> -->
<%--                         </c:if> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            
<%--         </c:forEach> --%>
<!--     </div> -->
<!-- </div> -->

</div><!-- 댓글목록 끝 div -->


	<!-- 댓글 수정 모달 -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="modal-title" aria-hidden="true">
         <div class="modal-dialog" role="documen bnt">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-title">댓글 수정</h5>
                </div>
                <div class="modal-body" id="modal-body">
                    <input type="hidden" id="modal_rid1" name="rid1" >
                    <input type="text" id="modal_rcontent1" name="rcontent1" >
                </div>
                <div class="modal-footer" id="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="javascript:updateAjax()">수정</button>
                    <button type="button" class="btn btn-primary" onclick="modalClose()">닫기</button>
                </div>
            </div>
        </div> 
    </div>
    
	<!-- 대댓글 등록 모달 -->
	  <div class="modal fade" id="add2Modal" tabindex="-1" role="dialog" aria-labelledby="modal-title" aria-hidden="true">
       	<input type="hidden" id="modal2_rid1" value="${r.rid1 }">
       	<input type="hidden" id="rwriter2" value="${user.userid}">
        <div class="modal-dialog" role="documen bnt">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-title">대댓글 등록</h5>
                </div>
                <div class="modal-body" id="modal-body">
                    <input type="text" id="rcontent2" name="rcontent2">
                </div>
                <div class="modal-footer" id="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="javascript:add2Ajax()">등록</button>
                    <button type="button" class="btn btn-primary" onclick="modalClose()">닫기</button>
                 </div>
            </div>
        </div>
    </div>
    
	
				
<script>
	var form = $("#infoForm");
	
    $("#list_btn").on("click", function(e){
		form.find("#bid").remove();
		form.attr("action", "/board/boardlist");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/boardmodify");
		form.submit();
	});	
	
	//댓글등록 ajax
	$('#rSubmit').on("click", function() {
			var rcontent1 = $("#rcontent1").val();
			var rwriter1 = $("#rwriter1").val();
			var bid = $("#bid").val();
			$.ajax({
				url : "/reply1/reply1add",
				data : {
					"rcontent1" : rcontent1,
					"rwriter1" : rwriter1,
					"bid" : bid
				},
				type : "post",
				success : function(result) {
					//	alert("등록성공")
					$('#rcontent1').val('') //댓글 등록시 댓글 등록창 초기화
					window.location.reload();
				},
				error : function() {
					alert("댓글을 입력해주세요.")

				}
			})
		})

	
	//(댓글 수정)updateModal(${r.rid1}, ${r.rcontent1}) 에서 받은 값으로 modal을 띄우는 함수
	function updateModal(rid1, rcontent1) {
	    $('#updateModal').modal('show');
		$("#modal_rcontent1").val(rcontent1);
		$("#modal_rid1").val(rid1);
		console.log(rcontent1);
		console.log(rid1);
	}

	function updateAjax() {
	    var rid1 = $("#modal_rid1").val();
    	var rcontent1 = $("#modal_rcontent1").val(); 
	    if (rcontent1 == "") {
			alert("댓글을 입력해주세요.");
			return;
		}

	    $.ajax({
	        url: "/reply1/reply1update",
	        type: "POST",
	        data: {
	        	rid1: rid1,
	        	rcontent1: rcontent1
	        },
	        success: function(data) {
 				window.location.reload();
 				console.log(data);
			},
	        error: function(jqXHR, textStatus, errorThrown) {
	        }
	    });
	}

	 $('a[href="#updateModal"]').click(function(event) {
	      event.preventDefault();
	 
	      $(this).modal({
	        fadeDuration: 250
	      });
	    });
	 
	    function modalClose() {
	        $('#updateModal').modal('hide'); 
	        $('#updateModal').hide();
	        $('.jquery-modal').hide();
	    }
	    
    //댓글 삭제2
    $('#r1delete').on("click", function() {
    	var rid1 = $("#rid1").val();
    	var bid = $("#bid").val();
    	
    	  console.log('댓글삭제' + rid1);
    	  if (confirm("댓글을 삭제하시겠습니까?")) {
			$.ajax({
				url : "/reply1/reply1delete",
				data : {
					"rid1" : rid1,
					"bid" : bid
				},
				type : "post",
				success : function(result) {
					alert("삭제 성공");
					$("#rep1_" + rid1).remove();
				},
				error : function() {
					alert("삭제 실패")

				}
			})
    	  }
		});

//대댓글 등록(add2Modal)
	function add2Modal(rid1) {
		$('#add2Modal').modal('show');
	    $("#modal2_rid1").val(rid1);
// 	    $("#rwriter2").val(rwriter2);
 	    console.log('대댓글 등록 모달'+ rid1);
	}

	function add2Ajax() {
		var rid1 = $("#modal2_rid1").val();
		var rcontent2 = $("#rcontent2").val();
		var rwriter2 = $("#rwriter2").val();
	 
		console.log('ajax처리' + rid1);
		
	    if (rcontent2 == "") {
			alert("댓글을 입력해주세요.");
			return;
		}

	    $.ajax({
	        url: "/reply2/reply2add",
	        type: "POST",
	        data: {
	        	"rid1" : rid1,
				"rcontent2" : rcontent2,
				"rwriter2" : rwriter2
	        },
	        success: function(data) {
 				window.location.reload();
  				console.log('대댓글 등록성공' + data);
			},
	        error: function(jqXHR, textStatus, errorThrown) {
	            // 수정 실패 시 처리할 로직
	        }
	    });
	    
	}

	 $('a[href="#add2Modal"]').click(function(event) {
	      event.preventDefault();
	 
	      $(this).modal({
	        fadeDuration: 250
	      });
	    });
	 
	    function modalClose() {
	        $('#add2Modal').modal('hide'); 
	        $('#add2Modal').hide();
	        $('.jquery-modal').hide();
	    }
	    
	    //대댓글
	 	$(document).ready(function () {
			getReply2Page();
		
	    //대댓글 목록 조회 ajax
		 function getReply2Page() {
			var rid1 = $("#rid1").val();
			
			console.log('대댓글 목록 ajax ' + rid1);
			
				$.ajax({
					url:"/reply1/reply2list",
					type:"get",
 					dataType:"json",
					data:{
						rid1 : rid1
					},
					success : function(data) {
						console.log('대댓글 목록 ajax 성공 ' + data);
						
						selectReply2List(data.reply2List); 
				  		
			        },
			        error: function (request, status, error) {
			            console.log(request.status);
			            console.log(request.responseText);
			            console.log(error);
			        }
			    });
			}
	 
	    
	    //대댓글 목록 마크업
	    function selectReply2List(reply2List) {
	    	
		    var reply2ListHtml = "";
	
		    for (var i = 0; i < reply2List.length; i++) {
		        var reply2 = reply2List[i];
		        reply2ListHtml += "<input id='rid1' type='hidden' value= '" + reply2.rid1 + "' >";
		        reply2ListHtml += "<input id='rid2' type='hidden' value= '" + reply2.rid2 + "' >";
		        reply2ListHtml += "<div id='rep2_" + reply2.rid2 + "' class='panel panel-default'>";
		        reply2ListHtml += "<div class='panel-body' id='replybody'>";
		        reply2ListHtml += "<p class='rwriter2'>" + reply2.rwriter2 + "</p>";
		        reply2ListHtml += "<p class='rcontent2'>" + reply2.rcontent2 + "</p>";
		        reply2ListHtml += "<p class='rregdate2'>" + formatDate(reply2.rregdate2) + "</p>";
		        reply2ListHtml += "<p class='rupdate2'>" + formatDate(reply2.rupdate2) + "</p>";
		        reply2ListHtml += "</div>";
		        reply2ListHtml += "<div class='panel-footer'>";
		        reply2ListHtml += "<div class='btn_wrap'>";
		        	
		        if (reply2.userid == reply2.rwriter2) {
			        reply2ListHtml += "<a class='rbtn' id='r2modify_btn' onclick='javascript:update2Modal '"+ (reply2.rid2, reply2.rcontent2) + "'>수정</a>";
		            reply2ListHtml += "<button class='rbtn' id='r2delete'>삭제</button>";
		        }
		        reply2ListHtml += "</div></div></div>";
		    }
	 
		    $(".reply2Section").html(reply2ListHtml);
		    console.log(reply2ListHtml);
	}
    
	    function formatDateToYYYYMMDD(dateString) {
	        const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
	        const date = new Date(dateString);
	        return new Intl.DateTimeFormat('en-US', options).format(date);
	    }
	  
 	 //날짜를 yyyy/MM/dd 형식으로 변환하는 함수
    function formatDate(date) {
        var formattedDate = new Date(date);
        var year = formattedDate.getFullYear();
        var month = (formattedDate.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 필요
        var day = formattedDate.getDate().toString().padStart(2, '0');
        return year + '/' + month + '/' + day;
    }
 	 
 });
 	 
	
</script>	
</body>
</html>