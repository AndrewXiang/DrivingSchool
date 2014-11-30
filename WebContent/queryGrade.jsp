<%@ page language="java" pageEncoding="gbk"%>


<%@ page import="db.*"%>
<%@ page import="java.sql.*"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title>queryGrade.jsp</title>
   

  </head>
  
  <body>
 
   <form name="queryGrade" method="post" action="servlet/queryGrade">	
     <table width="465" border="o.2" cellpadding="0" cellspacing="0" height="10">
      <tr>	
     	<td>
		 学号:<input type="text" name="sno" value="" size="15">
	 		  
	 	</td>
	 	<td>
		 姓名:<input type="text" name="sname" value="" size="15">	 		  
	 	</td>
	 	<td>
	 	考试科目:  <SELECT NAME="cname">
	 		<OPTION VALUE="">	 全部科目
		    <OPTION VALUE="理论">	 理论					
		    <OPTION VALUE="倒车">	 倒车	
		    <OPTION VALUE="路考">	 路考   		
	     </SELECT>
	     </td>
	     <td>		
		 <input type="submit" name="Submit" value="提交">
	 	 <input type="reset" name="reset" value="重置">
	 	</td>
	 </tr>
	 </table>
	<form>

<%					
	String flag2="NO";
	flag2=(String)request.getSession().getAttribute("flag2");	
	System.out.println(flag2);			
	if (flag2!=null&&flag2.equals("OK")) {			 
%>
	<table width="100%" border="o.5" cellpadding="0" cellspacing="0"
		class="TABLE">
		<tr>
			<td width="10%" class="TABLE_HEAD" align="center">
				学号
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				姓名
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				课程名
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				考试次数
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				最近考试的时间
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				分数
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				修改此信息
			</td>			
			<td width="10%" class="TABLE_HEAD" align="center">
				删除此信息
			</td>
		</tr>


		<%
			String sql=(String)request.getSession().getAttribute("sql");
			DB db = new DB();
			db.connectMySQL();
			ResultSet rs=db.query(sql);			
			while(rs.next()){	
						
		 %>
		<tr class="COL_A">
			
			<td class="TABLE_COL" align="center">
				<%=rs.getString("sno")%>				
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("sname")%>				
			</td>			
			<td class="TABLE_COL" align="center">
				<%=rs.getString("cname")%>
			</td>
			<td class="TABLE_COL" align="center">
			    <%=rs.getString("times")%>						
			</td>		
			<td class="TABLE_COL" align="center">
				<%=rs.getString("last_time")%>
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("grade")%>
			</td>				
			<td class="TABLE_COL" align="center">
				<a href="modifyGrade.jsp?id=<%=rs.getString("id") %>">修改  
				</a>
			</td>		
			<td class="TABLE_COL" align="center">
				<a href="servlet/deleteGrade?id=<%=rs.getString("id") %>">删除
				</a>
			</td>
		 </tr>
		 
		 
		<%}
		 db.closeDB();
		 request.getSession().setAttribute("flag2","RESET"); 
		 }	
		 	%>
		
		
		
		

</table>
   
   
  
   
  </body>
</html>
