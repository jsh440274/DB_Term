package Seating;

public class SeatingDataBean {
	
	private int seating_num; //좌석번호
	private int seating_reserved; //좌석에매여부
    private int theater_num;//극장번호
    private String theater_date; //상영영화정보
	public int getSeating_num() {
		return seating_num;
	}
	public void setSeating_num(int seating_num) {
		this.seating_num = seating_num;
	}
	public int getSeating_reserved() {
		return seating_reserved;
	}
	public void setSeating_reserved(int seating_reserved) {
		this.seating_reserved = seating_reserved;
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
