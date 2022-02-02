<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
          <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.28.4/sweetalert2.min.css" integrity="sha256-1mciy4fJXvhqkSOwLvtpsTeBJ02AgAcmNYTzRMrzloU=" crossorigin="anonymous" />
 <style>
 @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap');
 </style>
<c:if test="${t_result eq 1}">
<script type="text/javascript">
window.onload = function() {
    swal.fire({
    	 icon: "success",
    	 title: '<div style="font-size:35px;font-family:Dongle;color:#A9A9A9;">${t_msg}</div>',
        confirmButtonColor: "#A9A9A9",
        confirmButtonText: "확인",
        timer: 3000,
       
    }).then(function(){
        pp.method="post";
        pp.action="${t_url}";   
        pp.submit();
        })
    };
    
    
//    .then(function(){
//    location.href="${t_url}";   })
//};



</script>
</c:if>

<c:if test="${t_result eq 0}">
<script type="text/javascript">
window.onload = function() {
	swal.fire({
		 icon: 'question',
		 title: '<div style="font-size:35px;font-family:Dongle;color:#A9A9A9;">${t_msg}</div>',
        confirmButtonColor: "#A9A9A9",
        confirmButtonText: "확인",
        timer: 3000,
    }).then(function(){
    pp.method="post";
    pp.action="${t_url}";   
    pp.submit();
    })
};
</script>
</c:if>

</head>
<body>
<form name="pp">
	<input type="hidden" name="t_id" value="${t_id}">
</form>
</body>
</html>