<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.developer.ApplicationDBBean"%>
<%@ page import="appstore.developer.ApplicationDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>


<%
String developer_id = "";
try {
	developer_id = (String) session.getAttribute("developer_id");
	if (developer_id == null || developer_id.equals("")) {
		response.sendRedirect("../logon/developerLoginForm.jsp");
	} else {
%>

<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<%
List<ApplicationDataBean> appList = null;
int number = 0;
String app_category = "";

app_category = request.getParameter("app_category");

ApplicationDBBean appProcess = ApplicationDBBean.getInstance();
int count = appProcess.getAppCount(developer_id);

if (count > 0) {
	appList = appProcess.getApps(app_category);
}
%>

<%
String app_categoryName = "";
if (app_category.equals("100")) {
    app_categoryName = "사진";
} else if (app_category.equals("200")) {
    app_categoryName = "게임";
} else if (app_category.equals("300")) {
    app_categoryName = "운동";
} else if (app_category.equals("400")) {
    app_categoryName = "요리";		
} else if (app_category.equals("all")) {
    app_categoryName = "전체";
}
%>

<%@ include file="../../../layout/header.jsp" %>
<%@ include file="../../../layout/sidebar.jsp" %>

<div class="relative overflow-x-auto sm:rounded-lg p-6">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">번호</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">앱 분류</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">앱 이름</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">가격</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">개발자</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">출시일</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">업데이트일</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">버전</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">다운로드횟수</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">수정</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">삭제</th>
            </tr>
        </thead>
        <tbody>
            <%
		for (int i = 0; i < appList.size(); i++) {
			ApplicationDataBean app = (ApplicationDataBean) appList.get(i);
			if (app.getApp_dev_id().equals(developer_id)) {
		%>
		<tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
			<td class="px-6 py-4 text-center"><%=++number%></td>
			<td class="px-6 py-4 text-center"><%=app.getApp_category()%></td>
			<td class="px-6 py-4 text-center"><%=app.getApp_name()%></td>
			<td class="px-6 py-4 text-center"><%=app.getApp_price()%></td>
			<td class="px-6 py-4 text-center"><%=app.getApp_dev_id()%></td>
			<td class="px-6 py-4 text-center"><%=app.getApp_rel_date()%></td>
			<td class="px-6 py-4 text-center"><%=app.getApp_update()%></td>
			<td class="px-6 py-4 text-center"><%=app.getApp_ver()%></td>
			<td class="px-6 py-4 text-center"><%=app.getApp_dlcount()%></td>
			<td class="px-6 py-4 text-center"><a href="appUpdateForm.jsp?app_id=<%=app.getApp_id()%>&app_category=<%=app.getApp_category()%>">수정</a></td>
			<td class="px-6 py-4 text-center"><a href="appDeletePro.jsp?app_id=<%=app.getApp_id()%>&app_category=<%=app.getApp_category()%>" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
		</tr>
		<%
			}
		}
		%>
        </tbody>
    </table>
    <nav class="flex items-center flex-column flex-wrap md:flex-row justify-between pt-4" aria-label="Table navigation">
        <span class="text-sm font-normal text-gray-500 dark:text-gray-400 mb-4 md:mb-0 block w-full md:inline md:w-auto">Showing <span class="font-semibold text-gray-900 dark:text-white">1-10</span> of <span class="font-semibold text-gray-900 dark:text-white">
        <%
        if (app_category.equals("all")) {
        %>
        <%=count%>
        <%
        } else {
        %>
        <%=appList.size()%>
        <%
        }
        %>
        </span></span>
        <ul class="inline-flex -space-x-px rtl:space-x-reverse text-sm h-8">
            <li>
                <a href="#" class="flex items-center justify-center px-3 h-8 ms-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-s-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Previous</a>
            </li>
            <li>
                <a href="#" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">1</a>
            </li>
            <li>
                <a href="#" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">2</a>
            </li>
            <li>
                <a href="#" aria-current="page" class="flex items-center justify-center px-3 h-8 text-blue-600 border border-gray-300 bg-blue-50 hover:bg-blue-100 hover:text-blue-700 dark:border-gray-700 dark:bg-gray-700 dark:text-white">3</a>
            </li>
            <li>
                <a href="#" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">4</a>
            </li>
            <li>
                <a href="#" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">5</a>
            </li>
            <li>
        <a href="#" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 rounded-e-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Next</a>
            </li>
        </ul>
    </nav>
</div>
	
<%@ include file="../../../layout/footer.jsp" %>
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>