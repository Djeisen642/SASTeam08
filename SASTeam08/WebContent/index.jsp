<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link type="text/css" rel="stylesheet" href="css/jquery.jscrollpane.css"/>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="./script/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="./script/jquery.mousewheel.js"></script>
<script type="text/javascript" src="./script/mwheelIntent.js"></script>
<script type="text/javascript" src="./script/jquery.jscrollpane.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SAS Campaign Manager</title>
</head>
<body>
<div class="header">
	<!-- <button class="menu_btn"></button> -->
	<button class="header_btn" id="group"></button>
	<button class="header_btn" id="user"></button>
	<button class="header_btn" id="help"></button>
	<button class="header_btn" id="alert"></button>
	<button class="header_btn" id="search"></button>
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
	<div class="dashboard_link">Calendar</div>
	<div class="dashboard_link">Email</div>
	<img class="sas_db_logo" src="images/sas_db_logo.png">
</div>
<div class="accordion" id="dock">
  <div class="accordion-toggle">
  <div class="accordion-header">Creative Thanksgiving</div>
  </div>
  <div class="accordion-content">
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
  </div>
  <div class="accordion-toggle">
  <div class="accordion-header">Fall, All Things Pumpkin</div>
  </div>
  <div class="accordion-content">
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
    <p>Lorem ipsum dolor sit amet mauris eu turpis.</p>
  </div>
  <div class="accordion-toggle">
  <div class="accordion-header">End of Summer BBQ</div>
  </div>
  <div class="accordion-content">
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
    <p>Vivamus facilisisnibh scelerisque laoreet.</p>
  </div>
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
	
	$(document).ready(function($) {
		$('#dock').find('.accordion-toggle').click(function(){
			
			    //Expand or collapse this panel
			$(this).next().slideToggle('fast');
			
			    //Hide the other panels
			$('.accordion-content').not($(this).next()).slideUp('fast');
		});
	});
	
	// Use the function below to add a scroll bar to a div
// 	$(function() {
// 		$('.dashboard').jScrollPane();
// 	});
</script>
</html>
