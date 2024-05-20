<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.member.CustomerDBBean"%>

<%
request.setCharacterEncoding("utf-8");
%>

<%
String id = request.getParameter("mem_id");
String pw = request.getParameter("mem_pw");

CustomerDBBean mem = CustomerDBBean.getInstance();
int check = mem.userCheck(id, pw);

if (check == 1) {
	session.setAttribute("mem_id", id);
	response.sendRedirect("../../shop/shopMain.jsp");
} else if (check == 0) {
%>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
} else {
%>
<script>
	alert("아이디가 맞지 않습니다..");
	history.go(-1);
</script>
<%
}
%>