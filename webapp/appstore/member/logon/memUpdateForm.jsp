<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="appstore.member.CustomerDBBean"%>
<%@ page import="appstore.member.CustomerDataBean"%>

<%@ include file="../../../layout/header.jsp"%>
<%@ include file="../../../layout/sidebar_shop.jsp"%>


<%
request.setCharacterEncoding("utf-8");

String mem_id = request.getParameter("mem_id");

try {
	CustomerDBBean memProcess = CustomerDBBean.getInstance();
	CustomerDataBean mem = memProcess.getMember(mem_id);
%>
<section class="bg-gray-50 dark:bg-gray-900">
    <div class="flex flex-col items-center justify-center px-6 mx-auto md:h-screen lg:py-0">
        <div class="w-full bg-gray-50 shadow-xl rounded-lg dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                    회원 정보 수정
                </h1>
				<form  class="space-y-4 md:space-y-6" method="post" name="writeform" action="memUpdatePro.jsp">
                    <div class="">
                        <label for="mem_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">아이디</label>
                        <input value="<%=mem_id%>" type="text" name ="mem_id" readonly class="text-gray-400 mb-6 bg-gray-100 border border-gray-300 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 cursor-not-allowed dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-gray-400 dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="ID를 입력하세요." required>
                    </div>
					<div>
                        <label for="mem_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이름</label>
                        <input value="<%=mem.getMem_name()%>" type="text" name="mem_name" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="이름을 입력하세요." required>
                    </div>
					<div>
                        <label for="mem_tel" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">전화번호</label>
                        <input value="<%=mem.getMem_tel()%>" type="text" name="mem_tel" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="전화번호를 입력하세요." required>
                    </div>
                    <div>
                        <label for="mem_pw" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호</label>
                        <input value="<%=mem.getMem_pw()%>" type="password" name="mem_pw" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                    </div>
					<div>
                        <label for="mem_model" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">스마트폰 기종</label>
                        <input value="<%=mem.getMem_model()%>" type="text" name="mem_model" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="스마트폰 기종을 입력하세요." required>
                    </div>
                    <div class="flex items-center justify-between">
                    </div>
                    <button type="submit" class="w-full text-white bg-blue-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">회원정보수정</button>
					<button type="reset" class="w-full text-blue-700 hover:text-white border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 dark:border-blue-500 dark:text-blue-500 dark:hover:text-white dark:hover:bg-blue-500 dark:focus:ring-blue-800">다시작성</button>
				</form>
				<br>
				<a href="memDeletePro.jsp?mem_id=<%=mem_id%>&mem_pw=<%=mem.getMem_pw()%>" onclick="return confirm('정말 탈퇴하시겠습니까?');">
				<button type="reset" class="w-full text-red-700 hover:text-white border border-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900">회원탈퇴</button>
            	</a>
            </div>
        </div>
    </div>
</section>

	<%
} catch (Exception e) {
e.printStackTrace();
}
%>


<%@ include file="../../../layout/sidebar_shop_end.jsp"%>
<%@ include file="../../../layout/footer.jsp"%>