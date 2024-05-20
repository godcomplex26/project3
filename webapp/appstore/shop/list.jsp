<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.developer.ApplicationDBBean"%>
<%@ page import="appstore.developer.ApplicationDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.NumberFormat"%>

<%@ include file="../../layout/header.jsp"%>
<%@ include file="../../layout/sidebar_shop.jsp"%>

<%
String app_category = request.getParameter("app_category");
%>

	<table>
		<tr>
				<%
					List<ApplicationDataBean> appLists = null;
					ApplicationDataBean appList = null;
					String app_categoryName = "";

					ApplicationDBBean appProcess = ApplicationDBBean.getInstance();

					appLists = appProcess.getApps(app_category);
					
					if (app_category.equals("100"))
						app_categoryName = "사진";
					else if (app_category.equals("200"))
						app_categoryName = "게임";
					else if (app_category.equals("300"))
						app_categoryName = "운동";
					else if (app_category.equals("400"))
						app_categoryName = "요리";
					else if (app_category.equals("all"))
						app_categoryName = "전체";
				%>
				<h3 class="text-lg py-6 mb-6 font-semibold text-gray-900 dark:text-white text-center">
					<b><%=app_categoryName%> 분류의 목록</b>
				</h3> <%
 for (int i = 0; i < appLists.size(); i++) {
  	appList = (ApplicationDataBean) appLists.get(i);
 %>
<a href="appContent.jsp?app_id=<%=appList.getApp_id()%>&app_category=<%=appList.getApp_category()%>" class="mx-auto mb-6 flex flex-col items-center bg-white border border-gray-200 rounded-lg shadow md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700">
	<img class="object-cover w-full rounded-t-lg h-96 md:h-auto md:w-48 md:rounded-none md:rounded-s-lg" src="../../imageFile/<%=appList.getApp_iconURL()%>" alt="appThumnail">
	<div class="flex flex-col justify-between p-4 leading-normal">
		<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"><%=appList.getApp_name()%></h5>
		<p class="mb-3 font-normal text-gray-700 dark:text-gray-400">개발자 : <%=appList.getApp_dev_id()%></p>
		<p class="mb-3 font-normal text-gray-700 dark:text-gray-400">출시일 : <%=appList.getApp_rel_date()%></p>
		<p class="mb-3 font-normal text-gray-700 dark:text-gray-400">업데이트일 : <%=appList.getApp_update()%></p>
		<p class="mb-3 font-normal text-gray-700 dark:text-gray-400"><%=appList.getApp_price()%>원</p>
	</div>
</a>
				 <%
 }
 %>
			</td>
		</tr>
	</table>
<%@ include file="../../layout/sidebar_shop_end.jsp"%>
<%@ include file="../../layout/footer.jsp"%>