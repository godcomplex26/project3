<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.member.BuyDataBean"%>
<%@ page import="appstore.member.BuyDBBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.NumberFormat"%>

<%@ include file="../../../layout/header.jsp"%>
<%@ include file="../../../layout/sidebar_shop.jsp"%>

<%@ include file="../../etc/starScore.jspf"%>

<%
String buyer = (String) session.getAttribute("mem_id");
%>
	<%
	List<BuyDataBean> buyLists = null;
	BuyDataBean buyList = null;
	int count = 0;
	int number = 0;
	int total = 0;
	long compareId = 0;
	long preId = 0;

	if (session.getAttribute("mem_id") == null) {
		response.sendRedirect("../../shop/shopMain.jsp");
	} else {
		BuyDBBean buyProcess = BuyDBBean.getInstance();
		count = buyProcess.getListCount(buyer);

		if (count == 0) {
	%>
	<section class="bg-white dark:bg-gray-900">
		<div class="py-8 px-4 mx-auto max-w-screen-xl lg:py-16 lg:px-6">
			<div class="mx-auto max-w-screen-sm text-center">
				<p class="mb-4 text-3xl tracking-tight font-bold text-gray-900 md:text-4xl dark:text-white">구매 목록이 없습니다.</p>
			</div>   
		</div>
	</section>
	
	<%
	} else {
	buyLists = buyProcess.getBuyList(buyer);
	%>

<div class="relative overflow-x-auto sm:rounded-lg p-6">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">번호</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">구매자 ID</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">앱 ID</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">앱 이름</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">구매 일시</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">결제 계좌</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">별점</th>
                <th scope="col" class="px-6 py-3 min-w-20 text-center">별점 주기</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < buyLists.size(); i++) {
					buyList = buyLists.get(i);

					if (i < buyLists.size() - 1) {
						BuyDataBean compare = buyLists.get(i + 1);
						compareId = compare.getBuy_id();

						BuyDataBean pre = buyLists.get(buyLists.size() - 2);
						preId = pre.getBuy_id();
					} %>

		<tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
			<td class="px-6 py-4 text-center"><%=buyList.getBuy_id()%></td>
			<td class="px-6 py-4 text-center"><%=buyList.getBuy_mem_id()%></td>
			<td class="px-6 py-4 text-center"><%=buyList.getBuy_app_id()%></td>
			<td class="px-6 py-4 text-center"><%=buyList.getBuy_app_name()%></td>
			<td class="px-6 py-4 text-center"><%=buyList.getBuy_date()%></td>
			<td class="px-6 py-4 text-center"><%=buyList.getBuy_bank()%></td>
			<td class="px-6 py-4 text-center"><%=buyList.getBuy_score()%></td>
			<td class="px-6 py-4 text-center">
			<form action="updateScorePro.jsp" method="post">
			    <input type="hidden" name="buy_id" value="<%=buyList.getBuy_id()%>">
			    <input type="hidden" class="buy_score_input" name="buy_score" value="0">
			    <div class="star-rating" data-buy_id="<%=buyList.getBuy_id()%>">
			        <% for (int j = 1; j <= 5; j++) { %>
			            <span class="star" data-value="<%=j%>">&#9733;</span>
			        <% } %>
			    </div>
			    <div style="display: inline-block; background: linear-gradient(to right, #ff7e5f, #feb47b); border-radius: 12px; padding: 6px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
			        <input type="submit" value="별점주기" style="color: #fff; background: linear-gradient(to right, #ff7e5f, #feb47b); border: none; padding: 8px 16px; border-radius: 10px; cursor: pointer; font-weight: bold;">
			    </div>
			</form>
			</td>
		<%
			}
		}
	}
		%>
        </tbody>
    </table>
</div>

<%@ include file="../../../layout/sidebar_shop_end.jsp"%>
<%@ include file="../../../layout/footer.jsp"%>