<%@ page language="java" pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
	<TITLE>登录页面</TITLE>
		<LINK HREF="css.css" REL="stylesheet" TYPE="text/css">
	    <STYLE TYPE="text/css">
<!--
.STYLE3 {
	font-size: x-large;
	font-family: "宋体";
	color: #000000;
	font-weight: bold;
}
-->
        </STYLE>
</HEAD>
	<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0
		MARGINHEIGHT=0>
		<P>

		</P>
		<P>&nbsp;</P>
		<P>&nbsp;</P>
		<TABLE WIDTH="800" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER">
          <TR>
            <TD HEIGHT="46" ALIGN="CENTER" VALIGN="MIDDLE" ><SPAN CLASS="STYLE3">驾校学员管理系统</SPAN></TD>
          </TR>
        </TABLE>
        <form name="login" method="post" action="servlet/userLogin">
	    	<TABLE WIDTH=619 BORDER=0 ALIGN="center" CELLPADDING=0 CELLSPACING=0>		
			<TR>
				<TD HEIGHT="142" ALIGN="CENTER" VALIGN="MIDDLE" ><TABLE WIDTH="49%">
                  
                    <tr>
					<td class="g12" width="50%" height=40 align="right">
						<font size=2>用户名</font>
					</td>
					<td height="30">
						&nbsp;
						<input name="username" type="text" size="15">
					</td>

					</tr>
					<tr>
					<td class="g12" width="50%" height=40 align="right">
						<font size=2>密&nbsp;&nbsp;码</font>
					</td>
					<td height="30" align="left">
						&nbsp;
						<input name="password" type="password" size="15">
					</td>
					</tr>
					
                    <P>
                    <tr CLASS="COL_A">
                      <td WIDTH="8%" CLASS="TABLE_HEAD" ALIGN="center" ></td>
                      <td WIDTH="15%" ALIGN="LEFT" VALIGN="MIDDLE" CLASS="TABLE_COL" >
                      	  <INPUT TYPE="submit" NAME="Submit" VALUE="登录">
                          <INPUT TYPE="reset" NAME="reste" VALUE="重置">
                      </td>
                    </tr>
                  
                
                </TD>
			</TR>
			</TABLE>
           </form>
		
		<!-- End ImageReady Slices -->
	</BODY>
</HTML>
