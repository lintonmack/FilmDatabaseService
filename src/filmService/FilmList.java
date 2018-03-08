package filmService;
import java.util.*;
import javax.xml.bind.annotation.*;



@XmlRootElement(name="filmlist")
@XmlAccessorType(XmlAccessType.FIELD)

public class FilmList {
	
	@XmlElement(name="film")
		private List<Film> films;
		
		public FilmList(List<Film> films){
			this.films =films;
		}

	
		public FilmList() {
			
		}
}
