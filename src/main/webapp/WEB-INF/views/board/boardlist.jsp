<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<head>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<style>

ol.pagination {
    color: orange; 
    }
    
</style>
</head>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">
<br>
					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;"><a href="/board/boardlist">자유 게시판</a></h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	
<section class="py-5 text-center container"></section><br><br><br>

		<div class="container">
			<div style="padding-top: 50px">
			<div class="table_wrap">
					<div class="row form-group" >
						<div class="col-md-12">
						<c:if test="${user.userid != null}">
							<a href="/board/boardadd"><button type="button" class="btn btn-primary" style="float:right">등록</button></a>
						</c:if>
					    <a href="<c:url value='/board/excelDown' />" class="excel_btn" target="_blank" id="excelDown"><button type="button" class="btn btn-primary" style="float:right">엑셀다운</button></a>
						</div>
					</div>
				
				<table class="table">
					<tr style="background-color: #f5f5f5;">
<!-- 						<th class="rn_width">rn</th> -->
						<th class="bid_width">번호</th>
						<th class="userid_width">작성자</th>
						<th class="cate_width">카테고리</th>
						<th class="btitle_width">제목</th>
						<th class="bregdate_width">작성일</th>
						<th class="bupdate_width">수정일</th>
					</tr>
					<tbody class="dataSection">
						<!-- Ajax로 목록 조회 -->
					</tbody>
				</table>
				<form id="excelForm" action="/board/excelDown" method="post"> 
					<div class="cate_area" style="display: inline-block;">
						<select name="cno" id="categorySelect">
							    <option value="0">전체</option> <!-- 전체 카테고리를 나타내는 옵션 -->
						    <c:forEach items="${boardCateList}" var="bCate">
						        <option value="${bCate.DID}">${bCate.DNAME}</option>
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
			            <button id="searchButton" type="button" class="btn btn-primary">Search</button>
			        </div>
			    </div> 
			</form>
			<!-- 페이징 -->
			  <div class="pageInfo_wrap" >
			        <div class="pageInfoArea">
			  		 <ul id="pageInfo" class="pageInfo">
			  		 
			  		 </ul>
		        </div>
		    </div>
			</div>
			
		</div>
		</div>
		
<script>
	var currPage = 1;
//     var moveForm = $("#moveForm");
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
				// 서버로부터 받은 데이터를 사용하여 페이지네이션 및 게시물 목록 업데이트
				updatePagination(data.pageMake);
		  		updateBoardList(data.boardlist); 
		  		 
// 				var pageMake = data.pageMake;
// 				var boardlist = data.boardlist;
// 				updatePagination(pageMake);
// 		  		updateBoardList(boardlist); 
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
			var total = pageMake.total;
			var realEnd = pageMake.realEnd;
			var pageLimit = 1;	//페이지 버튼 1개 이상이면 맨 앞으로 가는 버튼 나타내기
		    var pageInfoHtml = "";
		
		    pageInfoHtml += '<input type="hidden" id="pageNum;" name="pageNum;" value="1">';
	        pageInfoHtml += '<ol class="pagination" id="pagination">';
	        
	        //첫페이지로
	        if(currPage > 1 && pageLimit < currPage){
	            pageInfoHtml += '<li class="pageInfo_btn"><a href="javascript:getPage(' + 1 + ')"><<</a></li>';
		 	}
	        
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
	        
	        //페이지 맨 끝으로 이동
	        
	        //맨 끝페이지로 가기
	        //변수로 lastPage 만들기
	        //나머지 없으면 total/10 / 나머지 있으면 total/10 + 1
	        if(currPage < total && next <total ){
	        	var lastPage = total % 10 == 0 ? total/10 : Math.ceil(total/10);
	            pageInfoHtml += '<li class="pageInfo_btn"><a href="javascript:getPage(' + lastPage + ')">>></a></li>';
	        pageInfoHtml += '</ol>';
	        
	        console.log('마지막 페이지' + lastPage);
	        console.log('총 갯수' + total);
	        }
	        
	        
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
// 	        boardListHtml += "<td>" + board.rn + "</td>";
	        boardListHtml += "<td>" + board.bid + "</td>";
	        boardListHtml += "<td>" + board.userid + "</td>";
	        boardListHtml += "<td>" + board.dname + "</td>";
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
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>