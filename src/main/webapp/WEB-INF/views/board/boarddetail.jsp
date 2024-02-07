<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
	
<style>
 .slideDownBtn {
        display: block;
        width: 100%; /* 원하는 가로 길이 설정 */
        height: 40px; /* 원하는 세로 길이 설정 */
        line-height: 40px; /* 버튼 세로 중앙 정렬을 위한 line-height 설정 */
        text-align: center; /* 텍스트를 가로 중앙 정렬 */
        font-size: 16px; /* 버튼의 글자 크기 */
        color: orange; /* 버튼 글자색 (주황색) */
        border: 1px solid orange; /* 테두리 스타일 및 색상 (주황색) */
        border-radius: 5px; /* 버튼 모서리 둥글게 만들기 */
        cursor: pointer; /* 포인터 형태로 마우스 오버 시 시각적 피드백 제공 */
        background-color: transparent; /* 배경색 없음 */
    }
 .slideUpBtn {
        display: block;
        width: 100%; /* 원하는 가로 길이 설정 */
        height: 40px; /* 원하는 세로 길이 설정 */
        line-height: 40px; /* 버튼 세로 중앙 정렬을 위한 line-height 설정 */
        text-align: center; /* 텍스트를 가로 중앙 정렬 */
        font-size: 16px; /* 버튼의 글자 크기 */
        color: orange; /* 버튼 글자색 (주황색) */
        border: 1px solid orange; /* 테두리 스타일 및 색상 (주황색) */
        border-radius: 5px; /* 버튼 모서리 둥글게 만들기 */
        cursor: pointer; /* 포인터 형태로 마우스 오버 시 시각적 피드백 제공 */
        background-color: transparent; /* 배경색 없음 */
    }
</style>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">
<br>
					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">게시글 상세조회</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	
	<section class="py-5 text-center container"></section><br><br><br>
	
