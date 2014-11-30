<%@ page language="java" pageEncoding="gbk"%>

<%@ page import="java.sql.*"%>
<%@ page import="db.*"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>queryLicence.jsp</title>
  

  </head>
  
  <body>
  
   <form name="queryLicense" method="post" action="servlet/queryLicense">	
     	<table width="465" border="o.2" cellpadding="0" cellspacing="0" height="10">
     	<tr>
     	<td>
			 学号<input type="text" name="sno" value="" size="15">
	 	</td>
	 	<td>
	 		姓名<input type="text" name="sname" value="" size="15">	
	 	</td>
	 	<td>
	 		驾驶证号码<input type="text" name="lno" value="" size="15">
	 	</td>
	 	<td>
	 		领取人<input type="text" name="receive_name" value="" size="15">
	 	</td>
	 	 <td>
		 <input type="submit" name="Submit" value="提交">
	 	 <input type="reset" name="reset" value="重置" >
	 	 </td>
	 	 </tr>
	 	 </table>
	 </form>
	 
<%					
	String flag3="NO";
	flag3=(String)request.getSession().getAttribute("flag3");	
	System.out.println(flag3);			
	if (flag3!=null&&flag3.equals("OK")) {			 
%>
	<table width="100%" border="o.5" cellpadding="0" cellspacing="0"
		class="TABLE">
		<tr>
			<td width="14%" class="TABLE_HEAD" align="center">
				学号
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				姓名
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				驾驶证号
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				领取时间
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				领取人
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				备注
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				修改此信息
			</td>			
			<td width="6%" class="TABLE_HEAD" align="center">
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
				<%=rs.getString("sname") %>
			</td>		
			<td class="TABLE_COL" align="center">
				<%=rs.getString("lno")%>
			</td>
			<td class="TABLE_COL" align="center">
			    <%=rs.getString("receive_time")%>						
			</td>		
			<td class="TABLE_COL" align="center">
				<%=rs.getString("receive_name")%>
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("l_text")%>
			</td>				
			<td class="TABLE_COL" align="center">
				<a href="modifyLicense.jsp?sno=<%=rs.getString("sno") %>">修改
				</a>
			</td>		
			<td class="TABLE_COL" align="center">
				<a href="servlet/deleteLicense?id=<%=rs.getString("id") %>">删除
				</a>
			</td>
		 </tr>
		<%}
		 db.closeDB();
		 request.getSession().setAttribute("flag3","RESET"); 
		 }	
		 	%>
		
		
</table>
   
  
  </body>
</html>
