<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <link href="styles/common.css" type="text/css" rel="stylesheet" />
	<link href="styles/menu.css" type="text/css" rel="stylesheet" />
	<link href="styles/function.css" type="text/css" rel="stylesheet" />
	<link href="styles/index.css" type="text/css" rel="stylesheet" />
	<link href="styles/link.css" type="text/css" rel="stylesheet" />
	<link href="styles/main.css" type="text/css" rel="stylesheet" />
    
    <title>queryStudent.jsp</title>


	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <form name="queryStudent" method="post" action="servlet/queryStudent">	
     	<table width="100%" border=1" cellpadding="0" cellspacing="0">
     	<tr>
     	<td width="4%" class="TABLE_HEAD" align="center">
     		<OPTION VALUE=100001>
			��ѧ�Ų�ѯ:<input type="text" name="sno" value="" size="10"/>
		</td>
		<td width="4%" class="TABLE_HEAD" align="center">
			<OPTION VALUE=100004>
		 	��������ѯ:<input type="text" name="sname" value="" size="10"/>
		</td>
		<td width="4%" class="TABLE_HEAD" align="center">
			<OPTION VALUE=100005>
	 		���������Ͳ�ѯ��
			<SELECT NAME="carType">
		 	<OPTION VALUE="all"> ȫ��
		    <OPTION VALUE="A1">	 A1					
		    <OPTION VALUE="A2">	 A2	
		    <OPTION VALUE="A3">	 A3	
		    <OPTION VALUE="B1">	 B1	
		    <OPTION VALUE="B2">	 B2	
		    <OPTION VALUE="C1">	 C1	
		    <OPTION VALUE="C2">	 C2	
		    <OPTION VALUE="C3">	 C3	
		    <OPTION VALUE="C4">	 C4	   		
	     	</SELECT>		 
		</td>
		<td width="6%" class="TABLE_HEAD" align="center">
			��ѧҵ״̬��ѯ:					
			<SELECT NAME="scondition">
				<OPTION VALUE="all">	ȫ��	
				<OPTION VALUE="ѧϰ">	ѧϰ				
				<OPTION VALUE="��ҵ">	��ҵ								
				<OPTION VALUE="��ѧ">	��ѧ													  															
			</SELECT>  		
		</td>	
		</tr>
		<tr>
		<input type="submit" name="Submit" value="�ύ">
	 	<input type="reset" name="reset" value="����">
	 	</tr>
	 	</table>
	 </form>

<%		 
	String flag="NO";
	flag=(String)request.getSession().getAttribute("flag");	
	System.out.println(flag);			
	if (flag!=null&&flag.equals("OK")) {	
	System.out.println("ffffffffff");	 
%>

	<table width="100%" border=1" cellpadding="0" cellspacing="0"
		class="TABLE">
		<tr>
			<td width="6%" class="TABLE_HEAD" align="center">
				ѧ��
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				����
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				�Ա�
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				����
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				���֤��
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				��ϵ�绰
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				��������
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				��ѧʱ��
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				��Уʱ��
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				ѧУ״̬
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				��ע
			</td>
			<td width="4%" class="TABLE_HEAD" align="center">
				�޸Ĵ���Ϣ
			</td>			
			<td width="4%" class="TABLE_HEAD" align="center">
				ɾ������Ϣ
			</td>
		</tr>


		<%
		//	ResultSet rs = (ResultSet)request.getSession().getAttribute("rs"); 
			String sql=(String)request.getSession().getAttribute("sql");
			DB db = new DB();
			db.connectMySQL();
			ResultSet rs=db.query(sql);			
			while(rs.next()){								
		 %>
		<tr class="COL_A">
			
			<td class="TABLE_COL" align="center">
				<%=rs.getString("sno") %>				
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("sname")%>
			</td>			
			<td class="TABLE_COL" align="center">
				<%=rs.getString("sex")%>
			</td>
			<td class="TABLE_COL" align="center">
			    <%=rs.getString("age")%>						
			</td>		
			<td class="TABLE_COL" align="center">
				<%=rs.getString("identify")%>
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("tel")%>
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("car_type")%>
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("enroll_time")%>
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("leave_time")%>
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("scondition")%>
			</td>
			<td class="TABLE_COL" align="center">
				<%=rs.getString("s_text")%>
			</td>				
			<td class="TABLE_COL" align="center">
				<a href="modifyStudent.jsp?sno=<%=rs.getString("sno") %>">�޸�
				</a>
			</td>		
			<td class="TABLE_COL" align="center">
				<a href="servlet/deleteStudent?sno=<%=rs.getString("sno") %>">ɾ��
				</a>
			</td>
		 </tr>
		 
	<%	 }
		 db.closeDB();
		 request.getSession().setAttribute("flag","RESET"); 
		 }	
	%>
		 		
</table>

	
   
  </body>
</html>
