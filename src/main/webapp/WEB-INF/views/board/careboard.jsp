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
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;"><a href="/board/boardlist">케어 게시판</a></h2>
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
							<a href="/board/careboardadd"><button type="button" class="btn btn-primary" style="float:right">등록</button></a>
						</c:if>
					    <a href="<c:url value='/board/careExcelDown' />" class="excel_btn" target="_blank" id="excelDown"><button type="button" class="btn btn-primary" style="float:right">엑셀다운</button></a>
						</div>
					</div>
					<!-- 카테고리, 키워드 검색 -->
					<form id="excelForm" action="/board/careExcelDown" method="post"> 
					<div class="cate_area" style="display: inline-block;">
						<select name="cno" id="categorySelect">
							    <option value="0">전체</option> <!-- 전체 카테고리를 나타내는 옵션 -->
						    <c:forEach items="${careBoardCateList}" var="cBcate">
						        <option value="${cBcate.DID}">${cBcate.DNAME}</option>
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
			<br>
				
				<table class="table">
					<tr style="background-color: #f5f5f5;">
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
				
			<!-- 페이징 -->
			  <div class="pageInfo_wrap" >
			        <div class="pageInfoArea">
			  		 <ul id="pageInfo" class="pageInfo">
			  		 
			  		 </ul>
		        </div>
		    </div>
			</div>
			
		</div>
		<button type="button" class="btn btn-primary" style="float:right" id="topBtn" onclick="scrollToTop()">Top</button>
		</div>
		
<script>
	var currPage = 1;
	
	$(document).ready(function () {
	// 초기 페이지 로드
	getPage(currPage);
	
	//무한 스크롤
	$(function(){

		$(window).scroll(function(){
			let $window = $(this);
			let scrollTop = $window.scrollTop();
			let windowHeight = $window.height();
			let documentHeight = $(document).height();
			
			console.log("scrollTop :" + scrollTop + "| windowHeight : " + windowHeight + " | documentHeight : " + documentHeight);
			
			if(scrollTop + windowHeight + 1 >= documentHeight){
				currPage++;
// 				getPage(currPage);
				setTimeout(getPage(currPage), 200);
			}
		})
	})
	
	});
	
	//     // 스크롤 이벤트 감지
	//     $(window).scroll(function () {
	//         // 스크롤이 페이지의 하단에 도달하면 다음 페이지를 로드
	//         if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
	//             currPage++;
	//             getPage(currPage);
	//         }
	//     });
	// 	var currPage = 1;
	// 	var isLoading = false;
	
	// 	$(document).ready(function () {
	// 	     // 초기 페이지 로드
	// 	     getPage(currPage);
	
	// 	$(window).on("scroll", function() {
	// 		var scrollTop = $(window).scrollTop(); // 위로 스크롤된 길이
	// 		var windowsHeight = $(window).height(); //웹브라우저의 창의 높이
	// 		var documentHeight = $(document).height(); // 문서 전체의 높이
	// 		var isBottom = scrollTop + windowsHeight + 10 >= documentHeight;
	// 		var endPage = pageMake.endPage;
			
	// 		if (isBottom) {
	// 			//만일 현재 마지막 페이지라면
	// 			if (currPage >= endPage) {
	// 				return false; //함수종료
	// 			} else {
	// 				isLoading = true; //위에서 종료되지 않으면 로딩상태를 true로 변경
	// 				$("#load").show(); //로딩바 표시
	// 				currPage++; //현재페이지 1증가
	// 				getPage(pageNum); //추가로 받을 리스트 ajax처리
	// 			}
	// 		}
	// 	});
		

    // 검색 버튼 클릭 이벤트
    $("#searchButton").on("click", function (e) {
        e.preventDefault();
        currPage = 1; // 검색 시 첫 페이지부터 보여주도록 초기화
        getPage(currPage);
    });

    //게시글 목록 조회
	function getPage(pageNum) {
		currPage=pageNum;
		var amount = $("input[name='amount']").val();
		var type = $(".search_area select").val();
  		var keyword = $(".search_area input[name='keyword']").val();
    	var cno = $("#categorySelect").val();

 		console.log('겟페이지 진입');
 		console.log(cno);
 		
		$.ajax({
			url:"/board/getcarelist",
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
		  		updateBoardList(boardlist); 
	        },
	        error: function (request, status, error) {
	            console.log(request.status);
	            console.log(request.responseText);
	            console.log(error);
	        }
	    });
	}
	
