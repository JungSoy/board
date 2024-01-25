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
  }
  .pageInfo{
  	list-style : none;
  	display: inline-block;
    margin: 50px 0 0 100px;  	
  }
  .pageInfo li{
  	float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
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
	  
	<table>
		<thead>
			<tr>
				<th class="bid_width">번호</th>
				<th class="cate_width">카테고리</th>
				<th class="btitle_width">제목</th>
				<th class="bregdate_width">작성일</th>
				<th class="bupdate_width">수정일</th>
			</tr>
		</thead>
		<tbody class="dataSection">
		 <c:forEach items="${boardlist}" var="list">
            <tr>
                <td><c:out value="${list.bid}"/></td>
        		<td><c:out value="${list.cate}"/></td>
              	<td>
              	 <a class="move"  href='<c:out value="${list.bid}"/>'> 
        		    	<c:out value="${list.btitle}"/>
                    </a>
                </td>    
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.bregdate}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.bupdate}"/></td>
            </tr>
        </c:forEach>
        </tbody>
	</table>
		<div class="cate_area" style="display: inline-block;">
			<select name="category" id="categorySelect">
				    <option value="">전체</option> <!-- 전체 카테고리를 나타내는 옵션 -->
			    <c:forEach items="${categorylist}" var="cate">
			        <option value="${cate.cno}">${cate.cate}</option>
			    </c:forEach>
			</select>
		</div>
	<div class="search_wrap" style="display: inline-block; margin-left: 10px;">
        	<div class="search_area" style="display: inline-block;">
        			<select name="type" id="type">
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

<!-- 페이징 -->
  <div class="pageInfo_wrap" >
        <div class="pageInfo_area">
 			<ul id="pageInfo" class="pageInfo">
 			
 			    <!-- 이전페이지 버튼 -->
                <c:if test="${pageMake.prev}">
                    <li class="pageInfo_btn previous"><a href="${pageMake.startPage-1}">Previous</a></li>
                </c:if>
                
 				 <!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMake.startPage}" end="${pageMake.endPage}">
             	    <li class="pageInfo_btn"><a href="${num}">${num}</a></li> 
				</c:forEach>
				
 				<!-- 다음페이지 버튼 -->
                <c:if test="${pageMake.next}">
                    <li class="pageInfo_btn next"><a href="${pageMake.endPage + 1 }">Next</a></li>
                </c:if>    
                
 			</ul>
        </div>
    </div>

    
    <form id="moveForm" action="/board/boardlist" method="get">    
    	<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMake.cri.amount }">    
        <input type="hidden" name="keyword" value="${pageMake.cri.keyword }">    
        <input type="hidden" name="type" value="${pageMake.cri.type }">    
        <input type="hidden" name="category" value="${categorylist}">    
    </form>
</div>
<script>
    let moveForm = $("#moveForm");
    $(document).ready(function () {
   	 $(".move").on("click", function(e){
   	        e.preventDefault();
   	        
   	        moveForm.append("<input type='hidden' name='bid' value='"+ $(this).attr("href")+ "'>");
   	        moveForm.attr("action", "/board/boarddetail");
   	        moveForm.submit();
   	    });
   	 
    	 getPage(1, 10, "", "", "");

    })
    
    //검색버튼 클릭 
    $("#searchButton").click(function() {
    	 
    		//현재 페이지
	        var pageNum=$("input[name=pageNum]").val();
	        
	        //한 페이지당 보여질 게시물 수
	    	var amount=$("input[name=amount]").val();
	    	
	        //키워드
	    	var keyword=$("input[name=keyword]").val();
	    	
	        //검색유형
	    	var type=$("select#type").val();// select 요소 선택값 가져오도록 수정
	    	
	        //카테고리
	    	var category=$("select#categorySelect").val();// select 요소 선택값 가져오도록 수정
	      
	        
		/* const search = $("#keyword").val();
		const searchType = $("#type").val();
		const categorySelect = $("#categorySelect").val();
 */
	/* 	$("#searchInput").val(search);
		$("#searchType").val(searchType); */
		getPage(pageNum, amount, keyword, type, category);
	});
    
	function getPage(pageNum, amount, keyword, type, category) {
			 var pageNumVal=$("input[name=pageNum]").val();
	    	var amountVal=$("input[name=amount]").val();
	    	var keywordVal=$("input[name=keyword]").val();
	    	var typeVal=$("input[name=type]").val();
	    	var categoryVal=$("input[name=category]").val();
 		
		$.ajax({
			url:"/board/getboardlist",
			type:"get",
			data:{
				"pageNum": pageNumVal,
		        "amount": amountVal,
		        "keyword": keywordVal,
		        "type": typeVal,
		        "category": categoryVal
				},
			dataType : "json",
			success : function(data) {
						const list = data['list'];
						const pagination = data['pagination'];
						var content = "";
						var content2 = "";
						
						var pageMakeVO = data.pageMakeVO;
					    var endPage = data.pageMakeVO.endPage;
					    var startPage = data.pageMakeVO.startPage;
					    var prev = startPage - 1;
					    var endPage = data.pageMakeVO.endPage;
					    var next = endPage + 1;
					    var realEnd = data.pageMakeVO.realEnd;
					    var total = data.pageMakeVO.total;
						 

						console.log(pagination);
						// 테이블의 row를 삽입하는 부분
						for (var i = 0; i < list.length; i++) {
							 var formattedBregdate = formatDate(list.bregdate);
			    	         var formattedBupdate = formatDate(list.bupdate);
			    	            
							content += "<tr>";
							content += "<td>" + list.bid + "</td>";
							content += "<td>" + list.cate + "</td>";
							content += "<td><a href='/board/boarddetail?bid=" + list.bid + "'>" + list.btitle + "</a></td>";
							content += "<td>" + formattedBregdate + "</td>";
							content += "<td>" + formattedBupdate + "</td>";
							content += "</tr>";
						}
						$(".dataSection").html(content);
						
						
							content2 = '<input type="hidden" id="pageNum;" name="pageNum;" value="1">';
						    content2 +=    '<ol class="pagination" id="pagination">';
						    
						    if(pageMakeVO.prev){
						        content2 +=    '<li class="pageInfo_btn previous"><a href="' + ${pageMake.startPage-1} + '">Previous</a></li>';    
						    }
						    
						 /*    for (var num=startPage; num<=endPage; num++) {
						         if (num == pageNum) {
						             content2 +=    '<li class="pageInfo_btn"><a href="' + num + '">' + num + '</a></li>';
						         } else {
						             content2 +=    '<li class="pageInfo_btn"><a href="' + num + '">' + num + '</a></li>';
						         }
						    } */
						    
						    for (var num = startPage; num <= endPage; num++) { 
						    content2 +=    '<li class="pageInfo_btn"><a href="' + num + '">' + num + '</a></li>';
						    }
						    
						    if(pageMakeVO.next){
						        content2 +=    '<li class="pageInfo_btn previous"><a href=" '+ ${pageMake.endPage + 1 } +'">Previous</a></li>';    
						    }
						    
						    content2 +=    '</ol>';
						    content2 +=    '</div>';
						 
						    
						$(".pageInfo_area").html(content2);
					}
				});
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
 	 
 	 
  
</script>    
  
</body>
</html> 