	// INSERT FILM METHOD
$(document).ready(function(){
		$("#insertFilm").click(function(e){
			if($('#insertTitle').val() === '' || $('#insertDirector').val() === '' || $('#insertStars').val() === '' || $('#insertReview').val() === '' || $('#insertYear').val() === '') {
				$('#insertUpdate').html('>> Missing Data <<');
				e.preventDefault();
				return;
			} else {
			var xhr = new XMLHttpRequest();
			var title, director, stars, review, year;
			e.preventDefault();
			title = $("#insertTitle").val(); 
			director = $("#insertDirector").val(); 
			stars = $("#insertStars").val();
			review = $("#insertReview").val(); 
			year = $("#insertYear").val(); 
			$('#insertUpdate').html('Film Added to the database!');
			xhr.open('GET', 'InsertFilm?title=' + title + '&director=' + director + '&stars=' + stars + '&review=' + review + '&year=' + year, true);
			xhr.send();
			}
		})
	})
	
	// UPDATE FILM METHOD
$(document).ready(function(){
		$("#updateFilm").click(function(e){
			if($('#updateTitle').val() === '' || $('#updateId').val() === '' || $('#updateDirector').val() === '' || $('#updateStars').val() === '' || $('#updateReview').val() === '' || $('#updateYear').val() === '') {
				$('#insertUpdate').html('>> Missing Data <<');
				e.preventDefault();
				return;
			} else {
			var xhr = new XMLHttpRequest();
			var id, title, director, stars, review, year;
			e.preventDefault();
			id = $("#updateId").val(); 
			title = $("#updateTitle").val(); 
			director = $("#updateDirector").val(); 
			stars = $("#updateStars").val();
			review = $("#updateReview").val(); 
			year = $("#updateYear").val(); 
			$('#insertUpdate').html('Film Updated in Database!');
			xhr.open('GET', 'UpdateFilm?title=' + title + '&director=' + director + '&stars=' + stars + '&review=' + review + '&year=' + year + '&id=' + id, true);
			xhr.send();
			}
		})
	})	
	
	// DELETE FILM
	$(document).ready(function(){
		$("#deleteFilm").click(function(e){
			if($('#deleteTitle').val() === '') {
				$('#insertUpdate').html('>> Missing Data <<');
				e.preventDefault();
				return;
			} else {
			title = $("#deleteTitle").val(); 
			console.log(">" + title + "<");
			var xhr = new XMLHttpRequest();
			var title;
			e.preventDefault();
			$('#insertUpdate').html('Film Deleted from Database!');
			xhr.open('GET', 'DeleteFilm?title=' + title, true);
			xhr.send();
			}
		})
	})	

	//GET ALL FILMS TEXT 
