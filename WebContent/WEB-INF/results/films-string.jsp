<%@ page import="java.util.List" %>
<%@ page import="filmService.*" %>

<%
List<Film> fList = (List<Film>) request.getAttribute("Films");
Film oneFilm = null;
for (int i=0; i<fList.size();i++){
	oneFilm = fList.get(i);
	out.println(oneFilm.getId() + "#" + oneFilm.getTitle() + "#" + oneFilm.getDirector() + "#" +oneFilm.getStars() + "#" + oneFilm.getReview() + "#" + oneFilm.getYear() + "#" + "%");	
}

%>