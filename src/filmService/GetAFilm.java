		package filmService;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetAFilm
 */
@WebServlet("/GetAFilm")
public class GetAFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAFilm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// http://localhost:8080/FilmDatabaseService/GetAFilm?title=War
		// Returns a list of films from the database with the title "War" or similar.
		response.setHeader("Cache-Control", "no-cache");
	    response.setHeader("Pragma", "no-cache");
		FilmDAO dao = new FilmDAO();
		ArrayList<Film> fList = new ArrayList<Film>();
        String searchFileName = request.getParameter("title");
		fList = dao.getFilm(searchFileName);
		request.setAttribute("Films", fList);
		String format = request.getParameter("format");
		String outputPage = "";
		if (format == null) {
			format = "json";
		}
		if ("json".equals(format)) {
			response.setContentType("application/json");
			outputPage = "/WEB-INF/results/films-json.jsp";
		} else if("text".equals(format)) {
		      response.setContentType("text/plain");
		      outputPage = "/WEB-INF/results/films-string.jsp";
		    } else if ("xml".equals(format)) {
		        response.setContentType("text/xml");
		        System.out.println("xml page");
		        outputPage = "/WEB-INF/results/films-xml.jsp";
		        System.out.println("after outputpage ")
		        ;
		    }
		RequestDispatcher dispatcher = request.getRequestDispatcher(outputPage);
		dispatcher.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
