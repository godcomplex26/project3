package appstore.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BuyDBBean {
private static BuyDBBean instance = new BuyDBBean();
	
	public static BuyDBBean getInstance() {
    	return instance;
    }
   
    private BuyDBBean() {}
   
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
        return ds.getConnection();
    }
    
    // bank테이블에 있는 전체 레코드를 얻어내는 메소드
    public List<String> getAccount(){
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> accountList = null;
        try {
            conn = getConnection();
                        
            pstmt = conn.prepareStatement("select * from bank");
            rs = pstmt.executeQuery();
            
            accountList = new ArrayList<String>();
            
            while (rs.next()) {
           	  String account = new String(rs.getString("bank_id")+" "
                     + rs.getString("bank_name"));
           	  accountList.add(account);
		    }
        }catch(Exception ex) {
        	ex.printStackTrace();
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
        return accountList;
    }
    
    //구매 테이블인 buy에 구매목록 등록
    public void insertBuy(BuyDataBean buy)
    		throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        buy.setBuy_date(formattedDateTime);

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("insert into buy (buy_mem_id,buy_app_id,buy_app_name,buy_date,buy_bank) values (?,?,?,?,?)");

            pstmt.setString(1, buy.getBuy_mem_id());
            pstmt.setInt(2, buy.getBuy_app_id());
            pstmt.setString(3, buy.getBuy_app_name());
            pstmt.setString(4, buy.getBuy_date());
            pstmt.setString(5, buy.getBuy_bank());

            pstmt.executeUpdate();
            
            // buy에 삽입 발생할 때마다 app_dlcount 1씩 증가
            pstmt = conn.prepareStatement("update application set app_dlcount = app_dlcount + 1 where app_id = ?");
            pstmt.setInt(1, buy.getBuy_app_id());
            pstmt.executeUpdate();
            
            // 커밋
            conn.commit();

        } catch(Exception ex) {
            // 예외 발생시 롤백
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ex.printStackTrace();
            
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
  //buy_mem_id에 해당하는 buy테이블의 레코드수를 얻어내는 메소드
    public int getListCount(String buy_mem_id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select count(*) from buy where buy_mem_id=?");
            pstmt.setString(1, buy_mem_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
    
    //buy_dev_id에 해당하는 buy테이블의 레코드수를 얻어내는 메소드
    public int getListCountdev(String buy_dev_id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        
        int x=0;

        try {
            conn = getConnection();
            
            sql = "SELECT application.? FROM buy LEFT JOIN application ON buy.buy_app_id = application.app_id;";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, buy_dev_id);	
			rs = pstmt.executeQuery();
            
            pstmt = conn.prepareStatement(
            	"select count(*) from buy where buy_dev_id=?");
            pstmt.setString(1, buy_dev_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
    
    //buy테이블의 전체 레코드수를 얻어내는 메소드
    public int getListCount()
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            		"select count(*) from buy");
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
    
    //id에 해당하는 buy테이블의 구매목록을 얻어내는 메소드
    public List<BuyDataBean> getBuyList(String id) 
    throws Exception {
   	    Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BuyDataBean buy=null;
        String sql = "";
        List<BuyDataBean> lists = null;
        
        try {
       	    conn = getConnection();
       	 
       	    sql = "select * from buy where buy_mem_id = ?";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            lists = new ArrayList<BuyDataBean>();

            while (rs.next()) {
              buy = new BuyDataBean();
           	 
           	  buy.setBuy_id(rs.getLong("buy_id"));
           	  buy.setBuy_mem_id(rs.getString("buy_mem_id"));
           	  buy.setBuy_app_id(rs.getInt("buy_app_id"));
           	  buy.setBuy_app_name(rs.getString("buy_app_name"));
           	  buy.setBuy_date(rs.getString("buy_date"));
           	  buy.setBuy_bank(rs.getString("buy_bank"));
           	  buy.setBuy_score(rs.getInt("buy_score"));
           	 
           	  lists.add(buy);
			}
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return lists;
    }
    
    //buy테이블의 전체 목록을 얻어내는 메소드
    public List<BuyDataBean> getBuyList() 
    throws Exception {
   	    Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BuyDataBean buy = null;
        String sql = "";
        List<BuyDataBean> lists = null;
        
        try {
       	 conn = getConnection();
       	 
       	 sql = "SELECT buy.*, application.app_dev_id FROM buy LEFT JOIN application ON buy.buy_app_id = application.app_id;";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            lists = new ArrayList<BuyDataBean>();

            while (rs.next()) {
              buy = new BuyDataBean();
           	 
           	  buy.setBuy_id(rs.getLong("buy_id"));
           	  buy.setBuy_mem_id(rs.getString("buy_mem_id"));
           	  buy.setBuy_app_id(rs.getInt("buy_app_id"));
           	  buy.setBuy_app_name(rs.getString("buy_app_name"));
           	  buy.setBuy_date(rs.getString("buy_date"));
           	  buy.setBuy_bank(rs.getString("buy_bank"));
           	  buy.setBuy_score(rs.getInt("buy_score"));
           	  buy.setBuy_dev_id(rs.getString("app_dev_id"));
           	 
           	  lists.add(buy);
		    }
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return lists;
    }
    
    //특정 buy_id에 해당하는 buy테이블의 구매목록을 얻어내는 메소드
    public BuyDataBean getBuy(long id) 
    throws Exception {
   	    Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BuyDataBean buy=null;
        String sql = "";
        
        try {
       	    conn = getConnection();
       	 
       	    sql = "select * from buy where buy_id = ?";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setLong(1, id);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
              buy = new BuyDataBean();
           	 
           	  buy.setBuy_id(rs.getLong("buy_id"));
           	  buy.setBuy_mem_id(rs.getString("buy_mem_id"));
           	  buy.setBuy_app_id(rs.getInt("buy_app_id"));
           	  buy.setBuy_app_name(rs.getString("buy_app_name"));
           	  buy.setBuy_date(rs.getString("buy_date"));
           	  buy.setBuy_bank(rs.getString("buy_bank"));
           	  buy.setBuy_score(rs.getInt("buy_score"));
			}
        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return buy;
    }
    
    
    // 별점 수정하기
    public void setBuyScore(BuyDataBean buy, long buy_id) 
		throws Exception {
	Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = getConnection();

        pstmt = conn.prepareStatement("update buy set buy_score=? where buy_id=?");

        pstmt.setInt(1, buy.getBuy_score());
        pstmt.setLong(2, buy_id);

        pstmt.executeUpdate();

    }catch(Exception ex) {
    	ex.printStackTrace();
    } finally {
        if (pstmt != null) 
        	try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) 
        	try { conn.close(); } catch(SQLException ex) {}
    	}
    }
}