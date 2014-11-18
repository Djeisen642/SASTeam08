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
<div class="header">
	<!-- <button class="menu_btn"></button> -->
	<img src="images/logo.png" style="float:left;height:30px;width:30px;margin-left:20px;margin-top:4px">
	<img class="icon_btn" id="btn1" src="images/Icon-02.png"/>
	<img class="icon_btn" id="btn2" src="images/Icon-09.png"/>
	<img class="icon_btn" id="btn3" src="images/Icon-10.png"/>
	<img class="icon_btn" id="btn4" src="images/Icon-05.png"/>
</div>
<div class="navBar" id="campaign1">
	<img class="back_arrow"  src="images/back_arrow.png"/>
	<div class="navBarText">2014 Christmas - Canned Food Drive</div>
</div>

<!-- side bar on the left side of screen -->
<div class="dashboard" id="dashboard">
	<img class="logo" src="images/Icon-01.png"/>
	<img class="hbar" src="images/horizontal_bar.png"/>
	<div class="dashboard_link">Dashboard</div>
	<div class="dashboard_link">Campaign <br/> Builder</div>
	<br/>
	<div class="dashboard_link">Analytics</div>
	<div class="dashboard_link">Media <br/> Manager</div>
	<br/>
	<div class="dashboard_link">Calendar</div><br/>
	<div class="dashboard_link">Email</div>
	<img class="sas_db_logo" src="images/sas_db_logo.png">
</div>
<div class="chatBar" id="chatBar"></div>
</body>
<script>
	var showing = true; 
	$('.navBarText').on('click', function () {
		//clicking on a campaign header should hide the dashboard
		if (showing === true) {
			$('.dashboard').animate({left:-175}, 300);
			$('.navBarText').animate({marginLeft:"15px"}, 300);
			$('.back_arrow').animate({opacity:1}, 1000);
			showing = false; 
		//clicking again should hide the dashboard
		} else {
			$('.dashboard').animate({left:0}, 300);
			$('.navBarText').animate({marginLeft:"150px"}, 300);
			$('.back_arrow').animate({opacity:0}, 300);
			showing = true;
		}
		
	});
</script>
</html>
