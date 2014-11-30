package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class queryHealth extends HttpServlet {

	public queryHealth() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gbk");
		String sql=null;
		
		String sno=null;
		String sname=null;
		sno=request.getParameter("sno");
		sname=request.getParameter("sname");
		if(sno.equals("")&&sname.equals(""))
			sql="SELECT * FROM healthInfo";
		else{
			if(!sno.equals(""))
				sql="SELECT * FROM healthInfo WHERE sno="+sno;
			else {
				sql="SELECT * FROM healthInfo WHERE sname LIKE '%"+sname+"%'";	
			}
		}
		
		if(sql!=null){
			request.getSession().setAttribute("sql", sql);
			request.getSession().setAttribute("flag1", "OK");
			response.sendRedirect("../queryHealth.jsp");
		}else{
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
