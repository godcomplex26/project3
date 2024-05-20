<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="appstore.developer.DeveloperDBBean"%>
<%@ page import="appstore.developer.DeveloperDataBean"%>

<%
String dev_id = request.getParameter("dev_id");

try {
	DeveloperDBBean devProcess = DeveloperDBBean.getInstance();
	DeveloperDataBean dev = devProcess.getDeveloper(dev_id);
	String dev_name = dev.getDev_id();
	String dev_pw = dev.getDev_id();
%>

<%@ include file="../../../layout/header.jsp"%>
<%@ include file="../../../layout/sidebar.jsp"%>

<section class="bg-gray-200 dark:bg-gray-900">
    <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
        <div class="w-full bg-gray-50 shadow-xl rounded-lg dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                    회원 정보 수정
                </h1>
				<form  class="space-y-4 md:space-y-6" method="post" name="writeform" action="developerUpdatePro.jsp">
                    <div>
                        <label for="dev_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">아이디</label>
                        <input type="text" name="dev_id" readonly value="<%=dev.getDev_id()%>" class="text-gray-400 mb-6 bg-gray-100 border border-gray-300 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 cursor-not-allowed dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-gray-400 dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="아이디를 입력하세요." required>
                    </div>
					<div>
                        <label for="dev_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이름</label>
                        <input type="text" name="dev_name" value="<%=dev.getDev_name()%>" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="이름을 입력하세요." required>
                    </div>
                    <div>
                        <label for="dev_pw" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호</label>
                        <input type="password" value="<%=dev.getDev_pw()%>" name="dev_pw" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                    </div>
                    <div class="flex items-center justify-between">
                    </div>
                    <button type="submit" class="w-full text-white bg-blue-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">회원정보수정</button>
                </form>
				<div class="p-0 mt-6">
				<a href="developerDeletePro.jsp?dev_id=<%=dev.getDev_id()%>&dev_pw=<%=dev.getDev_pw()%>" onclick="return confirm('정말 탈퇴하시겠습니까?');">
				<button type="reset" class="w-full text-red-700 hover:text-white border border-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900">회원탈퇴</button></a></div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../../../layout/sidebar_end.jsp"%>
<%@ include file="../../../layout/footer.jsp"%>
	<%
} catch (Exception e) {
e.printStackTrace();
}
%>
