<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="action.mainAction"%>
<%@page import="bean.DocBean"%>
<%@page import="bean.CampaignBean" %>
<%@page import="java.util.List" %>    
<%
	mainAction action = new mainAction();
	List<CampaignBean> campaignList = action.getCampaigns();
	List<DocBean> docList = action.getDocs(campaignList.get(0).getId()); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="css/jquery.jscrollpane.css"/>
<script src="javascripts/jquery.js"></script>
<script src="javascripts/jquery-color.js"></script>
<script src="javascripts/handleEditing.js"></script>
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
<div class="activeItem" id="activeItem">
  <div class="accordion-toggle" id="<%= campaignList.get(0).getId() %>">
    <div class="accordion-header">
   	  <img class="back_arrow"  src="images/back_arrow.png"/>
   	  <% 
   	  String title = "";
   	  if (campaignList != null) {
   	  	title = campaignList.get(0).getTitle();
   	  }%>
  	  <div><%= title %></div>
    </div>
  </div>
</div>

<div class="accordion" id="dock">
  <%for (int i = 1; i < campaignList.size(); i++) { %>
  <div class="accordion-toggle" id="<%= campaignList.get(i).getId() %>">
	  <div class="accordion-header">
	  	<img class="back_arrow"  src="images/back_arrow.png"/>
	  	<div><%= campaignList.get(i).getTitle() %></div>
	  </div>
  </div>
  <% } %>
</div>

<div class="documentDisplay">
	<div id="editor">
		<div class="selectedEdit" id="selectedEdit"></div>
		<div class="editIconBar">
			<img src="images/user.png" style="width:50px;height:50px" id="userBtn"/>
			<img src="images/highlightedUser.png" style="width:50px;height:50px" id="huserBtn" />
			<img src="images/add.png" style="width:50px;height:50px" id="addBtn"/>
			<img src="images/highlight.png" style="width:50px;height:50px" id="highlightBtn" />
			<img src="images/vibrate.png" style="width:50px;height:50px" id="vibrateBtn" />
			<img src="images/archive.png" style="width:50px;height:50px" id="archiveBtn"/>
		</div>
		<div class="docEditor" id="docEditor"></div>
	</div>
	<div class="documentDisplayTable">
	</div>
</div>

<div class="chat">
	<div class="chatsReceived" id="chatsReceived">
		<div class="chatItem">
			<img class="chatBubbleAvatar" src="images/chatAvatar.png">
			<div class="chatBubble">This is a chat bubble</div>
		</div>
	</div>
	<textarea class="chatInput"></textarea>
</div>

<div class="imageModal" onclick="hideImageModal()">
	<span class="imageModalImageHelper"></span>
		<img id="imageModalImage" src="" />
</div>

<div class="uploadModal">
	<span class="uploadActionHelper"></span>
	<div class="uploadActionBox">
		<input type="file" id="fileInput"/>
		
		<div class="uploadTextInput">
			<p>
				<span>
					Username:
					<input class="form-control" type="text" id="creatorInput" />
				</span>
			</p>
			<p>
				<span>
					Document Title:
					<input class="form-control" type="text" id="docTitleInput" />
				</span>
			</p>
			<p>
				<div id="fileToUpload"></div>
			</p>
		</div>
		<div class="uploadUI">
			<button class="btn btn-default browse_btn" id="browse_btn">Browse</button>
			<button class="btn btn-primary submit_btn" id="submit_btn">Upload</button>
			<button class="btn btn-warning close_btn" id="close_btn">Close</button>
		</div>
	</div>
</div>

