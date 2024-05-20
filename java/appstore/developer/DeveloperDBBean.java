package appstore.developer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DeveloperDBBean {

	private static DeveloperDBBean instance = new DeveloperDBBean();

	public static DeveloperDBBean getInstance() {
		return instance;
	}

	private DeveloperDBBean() {
	}

	// 커넥션풀로부터 커넥션객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/basicjsp");
		return ds.getConnection();
	}

	// 개발자 회원가입
	public void insertDeveloper(DeveloperDataBean developer) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("insert into developer values (?,?,?)");
			pstmt.setString(1, developer.getDev_id());
			pstmt.setString(2, developer.getDev_pw());
			pstmt.setString(3, developer.getDev_name());

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
	
	// 회원정보를 수정하기 위해 기존의 정보를 표시
	public DeveloperDataBean getDeveloper(String dev_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DeveloperDataBean developer = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from developer where dev_id = ?");
			pstmt.setString(1, dev_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				developer = new DeveloperDataBean();

				developer.setDev_id(rs.getString("dev_id"));
				developer.setDev_pw(rs.getString("dev_pw"));
				developer.setDev_name(rs.getString("dev_name"));
			}
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
		return developer;
	}

	// 개발자 회원정보수정
	public void updateDeveloper(DeveloperDataBean developer, String dev_id) 
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("update developer set dev_pw=?, dev_name=? where dev_id=?");
			pstmt.setString(1, developer.getDev_pw());
			pstmt.setString(2, developer.getDev_name());
			pstmt.setString(3, developer.getDev_id());

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
	
	// 개발자 회원탈퇴
	public int deleteDeveloper(String dev_id, String dev_pw) 
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(
					"select dev_pw from developer where dev_id= ?");
			pstmt.setString(1, dev_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("dev_pw");
				if (dbpasswd.equals(dev_pw)) {
					pstmt = conn.prepareStatement(
							"delete from developer where dev_id=?");
					pstmt.setString(1, dev_id);
					pstmt.executeUpdate();
					x = 1; // 회원탈퇴 성공
				} else
					x = 0; // 비밀번호 틀림
			}
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
}