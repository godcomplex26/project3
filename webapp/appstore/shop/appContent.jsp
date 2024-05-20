<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.developer.ApplicationDBBean"%>
<%@ page import="appstore.developer.ApplicationDataBean"%>
<%@ page import="java.text.NumberFormat"%>

<%@ include file="../../layout/header.jsp"%>
<%@ include file="../../layout/sidebar_shop.jsp"%>

<%
String app_category = request.getParameter("app_category");
int app_id = Integer.parseInt(request.getParameter("app_id"));
String app_name = request.getParameter("app_name");
String id = "";
int buy_price = 0;
try {
	if (session.getAttribute("mem_id") == null)
		id = "not";
	else
		id = (String) session.getAttribute("mem_id");
} catch (Exception e) {
}
%>
	<%
	ApplicationDataBean appList = null;
	String app_categoryName = "";

	ApplicationDBBean appProcess = ApplicationDBBean.getInstance();

	appList = appProcess.getApp(app_id);

	if (app_category.equals("100"))
		app_categoryName = "사진";
	else if (app_category.equals("200"))
		app_categoryName = "게임";
	else if (app_category.equals("300"))
		app_categoryName = "운동";
	else if (app_category.equals("400"))
		app_categoryName = "요리";
	%>

<div class="relative flex w-full p-10">
<div class="max-h-lg rounded-l-lg">
<img src="../developer/images/videoPlace.png" class="min-h-full rounded-l-lg">
</div>

<div class="flex flex-col justify-end w-full max-w-sm max-h-lg bg-white border border-gray-200 rounded-r-lg shadow dark:bg-gray-800 dark:border-gray-700">
<form name="inform" method="post" action="../member/orderedAppMem/buyForm.jsp">
<input type="hidden" name="app_name" value="<%=appList.getApp_name() %>">
<input type="hidden" name="app_id" value="<%=app_id %>">
<input type="hidden" name="app_price" value="<%=appList.getApp_price()%>">
    <a href="#">
		<img class="p-8 rounded-t-lg" src="../../imageFile/<%=appList.getApp_iconURL()%>" alt="product image" />
		
		<%-- <iframe class="w-full h-[30%] pb-5 rounded-t-lg" src="https://www.youtube.com/embed/Lj7ifGu00kc" frameborder="0" autoplay allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"></iframe> --%>
    </a>
    <div class="px-5 pb-5">
        <a href="#">
            <h5 class="mb-3 text-xl font-semibold tracking-tight text-gray-900 dark:text-white"><%=appList.getApp_name()%></h5>
			<p class="mb-3 text-sm font-semibold tracking-tight text-gray-900 dark:text-white">개발자 : <%=appList.getApp_dev_id()%></p>
			<p class="mb-3 text-sm font-semibold tracking-tight text-gray-900 dark:text-white">출시일 : <%=appList.getApp_rel_date()%></p>
        </a>
        <div class="flex items-center mt-2.5 mb-5">
            <div class="flex items-center space-x-1 rtl:space-x-reverse">
                <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                    <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                </svg>
                <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                    <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                </svg>
                <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                    <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                </svg>
                <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                    <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                </svg>
                <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                    <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                </svg>
            </div>
            <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">5.0</span>
        </div>
        <div class="flex items-center justify-between">
            <span class="text-3xl font-bold text-gray-900 dark:text-white"><%=NumberFormat.getInstance().format(appList.getApp_price())%>원</span>
            <button type="submit" class="text-white bg-green-700 hover:bg-green-800 focus:outline-none focus:ring-4 focus:ring-green-300 font-medium rounded-full text-sm px-5 py-2.5 text-center me-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">구매하기</button>
        </div>
    </div>
</form>
</div>

</div>

<%@ include file="../../layout/sidebar_shop_end.jsp"%>
<%@ include file="../../layout/footer.jsp"%>