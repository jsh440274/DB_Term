package Ticket;

public class TicketDataBean {
	private int ticket_num;
	public int getTicket_num() {
		return ticket_num;
	}
	public void setTicket_num(int ticket_num) {
		this.ticket_num = ticket_num;
	}
	public int getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public int getSeating_num() {
		return seating_num;
	}
	public void setSeating_num(int seating_num) {
		this.seating_num = seating_num;
	}
	private int ticket_price;
	private int theater_num;
	private String customer_id;
	private int seating_num;
}
