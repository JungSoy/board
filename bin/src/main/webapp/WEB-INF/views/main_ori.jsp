<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Board</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
    .header {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 20px;
    }

    h2 {
        margin: 0;
    }

    .content {
        text-align: center;
        padding: 20px;
    }

    .login-form {
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .button, .user-info span {
        margin: 10px;
        font-weight: bold;
    }
    .btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
    text-decoration: none; /* 밑줄 제거 */
}

    .btn-large {
        padding: 20px 40px;
        font-size: 24px;
    }
</style>
</head>
<body>
<div class="header">
    <h1>Board</h1>
</div>
<div class="content">
    <div class="container">
        <div class="login-form">
            <c:if test="${user == null}">
                <a class="btn btn-primary btn-lg btn-large" href="/user/login">Log In</a>
                <span><a class="btn btn-secondary btn-lg btn-large" href="/user/join">Sign Up</a></span>
            </c:if>
            <c:if test="${user != null}">
                <div class="user-info">
                    <span>Name: ${user.uname}</span>
                    <span>Email: ${user.uemail}</span>
                    <span>Phone: ${user.phone}</span>
                </div>
                <a class="btn" href="/board/boardlist">Go to Board</a>
                <a class="btn" href="/user/logout">Log Out</a>
            </c:if>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
   