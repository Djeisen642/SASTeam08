<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SAS Campaign Manager</title>
</head>
<body>
<div class="header"></div>
<div class="navBar">
<button class="custom_btn"> Add Campaign +</button>
</div>
<div class="chatBar" id="chatBar"></div>
</body>
<script>
	var showing = true; 
	$('#chatBar').on('click', function () {
		if (showing === true) {
			$('#chatBar').animate({right:-280}, 300);
			showing = false; 
		} else {
			$('#chatBar').animate({right:0}, 300);
			showing = true;
		}
		
	});
	
</script>
</html>
