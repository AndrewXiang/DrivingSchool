package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DB;

public class deleteGrade extends HttpServlet {


	public deleteGrade() {
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
		sql="DELETE FROM gradeInfo WHERE id="+id;
		DB db = new DB();
		db.connectMySQL();
		try {
			i=db.update(sql);
			if(i>0){
				System.out.println("ɾ���ɹ���");
				request.getSession().setAttribute("flag2", "OK");
				response.sendRedirect("../queryGrade.jsp");
			}
			db.closeDB();
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("../queryGrade.jsp");
		}
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		
	}

}
