package Theater;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Seating.SeatingDataBean;

import Cinema.CinemaDataBean;

public class TheaterDBBean {

	private static TheaterDBBean instance = new TheaterDBBean();

	public static TheaterDBBean getInstance() {
		return instance;
	}

	private TheaterDBBean() {
	}

	// DB Connect Class 파일
	public Connection getConnection() throws Exception {
		Connection conn = null;

		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase";
		String dbId = "root";
		String dbPass = "496752";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return conn;
	}

	public void insertTheater(TheaterDataBean theater) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 아이디 패스워드 이름 생년월일 주소 전화번호

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("insert into theater values(?, ?, ?, ?)");
			pstmt.setInt(1, theater.getTheater_num());
			pstmt.setString(2, theater.getTheater_date());
			pstmt.setInt(3, theater.getTheater_seating_capacity());
			pstmt.setString(4, theater.getCinema_name());
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

	public void insertSeating(SeatingDataBean seating, TheaterDataBean theater, int theater_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 아이디 패스워드 이름 생년월일 주소 전화번호
		try {
			conn = getConnection();
			for (int i = 0; i < 30; i++) {
				pstmt = conn.prepareStatement("insert into seating values(?, ?, ?, ?)");
				pstmt.setInt(1, i);
				pstmt.setInt(2, 0);
				pstmt.setInt(3, theater_num);
				pstmt.setString(4, theater.getTheater_date());
				pstmt.executeUpdate();
			}

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

	public int updateTheater(TheaterDataBean theater, int theater_num) throws Exception {
		int x = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"UPDATE theater SET theater_date=?, theater_seating_capacity=? WHERE theater_num=?");
			pstmt.setString(1, theater.getTheater_date());
			pstmt.setInt(2, theater.getTheater_seating_capacity());
			pstmt.setInt(3, theater.getTheater_num());
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
	} // end updatetheater

	public int deleteTheater(int theater_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int x = -1;

		try {
			conn = getConnection();

			// 1. 아이디에 해당하는 비밀번호를 조회한다.
			pstmt = conn.prepareStatement("DELETE FROM theater WHERE theater_num=?");
			pstmt.setInt(1, theater_num);
			pstmt.executeUpdate();
			x = 1;
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
	} // end deletetheater

	public TheaterDataBean getUserInfo(int theater_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TheaterDataBean theaterdata = null;

		try {
			// 쿼리
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM theater WHERE theater_num=?");
			pstmt.setInt(1, theater_num);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 회원정보를 DTO에 담는다.
				// 자바빈에 정보를 담는다.
				theaterdata = new TheaterDataBean();
				theaterdata.setTheater_num(rs.getInt("theater_num"));
				theaterdata.setTheater_date(rs.getString("theater_date"));
				theaterdata.setTheater_seating_capacity(rs.getInt("theater_seating_capacity"));
				theaterdata.setCinema_name(rs.getString("cinema_name"));
			}

			return theaterdata;

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
}
