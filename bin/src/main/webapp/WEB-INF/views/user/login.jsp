<%@ include file="/WEB-INF/header.jsp"%>

<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover" data-stellar-background-ratio="0.5" style="background-image: url(../resources/images/cover_bg_1.jpg);">
				<div class="desc">
					<div class="container">
						<div class="row">
							<div class="col-sm-5 col-md-5">
								<div class="tabulation animate-box">

								   <!-- Tab panes -->
									<div class="tab-content">
									 	<div class="row">
									 	<form id="login_form" method="post">
											<div class="col-xxs-12 col-xs-12 mt">
												<div class="input-field">
													<label for="from">ID:</label>
													<input type="text" class="form-control" id="userid" name="userid" placeholder="ID" required/>
												</div>
											</div>
											<div class="col-xxs-12 col-xs-12 mt">
												<div class="input-field">
													<label for="from">PASSWORD:</label>
													<input type="text" class="form-control" id="pw" name="pw" placeholder="PASSWORD" required/>
												</div>
											</div>
											<div class="col-xxs-12 col-xs-12 mt">	
												 <c:if test="${result == 0}">
											       <div class="alert alert-danger mt-3">Invalid ID or Password</div>
											     </c:if>
										     </div>
											<div class="col-xs-12">
												<input type="submit" class="btn btn-block btn-primary" value="LOG IN">
											</div>
										</form>
										</div>
									</div>
								</div>
							</div>
							<div class="desc2 animate-box">
								<div class="col-sm-7 col-sm-push-1 col-md-7 col-md-push-1">
									<h2>LOG IN</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		
		
  <script>
      /* 로그인 버튼 클릭 메서드 */
      $(".btn-primary").click(function() {
       /*  alert("로그인 버튼 작동"); */
        /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/user/login.do");
        $("#login_form").submit();
      });
    </script>
    
  <%@ include file="/WEB-INF/footer.jsp"%>