$(document).ready(function(){
		$("#getAllFilmsJson").click(function(){
			var film_data = '';
			$.ajax({
				/* $('#film_table').remove(); */
				url: "<%=request.getContextPath()%>/GetFilms",
				type: "GET",
				success: function(response){
					console.log(response);
					$('#film_table').remove();

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