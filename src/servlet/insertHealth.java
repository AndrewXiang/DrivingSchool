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

public class insertHealth extends HttpServlet {

	
	public insertHealth() {
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
		
		DB db=new DB();
		db.connectMySQL();
		sql="SELECT * FROM studentInfo WHERE sno="+sno;
		System.out.println(sql);
		try {
			ResultSet rs=db.query(sql);
			if(rs.next()){				
				sname=rs.getString("sname");				
				System.out.println(sname+"   1111111111");
				sql="INSERT INTO healthInfo VALUES(NULL,"+sno+",'"+sname+"',"+height+
					","+weight+",'"+differentiate+"',"+left_sight+","+right_sight+",'"+left_ear+
					"','"+right_ear+"','"+legs+"','"+pressure+"','"+history+"','"+h_text+"')";
				i=db.update(sql);
				if(i>0){
					response.sendRedirect("../queryHealth.jsp");
				}else{
					response.sendRedirect("../insertHealth.jsp");
				}
			}else{
				response.sendRedirect("../insertHealth.jsp");
			}
			db.closeDB();
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("../insertHealth.jsp");
		}

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		
	}

}
