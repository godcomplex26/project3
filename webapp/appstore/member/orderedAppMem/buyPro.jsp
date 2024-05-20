<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.member.BuyDBBean"%>
<%@ page import="appstore.developer.ApplicationDBBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.Timestamp"%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="buy" scope="page"
	class="appstore.member.BuyDataBean">
</jsp:useBean>

<%
String buy_mem_id = request.getParameter("buy_mem_id");
int buy_app_id = Integer.parseInt(request.getParameter("buy_app_id"));
String buy_bank = request.getParameter("buy_bank");
String buy_app_name = request.getParameter("buy_app_name");

buy.setBuy_mem_id(buy_mem_id);
buy.setBuy_app_id(buy_app_id);
buy.setBuy_bank(buy_bank);
buy.setBuy_app_name(buy_app_name);

BuyDBBean buyProcess = BuyDBBean.getInstance();
buyProcess.insertBuy(buy);

response.sendRedirect("buyList.jsp");
%>