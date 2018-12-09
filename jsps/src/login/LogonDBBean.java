package login;

import java.sql.*;

import movie.MovieDataBean;

public class LogonDBBean {

	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}

	private LogonDBBean() {
	}

	// DB Connect Class 파일
	private Connection getConnection() throws Exception {
		Connection conn = null;

		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase";
		String dbId = "root";
		String dbPass = "496752";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return conn;
	}

	// customerDao.java
	public void insertMember(LogonDataBean customer) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 아이디 패스워드 이름 생년월일 주소 전화번호
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("insert into customer values(?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, customer.getCustomer_id());
			pstmt.setString(2, customer.getCustomer_pw());
			pstmt.setString(3, customer.getCustomer_name());
			pstmt.setInt(4, customer.getCustomer_birth());
			pstmt.setInt(5, customer.getCustomer_tel());
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}

	public void nullprint() {

	}

	public int updateCustomer(LogonDataBean customer, String customer_id) throws Exception {
		int x = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update customer SET customer_pw=?, customer_name=?, "
					+ "customer_birth=?, customer_tel=?  WHERE customer_id=?");
			pstmt.setString(1, customer.getCustomer_pw());
			pstmt.setString(2, customer.getCustomer_name());
			pstmt.setInt(3, customer.getCustomer_birth());
			pstmt.setInt(4, customer.getCustomer_tel());
			pstmt.setString(5, customer.getCustomer_id());
			pstmt.executeUpdate();
			x = 1;

			return x;
			
		} catch (Exception sqle) {
			sqle.printStackTrace();
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end updatecustomer

	public int deleteMember(String id, String pw) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpw = ""; // DB상의 비밀번호를 담아둘 변수

		int x = -1;

		try {
			conn = getConnection();

			// 1. 아이디에 해당하는 비밀번호를 조회한다.
			pstmt = conn.prepareStatement("SELECT Customer_pw FROM customer WHERE Customer_ID=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpw = rs.getString("Customer_pw");

				if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
				{
					// 같을경우 회원삭제 진행
					pstmt = conn.prepareStatement("DELETE FROM CUSTOMER WHERE Customer_ID=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1; // 삭제 성공
				} else {
					x = 0; // 비밀번호 비교결과 - 다름
				}
			}

			return x;

		} catch (Exception sqle) {
			try {
				conn.rollback(); // 오류시 롤백
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end deletecustomer

	public LogonDataBean getUserInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean logondata = null;

		try {
			// 쿼리
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM CUSTOMER WHERE Customer_ID=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 회원정보를 DTO에 담는다.
			{
				// 자바빈에 정보를 담는다.
				logondata = new LogonDataBean();
				logondata.setCustomer_id(rs.getString("customer_id"));
				logondata.setCustomer_pw(rs.getString("customer_pw"));
				logondata.setCustomer_name(rs.getString("customer_name"));
				logondata.setCustomer_birth(rs.getInt("customer_birth"));
				logondata.setCustomer_tel(rs.getInt("customer_tel"));
				logondata.setCustomer_point(rs.getInt("customer_point"));
				logondata.setCustomer_count(rs.getInt("customer_count"));

			}
			return logondata;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end getUserInfo

	public int userCheck(String customer_id, String customer_pw) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select customer_pw from customer where customer_id = ?");
			pstmt.setString(1, customer_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("customer_pw");
				if (dbpasswd.equals(customer_pw))
					x = 1; // 인증 성공
				else
					x = 0; // 비밀번호 틀림
			} else
				x = -1;// 해당 아이디 없음

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	public void nullvoid() {

	}
}