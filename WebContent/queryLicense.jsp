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
			 ѧ��<input type="text" name="sno" value="" size="15">
	 	</td>
	 	<td>
	 		����<input type="text" name="sname" value="" size="15">	
	 	</td>
	 	<td>
	 		��ʻ֤����<input type="text" name="lno" value="" size="15">
	 	</td>
	 	<td>
	 		��ȡ��<input type="text" name="receive_name" value="" size="15">
	 	</td>
	 	 <td>
		 <input type="submit" name="Submit" value="�ύ">
	 	 <input type="reset" name="reset" value="����" >
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
				ѧ��
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				����
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				��ʻ֤��
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				��ȡʱ��
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				��ȡ��
			</td>
			<td width="14%" class="TABLE_HEAD" align="center">
				��ע
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				�޸Ĵ���Ϣ
			</td>			
			<td width="6%" class="TABLE_HEAD" align="center">
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
				<a href="modifyLicense.jsp?sno=<%=rs.getString("sno") %>">�޸�
				</a>
			</td>		
			<td class="TABLE_COL" align="center">
				<a href="servlet/deleteLicense?id=<%=rs.getString("id") %>">ɾ��
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
