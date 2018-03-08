<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="filmService.*" %>

<%
List<Film> fList = (List<Film>) request.getAttribute("Films");

Gson gson = new Gson();
String jsonInString = gson.toJson(fList);
response.getWriter().println(jsonInString);
%>



