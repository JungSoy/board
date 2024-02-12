<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<head>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

<style>

	.fixed-size {
	    width: 200px; 
	    height: 350px; 
	 }

</style>

</head>
	
		<div id="fh5co-wrapper">
		<div id="fh5co-page">

		<div id="fh5co-blog-section" class="fh5co-section-gray">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>상품 목록</h3>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row row-bottom-padded-md">
					<c:forEach items="${goodslist}" var="g">
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive fixed-size" src="../resources/static${g.gimg }" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3><a href="#">${g.gname }</a></h3>
										<p>${g.gprice }원</p>
										<p><a href="#">상세보기</a></p>
									</div>
								</div> 
							</div>
						</div>
					</c:forEach>
				</div>
				<button type="button" class="btn btn-primary" style="float:right" id="topBtn" onclick="scrollToTop()">Top</button>
			</div>
		</div>

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

<script>
	var currPage = 1;
	var isLoading = false; // 데이터 로딩 중 여부
	
	$(document).ready(function () {
		getPage(currPage);
	});   
	
	//게시글 목록 조회
	function getPage(currPage) {
		 if (isLoading) return;
		    isLoading = true;		
 		console.log('겟페이지 진입');
 		
		$.ajax({
			url:"/goods/getGoodsList",
			type:"get",
			dataType:'json',
			data:{
				"currPage": currPage
				},
			success : function(data) {
				console.log(data);
		  		 isLoading = false;
	        },
	        error: function (request, status, error) {
	            console.log(request.status);
	            console.log(request.responseText);
	            console.log(error);
	            isLoading = false;
	        }
	    });
	}
	
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