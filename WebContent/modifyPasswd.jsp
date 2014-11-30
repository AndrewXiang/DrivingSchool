<%@ page language="java" pageEncoding="GBK"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <html:base />
    
    <title>修改密码</title>
    
    	<script language="javascript" src="javascripts/common.js"></script>
		<link href="styles/common.css" type="text/css" rel="stylesheet" />
		<link href="styles/function.css" type="text/css" rel="stylesheet" />
		<link href="styles/menu.css" type="text/css" rel="stylesheet" />
		<link href="styles/function.css" type="text/css" rel="stylesheet" />
		<link href="styles/index.css" type="text/css" rel="stylesheet" />
		<link href="styles/link.css" type="text/css" rel="stylesheet" />
		<link href="styles/main.css" type="text/css" rel="stylesheet" />
		<script language="javascript">refTitle("欢迎使用本系统");</script>
		<style type="text/css">
		
<!--
.style1 {font-size: 12pt}
-->
</style>
	</HEAD>

	<BODY>
		<center>
			<h3>修改密码</h3>
		</center>
		<center>
		<form name="modifyPasswd" method="post" action="servlet/modifyPasswd">
			<table width="50%" border="o.2" cellpadding="0" cellspacing="0">
				
					<tr class="COL_A">
						<td width="22%" class="TABLE_HEAD" align="center" >
							用户名
						</td>
						<td class="TABLE_COL" align="left" >
							<input type="text" name="username" value="<%=request.getSession().getAttribute("username")%>" readonly="true" size="20">													
						</td>

					</tr>
				
			
					
					<tr class="COL_A">
						<td width="22%" class="TABLE_HEAD" align="center">
							旧密码
						</td>
						<td class="TABLE_COL" align="left">
							<input type="password" name="oldPassword" size="20">${OK }
						</td>
					</tr>
					<tr class="COL_A">
						<td width="22%" class="TABLE_HEAD" align="center">
							新密码
						</td>
						<td class="TABLE_COL" align="left">
							<input type="password"  name="newPassword1" size="20">${NOK}						
						</td>
					</tr>
					<tr class="COL_A">
						<td width="22%" class="TABLE_HEAD" align="center">
							确认新密码
						</td>
						<td class="TABLE_COL" align="left">
							<input type="password"  name="newPassword2" size="20">
						</td>
							
							<tr class="COL_A">
						<td width="22%" class="TABLE_HEAD" align="center">
							修改提交
						</td>
						<td class="TABLE_COL" align="left">
							<input type="submit" name="Submit" value="提交">
							<input type="reset" name="reste" value="重置">	
						</td>
							
			</table>				
							
		</form>
						
	
					
					
  </body>
</html>