<body>
  <div class="container">

    <!-- 주 게시물 -->
    <div class="panel panel-default">
      <div class="panel-heading">
        [ ${pageInfo.dname} ] ${pageInfo.btitle}
         <div class="text-right">
       		   글 번호 : ${pageInfo.bid} | ${pageInfo.userid}
        </div>
        </div>
      <div class="panel-body">
        <h5>${pageInfo.bcontent}</h5>
        <br><br><br>
       
        
        <div class="text-right">작성일: <fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bregdate}"/></div>
        <div class="text-right">수정일: <fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.bupdate}"/></div>

		<!-- 첨부파일 출력 -->
		<div class="form_section">
			<div class="input_wrap">
			</div>
			<div class="form_section_content">
				<div class="input_wrap">
					<div id="uploadResult">
				
													
					</div>
				</div>
			</div>
	    </div>
	    
	    <div class="btn_wrap">
		<a class="btn btn-primary pull-right" id="list_btn">목록 페이지</a> 
			<c:if test="${user.userid == pageInfo.userid}">
				<a class="btn btn-primary pull-right" id="modify_btn">수정 하기</a>  
			</c:if>
		</div>
		<form id="infoForm" action="/board/boardmodify" method="get">
			<input type="hidden" id="bid" name="bid" value='<c:out value="${pageInfo.bid}"/>'>
		</form>
	    
        
      </div>
    </div>

    	<!-- 댓글 등록 -->
	    <input id="bid" type="hidden" name="bid" value="${pageInfo.bid}">
	    <input id="rwriter1" type="hidden" name="rwriter1" value="${user.userid}">
	 		<c:if test="${user.userid == pageInfo.userid}">
		 		<div class="panel panel-default">
			      <div class="panel-heading">댓글 등록</div>
			      <div class="panel-body">
			        <textarea name="rcontent1" id="rcontent1" onkeyup="fn_chk_byte(this);" rows="3" class="form-control"></textarea>
			        <br>
				        <div style="margin-top:20px;">
							<span id="messagebyte">0</span><span>/ 2000 Byte</span>
						</div>
			        <div class="btn_wrap">
			        	<button class="btn btn-primary pull-right" id="rSubmit">댓글등록</button>
			        </div>
			      </div>
			    </div> 
			</c:if>
	<!-- 댓글 접기 -->    
	<div class="slideDown">   
	 
	<!-- 댓글 게시물 -->
	<div class="panel panel-default">
    <div class="panel-heading">댓글 리스트[ ${cnt}개의 댓글 ]</div>
    <div class="panel-body">
        <c:forEach items="${reply1List}" var="r">
            <input type="hidden" id="rid1" name="rid1" class="rid1" value="${r.rid1 }"> 
            <div id="rep1_${r.rid1 }" class="panel panel-default">
                <div class="panel-heading">${r.rwriter1} | <fmt:formatDate pattern="yyyy/MM/dd" value="${r.rregdate1}"/></div>
                <div class="panel-body">
                    <p>${r.rcontent1}</p>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="btn-group pull-right">
                          <div class="btn_wrap">
			                        <c:if test="${user.userid == r.rwriter1}">
			                            <a class="btn" id="r1modify_btn" onclick="javascript:updateModal('${r.rid1}', '${r.rcontent1}')">수정</a>  
			                            <a class="btn" id="r1delete_btn" onclick="javascript:deleteBtn('${r.rid1}')">삭제</a>  
			                        </c:if>
			                        <c:if test="${user.userid != null}">
			                            <a class="btn" id="r2add_btn" onclick="javascript:add2Modal(${r.rid1})">대댓글</a>  
			                        </c:if>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
            
              <!-- 대댓글 목록 (어려움...) -->
             <div class="panel-body">
		        <c:forEach items="${reply2list}" var="r2list">
			        <c:if test="${r.rid1 == r2list.rid1}">
				        <p><b>[ ${r2list.cnt2}개의 대댓글 ]</b></p>
		          		<input type="hidden" id="r2_rid1" name="r2_rid1" value="${r2list.rid1 }"> 
			        		<c:forEach var="r2" items="${r2list.list2}">
					          <input type="hidden" id="rid2" value="${r2.rid2 }"> 
					            <div id="rep2_${r2.rid2 }" class="panel panel-default">
					            <div class="panel-heading">${r2.rwriter2} | <fmt:formatDate pattern="yyyy/MM/dd" value="${r2.rregdate2}"/></div>
					                <div class="panel-body" id="reply2body">
					                    <p>${r2.rcontent2}</p>
					                </div>
					                <div class="panel-footer">
					                <div class="row">
					                   <div class="btn-group pull-right">
                          				<div class="btn_wrap">
					                        <c:if test="${user.userid == r2.rwriter2}">
					                            <a class="btn" id="r2modify_btn" onclick="javascript:update2Modal('${r2.rid2}', '${r2.rcontent2}')">수정</a>
					                            <a class="btn" id="r2delete_btn" onclick="javascript:delete2Btn(${r2.rid2})">삭제</a>  
					                        </c:if>
					                    </div>
					                	</div>
					                </div>
					           		</div>
					            </div>
				            </c:forEach>
				          </c:if>
			        </c:forEach>
			    </div>
	        </c:forEach>
	    </div>
	</div><!-- 댓글목록 끝 -->
	</div><!-- 댓글접기 끝 -->
	
	<button class="slideDownBtn">댓글 보기</button>
	<button class="slideUpBtn">댓글 접기</button>
	
   <!-- 댓글 수정 모달 -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="modal-title" aria-hidden="true">
         <div class="modal-dialog" role="documen bnt">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-title">댓글 수정</h5>
                </div>
                <div class="modal-body" id="modal-body">
                    <input type="hidden" id="modal_rid1" >
                    <input type="text" id="modal_rcontent1">
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
    
    <!-- 대 댓글 수정 모달 -->
    <div class="modal fade" id="update2Modal" tabindex="-1" role="dialog" aria-labelledby="modal-title" aria-hidden="true">
         <div class="modal-dialog" role="documen bnt">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-title">대댓글 수정</h5>
                </div>
                <div class="modal-body" id="modal-body">
                    <input type="hidden" id="modal_rid2">
                    <input type="text" id="modal_rcontent2">
                </div>
                <div class="modal-footer" id="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="javascript:update2Ajax()">수정</button>
                    <button type="button" class="btn btn-primary" onclick="modalClose()">닫기</button>
                </div>
            </div>
        </div> 
    </div>
    </div>
<script>
	var form = $("#infoForm");
	
// 	$(document).ready(functino() {
		// 이미지 정보 호출 
		var bid = '<c:out value="${pageInfo.bid}"/>';
		var uploadResult = $("#uploadResult");
		
		$.getJSON("/board/getFileById", {bid : bid}, function(arr){	
	
			console.log(arr); 
			
			if(arr.length === 0){	
				
				return;
			}	
			
// 			var obj = arr[0];	

			var str = "";
			
			str += "<label>첨부파일</label>";
			
			for (let i = 0; i < arr.length; i++) {
				var obj = arr[i];
			
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/board/display?fileName=" + fileCallPath +"'>";
			str += "</div>";		
			
			}
			uploadResult.html(str);						
		    console.log(str);
		});
		
