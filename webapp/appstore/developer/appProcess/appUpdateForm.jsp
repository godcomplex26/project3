<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="appstore.developer.ApplicationDBBean"%>
<%@ page import="appstore.developer.ApplicationDataBean"%>

<%
String developer_id = "";
try {
	developer_id = (String) session.getAttribute("developer_id");
	if (developer_id == null || developer_id.equals("")) {
		response.sendRedirect("../logon/developerLoginForm.jsp");
	} else {
%>
<%
int app_id = Integer.parseInt(request.getParameter("app_id"));
String app_category = request.getParameter("app_category");
try {
	ApplicationDBBean appProcess = ApplicationDBBean.getInstance();
	ApplicationDataBean app = appProcess.getApp(app_id);
%>

<%@ include file="../../../layout/header.jsp" %>
<%@ include file="../../../layout/sidebar.jsp" %>
<form class="max-w-sm mx-auto" action="appUpdatePro.jsp" enctype="multipart/form-data" method="post">
	<label for="countries" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">분류 선택</label>
	<select id="countries" name="app_category" class="mb-5 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
		<option selected value="100">사진</option>
		<option value="200">게임</option>
		<option value="300">운동</option>
		<option value="400">요리</option>
	</select>
	<div class="mb-5">
		<label for="app_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">앱 이름</label>
		<input type="hidden" value="<%=app_id%>" name="app_id">
		<input type="hidden" value="<%=app.getApp_dlcount()%>" name="app_dlcount">
		<input type="text" value="<%=app.getApp_name()%>" name="app_name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
	</div>
	<div class="mb-5">
		<label for="app_price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">가격</label>
		<input type="text" value="<%=app.getApp_price()%>" name="app_price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="원">
	</div>
	<div class="mb-5">
		<label for="app_dev_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">아이디</label>
        <input value="<%=developer_id%>" type="text" name ="app_dev_id" readonly class="text-gray-400 mb-6 bg-gray-100 border border-gray-300 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 cursor-not-allowed dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-gray-400 dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="ID를 입력하세요." required>
	</div>
	<div class="mb-5">
		<label for="app_iconURL" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">아이콘</label>
		<input type="file" value="<%=app.getApp_iconURL()%>" name="app_iconURL" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400">
	</div>
	<div class="mb-5">
		<label for="app_descURL" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">설명</label>
		<input type="text" value="<%=app.getApp_descURL()%>" name="app_descURL" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
	</div>
	<div class="mb-5">
		<label for="app_dlURL" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">다운로드 링크</label>
		<input type="text" value="<%=app.getApp_dlURL()%>" name="app_dlURL" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
	</div>
	<div class="mb-5">
		<label for="app_dlURL" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">출시일</label>
		<input type="date" value="<%=app.getApp_rel_date()%>" name="app_rel_date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
	</div>
	<div class="mb-5">
		<label for="app_update" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">업데이트일</label>
		<input type="date" value="<%=app.getApp_update()%>" name="app_update" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
	</div>
	<div class="mb-5">
		<label for="app_ver" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">버전</label>
		<input type="text" value="<%=app.getApp_ver()%>" name="app_ver" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
	</div>
	<button type="submit" class="w-full inline-flex items-center justify-center p-0.5 mb-6 me-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-green-400 to-blue-600 group-hover:from-green-400 group-hover:to-blue-600 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-green-200 dark:focus:ring-green-800">
		<span class="w-full px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">앱 수정</span>
	</button>
	<button type="reset" class="w-full text-gray-900 hover:text-white border border-gray-800 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 dark:border-gray-600 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-800">다시 작성</button>
		
</form>

	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
<%@ include file="../../../layout/sidebar_end.jsp" %>
<%@ include file="../../../layout/footer.jsp" %>
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>