package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DB;

public class modifyHealth extends HttpServlet {

	
	public modifyHealth() {
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
		String sname=request.getParameter("sname");
		String height=request.getParameter("height");
		String weight=request.getParameter("weight");
		String differentiate=request.getParameter("differentiate");
		String left_sight=request.getParameter("left_sight");
		String right_sight=request.getParameter("right_sight");
		String left_ear=request.getParameter("left_ear");
		String right_ear=request.getParameter("right_ear");
		String legs=request.getParameter("legs");
		String pressure=request.getParameter("pressure");
		String history=request.getParameter("history");
		String h_text=request.getParameter("h_text");
		
		sql="UPDATE healthInfo SET height="+height+",weight="+weight+",differentiate='"+differentiate+
			"',left_sight="+left_sight+",right_sight="+right_sight+",left_ear='"+left_ear+"',right_ear='"+
			right_ear+"',legs='"+legs+"',pressure='"+pressure+"',history='"+history+"',h_text='"+h_text+"' WHERE sno="+sno;

		System.out.println(sql);
		
		DB db=new DB();
		db.connectMySQL();
		try {
			int i=db.update(sql);
			if(i>0){
				System.out.println("ÐÞ¸Ä³É¹¦£¡");
				request.getSession().setAttribute("flag1", "OK");
				response.sendRedirect("../queryHealth.jsp");
			}
			db.closeDB();
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("../queryHealth.jsp");
		}

		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	
	}

	

	public void init() throws ServletException {
	
	}

}
