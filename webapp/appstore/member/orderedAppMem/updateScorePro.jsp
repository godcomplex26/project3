<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="appstore.member.BuyDBBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%
request.setCharacterEncoding("utf-8");
%>    
    
    
<jsp:useBean id="buy" scope="page"
	class="appstore.member.BuyDataBean">
</jsp:useBean>

<%
long buy_id = Long.parseLong(request.getParameter("buy_id"));
int buy_score = Integer.parseInt(request.getParameter("buy_score"));

buy.setBuy_score(buy_score);

BuyDBBean buyProcess = BuyDBBean.getInstance();
buyProcess.setBuyScore(buy, buy_id);

response.sendRedirect("buyList.jsp");
%>