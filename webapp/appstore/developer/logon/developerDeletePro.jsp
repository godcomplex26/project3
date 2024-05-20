<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.developer.DeveloperDBBean"%>

<%
request.setCharacterEncoding("utf-8");
%>

<%
String dev_id = request.getParameter("dev_id");
String dev_pw = request.getParameter("dev_pw");

DeveloperDBBean dev = DeveloperDBBean.getInstance();
int check = dev.deleteDeveloper(dev_id, dev_pw);

if (check == 1) {
%>
	<script>
		alert("회원탈퇴가 완료되었습니다.");
		location.href = "developerLogout.jsp";
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