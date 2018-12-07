package movie;

import java.sql.*;

public class MovieDBBean {

	private static MovieDBBean instance = new MovieDBBean();

	public static MovieDBBean getInstance() {
		return instance;
	}

	private MovieDBBean() {
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

	// MemberDAO.java

	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select passwd from MEMBER where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd))
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

	public void insertMovie(MovieDataBean movie) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 아이디 패스워드 이름 생년월일 주소 전화번호

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("insert into movie values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, movie.getMovie_id());
			pstmt.setString(2, movie.getMovie_title());
			pstmt.setString(3, movie.getMovie_director());
			pstmt.setString(4, movie.getMovie_actor());
			pstmt.setString(5, movie.getMovie_rating());
			pstmt.setString(6, movie.getMovie_info());
			pstmt.setInt(7, movie.getMovie_reservation_rate());
			pstmt.setInt(8, movie.getMovie_runtime());
			pstmt.setInt(9, movie.getTheater_num());
			pstmt.setString(10, movie.getTheater_date());
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

	public MovieDataBean getUserInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MovieDataBean moviedata = null;

		try {
			// 쿼리
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MOVIE WHERE movie_id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 회원정보를 DTO에 담는다.
			{
				// 자바빈에 정보를 담는다.
				moviedata = new MovieDataBean();
				moviedata.setMovie_id(rs.getString("movie_id"));
				moviedata.setMovie_title(rs.getString("movie_title"));
				moviedata.setMovie_director(rs.getString("movie_director"));
				moviedata.setMovie_actor(rs.getString("movie_actor"));
				moviedata.setMovie_rating(rs.getString("movie_rating"));
				moviedata.setMovie_info(rs.getString("movie_info"));
				moviedata.setMovie_reservation_rate(rs.getInt("movie_reservation_rate"));
				moviedata.setMovie_runtime(rs.getInt("movie_runtime"));
				moviedata.setTheater_num(rs.getInt("theater_num"));
				moviedata.setTheater_date(rs.getString("theater_date"));

			}

			return moviedata;

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

	public int deleteMovie(String movie_id, String movie_title) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbtitle = ""; // DB상의 비밀번호를 담아둘 변수

		int x = -1;

		try {
			conn = getConnection();

			// 1. 아이디에 해당하는 비밀번호를 조회한다.
			pstmt = conn.prepareStatement("SELECT movie_title FROM movie WHERE MOVIE_ID=?");
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbtitle = rs.getString("movie_title");

				if (dbtitle.equals(movie_title)) // 입력된 비밀번호와 DB비번 비교
				{
					// 같을경우 회원삭제 진행
					pstmt = conn.prepareStatement("DELETE FROM movie WHERE MOVIE_ID=?");
					pstmt.setString(1, movie_id);
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
	} // end deleteMember

	public int updateMovie(MovieDataBean movie, String movie_id) throws Exception {
		int x = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"UPDATE movie SET movie_title=?, movie_director=?, movie_actor=?, movie_rating=?, movie_info=?,"
							+ "movie_reservation_rate=?,movie_runtime=?,theater_num=?, theater_date=? where movie_id=?");
			pstmt.setString(1, movie.getMovie_title());
			pstmt.setString(2, movie.getMovie_director());
			pstmt.setString(3, movie.getMovie_actor());
			pstmt.setString(4, movie.getMovie_rating());
			pstmt.setString(5, movie.getMovie_info());
			pstmt.setInt(6, movie.getMovie_reservation_rate());
			pstmt.setInt(7, movie.getMovie_runtime());
			pstmt.setInt(8, movie.getTheater_num());
			pstmt.setString(9, movie.getTheater_date());
			pstmt.setString(10, movie.getMovie_id());
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
	} // end updateMember

//	public MovieDataBean getUserInfo1(String id) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		MovieDataBean moviedata = null;
//
//		try {
//			// 쿼리
//			conn = getConnection();
//			pstmt = conn.prepareStatement("SELECT * FROM movie WHERE movie_id=?");
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) // 회원정보를 DTO에 담는다.
//			{
//				// 자바빈에 정보를 담는다.
//				moviedata = new MovieDataBean();
//				moviedata.setMovie_id(rs.getString("movie_id"));
//				moviedata.setMovie_title(rs.getString("movie_title"));
//				moviedata.setMovie_director(rs.getString("movie_director"));
//				moviedata.setMovie_actor(rs.getString("movie_actor"));
//				moviedata.setMovie_rating(rs.getString("movie_rating"));
//				moviedata.setMovie_info(rs.getString("movie_info"));
//				moviedata.setMovie_reservation_rate(rs.getInt("movie_reservation_rate"));
//				moviedata.setMovie_runtime(rs.getInt("movie_runtime"));
//				moviedata.setTheater_num(rs.getInt("theater_num"));
//				moviedata.setTheater_date(rs.getString("theater_date"));
//			}
//
//			return moviedata;
//
//		} catch (Exception sqle) {
//			throw new RuntimeException(sqle.getMessage());
//		} finally {
//			// Connection, PreparedStatement를 닫는다.
//			try {
//				if (pstmt != null) {
//					pstmt.close();
//					pstmt = null;
//				}
//				if (conn != null) {
//					conn.close();
//					conn = null;
//				}
//			} catch (Exception e) {
//				throw new RuntimeException(e.getMessage());
//			}
//		}
//	} // end getUserInfo
}