// 	});

	//댓글 접기, 펴기
 	 $( document ).ready( function() {
 		$('.slideDown').hide();
 		 $('button.slideUpBtn').hide();
      
	 $( 'button.slideDownBtn' ).click( function() {
         $( '.slideDown' ).slideDown();
         $('button.slideDownBtn').hide();
         $('button.slideUpBtn').show();
       })
       
     $( 'button.slideUpBtn' ).click( function() {
    	 $( '.slideDown' ).slideUp(100);
         $('button.slideDownBtn').show();
         $('button.slideUpBtn').hide();
     })
 	
 	 });	
 	 
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
		
		if (sms_send()) {	// sms_send() 함수가 true를 반환하는 경우에만 ajax 호출 실행
			
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
					
					$('#rcontent1').val('') //댓글 등록시 댓글 등록창 초기화
					window.location.reload();
				},
				error : function() {
					alert("댓글을 입력해주세요.")
	
				}
			});
		}
	});

	//텍스트 byte 체크
	var limitByte = 2000;
	var totalByte = 0;
	
	function fn_chk_byte(obj){
	    totalByte = 0;
	    var message = $(obj).val();
	
	    for(var i =0; i < message.length; i++) {
	            var currentByte = message.charCodeAt(i);
	            if(currentByte > 128){
	            	totalByte += 2;
	            }else {
	            	totalByte++;
	            }
	    }
	
	    $("#messagebyte").text(totalByte);
	}
	
	function sms_send(){
		if(totalByte > 2000){
			alert(limitByte+"Byte 까지 전송가능합니다.");
			
			return false;	//전송 불가능한 경우 false 반환
		}
		
		return true;	//전송 가능한 경우 true 반환
	}

	//(댓글 수정)updateModal(${r.rid1}, ${r.rcontent1}) 에서 받은 값으로 modal을 띄우는 함수
	function updateModal(rid1, rcontent1) {
	    $("#updateModal").modal('show');
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
// 	        dataType:'json',
	        data: {
	        	rid1: rid1,
	        	rcontent1: rcontent1
	        },
	        success: function(data) {
 				window.location.reload();
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
	    
    //댓글 삭제
    function deleteBtn(rid1){
	   $("#rid1").val(rid1);
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
	}
    
//     $('#r1delete').on("click", function() {
//     	$("#rid1").val(rid1);
//     	var rid1 = $("#rid1").val();
// //     	var bid = $("#bid").val();
    	
//     	  console.log('댓글삭제' + rid1);
//     	  if (confirm("댓글을 삭제하시겠습니까?")) {
// 			$.ajax({
// 				url : "/reply1/reply1delete",
// 				data : {
// 					"rid1" : rid1
// // 					"bid" : bid
// 				},
// 				type : "post",
// 				success : function(result) {
// 					alert("삭제 성공");
// 					$("#rep1_" + rid1).remove();
// 				},
// 				error : function() {
// 					alert("삭제 실패")

// 				}
// 			})
//     	  }
// 		});

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
			alert("대댓글을 입력해주세요.");
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
	    
	  //(대 댓글 수정)update2Modal(${r2.rid2}, ${r2.rcontent2}) 에서 받은 값으로 modal을 띄우는 함수
		function update2Modal(rid2, rcontent2) {
		    $('#update2Modal').modal('show');
			$("#modal_rcontent2").val(rcontent2);
			$("#modal_rid2").val(rid2);
			console.log(rcontent2);
			console.log(rid2);
		}

		function update2Ajax() {
		    var rid2 = $("#modal_rid2").val();
	    	var rcontent2 = $("#modal_rcontent2").val(); 
	    	
		    if (rcontent2 == "") {
				alert("대댓글을 입력해주세요.");
				return;
			}

		    $.ajax({
		        url: "/reply2/reply2update",
		        type: "POST",
// 		        dataType:'json',
		        data: {
		        	rid2: rid2,
		        	rcontent2: rcontent2
		        },
		        success: function(data) {
	 				window.location.reload();
				},
		        error: function(jqXHR, textStatus, errorThrown) {
		        }
		    });
		}

		 $('a[href="#update2Modal"]').click(function(event) {
		      event.preventDefault();
		 
		      $(this).modal({
		        fadeDuration: 250
		      });
		    });
		 
		    function modalClose() {
		        $('#update2Modal').modal('hide'); 
		        $('#update2Modal').hide();
		        $('.jquery-modal').hide();
		    }
		
	    //대댓글 삭제(delete2Btn)
	    function delete2Btn(rid2){
	    	 $("#rid2").val(rid2);
	    	
	    	  console.log('대댓글삭제 rid2 ' + rid2);
	    	  
	    	  if (confirm("대댓글을 삭제하시겠습니까?")) {
				$.ajax({
					url : "/reply2/reply2delete",
					type : "POST",
					data : {
						"rid2" : rid2
					},
					success : function(result) {
						alert("삭제 성공");
						$("#rep2_" + rid2).remove();
					},
					error : function() {
						alert("삭제 실패")

					}
				})
	    	  }
	    	}		    
	    
	    //대 댓글 삭제
// 	    $('#r2delete').on("click", function() {
// 	    	var rid2 = $("#rid2").val();
// 	    	var bid = $("#bid").val();
// 	    	var rid1 = $("#r2_rid1").val();
	    	
// 	    	  console.log('대댓글삭제 rid1 ' + rid1);
// 	    	  console.log('대댓글삭제 rid2 ' + rid2);
// 	    	  if (confirm("댓글을 삭제하시겠습니까?")) {
// 				$.ajax({
// 					url : "/reply2/reply2delete",
// 					data : {
// 						"bid" : bid,
// 						"rid1" : rid1,
// 						"rid2" : rid2
// 					},
// 					type : "post",
// 					success : function(result) {
// 						alert("삭제 성공");
// 						$("#rep2_" + rid2).remove();
// 					},
// 					error : function() {
// 						alert("삭제 실패")

// 					}
// 				})
// 	    	  }
// 			});
	
</script>	

<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>
