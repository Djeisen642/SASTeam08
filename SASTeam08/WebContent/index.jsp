<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link type="text/css" rel="stylesheet" href="css/jquery.jscrollpane.css"/>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="javascripts/jquery-color.js"></script>
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
<!--<div class="navBar" id="campaign1">
	<img class="back_arrow"  src="images/back_arrow.png"/>
	<div class="navBarText">2014 Christmas - Canned Food Drive</div>
</div>-->

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
  <div class="accordion-header">
 	 <img class="back_arrow"  src="images/back_arrow.png"/>
  	 2014 Christmas - Canned Food Drive
  </div>
  <div class="accordion-content">
    <p>Hello</p>
  </div>
  </div>
  <div class="accordion-toggle">
  <div class="accordion-header">
  	<img class="back_arrow"  src="images/back_arrow.png"/>
  	Creative Thanksgiving
  </div>
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
  <div class="accordion-header">
  	<img class="back_arrow"  src="images/back_arrow.png"/>
  	Fall, All Things Pumpkin</div>
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
  <div class="accordion-header">
	  <img class="back_arrow"  src="images/back_arrow.png"/>
	  End of Summer BBQ</div>
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
	var showingDashboard = true; 
	$('.accordion-toggle').click(function () {
		if (!$(this).hasClass("navBar")) {
			$(this).addClass("navBar", true);
			$(this).animate({backgroundColor:"#8cb755"}, 300);
			$('.accordion-toggle').not($(this)).animate({backgroundColor:"#0D7D7B"});
			$('.accordion-toggle').not($(this)).removeClass("navBar");
			$('.navBar').prependTo('#dock');
		} else {
			//clicking on a campaign header should hide the dashboard
			if (showingDashboard === true) {
				$('.dashboard').animate({left:-175}, 300);
				$(this).find('.accordion-header').animate({marginLeft:"15px"}, 300);
				$(this).find('.accordion-header > .back_arrow').animate({opacity:1}, 1000);
				$(".accordion-toggle").not($(this)).animate({opacity:0});
				$(this).css({borderBottom:"0px"});
				showingDashboard = false; 
			//clicking again should hide the dashboard
			} else {
				$('.dashboard').animate({left:0}, 300);
				$(this).find('.accordion-header').animate({marginLeft:"200px"}, 300);
				$(this).find('.accordion-header > .back_arrow').animate({opacity:0}, 300);
				$(".accordion-toggle").not($(this)).animate({opacity:1});
				$(this).css({borderBottom:"1px solid white"});
				showingDashboard = true;
			}
		}
	});
	
	
	
	$(document).ready(function($) {
		$(".accordion-toggle:first").css({backgroundColor:"#8cb755"});
		$(".accordion-toggle:first").addClass("navBar");
		
		/*$('#dock').find('.accordion-toggle').click(function(){
			
			    //Expand or collapse this panel
			$(this).next().slideToggle('fast');
			
			    //Hide the other panels
			$('.accordion-content').not($(this).next()).slideUp('fast');
		});*/
	});
	
	// Use the function below to add a scroll bar to a div
// 	$(function() {
// 		$('.dashboard').jScrollPane();
// 	});
</script>
</html>
