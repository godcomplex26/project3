<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="appstore.member.BuyDBBean"%>
<%@ page import="appstore.member.BuyDataBean"%>

<%
long buy_id = Integer.parseInt(request.getParameter("buy_id"));

try {
	BuyDBBean buyProcess = BuyDBBean.getInstance();
	BuyDataBean buy = buyProcess.getBuy(buy_id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>별점 수정</title>
</head>
<body>
<form method="post" action="updateScorePro.jsp">
	<table>
		<tr>
			<td>별점 주기
				<select name="score">
					<option value="0">0점</option>
					<option value="1">1점</option>
					<option value="2">2점</option>
					<option value="3">3점</option>
					<option value="4">4점</option>
					<option value="5">5점</option>
				</select>
				<input type="hidden" name="buy_id" value="<%=buy.getBuy_id()%>">
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="2" align="center" bgcolor="#b0e0e6"><input
				type="submit" value="확인"> 
				<input type="button" value="취소" onclick="javascript:window.location='buyList.jsp'"></td>
		</tr>
	</table>
</form>

<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>