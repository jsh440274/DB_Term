package login;

import java.sql.Timestamp;

public class LogonDataBean {
	// 아이디 패스워드 이름 생년월일 주소 전화번호
	// MemberBean.java
	
	//Login
	private String customer_id;
	private String customer_pw;
	private String customer_name;
	private int customer_birth;
	private int customer_tel;
	private int customer_point;
	private int customer_count;
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_pw() {
		return customer_pw;
	}
	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public int getCustomer_birth() {
		return customer_birth;
	}
	public void setCustomer_birth(int customer_birth) {
		this.customer_birth = customer_birth;
	}
	public int getCustomer_tel() {
		return customer_tel;
	}
	public void setCustomer_tel(int customer_tel) {
		this.customer_tel = customer_tel;
	}
	public int getCustomer_point() {
		return customer_point;
	}
	public void setCustomer_point(int customer_point) {
		this.customer_point = customer_point;
	}
	public int getCustomer_count() {
		return customer_count;
	}
	public void setCustomer_count(int customer_count) {
		this.customer_count = customer_count;
	}
	


}
	