$(document).ready(function(){
		$("#getAllFilmsText").click(function(){
			var xhr = new XMLHttpRequest();
			xhr.onload = function() {
				if(xhr.status === 200){
				var film_data = '<table>';
					var response = xhr.responseText;
					console.log(film_data);
					var splitRows = response.split('%');
					
						for(var i = 0; i < splitRows.length; i++){
							var splitData = splitRows[i].split('#');
							film_data += '<tr scope="row">';
								film_data += '<td>' + splitData[0] + '</td>';
								film_data += '<td>'+ splitData[1] + '</td>';
								film_data += '<td>' + splitData[2]+ '</td>';
								film_data += '<td>' + splitData[3] + '</td>';
								film_data += '<td>' + splitData[4] + '</td>';
								film_data += '<td>' + splitData[5]+ '</td>'; 
							film_data += '</tr>';
						}
						film_data += '</table>';
						$('#insertUpdate').html('Get Query Successfully Executed');
						$('#table_body').html(film_data);
				}
			};
			xhr.open('GET', 'GetFilms?format=text', true);
			xhr.send(null);
		})
	})
	
	//SEACH FOR A SPECIFIC FILM(S) TEXT
	$(document).ready(function(){
		$("#searchForAFilmText").click(function(e){
			if($('#setFilm').val() === '') {
				$('#insertUpdate').html('>> Missing Data <<');
				e.preventDefault();
				return;
			} else {
			var filmSearch = $("#setFilm").val(); 
			var xhr = new XMLHttpRequest();
			console.log(filmSearch);
			e.preventDefault();  
			xhr.onload = function() {
				if(xhr.status === 200){
				var film_data = '<table>';
					var response = xhr.responseText;
					console.log(response);
					console.log(film_data);
					var splitRows = response.split('%');
					
						for(var i = 0; i < splitRows.length; i++){
							var splitData = splitRows[i].split('#');
							if (splitData[i] != undefined){
								film_data += '<tr scope="row">';
								film_data += '<td>' + splitData[0] + '</td>';
								film_data += '<td>'+ splitData[1] + '</td>';
								film_data += '<td>' + splitData[2]+ '</td>';
								film_data += '<td>' + splitData[3] + '</td>';
								film_data += '<td>' + splitData[4] + '</td>';
								film_data += '<td>' + splitData[5]+ '</td>'; 
							film_data += '</tr>';
							}
							
						}
						film_data += '</table>';
						$('#insertUpdate').html('Get Query Successfully Executed');
						$('#table_body').html(film_data);
				}
			};
			xhr.open('GET', 'GetAFilm?format=text&title=' + filmSearch, true);
			xhr.send(null);
			}
		})
	})
	
	//GET ALL FILMS JSON
	$(document).ready(function(){
		$("#getAllFilmsJson").click(function(){
			var film_data = '';
			$.ajax({
				url: 'GetFilms',
				type: "GET",
				success: function(response){
					console.log(response);
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
					$('#insertUpdate').html('Get Query Successfully Executed');
					$("#table_body").html(film_data);
				},
				error: function(jqHXR, textStatus, errorThrown){
					console.log(errorThrown);
					alert("Error: " + errorThrown)
				}
			});
		});
	}); 
	 
	// SEARCH FOR A SPECIFIC(S) FILM JSON
	$(document).ready(function(){
		   $('#searchForAFilmJson').click(function(e){ 
					if($('#setFilm').val() === '') {
						$('#insertUpdate').html('>> Missing Data <<');
						e.preventDefault();
						return;
					} else {
			   var filmSearch = $("#setFilm").val(); 
				 console.log(filmSearch); 
			    var film_data = '';
			    e.preventDefault();
	
			$.ajax({
				url: 'GetAFilm?title=' + filmSearch, 
				type: "GET",
				success: function(response){
					console.log('Hello', response); 
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
					$('#insertUpdate').html('Get Query Successfully Executed');
					$("#table_body").html(film_data);
				},
				error: function(jqHXR, textStatus, errorThrown){
					console.log('Error',jqHXR, textStatus, errorThrown);
					console.log("Error: " + errorThrown)
				}
			});
					}
			}); 
		}); 
	
	// GET ALL FILMS XML
	$(document).ready(function(){
		$("#getAllFilmsXML").click(function(){
			/* $.ajax({ */
				var xhr = new XMLHttpRequest();
				xhr.onload = function() {
					if(xhr.status === 200) {
						var response = xhr.responseXML;
						var films = response.getElementsByTagName('film');
						var filmTable = document.getElementById('table_body');
					
						filmTable.innerHTML = '';
						
						
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
							
							document.getElementById('table_body').appendChild(tableRow);
						}
						function getNodeValue(obj, tag){
							return obj.getElementsByTagName(tag)[0].firstChild.nodeValue;
						}
						$('#insertUpdate').html('Get Query Successfully Executed');
					}
				};
				xhr.open('GET', 'GetFilms?format=xml', true);
				xhr.send(null);
		})
	})
	
	// SEARCH FOR A SPECIFIC FILM(S) XML
	$(document).ready(function(){
		$("#searchForAFilmXml").click(function(e){
				if($('#setFilm').val() === '') {
					$('#insertUpdate').html('>> Missing Data <<');
					e.preventDefault();
					return;
				} else {
			/* $.ajax({ */
				e.preventDefault();

				var filmSearch = $("#setFilm").val();
				var xhr = new XMLHttpRequest();
				xhr.onload = function() {
					if(xhr.status === 200) {
						var response = xhr.responseXML;
						var films = response.getElementsByTagName('film');
						var filmTable = document.getElementById('table_body');
						
						filmTable.innerHTML = '';
						
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
							
							document.getElementById('table_body').appendChild(tableRow);
						}
						function getNodeValue(obj, tag){
							return obj.getElementsByTagName(tag)[0].firstChild.nodeValue;
						}
					$('#insertUpdate').html('Get Query Successfully Executed');
					}
				};
				xhr.open('GET', 'GetAFilm?format=xml&title=' + filmSearch, true);
				xhr.send(null);
				}
		})
	})