var files, id, creator, text; 
$(document).ready(function ($) {
	$("#userBtn").click(function () {
		$("#selectedEdit").animate({left:"5px"}, 300);
		
	});
	$("#huserBtn").on("click", function () {
		$("#selectedEdit").animate({left:"60px"}, 300);
	});
	$("#addBtn").on("click", function () {
		$("#selectedEdit").animate({left:"114px"}, 300, function () {
			$('.uploadModal').css({display:"inline-block"});
			$('.uploadModal').animate({opacity:1}, 300);
			$("#close_btn").click(function () {
				$('.uploadModal').animate({opacity:0}, 300, function (){
					$('.uploadModal').css({display:"none"});
				});
				$('#fileToUpload').html(""); // set all values back to null
				$("#creatorInput").val("");
        		$("#docTitleInput").val("");
			});
			// handle image upload
			var files;
			$("#browse_btn").unbind().on('click', function (e) {
				e.preventDefault();
				e.stopPropagation();
				$("#fileInput:hidden").trigger('click');
			});
			$(this).off("click");
			$('input[type=file]').unbind().on('change', prepareupload);
			$("#submit_btn").unbind().on('click', upload_file);
		});
	});
	$("#highlightBtn").on("click", function () {
		$("#selectedEdit").animate({left:"164px"}, 300);
	});
	$("#vibrateBtn").on("click", function () {
		$("#selectedEdit").animate({left:"220px"}, 300);
	});
	$("#archiveBtn").on("click", function () {
		$("#selectedEdit").animate({left:"277px"}, 300);
	});
});
	
function prepareupload (event) {
	files = event.target.files;
	$("#fileToUpload").html(files[0].name);
	creator = $("#creatorInput").val();
	text = $("#docTitleInput").val();
	id = $("#activeItem > .accordion-toggle").attr("id");
}

function upload_file(event) {
	event.stopPropagation(); 
    event.preventDefault(); 
 
    // Create a formdata object and add the files
	var data = new FormData();
	$.each(files, function(key, value)
	{
		data.append(key, value);
	});
    
    $.ajax({
        url: "/SASTeam08/FileUploadServlet?id=" + id + "&creator=" + creator + "&text=" + text,
        type: 'POST',
        data: data,
        cache: false,
        processData: false, // Don't process the files
        contentType: false, // Set content type to false as jQuery will tell the server its a query string request
        success: function(data, textStatus, jqXHR)
        {
        	console.log(data);
        	$(".uploadModal").animate({opacity:"0"}, 300, function(){
        		$(".uploadModal").css({display:"none"});
        		$('#fileToUpload').html("");
        		$("#creatorInput").val("");
        		$("#docTitleInput").val("");
        	});
        	getDocs(id);
        },
        error: function(jqXHR, textStatus, errorThrown)
        {
        	// Handle errors here
        	console.log('ERRORS: ' + textStatus);
        }
    });
}

function handleDeleteFile(id, campaignId, href) {
	$.post("/SASTeam08/DeleteFileServlet?id=" + id + "&href=" + href, function(data) {
		console.log(data);
		getDocs(campaignId, href);
		clickedDelete = false; 
	});
}

function downloadFile(href) {
	if (!clickedDelete) {
		var win = window.open(href, '_blank');
		win.focus();
	}
}
