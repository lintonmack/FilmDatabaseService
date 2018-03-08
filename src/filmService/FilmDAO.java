package filmService;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class FilmDAO {

	Film oneFilm = null;
	Connection conn = null;
	Statement stmt = null;

	// OPEN CONNECTION
	private void openConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			System.out.println(e);
		}

		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://mudfoot.doc.stu.mmu.ac.uk:3306/mackerel?user=mackerel&password=Retophal7");
			stmt = conn.createStatement();
		} catch (SQLException sqlE) {
			System.out.println(sqlE);
		}
	}

	// CLOSE CONNECTION
	private void closeConnection() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private Film getNextFilm(ResultSet rSet) {
		Film thisFilm = null;
		try {
			thisFilm = new Film(rSet.getInt("id"), rSet.getString("title"), rSet.getString("director"),
					rSet.getString("stars"), rSet.getString("review"), rSet.getInt("year"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thisFilm;
	}

	// GET ALL FILMS
	public ArrayList<Film> getAllFilms() {
		ArrayList<Film> allFilms = new ArrayList<Film>();
		openConnection();
		try {
			String selectAllFilms = "select * from films";
			ResultSet rs = stmt.executeQuery(selectAllFilms);
			while (rs.next()) {
				oneFilm = getNextFilm(rs);
				allFilms.add(oneFilm);
			}
			stmt.close();
			closeConnection();
		} catch (SQLException se) {
			System.out.println(se);
		}
		System.out.println(allFilms);
		return allFilms;
	}

	// GET A FILM
	public ArrayList<Film> getFilm(String title) {
		ArrayList<Film> film = new ArrayList<Film>();
			String selectFilm = "SELECT * FROM films WHERE title LIKE ";
			String appendFilm = "'%" + title + "%'";
			String selectFilmSQL = selectFilm + appendFilm;
			
			System.out.println(selectFilmSQL);
		try {
			openConnection();
			ResultSet rs = stmt.executeQuery(selectFilmSQL);
			while (rs.next()) {
				oneFilm = getNextFilm(rs);
				film.add(oneFilm);
			}
			stmt.close();
			closeConnection();
		} catch (SQLException se) {
			System.out.println(se);
		}
		System.out.println(film);
		return film;
	}

	// INSERT FILM - TESTED - WORKING
	public int insertFilm(Film film)
			throws SQLException {

		int rowsAffected = 0;
		PreparedStatement pstmt = null;

		String insertSqlStmt = "INSERT INTO films(title, director, stars, review, year) VALUES(?, ?, ?, ?, ?)";

		try {
			openConnection();
			pstmt = conn.prepareStatement(insertSqlStmt);

			pstmt.setString(1, film.getTitle());
			pstmt.setString(2, film.getDirector());
			pstmt.setString(3, film.getStars());
			pstmt.setString(4, film.getReview());
			pstmt.setInt(5, film.getYear());
			rowsAffected = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		if(rowsAffected == 1) {
			System.out.println("Rows Affected: 1\n Film successfully added to database");
		} else {
			System.out.println("Film failed to add to database");
		}
		System.out.println(rowsAffected);
		return rowsAffected;
	}

	// DELETE FILM - UNTESTED 21/02
	public void deleteFilm(String title) throws SQLException {
		PreparedStatement pstmt = null;

		String deleteSqlStmt = "DELETE FROM films WHERE title = ?";

		try {
			openConnection();
			pstmt = conn.prepareStatement(deleteSqlStmt);
			pstmt.setString(1, title);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		System.out.println("Film deleted");
	}

// UPDATE FILM - UNTESTED 21/02

}
