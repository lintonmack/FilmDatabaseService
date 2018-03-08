
<%@ page import="java.util.List" %>
<%@ page import="javax.xml.bind.JAXBContext" %>
<%@ page import="javax.xml.bind.JAXBException" %>
<%@ page import="javax.xml.bind.Marshaller" %>
<%@ page import="filmService.Film" %>
<%@ page import="filmService.FilmList" %>
<%@ page import="filmService.FilmDAO" %>

<%
FilmList film = new FilmList((List<Film>) request.getAttribute("Films"));

try {
	JAXBContext jaxbContext = JAXBContext.newInstance(FilmList.class);
	Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

	// output pretty printed
	jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

	jaxbMarshaller.marshal(film, response.getWriter());

    } catch (JAXBException e) {
	e.printStackTrace();
    }


%>