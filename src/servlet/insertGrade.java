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

public class insertGrade extends HttpServlet {

	
	public insertGrade() {
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
		String sno=request.getParameter("sno");
		String cno=request.getParameter("cno");
		String times=request.getParameter("times");
		String last_time=request.getParameter("last_time");
		String grade=request.getParameter("grade");
		
		
		DB db = new DB();
		db.connectMySQL();
		if(sno!=null&&!sno.equals("")){
			sql="SELECT * FROM studentInfo WHERE sno="+sno;
			try {
				ResultSet rs=db.query(sql);
				if(rs.next()){
					sql="INSERT INTO gradeInfo VALUES(NULL,"+sno+","+cno+
						",'"+last_time+"',"+times+","+grade+")";
					System.out.println(sql);
					i=db.update(sql);
					if(i>0){
						response.sendRedirect("../queryGrade.jsp");
					}else{
						System.out.println("记录插入失败！");
						response.sendRedirect("../insertGrade.jsp");
					}
					
				}
				else{
					System.out.println("学员表中没有该学员");
					response.sendRedirect("../insertGrade.jsp");
				}
				db.closeDB();
			} catch (SQLException e) {
				e.printStackTrace();
				response.sendRedirect("../insertGrade.jsp");
			}
		}
		

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		
	}

}
