package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DB;

public class modifyLicense extends HttpServlet {

	
	public modifyLicense() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gbk");
		String sql=null;
		String sno=request.getParameter("sno");
		String lno=request.getParameter("lno");
		String receive_time=request.getParameter("receive_time");
		String receive_name=request.getParameter("receive_name");
		String l_text=request.getParameter("l_text");
	
		sql="UPDATE licenseInfo SET lno='"+lno+"',receive_time='"+receive_time+
			"',receive_name='"+receive_name+"',l_text='"+l_text+"' WHERE sno="+sno;
		
System.out.println(sql);
		
		DB db=new DB();
		db.connectMySQL();
		try {
			int i=db.update(sql);
			if(i>0){
				System.out.println("ÐÞ¸Ä³É¹¦£¡");
				request.getSession().setAttribute("flag3", "OK");
				response.sendRedirect("../queryLicense.jsp");
			}
			db.closeDB();
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("../queryLicense.jsp");
		}

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		
	}

}
