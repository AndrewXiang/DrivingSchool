package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DB;

public class insertLicense extends HttpServlet {

	
	public insertLicense() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("gbk");
		String sql=null;
		int i;
		String sname;
		String sno=request.getParameter("sno");
		String lno=request.getParameter("lno");
		String receive_time=request.getParameter("receive_time");
		String receive_name=request.getParameter("receive_name");
		String l_text=request.getParameter("l_text");

		DB db=new DB();
		db.connectMySQL();
		sql="SELECT * FROM studentInfo WHERE sno="+sno;
		System.out.println(sql);
		try {
			ResultSet rs=db.query(sql);
			if(rs.next()){				
				sname=rs.getString("sname");				
				System.out.println(sname+"   1111111111");
				sql="INSERT INTO licenseInfo VALUES(NULL,"+sno+",'"+sname+"','"+
					lno+"','"+receive_time+"','"+receive_name+"','"+l_text+"')";
				System.out.println(sql);
				i=db.update(sql);
				if(i>0){
					response.sendRedirect("../queryLicense.jsp");
				}else{
					response.sendRedirect("../insertLicense.jsp");
				}
			}else{
				response.sendRedirect("../insertLicense.jsp");
			}
			db.closeDB();
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("../insertLicense.jsp");
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doGet(request, response);
	}

	
	public void init() throws ServletException {
		
	}

}
