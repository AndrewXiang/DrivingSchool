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
		 ѧ��:<input type="text" name="sno" value="" size="15">
	 		  
	 	</td>
	 	<td>
		 ����:<input type="text" name="sname" value="" size="15">	 		  
	 	</td>
	 	<td>
	 	���Կ�Ŀ:  <SELECT NAME="cname">
	 		<OPTION VALUE="">	 ȫ����Ŀ
		    <OPTION VALUE="����">	 ����					
		    <OPTION VALUE="����">	 ����	
		    <OPTION VALUE="·��">	 ·��   		
	     </SELECT>
	     </td>
	     <td>		
		 <input type="submit" name="Submit" value="�ύ">
	 	 <input type="reset" name="reset" value="����">
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
				ѧ��
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				����
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				�γ���
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				���Դ���
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				������Ե�ʱ��
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				����
			</td>
			<td width="10%" class="TABLE_HEAD" align="center">
				�޸Ĵ���Ϣ
			</td>			
			<td width="10%" class="TABLE_HEAD" align="center">
				ɾ������Ϣ
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
				<a href="modifyGrade.jsp?id=<%=rs.getString("id") %>">�޸�  
				</a>
			</td>		
			<td class="TABLE_COL" align="center">
				<a href="servlet/deleteGrade?id=<%=rs.getString("id") %>">ɾ��
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
