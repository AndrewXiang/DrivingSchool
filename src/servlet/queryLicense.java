package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class queryLicense extends HttpServlet {

	
	public queryLicense() {
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
		String lno=null;
		String receive_name=null;
		sno=request.getParameter("sno");
		sname=request.getParameter("sname");
		lno=request.getParameter("lno");
		receive_name=request.getParameter("receive_name");
		
		System.out.println(sno);
		
		if(!sno.equals("")){
			sql="SELECT * FROM licenseInfo WHERE sno="+sno;			//使用sno字段查询
		}else{
			if(!lno.equals("")){
			sql="SELECT * FROM licenseInfo WHERE lno="+lno;		//使用lno字段查询
			}else{
				if(!sname.equals("")&&!receive_name.equals("")){			//使用sname和receive_name查询
					sql="SELECT * FROM licenseInfo WHERE sname LIKE '%"+sname+
						"%' AND receive_name LIKE '%"+receive_name+"%'";
				}else if(sname.equals("")&&!receive_name.equals("")){		//使用receive_name字段查询
						sql="SELECT * FROM licenseInfo WHERE receive_name LIKE '%"+receive_name+"%'";
				}else if(!sname.equals("")&&receive_name.equals("")){		//使用sname字段查询
						sql="SELECT * FROM licenseInfo WHERE sname LIKE '%"+sname+"%'";
				}else{
					sql="SELECT * FROM licenseInfo";					//查询所有记录
				}
			}
		}

		System.out.println(sql);
		
		if(sql!=null){
			request.getSession().setAttribute("sql", sql);
			request.getSession().setAttribute("flag3", "OK");
			response.sendRedirect("../queryLicense.jsp");
		}else{
			response.sendRedirect("../queryLicense.jsp");
		}
		
		
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		
	}

}
