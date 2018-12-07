package Cinema;

public class CinemaDataBean {

	private String cinema_name; // 상영관이름
	private String cinema_address; // 주소
	private int cinema_tel;// 번호
	private int cinema_count;// 상영관수

	public String getCinema_name() {
		return cinema_name;
	}

	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}

	public String getCinema_address() {
		return cinema_address;
	}

	public void setCinema_address(String cinema_address) {
		this.cinema_address = cinema_address;
	}

	public int getCinema_tel() {
		return cinema_tel;
	}

	public void setCinema_tel(int cinema_tel) {
		this.cinema_tel = cinema_tel;
	}

	public int getCinema_count() {
		return cinema_count;
	}

	public void setCinema_count(int cinema_count) {
		this.cinema_count = cinema_count;
	}

}
