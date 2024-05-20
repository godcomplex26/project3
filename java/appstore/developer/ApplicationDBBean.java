package appstore.developer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ApplicationDBBean {

	private static ApplicationDBBean instance = new ApplicationDBBean();

	public static ApplicationDBBean getInstance() {
		return instance;
	}

	private ApplicationDBBean() {
	}

	// 커넥션풀로부터 커넥션객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/basicjsp");
		return ds.getConnection();
	}

	// 개발자 인증 메소드
	public int developerCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select dev_pw from developer where dev_id = ? ");
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("dev_pw");
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

	// 앱 등록 메소드
	public void insertApp(ApplicationDataBean app) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("insert into application values (?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, app.getApp_id());
			pstmt.setString(2, app.getApp_name());
			pstmt.setString(3, app.getApp_dev_id());
			pstmt.setInt(4, app.getApp_price());
			pstmt.setString(5, app.getApp_iconURL());
			pstmt.setString(6, app.getApp_descURL());
			pstmt.setString(7, app.getApp_dlURL());
			pstmt.setString(8, app.getApp_rel_date());
			pstmt.setString(9, app.getApp_update());
			pstmt.setString(10, app.getApp_ver());
			pstmt.setInt(11, app.getApp_dlcount());
			pstmt.setString(12, app.getApp_category());

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

	// 개발자별 전체등록된 앱의 수를 얻어내는 메소드
	public int getAppCount(String app_dev_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*) from application where app_dev_id =?");
			pstmt.setString(1, app_dev_id);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1);
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
	
	// 분류별 전체등록된 앱의 수를 얻어내는 메소드
	public int getAppCountByCategory(String app_category) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*) from application where app_category =?");
			pstmt.setString(1, app_category);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1);
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
	
	// 전체등록된 앱의 수를 얻어내는 메소드
	public int getAppCountAll() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*) from application");
			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1);
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

	// 분류별 또는 전체 등록된 앱의 정보를 얻어내는 메소드
	public List<ApplicationDataBean> getApps(String app_category) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ApplicationDataBean> appList = null;

		try {
			conn = getConnection();

			String sql1 = "select * from application";
			String sql2 = "select * from application";
			sql2 += " where app_category = ? order by app_rel_date desc";

			if (app_category.equals("all")) {
				pstmt = conn.prepareStatement(sql1);
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, app_category);
//				pstmt = conn.prepareStatement("select * from application where app_category = 100 order by app_rel_date desc");
			}
			rs = pstmt.executeQuery();

			if (rs.next()) {
				appList = new ArrayList<ApplicationDataBean>();
				do {
					ApplicationDataBean app = new ApplicationDataBean();

					app.setApp_id(rs.getInt("app_id"));
					app.setApp_name(rs.getString("app_name"));
					app.setApp_dev_id(rs.getString("app_dev_id"));
					app.setApp_price(rs.getInt("app_price"));
					app.setApp_iconURL(rs.getString("app_iconURL"));
					app.setApp_descURL(rs.getString("app_descURL"));
					app.setApp_dlURL(rs.getString("app_dlURL"));
					app.setApp_rel_date(rs.getString("app_rel_date"));
					app.setApp_update(rs.getString("app_update"));
					app.setApp_ver(rs.getString("app_ver"));
					app.setApp_dlcount(rs.getInt("app_dlcount"));
					app.setApp_category(rs.getString("app_category"));

					appList.add(app);
				} while (rs.next());
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
		return appList;
	}

	// 앱스토어 메인에 표시하기 위해서 사용하는 분류별 신간 앱목록을 얻어내는 메소드
	public ApplicationDataBean[] getApps(String app_category, int count) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ApplicationDataBean appList[] = null;
		int i = 0;

		try {
			conn = getConnection();

			String sql = "select * from application where app_category = ? ";
			sql += "order by app_rel_date desc limit ?,?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, app_category);
			pstmt.setInt(2, 0);
			pstmt.setInt(3, count);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				appList = new ApplicationDataBean[count];
				do {
					ApplicationDataBean app = new ApplicationDataBean();

					app.setApp_id(rs.getInt("app_id"));
					app.setApp_name(rs.getString("app_name"));
					app.setApp_dev_id(rs.getString("app_dev_id"));
					app.setApp_price(rs.getInt("app_price"));
					app.setApp_iconURL(rs.getString("app_iconURL"));
					app.setApp_descURL(rs.getString("app_descURL"));
					app.setApp_dlURL(rs.getString("app_dlURL"));
					app.setApp_rel_date(rs.getString("app_rel_date"));
					app.setApp_update(rs.getString("app_update"));
					app.setApp_ver(rs.getString("app_ver"));
					app.setApp_dlcount(rs.getInt("app_dlcount"));
					app.setApp_category(rs.getString("app_category"));

					appList[i] = app;

					i++;
				} while (rs.next());
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
		return appList;
	}

	// app_id에 해당하는 앱의 정보를 얻어내는 메소드로
	// 등록된 앱을 수정하기 위해 수정폼으로 읽어들기이기 위한 메소드
	public ApplicationDataBean getApp(int app_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ApplicationDataBean app = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from application where app_id = ?");
			pstmt.setInt(1, app_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				app = new ApplicationDataBean();

				app.setApp_name(rs.getString("app_name"));
				app.setApp_dev_id(rs.getString("app_dev_id"));
				app.setApp_price(rs.getInt("app_price"));
				app.setApp_iconURL(rs.getString("app_iconURL"));
				app.setApp_descURL(rs.getString("app_descURL"));
				app.setApp_dlURL(rs.getString("app_dlURL"));
				app.setApp_rel_date(rs.getString("app_rel_date"));
				app.setApp_update(rs.getString("app_update"));
				app.setApp_ver(rs.getString("app_ver"));
				app.setApp_dlcount(rs.getInt("app_dlcount"));
				app.setApp_category(rs.getString("app_category"));
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
		return app;
	}

	// 등록된 앱의 정보를 수정시 사용하는 메소드
	public void updateApp(ApplicationDataBean app, int app_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql;

		try {
			conn = getConnection();

			sql = "update application set app_name=?, app_dev_id=?, app_price=?";
			sql += ", app_iconURL=?, app_descURL=?, app_dlURL=?, app_rel_date=?";
			sql += ", app_update=?, app_ver=?, app_dlcount=?, app_category=?";
			sql += " where app_id=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, app.getApp_name());
			pstmt.setString(2, app.getApp_dev_id());
			pstmt.setInt(3, app.getApp_price());
			pstmt.setString(4, app.getApp_iconURL());
			pstmt.setString(5, app.getApp_descURL());
			pstmt.setString(6, app.getApp_dlURL());
			pstmt.setString(7, app.getApp_rel_date());
			pstmt.setString(8, app.getApp_update());
			pstmt.setString(9, app.getApp_ver());
			pstmt.setInt(10, app.getApp_dlcount());
			pstmt.setString(11, app.getApp_category());
			pstmt.setInt(12, app_id);

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

	// app_id에 해당하는 앱의 정보를 삭제시 사용하는 메소드
	public void deleteApp(int app_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("delete from application where app_id=?");
			pstmt.setInt(1, app_id);

			pstmt.executeUpdate();

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
	}
}