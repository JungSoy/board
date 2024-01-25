<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <style>
  a{
  	text-decoration : none;
  }
  table{
 	border-collapse: collapse;
 	width: 1000px;    
 	margin-top : 20px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 50px;
  }
  th{
  	font-size : 17px;
  }
  thead{
  	font-weight: 700;
  }
  .table_wrap{
  	margin : 50px 0 0 50px;
  }
  .bno_width{
  	width: 12%;
  }
  .writer_width{
  	width: 20%;
  }
  .regdate_width{
  	width: 15%;
  }
  .updatedate_width{
  	width: 15%;
  }
  .top_btn{
  	font-size: 20px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    display: inline-block;
  }
  .excel_btn{
    display: inline-block;
  	font-size: 20px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    float: right;
    margin-right: 315px;
  }
 
  ol{
   list-style:none;
   }
 .pageInfoArea{
      list-style : none;
      display: inline-block;
    margin: 50px 0 0 100px;      
  }
  .pageInfoArea ul {
  list-style: none;
  display: inline; /* 페이지 번호를 가로로 정렬 */
  padding: 0;
}
  .pageInfoArea li {
  display: inline;
  margin-left: 18px;
  padding: 7px;
  font-weight: 500;
}

.pageInfoArea li:first-child {
  margin-left: 0; /* 첫 번째 페이지 번호의 왼쪽 여백을 제거 */
}

a:link {color: black; text-decoration: none;}
a:visited {color: black; text-decoration: none;}
a:hover {color: black; text-decoration: underline;}
.active{
      background-color: #cdd5ec;
  }
  
  
 /*  .search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
  } */
 .search_area input{
  	height: 30px;
    width: 250px;
  }
  .search_area button{
 	width: 100px;
    height: 36px;
  } 
  .search_area select{
  	height: 35px;
  }
   .cate_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 160px;
  } 
  .cate_area button{
 	width: 100px;
    height: 36px;
  } 
  .cate_area select{
  	height: 35px;
  } 
   
  </style>
</head>
<body>

<div class="table_wrap">
	<c:if test="${user.userid != null}">
		<a href="/board/boardadd" class="top_btn">게시판 등록</a>
	</c:if>
	<button type="button" class="top_btn" onclick="location.href='/main'">메인</button>

	<!-- 엑셀 다운 버튼 -->
<!-- 	<div class="col-sm-2 col-sm-offset-10 text-right"> -->
	    <a href="<c:url value='/board/excelDown' />" class="excel_btn" target="_blank" id="excelDown">excelDownload</a>
<!-- 	</div> -->

	<table>
		<thead>
			<tr>
				<th class="bid_width">번호</th>
				<th class="userid_width">작성자</th>
				<th class="cate_width">카테고리</th>
				<th class="btitle_width">제목</th>
				<th class="bregdate_width">작성일</th>
				<th class="bupdate_width">수정일</th>
			</tr>
		</thead>
		<tbody class="dataSection">
<%-- 		 <c:forEach items="${boardlist}" var="list"> --%>
<!--             <tr> -->
<%--                 <td><c:out value="${list.bid}"/></td> --%>
<%--         		<td><c:out value="${list.cate}"/></td> --%>
<!--               	<td> -->
<%--               	 <a class="move"  href='<c:out value="${list.bid}"/>'>  --%>
<%--         		    	<c:out value="${list.btitle}"/> --%>
<!--                     </a> -->
<!--                 </td>     -->
<%--                 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.bregdate}"/></td> --%>
<%--                 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.bupdate}"/></td> --%>
<!--             </tr> -->
<%--         </c:forEach> --%>
        </tbody>
	</table>
	<form id="excelForm" action="/board/excelDown" method="post"> 
		<div class="cate_area" style="display: inline-block;">
			<select name="cno" id="categorySelect">
				    <option value="0">전체</option> <!-- 전체 카테고리를 나타내는 옵션 -->
			    <c:forEach items="${categorylist}" var="cate">
			        <option value="${cate.cno}">${cate.cate}</option>
			    </c:forEach>
			</select>
		</div>
	<div class="search_wrap" style="display: inline-block; margin-left: 10px;">
        	<div class="search_area" style="display: inline-block;">
        			<select name="type">
						<option value="" <c:out value="${pageMake.cri.type == null?'selected':'' }"/>>--</option>
						<option value="T" <c:out value="${pageMake.cri.type eq 'T'?'selected':'' }"/>>제목</option>
						<option value="C" <c:out value="${pageMake.cri.type eq 'C'?'selected':'' }"/>>내용</option>
						<option value="W" <c:out value="${pageMake.cri.type eq 'W'?'selected':'' }"/>>작성자</option> 
						<option value="TC" <c:out value="${pageMake.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
					    <option value="TW" <c:out value="${pageMake.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
						<option value="TCW" <c:out value="${pageMake.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option> 
					</select>		
            <input type="text" id="keyword" name="keyword" value="${pageMake.cri.keyword }"> 
            <button id="searchButton">Search</button>
        </div>
    </div> 
