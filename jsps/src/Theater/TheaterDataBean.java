package Theater;

public class TheaterDataBean {
	private int theater_num; //상영관번호
	private String theater_date; //상영일정
    private int theater_seating_capacity;//좌석수
    private String cinema_name; //영화관이름
    
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
	public int getTheater_seating_capacity() {
		return theater_seating_capacity;
	}
	public void setTheater_seating_capacity(int theater_seating_capacity) {
		this.theater_seating_capacity = theater_seating_capacity;
	}
	public String getCinema_name() {
		return cinema_name;
	}
	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}
	
}
