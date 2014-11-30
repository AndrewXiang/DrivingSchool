package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class queryGrade extends HttpServlet {

	
	public queryGrade() {
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
		String cname=request.getParameter("cname");
		
		if(!sno.equals("")){
			sql="SELECT * FROM grade_view WHERE sno="+sno;				//使用sno字段查询
			}
		else{
			if(!sname.equals("")&&!cname.equals("")){
//			使用sname字段和cname字段查询
			sql="SELECT * FROM grade_view sname='%"+sname+"%' AND cname='%"+cname+"%'";
			}else if(sname.equals("")&&!cname.equals("")){
			sql="SELECT * FROM grade_view cname='%"+cname+"%'";		//使用cname字段查询
			}else if(!sname.equals("")&&cname.equals("")){
			sql="SELECT * FROM grade_view sname='%"+sname+"%'";		//使用sname字段查询
			}else{
			sql="SELECT * FROM grade_view";							//查询所有记录
			}
		}
		
		
		if(sql!=null){
			request.getSession().setAttribute("sql", sql);
			request.getSession().setAttribute("flag2", "OK");
			response.sendRedirect("../queryGrade.jsp");
		}else{
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
