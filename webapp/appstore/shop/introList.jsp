<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.developer.ApplicationDBBean"%>
<%@ page import="appstore.developer.ApplicationDataBean"%>
<%@ page import="java.text.NumberFormat"%>

<div class="flex-col">
	<h1 class="text-xl py-5 mb-6 font-semibold text-gray-900 dark:text-white text-center">신작 소개</h1>
	<%

		ApplicationDataBean appLists[] = null;
			int number = 0;
			String app_categoryName = "";

			ApplicationDBBean appProcess = ApplicationDBBean.getInstance();
			for (int i = 1; i <= 4; i++) { // 2개까지만 보여주는 코드

		appLists = appProcess.getApps(i + "00", 2);

		if (appLists[0].getApp_category().equals("100")) {
			app_categoryName = "사진";
		} else if (appLists[0].getApp_category().equals("200")) {
			app_categoryName = "게임";
		} else if (appLists[0].getApp_category().equals("300")) {
			app_categoryName = "운동";
		} else if (appLists[0].getApp_category().equals("400")) {
			app_categoryName = "요리";
		}
	%>
	<h3 class="text-lg mb-6 font-semibold text-gray-900 dark:text-white text-center">
	<%=app_categoryName%> 분류의 신작목록: <a
			href="list.jsp?app_category=<%=appLists[0].getApp_category()%>">더보기</a>
	</h3>
	<%
	for (int j = 0; j < appLists.length; j++) {
		if (appLists[j] != null) {
	%>

		<a href="appContent.jsp?app_id=<%=appLists[j].getApp_id()%>&app_category=<%=appLists[0].getApp_category()%>" class="mx-auto mb-6 flex flex-col items-center bg-white border border-gray-200 rounded-lg shadow md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700">
			<img class="object-cover w-full rounded-t-lg h-96 md:h-auto md:w-48 md:rounded-none md:rounded-s-lg" src="../../imageFile/<%=appLists[j].getApp_iconURL()%>" alt="appThumnail">
			<div class="flex flex-col justify-between p-4 leading-normal">
				<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"><%=appLists[j].getApp_name()%></h5>
				<p class="mb-3 font-normal text-gray-700 dark:text-gray-400">개발자 : <%=appLists[j].getApp_dev_id()%></p>
				<p class="mb-3 font-normal text-gray-700 dark:text-gray-400">가격 : <%=appLists[j].getApp_price()%>원</p>
			</div>
		</a>
	<%
		}
	}
}
	%>

	</div>