</form>
<!-- 페이징 -->
  <div class="pageInfo_wrap" >
        <div class="pageInfoArea">
<!-- 			<input type="hidden" name="pageNum" id="pageNum">  -->
 			
 			 <ul id="pageInfo" class="pageInfo">
 			    <!-- 이전페이지 버튼 -->
<%--                 <c:if test="${pageMake.prev}"> --%>
<%--                     <li class="pageInfo_btn previous"><a href="${pageMake.startPage-1}">Previous</a></li> --%>
<%--                 </c:if> --%>
                
<!--  				 각 번호 페이지 버튼 -->
<%--                 <c:forEach var="num" begin="${pageMake.startPage}" end="${pageMake.endPage}"> --%>
<%--              	    <li class="pageInfo_btn"><a href="${num}">${num}</a></li>  --%>
<%-- 				</c:forEach> --%>
				
<!--  				다음페이지 버튼 -->
<%--                 <c:if test="${pageMake.next}"> --%>
<%--                     <li class="pageInfo_btn next"><a href="${pageMake.endPage + 1 }">Next</a></li> --%>
<%--                 </c:if>      --%>
                
 			</ul>
        </div>
    </div>

<!-- 	<form id="excelForm" action="/board/excelDown" method="post">     -->
<%--         <input type="hidden" id="ex_keyword" name="keyword" value="${pageMake.cri.keyword }">     --%>
<%--         <input type="hidden" id="ex_type" name="type" value="${pageMake.cri.type }">     --%>
<%--         <input type="hidden" id="ex_category" name="category" value="${categorylist}">     --%>
<!--     </form> -->
    
