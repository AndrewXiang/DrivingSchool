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
			sql="SELECT * FROM grade_view WHERE sno="+sno;				//ʹ��sno�ֶβ�ѯ
			}
		else{
			if(!sname.equals("")&&!cname.equals("")){
//			ʹ��sname�ֶκ�cname�ֶβ�ѯ
			sql="SELECT * FROM grade_view sname='%"+sname+"%' AND cname='%"+cname+"%'";
			}else if(sname.equals("")&&!cname.equals("")){
			sql="SELECT * FROM grade_view cname='%"+cname+"%'";		//ʹ��cname�ֶβ�ѯ
			}else if(!sname.equals("")&&cname.equals("")){
			sql="SELECT * FROM grade_view sname='%"+sname+"%'";		//ʹ��sname�ֶβ�ѯ
			}else{
			sql="SELECT * FROM grade_view";							//��ѯ���м�¼
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
