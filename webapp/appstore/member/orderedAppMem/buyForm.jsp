<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="appstore.member.CustomerDataBean"%>
<%@ page import="appstore.member.CustomerDBBean"%>
<%@ page import="appstore.member.BuyDBBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.NumberFormat"%>

<% request.setCharacterEncoding("utf-8");%>

<%
   String app_category = request.getParameter("app_category");
   String buy_app_id = request.getParameter("app_id");
   String buy_app_name = request.getParameter("app_name");
   String buy_price = request.getParameter("app_price");
   String buyer = (String)session.getAttribute("mem_id");
%>

<jsp:useBean id="buy" scope="page"
           class="appstore.member.BuyDataBean">
</jsp:useBean>

<%
  buy.setBuy_app_id(Integer.parseInt(buy_app_id));
  buy.setBuy_app_name(buy_app_name);
  buy.setBuy_price(Integer.parseInt(buy_price));
  buy.setBuy_mem_id(buyer);
%>
<%@ include file="../../../layout/header.jsp"%>
<%@ include file="../../../layout/sidebar_shop.jsp"%>
  	<%
  	List<String> accountLists = null;
  	CustomerDataBean member = null;

  	if (session.getAttribute("mem_id") == null) {
  	%>
  	<script>
  	alert("로그인이 필요합니다.");
  	history.go(-1);
  	</script>
  	<%
  	} else {
  		CustomerDBBean memberProcess = CustomerDBBean.getInstance();
  		member = memberProcess.getMember(buyer);

  		BuyDBBean buyProcess = BuyDBBean.getInstance();
  		accountLists = buyProcess.getAccount();
  	%>
  		

<section class="bg-gray-200 dark:bg-gray-900">
    <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
        <div class="w-full bg-gray-50 shadow-xl rounded-lg dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                    <%=buy_app_name%> 구매하기
                </h1>
				<form class="p-4 md:p-5" action="buyPro.jsp" name="buyinput">
				<input type="hidden" name="buy_app_id" value="<%=buy_app_id%>">
  				<input type="hidden" name="buy_app_name" value="<%=buy_app_name%>">
				<div class="grid gap-4 mb-4 grid-cols-2">
                    <div class="col-span-2">
                        <label for="buy_mem_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">아이디</label>
                        <input type="text" value="<%=member.getMem_id()%>" name="buy_mem_id" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Type product name" required="">
                    </div>
                    <div class="col-span-2 sm:col-span-2">
                        <label for="buy_mem_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이름</label>
                        <input type="text" value="<%=member.getMem_name()%>" name="buy_mem_name" id="price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="$2999" required="">
                    </div>
					<div class="col-span-2 sm:col-span-2">
                        <label for="buy_mem_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">전화번호</label>
                        <input type="text" value="<%=member.getMem_tel()%>" name="buy_mem_tel" id="price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="$2999" required="">
                    </div>
                    <div class="col-span-2 sm:col-span-2">
                        <label for="category" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">결제은행</label>
						<select name="buy_bank" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
							<%
							for (int i = 0; i < accountLists.size(); i++) {
								String accountList = accountLists.get(i);
							%>
							<option value="<%=accountList%>"><%=accountList%></option>
							<%
							}
							%>
  						</select>
                    </div>
                </div>
                    
                    <button type="submit" class="mt-5 w-full text-white bg-blue-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">구매하기</button>
                </form>
            </div>
        </div>
    </div>
</section>



  	<%
  	} 
   	%>
<%@ include file="../../../layout/sidebar_shop_end.jsp"%>
<%@ include file="../../../layout/footer.jsp"%>
