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
		<tbody class="class="dataSection">
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
        			<select name="type">
						<option value="" <c:out value="${pageMake.cri.type == null?'selected':'' }"/>>--</option>
						<option value="T" <c:out value="${pageMake.cri.type eq 'T'?'selected':'' }"/>>제목</option>
						<option value="C" <c:out value="${pageMake.cri.type eq 'C'?'selected':'' }"/>>내용</option>
						<option value="W" <c:out value="${pageMake.cri.type eq 'W'?'selected':'' }"/>>작성자</option> 
						<option value="TC" <c:out value="${pageMake.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
					    <option value="TW" <c:out value="${pageMake.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
						<option value="TCW" <c:out value="${pageMake.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option> 
					</select>		
            <input type="text" name="keyword" value="${pageMake.cri.keyword }"> 
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
    	
    	var pageNum=$("input[name=pageNum]").val()
    	var amount=$("input[name=amount]").val()
    	var keyword=$("input[name=keyword]").val()
    	var type=$("input[name=type]").val()
    	var category=$("input[name=category]").val()
    	
    	if(pageNum !="" ||amount != "" || keyword != "" || type !=""|| category !=""){
    		searchList(pageNum,amount,keyword,type, category);	
    	}else{
    		searchList(1,"","","");
    	}
    	
	    }); 
    
    	//검색버튼 
	    $("#searchButton").on("click", function(e){
	        e.preventDefault();
	        
	        //현재 페이지
	        var pageNum=$("input[name=pageNum]").val();
	        
	        //한 페이지당 보여질 게시물 수
	    	var amount=$("input[name=amount]").val();
	    	
	        //키워드
	    	var keyword=$("input[name=keyword]").val();
	    	
	        //검색유형
	    	var type=$("input[name=type]").val();
	    	
	        //카테고리
	    	var category=$("input[name=category]").val();
	       
	       searchList(pageNum, amount, keyword, type, category);	
	
	       /*  moveForm.append("<input type='hidden' name='bid' value='"+ $(this).attr("href")+ "'>");
	        moveForm.attr("action", "/board/boarddetail");
	        moveForm.submit(); */
	   
    }); 
    	
    	//리스트 조회
    	function searchList(pageNum, amount, keyword, type, category){

   	        var pageNumVal=$("input[name=pageNum]").val();
   	    	var amountVal=$("input[name=amount]").val();
   	    	var keywordVal=$("input[name=keyword]").val();
   	    	var typeVal=$("input[name=type]").val();
   	    	var categoryVal=$("input[name=category]").val();
    		
	   	$.ajax({
			url:"/getboardlist",
			type:"get",
			data:{"pageNum":pageNumVal,
				"amount":amountVal,
				"keyword":keywordVal,
				"type":typeVal, 
				"category":categoryVal},
			dataType : "json",
			success : function(data){
		
				var pageMake = data.pageMakeVO;
				var pageNum = pageMake.cri.pageNum;
				var amount = pageMake.cri.amount;
				var keyword = pageMake.cri.keyword;
				var type = pageMake.cri.type;
				var typeArr = pageMake.cri.typeArr;
				var startPage = pageMake.startPage;
				var endPage = pageMake.endPage;
				var prev = pageMake.prev;
				var next = pageMake.next;
				var total = pageMake.total;
				
				  updateTable(data);
				  makePagination(total, amount, pageNum);
				  
			}
	   	});
    	
    	}
    	
    	function makePagination(total, amount, pageNum){
    	    //total = 총 갯수
    	    //bottomSize = 하단크기
    	    //listSize = 화면에서 보여줄 크기
    	    //cursor = 현재 나의 페이지

    	    let realEnd = Math.ceil(total / amount);  //한 화면에 보여줄 갯수에서 구한 하단 총 갯수 

    	    let startPage = pageNum - pageNum % amount + 1;  //하단 최초 숫자
    	    let endPage = pageNum - pageNum % pageNum + pageNum;  //하단 마지막 숫자

    	    if(endPage > realEnd) endPage = realEnd;  //총 갯수보다 큰 경우 방지

    	    return {
    	    	startPage,
    	    	endPage,
    	    	realEnd,
    	        total,
    	        amount,
    	        pageNum
    	    }
    	}
    	
    	
    	   function formatDateToYYYYMMDD(dateString) {
    	        const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
    	        const date = new Date(dateString);
    	        return new Intl.DateTimeFormat('en-US', options).format(date);
    	    }

    	    // 서버에서 받은 데이터로 테이블을 업데이트하는 함수를 정의합니다.
    	    function updateTable(data) {
    	        var table = $("table tbody");
    	        table.empty();

    	        for (var i = 0; i < data.length; i++) {
    	            var row = data[i];
    	            var formattedBregdate = formatDate(row.bregdate);
    	            var formattedBupdate = formatDate(row.bupdate);
    	            var rowHtml = "<tr>" +
    	                "<td>" + row.bid + "</td>" +
    	                "<td>" + row.cate + "</td>" +
    	                "<td><a href='/board/boarddetail?bid=" + row.bid + "'>" + row.btitle + "</a></td>" +
    	                "<td>" + formattedBregdate + "</td>" + 
    	                "<td>" + formattedBupdate + "</td>" + 
    	                 "</tr>";
    	            table.append(rowHtml);
    	        }
    	    }
    	 
    	    // 날짜를 yyyy/MM/dd 형식으로 변환하는 함수
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