package movie;


public class MovieDataBean {
	// 아이디 패스워드 이름 생년월일 주소 전화번호
	// MemberBean.java

	//Movie
	private String movie_id;
	private String movie_title;
	private String movie_director;
	private String movie_actor;
	private String movie_rating;
	private String movie_info;
	private int movie_reservation_rate;
	private int movie_runtime;
	private int theater_num;
	private String theater_date;

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getMovie_director() {
		return movie_director;
	}

	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}

	public String getMovie_actor() {
		return movie_actor;
	}

	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}

	public String getMovie_rating() {
		return movie_rating;
	}

	public void setMovie_rating(String movie_rating) {
		this.movie_rating = movie_rating;
	}

	public String getMovie_info() {
		return movie_info;
	}

	public void setMovie_info(String movie_info) {
		this.movie_info = movie_info;
	}

	public int getMovie_reservation_rate() {
		return movie_reservation_rate;
	}

	public void setMovie_reservation_rate(int movie_reservation_rate) {
		this.movie_reservation_rate = movie_reservation_rate;
	}

	public int getMovie_runtime() {
		return movie_runtime;
	}

	public void setMovie_runtime(int movie_runtime) {
		this.movie_runtime = movie_runtime;
	}

	public int getTheater_num() {
		return theater_num;
	}

	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}

	public String getTheater_date() {
		return theater_date;
	}

	public void setTheater_date(String theater_date) {
		this.theater_date = theater_date;
	}

}
	
