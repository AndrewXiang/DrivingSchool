package db;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.io.*;
public class DB {
	private Connection conn=null;
	private Statement stat=null;
    public ResultSet rs=null;

	public void connectMySQL() 
	{
		String url="jdbc:mysql://localhost:3306/drivingschool";
		String user="dbo";
		String psd="dbo";
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(url, user, psd);
		    stat = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ResultSet query(String sql) throws SQLException
	{
		if(sql==null||sql.equals(""))
		{
			return null;
		}
		rs = stat.executeQuery(sql);
		return rs;
	}
	
	public int update(String sql) throws SQLException
	{		
		int i;
		if(sql==null||sql.equals(""))
		{
			return 0;
		}
		i=stat.executeUpdate(sql);	
		return i;
	}
	
	public ResultSet executeSQL(String sql) throws SQLException{
		
		boolean t;
		if(sql==null||sql.equals(""))
		{
			return null;
		}
		t=stat.execute(sql);
		if(t){
			rs = stat.getResultSet();
			return rs;
		}
		else{
			return null;
		}		
	}
	
	public void closeDB() throws SQLException
	{
		if(rs!=null)
		{
			rs.close();
			rs=null;
		}
		if(stat!=null)
		{
			stat.close();
			stat=null;
		}
		if(conn!=null)
		{
			conn.close();
			conn=null;
		}
	}
	
/*	
	public  static void main(String arg[]) throws SQLException,IOException, InstantiationException, IllegalAccessException, ClassNotFoundException{
	 
		String sql="select * from user";
		
		DB d=new DB();
		
		d.connectMySQL();
		
		ResultSet rs=d.query(sql);
		
		if(rs!=null){
		System.out.println("success");
		while(rs.next()){
			
			String i=rs.getString("username");
			System.out.println(i);
			String j=rs.getString("password");
			System.out.println(j);
			}
		}
		else{
			System.out.println("Fail");
		}
		d.closeDB();
	
	}
*/
}
	
	
	

