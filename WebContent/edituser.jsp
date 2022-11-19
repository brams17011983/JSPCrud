<%@page import="main.com.javatpoint.dao.UserDao"%>
<jsp:useBean id="u" class="main.com.javatpoint.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=UserDao.update(u);
response.sendRedirect("viewusers.jsp");
%>