<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Travel &mdash; planner</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="../resources/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../resources/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../resources/css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="../resources/css/superfish.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="../resources/css/magnific-popup.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.min.css">
	<!-- CS Select -->
	<link rel="stylesheet" href="../resources/css/cs-select.css">
	<link rel="stylesheet" href="../resources/css/cs-skin-border.css">
	
	<link rel="stylesheet" href="../resources/css/style.css">


	<!-- Modernizr JS -->
	<script src="../resources/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="../resources/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">

		<header id="fh5co-header-section" class="sticky-banner">
			<div class="container">
				<div class="nav-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
					<h1 id="fh5co-logo"><a href="/main"><i class="icon-airplane"></i>Travel</a></h1>
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li class="active"><a href="/main">Home</a></li>
<!-- 							<li> -->
<!-- 								<a href="vacation.html" class="fh5co-sub-ddown">Vacations</a> -->
<!-- 								<ul class="fh5co-sub-menu"> -->
<!-- 									<li><a href="#">Family</a></li> -->
<!-- 									<li><a href="#">CSS3 &amp; HTML5</a></li> -->
<!-- 									<li><a href="#">Angular JS</a></li> -->
<!-- 									<li><a href="#">Node JS</a></li> -->
<!-- 									<li><a href="#">Django &amp; Python</a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
						<c:if test="${user != null}">
							<li><a href="/board/boardlist">board</a></li>
							<li><a href="/board/boardlistscroll">board scroll</a></li>
<!-- 							<li><a href="/user/logout">Log out</a></li> -->
							<li><a id="logoutBtn">Log out</a></li>
						</c:if>
							
						<c:if test="${user == null}">
							<li><a href="/user/login">Log in</a></li>
							<li><a href="/user/join">Sign up</a></li>
						</c:if>	
						
						<c:if test="${user.adminck == 1 }">
                        <li><a href="/admin/main">Admin</a></li>
                    </c:if>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<script>
	    $("#logoutBtn").click(function(){
	        //alert("버튼 작동");
	        $.ajax({
	            type:"POST",
	            url:"/user/logout",
	            success:function(data){
	                alert("로그아웃 성공");
	                document.location.reload();     
	            } 
	        }); 
	    });
		
		
		</script>

		<!-- end:header-top -->
