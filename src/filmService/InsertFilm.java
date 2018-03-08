package filmService;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertFilm
 */
@WebServlet("/InsertFilm")
public class InsertFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFilm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int filmYear;
		FilmDAO dao = new FilmDAO();
		String filmTitle = request.getParameter("title");
		String filmDirector = request.getParameter("director");
		String filmStars = request.getParameter("stars");
		String filmReview = request.getParameter("review");
		filmYear = Integer.parseInt(request.getParameter("year"));

 // URL TO INSTERT EXAMPLE FILM http://localhost:8080/FilmDatabaseService/InsertFilm?title=test4&director=test4&stars=test4&review=test4&year=2018
		
		//Create an if statement to run parse Intger if the value is not equal to null.
		Film film = new Film(filmTitle, filmDirector, filmStars, filmReview, filmYear);
		try {
			dao.insertFilm(film);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
