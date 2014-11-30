package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DB;

public class deleteLicense extends HttpServlet {


	public deleteLicense() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gbk");
		String sql=null;
		String id=null;
		int i=0;
		id=request.getParameter("id");
		sql="DELETE FROM licenseInfo WHERE id="+id;
		System.out.println(sql);
		DB db = new DB();
		db.connectMySQL();
		try {
			i=db.update(sql);
			System.out.println(i);
			if(i>0){
				System.out.println("É¾³ý³É¹¦£¡");
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
