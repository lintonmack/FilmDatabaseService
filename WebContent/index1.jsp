<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page For Films Database</title>
<script src="<%=request.getContextPath()%>/scripts/jquery-3.3.1.min.js"
	type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/scripts/scripts.js"
	type="text/javascript"></script> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<%-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>--%>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	
</head>
<body>
<nav class="navbar navbar-light bg-light">
  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search Films" aria-label="Search" id="setFilm">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchForAFilmJson">Search For Film JSON</button>
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchForAFilmXml">Search For Film XML</button>
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchForAFilmText">Search For Film TEXT</button>
  </form>
</nav>
	<button id="getAllFilmsJson">Get All Films JSON</button>
	<button id="getAllFilmsXML">Get All Films XML</button>
	<button id="getAllFilmsText">Get All Films Text</button>
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
		<tbody id="table_body">
		</tbody>
	</table>
	<p id="contents"></p>
	<!-- <script type="text/javascript">
	
	
	
	</script> -->
</body>
</html>