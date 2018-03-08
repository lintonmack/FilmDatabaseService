package filmService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="film")
@XmlAccessorType(XmlAccessType.FIELD)

public class Film {
	int id;
	String title, director, stars, review;
	int year;
	
	public Film() {
		
	}
	
	public Film(int id, String title, String director, String stars, String review, int year) {
		super();
		this.id = id;
		this.title = title;
		this.director = director;
		this.stars = stars;
		this.review = review;
		this.year = year;
	}
	
	public Film(String title, String director, String stars, String review, int year) {
		super();
		this.title = title;
		this.director = director;
		this.stars = stars;
		this.review = review;
		this.year = year;
	}
	

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}
	
	public void setDirector(String director) {
		this.director = director;
	}

	public String getStars() {
		return stars;
	}
	
	public void setStars(String stars) {
		this.stars = stars;
	}

	public String getReview() {
		return review;
	}
	
	public void setReview(String review) {
		this.review = review;
	}

	public int getYear() {
		return year;
	}
	
	public void setYear(int year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "Film [id=" + id + ",\n title=" + title + ",\n director=" + director + ",\n stars=" + stars + ",\n review="
				+ review + ",\n year=" + year + "]\n\n";
	}
	

	
}
