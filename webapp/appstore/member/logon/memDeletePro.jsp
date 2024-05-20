<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.member.CustomerDBBean"%>

<%
request.setCharacterEncoding("utf-8");
%>

<%
String mem_id = request.getParameter("mem_id");
String mem_pw = request.getParameter("mem_pw");

CustomerDBBean mem = CustomerDBBean.getInstance();
int check = mem.deleteMember(mem_id, mem_pw);

if (check == 1) {
%>
	<script>
		alert("회원탈퇴가 완료되었습니다.");
		location.href = "memLogout.jsp";
	</script>
<%
} else if (check == 0) {
%>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
} else if (check == -1) {
%>
	<script>
	alert("check 설정이 안되고있음");
	</script>
<%
}
%>