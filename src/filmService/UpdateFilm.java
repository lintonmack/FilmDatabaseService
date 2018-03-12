package filmService;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateFilm
 */
@WebServlet("/UpdateFilm")
public class UpdateFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFilm() {
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
		int filmId;
		FilmDAO dao = new FilmDAO();
		String filmTitle = request.getParameter("title");
		String filmDirector = request.getParameter("director");
		String filmStars = request.getParameter("stars");
		String filmReview = request.getParameter("review");
		filmYear = Integer.parseInt(request.getParameter("year"));
		filmId = Integer.parseInt(request.getParameter("id"));
		
		Film film = new Film(filmId, filmTitle, filmDirector, filmStars, filmReview, filmYear);
		dao.updateFilm(film);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
