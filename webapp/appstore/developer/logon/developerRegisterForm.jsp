<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../../layout/header.jsp"%>

<section class="bg-gray-50 dark:bg-gray-900">
    <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0 bg-gradient-to-r from-indigo-500 from-10% via-sky-500 via-30% to-emerald-500 to-90%">
        <a href="#" class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
            <img class="w-8 h-8 mr-2" src="../images/OpenAppStore_Icon1024.png" alt="logo">
            Open AppStore    
        </a>
        <div class="w-full bg-gray-50 shadow-xl rounded-lg dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                    개발자 회원가입
                </h1>
				<form  class="space-y-4 md:space-y-6" method="post" name="writeform" action="developerRegisterPro.jsp">
                    <div>
                        <label for="dev_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">아이디</label>
                        <input type="text" name="dev_id" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="아이디를 입력하세요." required>
                    </div>
					<div>
                        <label for="dev_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">이름</label>
                        <input type="text" name="dev_name" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="이름을 입력하세요." required>
                    </div>
                    <div>
                        <label for="dev_pw" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">비밀번호</label>
                        <input type="password" name="dev_pw" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                    </div>
                    <div class="flex items-center justify-between">
                    </div>
                    <button type="submit" class="w-full text-white bg-blue-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">가입하기</button>
                </form>
                <p class="text-sm font-light text-gray-500 dark:text-gray-400 text-right">
                    이미 가입 하셨나요? <a href="developerLoginForm.jsp" class="font-medium hover:underline dark:text-primary-500 pl-3">로그인 하러가기</a>
                </p>
                <p class="text-sm font-light text-gray-500 dark:text-gray-400 text-right">
                    또는 <a href="../../member/logon/memRegisterForm.jsp" class="font-medium hover:underline dark:text-primary-500 pl-3">일반 회원가입</a>
                </p>
                
            </div>
        </div>
    </div>
</section>

<%@ include file="../../../layout/footer.jsp"%>