<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Your Name">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
      .container {
        max-width: 330px;
        padding: 15px;
        margin: 0 auto;
      }
      .form-signin {
        width: 100%;
        max-width: 330px;
        padding: 15px;
        margin: 0 auto;
      }
      .form-control {
        position: relative;
        box-sizing: border-box;
        height: auto;
        padding: 10px;
        font-size: 16px;
      }
      .form-floating {
        position: relative;
      }
      .form-floating input {
        width: 100%;
      }
       .btn-lg {
        padding: 10px 40px;
        font-size: 15px;
    }
      
    </style>
  </head>
  <body class="text-center">
    <main class="form-signin">
      <form id="login_form" method="post">
        <h1 class="h3 mb-3 fw-normal">Login</h1>
        <div class="form-floating">
          <input type="text" name="userid" class="form-control" id="userid" placeholder="ID" required>
        </div>
        <br>
        <div class="form-floating">
          <input type="password" name="pw" class="form-control" id="pw" placeholder="Password" required>
        </div>
        <c:if test="${result == 0}">
          <div class="alert alert-danger mt-3">Invalid ID or Password</div>
        </c:if>
        <br>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign In</button>
      </form>
    </main>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script>
      /* 로그인 버튼 클릭 메서드 */
      $(".btn-primary").click(function() {
       /*  alert("로그인 버튼 작동"); */
        /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/user/login");
        $("#login_form").submit();
      });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</html>