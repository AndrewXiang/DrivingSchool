package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DB;

public class insertStudent extends HttpServlet {

	public insertStudent() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("gbk");
		String sql=null;
		int i;
		String sno=request.getParameter("sno");
		String sname=request.getParameter("sname");
		System.out.println(sname);
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		String identify=request.getParameter("identify");
		String tel=request.getParameter("tel");
		String car_type=request.getParameter("carType");
		String enroll_time=request.getParameter("enrollTime"); 
		if(enroll_time.equals(""))
			enroll_time="9999-12-30";
		String leave_time=request.getParameter("leaveTime");
		if(leave_time.equals(""))
			leave_time="9999-12-30";
		String scondition=request.getParameter("scondition");
		String s_text=request.getParameter("stext");
		
		DB db = new DB();
		db.connectMySQL();
		if(sno!=null&&!sno.equals("")){
			sql="SELECT * FROM studentInfo WHERE sno="+sno;
			try {
				ResultSet rs=db.query(sql);
				if(rs.next()){
					System.out.println("该记录已经存在！");
					response.sendRedirect("../LoginError.html");
				}
				else{
					sql="INSERT INTO studentInfo VALUES("+sno+",'"+sname+"','"+sex+
						"',"+age+",'"+identify+"','"+tel+"','"+car_type+"','"+enroll_time+
						"','"+leave_time+"','"+scondition+"','"+s_text+"')";
					System.out.println(sql);
					i=db.update(sql);
					if(i>0){
						request.getSession().setAttribute("flag", "OK");
						response.sendRedirect("../queryStudent.jsp");
					}else{
						System.out.println("记录插入失败！");
						response.sendRedirect("../insertStudent.jsp");
					}
				}
				db.closeDB();
			} catch (SQLException e) {
				e.printStackTrace();
				response.sendRedirect("../insertStudent.jsp");
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
