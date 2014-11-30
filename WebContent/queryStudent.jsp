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
			按学号查询:<input type="text" name="sno" value="" size="10"/>
		</td>
		<td width="4%" class="TABLE_HEAD" align="center">
			<OPTION VALUE=100004>
		 	按姓名查询:<input type="text" name="sname" value="" size="10"/>
		</td>
		<td width="4%" class="TABLE_HEAD" align="center">
			<OPTION VALUE=100005>
	 		按报考车型查询：
			<SELECT NAME="carType">
		 	<OPTION VALUE="all"> 全部
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
			按学业状态查询:					
			<SELECT NAME="scondition">
				<OPTION VALUE="all">	全部	
				<OPTION VALUE="学习">	学习				
				<OPTION VALUE="结业">	结业								
				<OPTION VALUE="退学">	退学													  															
			</SELECT>  		
		</td>	
		</tr>
		<tr>
		<input type="submit" name="Submit" value="提交">
	 	<input type="reset" name="reset" value="重置">
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
				学号
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				姓名
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				性别
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				年龄
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				身份证号
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				联系电话
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				报考车型
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				入学时间
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				离校时间
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				学校状态
			</td>
			<td width="6%" class="TABLE_HEAD" align="center">
				备注
			</td>
			<td width="4%" class="TABLE_HEAD" align="center">
				修改此信息
			</td>			
			<td width="4%" class="TABLE_HEAD" align="center">
				删除此信息
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
				<a href="modifyStudent.jsp?sno=<%=rs.getString("sno") %>">修改
				</a>
			</td>		
			<td class="TABLE_COL" align="center">
				<a href="servlet/deleteStudent?sno=<%=rs.getString("sno") %>">删除
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
