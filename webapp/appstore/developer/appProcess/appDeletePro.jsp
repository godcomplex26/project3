<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "appstore.developer.ApplicationDBBean" %>

<%
request.setCharacterEncoding("utf-8");
%>

<%
int app_id = Integer.parseInt(request.getParameter("app_id"));
  String app_category = request.getParameter("app_category");

  ApplicationDBBean appProcess = ApplicationDBBean.getInstance();
  appProcess.deleteApp(app_id); 

  response.sendRedirect("appList.jsp?app_category="+app_category);
%>