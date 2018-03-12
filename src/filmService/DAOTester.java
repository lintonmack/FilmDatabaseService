package filmService;

import java.sql.SQLException;
import java.util.ArrayList;

public class DAOTester {

	public static void main(String args[]) {
		FilmDAO dao = new FilmDAO();
		Film film = new Film("The lost coder", "Test", "Test", "test", 0);
		Film filmOne = new Film(0, "", null, null, null, 0);
		ArrayList<Film> fList = new ArrayList<Film>();
		
		fList = dao.getFilm("War");

		try {
			dao.insertFilm(film);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		dao.getFilm("The lost coder");
		
		try {
			dao.deleteFilm("The lost coder");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
