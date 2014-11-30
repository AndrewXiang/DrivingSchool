package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DB;

public class modifyGrade extends HttpServlet {

	public modifyGrade() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gbk");
		String sql=null;
		String id=request.getParameter("id");
		
		System.out.println("id="+id);
		
		String sno=request.getParameter("sno");
		String cname=request.getParameter("cname");
		String last_time=request.getParameter("last_time");
		String times=request.getParameter("times");
		String grade=request.getParameter("grade");
		int cno=0;
		if(cname.equals("理论"))
			cno=1;
		else if(cname.equals("倒车"))
			cno=2;
		else if(cname.equals("路考"))
			cno=3;
		
		sql="UPDATE gradeInfo SET cno="+cno+",last_time='"+last_time+
			"',times="+times+",grade="+grade+" WHERE id="+id;

		System.out.println(sql);
		
		DB db=new DB();
		db.connectMySQL();
		try {
			int i=db.update(sql);
			if(i>0){
				System.out.println("修改成功！");
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
