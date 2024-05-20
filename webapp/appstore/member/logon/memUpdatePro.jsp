<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="appstore.member.CustomerDBBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%
request.setCharacterEncoding("utf-8");
%>    
    
    
<jsp:useBean id="mem" scope="page"
	class="appstore.member.CustomerDataBean">
</jsp:useBean>

<%
String mem_id = request.getParameter("mem_id");
String mem_pw = request.getParameter("mem_pw");
String mem_name = request.getParameter("mem_name");
String mem_tel = request.getParameter("mem_tel");
String mem_model = request.getParameter("mem_model");

mem.setMem_id(mem_id);
mem.setMem_pw(mem_pw);
mem.setMem_name(mem_name);
mem.setMem_tel(mem_tel);
mem.setMem_model(mem_model);

CustomerDBBean memProcess = CustomerDBBean.getInstance();
memProcess.updateMember(mem, mem_id);

%>

<script>
	alert("회원정보수정이 완료되었습니다. 다시 로그인하세요.");
	location.href = "memLoginForm.jsp";
</script>