// 	function updateScroll(pageMake) {
// 		var currPage = 1;
// 		var isLoading = false;
// 		var endPage = pageMake.endPage;
// 		var total = pageMake.total;
		    
		    
// 		$(window).on("scroll", function() {
// 			var scrollTop = $(window).scrollTop(); // 위로 스크롤된 길이
// 			var windowsHeight = $(window).height(); //웹브라우저의 창의 높이
// 			var documentHeight = $(document).height(); // 문서 전체의 높이
// 			var isBottom = scrollTop + windowsHeight + 10 >= documentHeight;
			
// 			if (isBottom) {
// 				//만일 현재 마지막 페이지라면
// 				if (currPage >= total) {
// 					return false; //함수종료
// 				} else {
// 					isLoading = true; //위에서 종료되지 않으면 로딩상태를 true로 변경
// 					$("#load").show(); //로딩바 표시
// 					currPage++; //현재페이지 1증가
// 					getPage(currPage); //추가로 받을 리스트 ajax처리
// 				}
// 			}
// 		})
		
// 	}

	function updateBoardList(boardlist) {
		
	    // boardlist 변수를 사용하여 게시물 목록을 업데이트
	    var boardListHtml = "";

	    for (var i = 0; i < boardlist.length; i++) {
	        var board = boardlist[i];
	        boardListHtml += "<tr>";
	        boardListHtml += "<td>" + board.bid + "</td>";
	        boardListHtml += "<td>" + board.userid + "</td>";
	        boardListHtml += "<td>" + board.dname + "</td>";
	        boardListHtml += "<td><a href='/board/boarddetail?bid=" + board.bid + "'>" + board.btitle + "</a></td>";
	        boardListHtml += "<td>" + formatDate(board.bregdate) + "</td>";
	        boardListHtml += "<td>" + formatDate(board.bupdate) + "</td>";
	        boardListHtml += "</tr>";
	    }
	    if (currPage === 1) {
	    	$(".dataSection").html(boardListHtml);
	    }else{
	    	$(".dataSection").append(boardListHtml); //무한스크롤은 뒤에 데이터 붙여야하므로
	    }
	    console.log(boardListHtml);
	}
	

	  
 	 // 날짜를 yyyy/MM/dd 형식으로 변환하는 함수
    function formatDate(date) {
        var formattedDate = new Date(date);
        var year = formattedDate.getFullYear();
        var month = (formattedDate.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 필요
        var day = formattedDate.getDate().toString().padStart(2, '0');
        return year + '/' + month + '/' + day;
    }
 	 
//	  function formatDateToYYYYMMDD(dateString) {
//     const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
//     const date = new Date(dateString);
//     return new Intl.DateTimeFormat('en-US', options).format(date);
// }

//     function formatDate(date) {
// 	    var formattedDate = new Date(date);
// 	    var year = formattedDate.getFullYear();
// 	    var month = (formattedDate.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 필요
// 	    var day = formattedDate.getDate().toString().padStart(2, '0');
// 	    var hours = formattedDate.getHours().toString().padStart(2, '0');
// 	    var minutes = formattedDate.getMinutes().toString().padStart(2, '0');
// 	    var seconds = formattedDate.getSeconds().toString().padStart(2, '0');
// 	    var milliseconds = formattedDate.getMilliseconds().toString().padStart(3, '0');
// 	    return year + '/' + month + '/' + day + ' ' + hours + ':' + minutes + ':' + seconds + '.' + milliseconds;
	    
// }
 	 
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
    		
	 		$(this).attr("href","<c:url value='/board/careExcelDown' />"+"?"+ $("#excelForm").serialize() );
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

  //top 버튼
    function scrollToTop() {
    	  $("html, body").animate({ scrollTop: 0 }, "slow");
    }
    	
    // top 이벤트 처리
    $(window).scroll(function() {
      if ($(this).scrollTop() > 100) {
        $('#topBtn').fadeIn();
      } else {
        $('#topBtn').fadeOut();
      }
    });


			
  
</script>    
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>