<!--     <form id="moveForm" method="get">     -->
<%--     	<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum }"> --%>
<%--         <input type="hidden" name="amount" value="${pageMake.cri.amount }">     --%>
<%--         <input type="hidden" name="keyword" value="${pageMake.cri.keyword }">     --%>
<%--         <input type="hidden" name="type" value="${pageMake.cri.type }">     --%>
<%--         <input type="hidden" name="category" value="${categorylist}">     --%>
<!--     </form> -->
</div>
<script>
	var currPage = 1;
    var moveForm = $("#moveForm");
    $(document).ready(function () {
    	getPage(currPage);
    	
//    	 $(".move").on("click", function(e){
//    	    e.preventDefault();
   	        
//    	 	console.log('상세조회버튼');
   	 	
//         moveForm.append("<input type='hidden' name='bid' value='"+ $(this).attr("href")+ "'>");
//         moveForm.attr("action", "/board/boarddetail");
//         moveForm.submit();
        
//    	    })
   	 
   	 
    //검색버튼 클릭 
    $("#searchButton").on("click", function(e){
         e.preventDefault();
    	 
//     	var type = $(".search_area select").val();
//   		var keyword = $(".search_area input[name='keyword']").val();
//     	var category = $(".cate_area select").val();
  		
// 			moveForm.find("input[name='type']").val(type);
//          moveForm.find("input[name='keyword']").val(keyword);
//          moveForm.find("input[name='pageNum']").val(1);
//          moveForm.find("input[name='category']").val(1);
//          moveForm.submit();
        
    	getPage(currPage);

    	console.log('버튼');
  		
		})

    });
    
    //게시글 목록 조회
	function getPage(pageNum) {
		currPage=pageNum;
		var amount = $("input[name='amount']").val();
		var type = $(".search_area select").val();
  		var keyword = $(".search_area input[name='keyword']").val();
    	var cno = $("#categorySelect").val();
//     	var cno = $("select[name=cno]").val();
//     	var category = $(".cate_area select").val();
  		
// 		var pageNum = $("input[name='pageNum']").val();
// 		var keyword = $("input[name='keyword']").val();
// 		var type = $("input[name='type']").val();
// 		var category = $("input[name='category']").val();

 		console.log('겟페이지 진입');
 		console.log(cno);
 		
		$.ajax({
			url:"/board/getboardlist",
			type:"get",
			dataType:'json',
			data:{
 				"pageNum": pageNum,
		        "amount": amount, 
		        "keyword": keyword,
		        "type": type,
 		        "cno": cno
				},
			success : function(data) {
				console.log(data);
				var pageMake = data.pageMake;
				var boardlist = data.boardlist;
				// 서버로부터 받은 데이터를 사용하여 페이지네이션 및 게시물 목록 업데이트
				updatePagination(pageMake);
		  		updateBoardList(boardlist); 
	        },
	        error: function (request, status, error) {
	            console.log(request.status);
	            console.log(request.responseText);
	            console.log(error);
	        }
	    });
	}
	
	function updatePagination(pageMake) {
		
		 if (pageMake && pageMake.startPage !== undefined && pageMake.endPage !== undefined && pageMake.prev !== undefined && pageMake.next !== undefined) {
		    // startPage, endPage 변수를 사용하여 페이지 버튼을 생성하거나 페이지네이션을 업데이트
		    var startPage = pageMake.startPage;
		    var endPage = pageMake.endPage;
			var prev = pageMake.prev;
			var next = pageMake.next;
		    var pageInfoHtml = "";
		
		    pageInfoHtml += '<input type="hidden" id="pageNum;" name="pageNum;" value="1">';
	        pageInfoHtml += '<ol class="pagination" id="pagination">';
	        // 이전으로
	        if (prev) {
	            pageInfoHtml += '<li class="pageInfo_btn"><a href="javascript:getPage(' + (startPage - 1) + ')">Previous</a></li>';
	        }

	        //페이지 번호
	        for (var i = startPage; i <= endPage; i++) {
// 	            pageInfoHtml += "<li class='pageInfo_btn'>";
	            
	        	if(i == currPage){
	        		 pageInfoHtml +="<li class='pageInfo_btn active'><a href='javascript:getPage(" + i + ")'>" + i + "</a></li>";
	        	}else{
	        		 pageInfoHtml +="<li class='pageInfo_btn'><a href='javascript:getPage(" + i + ")'>" + i + "</a></li>";
	        	}
	        }

	        //다음으로
	        if (next) {
	            pageInfoHtml += '<li class="pageInfo_btn"><a href="javascript:getPage(' + (endPage + 1) + ')">Next</a></li>';
	        }
	        pageInfoHtml += '</ol>';

	        $(".pageInfoArea").html(pageInfoHtml);
	        console.log(pageInfoHtml);
	    }
	}

	function updateBoardList(boardlist) {
		
	    // boardlist 변수를 사용하여 게시물 목록을 업데이트
	    var boardListHtml = "";

	    for (var i = 0; i < boardlist.length; i++) {
	        var board = boardlist[i];
	        boardListHtml += "<tr>";
	        boardListHtml += "<td>" + board.bid + "</td>";
	        boardListHtml += "<td>" + board.userid + "</td>";
	        boardListHtml += "<td>" + board.cate + "</td>";
	        boardListHtml += "<td><a href='/board/boarddetail?bid=" + board.bid + "'>" + board.btitle + "</a></td>";
	        boardListHtml += "<td>" + formatDate(board.bregdate) + "</td>";
	        boardListHtml += "<td>" + formatDate(board.bupdate) + "</td>";
	        boardListHtml += "</tr>";
	    }

	    $(".dataSection").html(boardListHtml);
	    console.log(boardListHtml);
	}
	
	  function formatDateToYYYYMMDD(dateString) {
	        const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
	        const date = new Date(dateString);
	        return new Intl.DateTimeFormat('en-US', options).format(date);
	    }
	  
 	 // 날짜를 yyyy/MM/dd 형식으로 변환하는 함수
    function formatDate(date) {
        var formattedDate = new Date(date);
        var year = formattedDate.getFullYear();
        var month = (formattedDate.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 필요
        var day = formattedDate.getDate().toString().padStart(2, '0');
        return year + '/' + month + '/' + day;
    }
 	 
 	//excelDown(Ajax)
//  	 $("#excelDown").click( function(e){
//     	if (confirm("목록을 엑셀다운하시겠습니까?")) {
    		
    	
//  		var type = $("#ex_type").val();
//   		var keyword = $("#ex_keyword").val();
//     	var category = $("#ex_category").val();
    	
//  		console.log('getExcel 진입');
 		
// 		$.ajax({
// 			url:"/board/excelDown",
// 			type:"post",
// 			dataType:'json',
// 			data:{
// 		        "keyword": keyword,
// 		        "type": type,
// 		        "category": category
// 				},
// 			success : function(data) {
// 				console.log(data);
// 				var boardlist = data.boardlist;
// 				// 서버로부터 받은 데이터를 사용하여 페이지네이션 및 게시물 목록 업데이트
// 		  		updateBoardList(boardlist); 
// 	        },
// 	        error: function (request, status, error) {
// 	            console.log(error);
// 	        }
// 	  	  })
// 		}
//     })
 	
 	
 	//excelDown(form) 
    $("#excelDown").click( function(e){
    	if (confirm("목록을 엑셀다운하시겠습니까?")) {
    		
	 		$(this).attr("href","<c:url value='/board/excelDown' />"+"?"+ $("#excelForm").serialize() );
//     		var searchData = {
//     			    type: $("#ex_type").val(),
//     			    keyword: $("#ex_keyword").val(),
//     			    category: $("#ex_category").val()
//     			};

//     			var serializedData = $.param(searchData);

//     			$(this).attr("href", "<c:url value='/board/excelDown' />" + "?" + serializedData);
    			
//     		var eForm=$("#excelForm");
// 			var type = $("#ex_type").val();
// 	  		var keyword = $("#ex_keyword").val();
// 	    	var category = $("#ex_category").val();
	//   		var searchData = {
	// 		    type: $("#ex_type").val(),
	// 		    keyword: $("#ex_keyword").val(),
	// 		    category: $("#ex_category").val()
	// 		};
	 		
    	
    	}
	}); 


			
  
</script>    
  
</body>
</html> 