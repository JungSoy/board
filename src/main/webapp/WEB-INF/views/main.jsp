
<%@ include file="/WEB-INF/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
    <!-- 스와이프 CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.css">
    <!-- 스와이프 JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js"></script>
    <style>
	    .swiper-container {
            width: 100%; /* 스와이퍼 컨테이너 너비 설정 */
            margin: 0 auto; /* 가운데 정렬 */
            overflow: hidden; /* 넘치는 부분 숨기기 */
        }
        .swiper-slide {
          width: 430px; 
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .swiper-slide img{
			margin-top:30px;
			width:400px;
			height:400px;
		}
        .thumbImg {
            max-width: 400px;
            max-height: 400px;
             object-fit: contain; /* 이미지 비율 유지 */ 
        }
        .swiper-pagination{
        	margin-top:20px;
        }
        
        .swiper-button-prev, .swiper-button-next {
		    position: absolute; /* 버튼들의 위치를 설정하기 위해 절대 위치로 설정 */
		    top: 50%; /* 컨테이너의 중앙에 위치하도록 설정 */
		    transform: translateY(-50%); /* 세로 중앙 정렬 */
		    z-index: 10; /* 버튼들을 슬라이드 위에 표시하기 위해 겹침 순서를 설정 */
		    background-color: rgba(255, 255, 255, 0.5); /* 버튼 배경 색상 설정 */
		    padding: 10px; /* 버튼 패딩 설정 */
		    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
		    color: white;
		  }
		  
		  p {
 		    text-align: center; /* 내용을 가운데 정렬합니다. */ 
		    color: black;
		}
		  
  
    </style>
    
		<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover" data-stellar-background-ratio="0.5" style="background-image: url(../resources/images/cover_bg_1.jpg);">
<!-- 				<div class="desc"> -->
					<div class="container">
						<div class="row">
								<div class="container" style="margin: 40px auto;">
								<p></p>
<!-- 									<p>강아지 커뮤니티 & 쇼핑몰</p> -->
								</div>
							  <div class="swiper-container">
							        <div class="swiper-wrapper"> </div>
							        <div class="swiper-pagination"></div>
							        <div class="swiper-button-prev"></div>
							        <div class="swiper-button-next"></div>
							   </div>
						</div>
					</div>
<!-- 				</div> -->
			</div>

		</div>
		
		<div id="fh5co-tours" class="fh5co-section-gray">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>이번 달 신제품</h3>
<!-- 						<p>이번 달 가장 많이 판매된 상품 세가지</p> -->
					</div>
				</div>
				<div class="row">
						<c:forEach items="${newgoods}" var="g">
							<div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn">
								<div href="#"><img src="../resources/static${g.gimg }" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
									<div class="desc">
										<span></span>
										<h3>${g.gname }</h3>
										<span class="price">${g.gprice }원</span>
										<br>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="col-md-12 text-center animate-box">
							<p><a class="btn btn-primary btn-outline btn-lg" href="/goods/goodslist">전체 상품 보기<i class="icon-arrow-right22"></i></a></p>
						</div>
				</div>
			</div>
		</div>


<script>
  $(document).ready(function(){
	  
            // 이미지 파일 경로 배열
            var imagePaths = [
            	'../resources/static/img/s1.jpg',
                '../resources/static/img/s2.jpg',
                '../resources/static/img/s3.jpg',
                '../resources/static/img/s4.jpg',
                '../resources/static/img/s5.jpg',
                '../resources/static/img/s6.jpg',
                '../resources/static/img/s7.jpg'
                // 추가 이미지 파일 경로를 여기에 추가할 수 있습니다.
            ];

            // 이미지 슬라이드 동적 생성
            imagePaths.forEach(function (path) {
                var slide = '<div class="swiper-slide">' +
                                '<img class="thumbImg" src="' + path + '">' +
                            '</div>';
                $('.swiper-wrapper').append(slide);
            });

            // 스와이프 설정
            var swiper = new Swiper('.swiper-container', {
                // 옵션 설정
            	loop: true, // 슬라이드 반복 여부
                slidesPerView: 3, // 한 번에 보여지는 슬라이드 개수
                spaceBetween: 50, // 슬라이드 간격
                autoplay: {
                    delay: 2000, // 확인 때문에 3초로 변경
                    pauseOnMouseEnter: true, // 마우스 호버 시 일시 정지
                    disableOnInteraction: false, // 사용자 상호작용 후에도 자동 재생 유지
                },
                pagination: {
        		    el: '.swiper-pagination',
        		    clickable: true
        		  },
        		  navigation: {
        		    nextEl: '.swiper-button-next',
        		    prevEl: '.swiper-button-prev',
        		  }
            });
        });

</script>
	
	<%@ include file="/WEB-INF/footer.jsp"%>		

