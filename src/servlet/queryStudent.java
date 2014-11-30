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

public class queryStudent extends HttpServlet {

	public queryStudent() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
//		rs.getString("sex").getBytes("ISO-8859-1"),"GBK")	
		
		request.setCharacterEncoding("gbk");
		String sql=null;
		
		String sno=null;
		String sname=null;
		String carType=null;
		String scondition=null;
		
		sno=request.getParameter("sno");
		sname=request.getParameter("sname");
		carType=request.getParameter("carType");
		scondition=request.getParameter("scondition");
		
		if(!sno.equals("")){			//只按学号查询
			sql="SELECT * FROM studentInfo WHERE sno="+sno;
		}else{							//不按学号					
			if(!sname.equals("")){		
				if(carType.equals("all")){
					if(scondition.equals("all")){
						sql="SELECT * FROM studentInfo WHERE sname LIKE '%"+sname+"%'";
					}else{
						sql="SELECT * FROM studentInfo WHERE sname LIKE '%"+sname+"%' AND scondition='"+scondition+"'";
					}
				}else{
					if(scondition.equals("all")){
						sql="SELECT * FROM studentInfo WHERE sname LIKE '%"+sname+"%' AND car_type='"+carType+"'";
					}else{
						sql="SELECT * FROM studentInfo WHERE sname LIKE '%"+sname+"%' AND scondition='"+scondition+"' AND car_type='"+carType+"'";
					}
				}
			}else{
				if(carType.equals("all")){
					if(scondition.equals("all")){
						sql="SELECT * FROM studentInfo";
					}else{
						sql="SELECT * FROM studentInfo WHERE scondition='"+scondition+"'";
					}
				}else{
					if(scondition.equals("all")){
						sql="SELECT * FROM studentInfo WHERE car_type='"+carType+"'";
					}else{
						sql="SELECT * FROM studentInfo WHERE scondition='"+scondition+"' AND car_type='"+carType+"'";
					}
				}
			}
		}

		if(sql!=null){
			request.getSession().setAttribute("sql", sql);
			request.getSession().setAttribute("flag", "OK");
			response.sendRedirect("../queryStudent.jsp");
		}else{
			response.sendRedirect("../queryStudent.jsp");
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		
	}

	public void init() throws ServletException {
		
	}

}
