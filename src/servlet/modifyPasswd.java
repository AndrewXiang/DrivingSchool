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

public class modifyPasswd extends HttpServlet {

	
	public modifyPasswd() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("gbk");
		int flag;
		String sql=null;
		String username=null;
		String oldPassword=null;
		String newPassword1=null;
		String newPassword2=null;
		
		username=request.getParameter("username");		
		oldPassword=request.getParameter("oldPassword");
		newPassword1=request.getParameter("newPassword1");
		newPassword2=request.getParameter("newPassword2");
		
		if(newPassword1!=null&&!newPassword1.equals("")&&newPassword1.equals(newPassword2)){			
			sql = "SELECT * FROM user WHERE username='"+username+"' AND password='"+oldPassword+"'";
			int i;
			DB db = new DB();
			db.connectMySQL();
			try{
				ResultSet rs=db.query(sql);
				if(rs.next()){
					sql = "UPDATE user SET password='"+newPassword1+"' WHERE username='"+username+"'";
					i=db.update(sql);
					if(i>0){
//						request.setAttribute("info", "密码修改成功");
						System.out.println("密码修改成功");
					}
				}else{
//					request.setAttribute("info", "旧密码错误");
					System.out.println("旧密码错误");
				}
				db.closeDB();
			}catch(SQLException e){
				e.printStackTrace();
			}		
		}else{
//			request.setAttribute("info", "2次输入的新密码不一致");
			System.out.println("2次输入的新密码不一致或者新密码为空");
		}
		
		response.sendRedirect("../modifyPasswd.jsp");
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		
	}

}
