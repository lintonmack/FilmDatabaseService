<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page For Films Database</title>
<script src="<%=request.getContextPath()%>/scripts/jquery-3.3.1.min.js"
	type="text/javascript"></script>
	<%-- <script src="<%=request.getContextPath()%>/scripts/scripts.js"
	type="text/javascript"></script> --%>
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
<nav class="navbar navbar-light bg-light">
  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search Films" aria-label="Search" id="setFilm">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchForAFilm">Search</button>
  </form>
</nav>
	<button id="getAllFilmsJson">Get All Films JSON</button>
	<button id="getAllFilmsXML">Get All Films XML</button>
	<button id="getAllFilmsText">Get All Films TextL</button>
	
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
	<p id="contents"></p>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#getAllFilmsText").click(function(){
			var xhr = new XMLHttpRequest();
			xhr.onload = function() {
				if(xhr.status === 200){
					document.getElementById('film_table').innerHTML = xhr.responseText;
					var film_data = '';
					var response = xhr.responseXML;
					$.each(response, function(i){
						for(i = 0; i < response.length; i++){
							film_data += '<tr><td>'
							+ response[i].id
							+ '</td><td>'
							+ response[i].title
							+ '</td><td>'
							+ response[i].director
							+ '</td><td>'
							+ response[i].stars
							+ '</td><td>'
							+ response[i].review;
							+ '</td><td>'
							+ response[i].year;
						}
					});
					$('#film_table').append(film_data);
				}
			};
			xhr.open('GET', '<%=request.getContextPath()%>/GetFilms?format=text', true);
			xhr.send(null);
		})
	})
	
	$(document).ready(function(){
		$("#getAllFilmsJson").click(function(){
			var film_data = '';
			$.ajax({
				/* $('#film_table').remove(); */
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
	 
	
	/* $(document).ready(function(){ */
		/* var filmSearch = ''; */
		/* $("#searchForAFilm").click(function() {
		     filmSearch = document.getElementById("#setFilm").value;
		     $("#setFilm").val(" ");
		     console.log(filmSearch);
		     return false; 
		  });  */
		  /* $('#searchForAFilm').click(function(){ */
			    /* $("#setFilm").val(""); */
				/* console.log(filmSearch); */
//				<%-- var film_data = '';
//				var filmSearch = document.getElementById("#setFilm").value;
//
//			$.ajax({
//				filmSearch = escape(filmSearch);
//				url: "<%=request.getContextPath()%>" + "/GetAFilm?format=json&title=" + filmSearch, 
//				type: "GET",
//				success: function(response){
//					console.log(response); --%>
					//document.getElementById("result").innerHTML = JSON.stringify(response, null, 2);
					/* $.each(response, function(key,value){
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
		}); */
	
	$(document).ready(function(){
		$("#getAllFilmsXML").click(function(){
			/* $.ajax({ */
				var xhr = new XMLHttpRequest();
				xhr.onload = function() {
					if(xhr.status === 200) {
						var response = xhr.responseXML;
						var films = response.getElementsByTagName('film');
						
						for(var i = 0; i < films.length; i++){
							var tableRow, id, title, director, stars, review, year;
							tableRow = document.createElement('tr');
							tableRow.className = 'film';
							
							id = document.createElement('td');
							title = document.createElement('td');
							director = document.createElement('td');
							stars = document.createElement('td');
							review = document.createElement('td');
							year = document.createElement('td');
							
							id.appendChild(document.createTextNode(getNodeValue(films[i], 'id')));
							title.appendChild(document.createTextNode(getNodeValue(films[i], 'title')));
							director.appendChild(document.createTextNode(getNodeValue(films[i], 'director')));
							stars.appendChild(document.createTextNode(getNodeValue(films[i], 'stars')));
							review.appendChild(document.createTextNode(getNodeValue(films[i], 'review')));
							year.appendChild(document.createTextNode(getNodeValue(films[i], 'year')));
							tableRow.appendChild(id);
							tableRow.appendChild(title);
							tableRow.appendChild(director);
							tableRow.appendChild(stars);
							tableRow.appendChild(review);
							tableRow.appendChild(year);
							
							document.getElementById('film_table').appendChild(tableRow);
						}
						function getNodeValue(obj, tag){
							return obj.getElementsByTagName(tag)[0].firstChild.nodeValue;
						}
					}
				};
				xhr.open('GET', '<%=request.getContextPath()%>/GetFilms?format=xml', true);
				xhr.send(null);
				
			/* }) */
		})
	})
	
	$(document).ready(function(){
		$("#getAFilm").click(function(){
			var film_data = '';
			$.ajax({
				/* $('#film_table').remove(); */
				url: "<%=request.getContextPath()%>/GetAFilm?format=json&title=war",
					type : "GET",
					success : function(response) {
						console.log(response);
						$('#film_table').remove(); 

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