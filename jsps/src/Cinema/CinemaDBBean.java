package Cinema;

import java.sql.*;

import login.LogonDataBean;

public class CinemaDBBean {

	private static CinemaDBBean instance = new CinemaDBBean();

	public static CinemaDBBean getInstance() {
		return instance;
	}

	private CinemaDBBean() {
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

	public void insertCinema(CinemaDataBean cinema) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 아이디 패스워드 이름 생년월일 주소 전화번호

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("insert into cinema values(?, ?, ?, ?)");
			pstmt.setString(1, cinema.getCinema_name());
			pstmt.setString(2, cinema.getCinema_address());
			pstmt.setInt(3, cinema.getCinema_tel());
			pstmt.setInt(4, cinema.getCinema_count());
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

	public int updateCinema(CinemaDataBean cinema, String getCinema_name) throws Exception {
		int x = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"UPDATE cinema SET cinema_address=?, cinema_tel=?, cinema_count=? WHERE cinema_name=?");
			pstmt.setString(1, cinema.getCinema_address());
			pstmt.setInt(2, cinema.getCinema_tel());
			pstmt.setInt(3, cinema.getCinema_count());
			pstmt.setString(4, cinema.getCinema_name());
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
	} // end updatecinema

	// public int deleteCinema(String cinema_name, String cinema_address) throws
	// Exception {
	// Connection conn = null;
	// PreparedStatement pstmt = null;
	// ResultSet rs = null;
	//
	// String db_address = ""; // DB상의 비밀번호를 담아둘 변수
	//
	// int x = -1;
	//
	// try {
	// conn = getConnection();
	//
	// // 1. 아이디에 해당하는 비밀번호를 조회한다.
	// pstmt = conn.prepareStatement("SELECT cinema_address FROM cinema WHERE
	// cinema_name=?");
	// pstmt.setString(1, cinema_name);
	// rs = pstmt.executeQuery();
	//
	// if (rs.next()) {
	// db_address = rs.getString("cinema_address");
	//
	// if (db_address.equals(cinema_address)) // 입력된 비밀번호와 DB비번 비교
	// {
	// // 같을경우 회원삭제 진행
	// pstmt = conn.prepareStatement("DELETE FROM cinema WHERE cinema_name=?");
	// pstmt.setString(1, cinema_name);
	// pstmt.executeUpdate();
	// x = 1; // 삭제 성공
	// } else {
	// x = 0; // 비밀번호 비교결과 - 다름
	// }
	// }
	//
	// return x;
	//
	// } catch (Exception sqle) {
	// try {
	// conn.rollback(); // 오류시 롤백
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// throw new RuntimeException(sqle.getMessage());
	// } finally {
	// try {
	// if (pstmt != null) {
	// pstmt.close();
	// pstmt = null;
	// }
	// if (conn != null) {
	// conn.close();
	// conn = null;
	// }
	// } catch (Exception e) {
	// throw new RuntimeException(e.getMessage());
	// }
	// }
	// } // end deletecinema

	public int deleteCinema(String cinema_name) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int x = -1;

		try {
			conn = getConnection();

			// 1. 아이디에 해당하는 비밀번호를 조회한다.
			pstmt = conn.prepareStatement("DELETE FROM cinema WHERE cinema_name=?");
			pstmt.setString(1, cinema_name);
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
	} // end deletecinema

	public CinemaDataBean getUserInfo(String cinema_name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CinemaDataBean cinemadata = null;

		try {
			// 쿼리
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM cinema WHERE cinema_name=?");
			pstmt.setString(1, cinema_name);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 회원정보를 DTO에 담는다.
				// 자바빈에 정보를 담는다.
				cinemadata = new CinemaDataBean();
				cinemadata.setCinema_name(rs.getString("cinema_name"));
				cinemadata.setCinema_address(rs.getString("cinema_address"));
				cinemadata.setCinema_tel(rs.getInt("cinema_tel"));
				cinemadata.setCinema_count(rs.getInt("cinema_count"));

			}

			return cinemadata;

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