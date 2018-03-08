<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page For Films Database</title>
<script src="<%=request.getContextPath()%>/scripts/jquery-3.3.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<button id="getAllFilms">Get All Films JSON</button>
	<button id="getAFilm">Get Films with War JSON</button>
	<table class="table table-bordered table-hover" id="film_table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Title</th>
				<th scope="col">Director</th>
				<th scope="col">Stars</th>
				<th scope="col">Review</th>
				<th scope="col">Year</th>
			</tr>
		</thead>
	</table>
	<script>
	$(document).ready(function(){
		$("#getAllFilms").click(function(){
			var film_data = '';
			$.ajax({
				url: "<%=request.getContextPath()%>/GetFilms",
				type: "GET",
				success: function(response){
					console.log(response);
					//document.getElementById("result").innerHTML = JSON.stringify(response, null, 2);
					$.each(response, function(key,value){
						film_data += '<tr scope="row">';
						film_data += '<td>' + value.id + '</td>';
						film_data += '<td>' + value.title + '</td>';
						film_data += '<td>' + value.director + '</td>';
						film_data += '<td>' + value.stars + '</td>';
						film_data += '<td>' + value.review + '</td>';
						film_data += '<td>' + value.year + '</td>';
						film_data += '</tr>';
					});
					$("#film_table").append(film_data);
				},
				error: function(jqHXR, textStatus, errorThrown){
					console.log(errorThrown);
					alert("Error: " + errorThrown)
				}
			});
		});
	}); 
	
	$(document).ready(function(){
		$("#getAFilm").click(function(){
			var film_data = '';
			$.ajax({
				url: "<%=request.getContextPath()%>/GetAFilm?format=json&title=war",
					type : "GET",
					success : function(response) {
						console.log(response);
						//document.getElementById("result").innerHTML = JSON.stringify(response, null, 2);
						$.each(response, function(key, value) {
							film_data += '<tr scope="row">';
							film_data += '<td>' + value.id + '</td>';
							film_data += '<td>' + value.title + '</td>';
							film_data += '<td>' + value.director + '</td>';
							film_data += '<td>' + value.stars + '</td>';
							film_data += '<td>' + value.review + '</td>';
							film_data += '<td>' + value.year + '</td>';
							film_data += '</tr>';
						});
						$("#film_table").append(film_data);
					},
					error : function(jqHXR, textStatus, errorThrown) {
						console.log(errorThrown);
						alert("Error: " + errorThrown)
					}
				});
			});
		});
	</script>
</body>
</html>