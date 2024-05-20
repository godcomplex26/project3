<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "appstore.member.BuyDataBean" %>
<%@ page import = "appstore.member.BuyDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%
	String buyer = (String)session.getAttribute("id");
	String dev_id = request.getParameter("dev_id");
	String developer_id = (String)session.getAttribute("developer_id");
%>

<%@ include file="../../../layout/header.jsp"%>
<%@ include file="../../../layout/sidebar.jsp"%>

<%
List<BuyDataBean> buyLists = null;
BuyDataBean buyList = null; 
int count = 0;

BuyDBBean buyProcess = BuyDBBean.getInstance();
count = buyProcess.getListCount();

if(count == 0){
%>
  <h3><b>주문목록</b></h3>
  
  <table> 
    <tr><td>구매목록이 없습니다.</td> </tr>
  </table>
  <a href="../developerMain.jsp"> 관리자 메인으로</a> 
<%
} else {
   buyLists = buyProcess.getBuyList();
%>

<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3">
                    번호
                </th>
                <th scope="col" class="px-6 py-3">
                    구매자ID
                </th>
                <th scope="col" class="px-6 py-3">
                    구매 앱
                </th>
                <th scope="col" class="px-6 py-3">
                    구매 일시
                </th>
                <th scope="col" class="px-6 py-3">
                    결제 계좌
                </th>
				<th scope="col" class="px-6 py-3">
					별점
				</th>
            </tr>
		</thead>
		<tbody>
<%
  for(int i=0;i<buyLists.size();i++) {
    buyList = (BuyDataBean)buyLists.get(i);
      if(buyList.getBuy_dev_id() != null && buyList.getBuy_dev_id().equals(dev_id)) {
%>
	<tr>
		<th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
			<%=buyList.getBuy_id()%>
		</th>
		<td class="px-6 py-4">
			<%=buyList.getBuy_mem_id()%>
		</td>
		<td class="px-6 py-4">
			<%=buyList.getBuy_app_id()%>
		</td>
		<td class="px-6 py-4">
			<%=buyList.getBuy_date()%>
		</td>
		<td class="px-6 py-4">
			<%=buyList.getBuy_bank()%>
		</td>
		<td class="px-6 py-4">
			<%=buyList.getBuy_score()%>
		</td>
	</tr>
<%
		 }
	}
%>
        </tbody>
    </table>
</div>
<%
}
%>
<%@ include file="../../../layout/sidebar_end.jsp"%>
<%@ include file="../../../layout/footer.jsp"%>