<div class="chatBar" id="chatBar"></div>
</body>
<script>
	var showingDashboard = true; 
	$('.accordion-toggle').click(function () {
		if (!$(this).hasClass("navBar")) { //when an item is clicked and is not top item
			var goingActive = $(this);
			var lastActive = $('#activeItem > .accordion-toggle');
			var id = $(this).attr("id");
			goingActive.animate({marginLeft:"200%"}, 300);
			getDocs(id);
			$('#activeItem').animate({top:"-20px"}, 300, function () {
				$('.accordion-toggle').not(goingActive).css({backgroundColor:"#0D7D7B"}); //change all other bgs to dark green
				$(goingActive).addClass("navBar", true);
				$('#activeItem').css({top:"45px"});
				lastActive.css({borderBottom:"1px solid white", marginLeft: "200%"});
				lastActive.appendTo("#dock"); // prepend activeItem to dock
				lastActive.animate({marginLeft:"0"}, 300);
				goingActive.prependTo('#activeItem');
				goingActive.animate({marginLeft:"0"}, 300);
				$('.accordion-toggle').not(goingActive).removeClass("navBar"); // remove navBar class from all other items
				$(goingActive).animate({backgroundColor:"#8cb755"}, 300); //change bg to light green
				$(goingActive).css({borderBottom:"0px"});
			});
		} else { //when an item is clicked and is top item
			//clicking on a campaign header should hide the dashboard
			if (showingDashboard === true) {
				$('.dashboard').animate({left:-175}, 300); //hide the dashboard
				$(this).find('.accordion-header').animate({marginLeft:"15px"}, 300); //move text left
				$(this).find('.accordion-header > .back_arrow').animate({opacity:1}, 1000); // show back arrow
				var allOtherAccordionToggles = $(".accordion-toggle").not($(this));
				allOtherAccordionToggles.animate({opacity:0}, function (){
					allOtherAccordionToggles.hide();
				}); //hide all other accordion-toggle classes
				$(".documentDisplay").animate({left:"40px", bottom:"5px", right:"200px"}, 300);
				$(".chatsReceived").empty();
				$(".chat").animate({right: "20px"});
				$("#editor").stop(true, true).fadeIn({ duration: 300, queue: false }).css('display', 'none').slideDown(300); //show editor
				$(".documentDisplay").css({zIndex:"102"});
				
				showingDashboard = false; 
			//clicking again should show the dashboard
			} else {
				$('.dashboard').animate({left:0}, 300);
				$(this).find('.accordion-header').animate({marginLeft:"200px"}, 300);
				$(this).find('.accordion-header > .back_arrow').animate({opacity:0}, 300);
				$(".accordion-toggle").not($(this)).show();
				$(".accordion-toggle").not($(this)).animate({opacity:1}, 300);
				$(".documentDisplay").animate({left:"180px", bottom:"138px", right:"180px"}, 300);
				$(".chat").animate({right: "-200px"});
				$("#editor").stop(true, true).fadeOut({ duration: 300, queue: false }).slideUp(300); //hide editor
				$(".documentDisplay").css({zIndex:"10"});
				showingDashboard = true;
			}
		}
	});
	
	
	// handle chat functionality
	$(".chatInput").on("keyup", function (e) {
		var code = (e.keycode) ? e.keycode : e.which; 
		if (code === 13) {
			var chatItem = "<div class=\"chatItem\">";
			var img = "<img class=\"chatBubbleAvatar\" src=\"images/chatAvatar.png\"/>";
			var submit = "<div class=\"chatBubble\">" + $('.chatInput').val() + "</div></div>";
			$(chatItem + img + submit).appendTo($('.chatsReceived'));
			updateChatScroller();
			$('.chatInput').val("");
		}
	});
	
	
	$(document).ready(function($) {
		$("#editor").hide();
		$(".activeItem > .accordion-toggle").css({backgroundColor:"#8cb755", borderBottom:0});
		$(".activeItem > .accordion-toggle").addClass("navBar");
		var activeId = $(".activeItem > .accordion-toggle").attr("id");
		getDocs(activeId);
		/*$('#dock').find('.accordion-toggle').click(function(){
			
			    //Expand or collapse this panel
			$(this).next().slideToggle('fast');
			
			    //Hide the other panels
			$('.accordion-content').not($(this).next()).slideUp('fast');
		});*/
	});
	
	function updateChatScroller () {
		var element = document.getElementById("chatsReceived");
		element.scrollTop = element.scrollHeight;
	}
	function getDocs(id) {
		$('.documentDisplay').fadeOut(function () {
			$(".documentDisplayTable").empty();
			$.get("DBGetter?id=" + id, function (data) {
				for (var i = 0; i < data.length; i++) {
					var content;
					if ( i % 3 === 0) {
						content = "<div class=\"documentRow\">" +  
						"<div class=\"documentBox\" onclick=\"showImageModal('"+ data[i].href  + "')\">" 
						+ "<div class=\"documentImage\"></div>"  +
						data[i].text + " - " + data[i].creator + "</div></div>";
						$(content).appendTo($(".documentDisplayTable"));
					} else {
						content = "<div class=\"documentBox\" onclick=\"showImageModal('"+ data[i].href  + "')\">" 
						+ "<div class=\"documentImage\"></div>"
						+ data[i].text + " - " + data[i].creator +"</div></div>";
						$(content).appendTo($(".documentDisplayTable").children().last());
					}
					console.log(data[i].ext);
					if (data[i].ext === "png" || data[i].ext ==="gif" || data[i].ext === "jpg") { //show image or show the doc type
						$(".documentDisplayTable").children().last().children().last().children().first().css('background-image', 'url(' + data[i].href + ')');
					} else {
						$(".documentDisplayTable").children().last().children().last().children().first().css('background-image', 'url(\'images/file.png\')');
						$(".documentDisplayTable").children().last().children().last().children().first().html( data[i].ext );
						$(".documentDisplayTable").children().last().children().last().children().first().css({fontSize: "20px", verticalAlign:"middle"}); 
						$(".documentDisplayTable").children().last().children().last().attr("onclick", "");
					}
					
				}
				$(".documentDisplay").fadeIn();
			});
		});
	}
	function showImageModal(url) {
		$('#imageModalImage').attr("src", url);
		$('.imageModal').css({display:"inline-block"});
		$('.imageModal').animate({opacity:1}, 300);
	}
	
	function hideImageModal() {
		$('.imageModal').animate({opacity:0}, 300, function (){
			$('.imageModal').css({display:"none"});
		});
		
	}
	
	// Use the function below to add a scroll bar to a div
// 	$(function() {
// 		$('.dashboard').jScrollPane();
// 	});
</script>
</html>
