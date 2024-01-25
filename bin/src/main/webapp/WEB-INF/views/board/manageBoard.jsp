<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
</head>
<body>

<script>
$(document).ready(function(){
	
	 let result = "${addBoard_result}";
	    
	    checkResult(result);
	    
	    function checkResult(result){
	        
	        if(result === ''){
	            return;
	        }
	        
	        alert("게시글'${addBoard_result}' 을 등록하였습니다.");
	        
	    }

});
</script>

</body>
</html>