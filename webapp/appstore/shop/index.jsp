<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>

		<div class="bg-white">
			<div class="relative isolate px-6 pt-14 lg:px-8">
				<div class="absolute inset-x-0 -top-40 -z-10 transform-gpu overflow-hidden blur-3xl sm:-top-80" aria-hidden="true">
					<div class="relative left-[calc(50%-11rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[deepskyblue] to-[dodgerblue] opacity-30 sm:left-[calc(50%-30rem)] sm:w-[72.1875rem]" style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"></div>
				</div>
			 	<div class="mx-auto max-w-2xl py-32 sm:py-48 lg:py-56">
					<div class="hidden sm:mb-8 sm:flex sm:justify-center">
					<!-- <div class="relative rounded-full px-3 py-1 text-sm leading-6 text-gray-600 ring-1 ring-gray-900/10 hover:ring-gray-900/20">
							혹시 개발자 이신가요? 이곳에서 앱을 배포하시려면 <a href="#" class="font-semibold text-sky-600"><span class="absolute inset-0" aria-hidden="true"></span>이 문서를 참조하세요. <span aria-hidden="true">&rarr;</span></a>
						</div>
					-->
					</div>
					<div class="text-center">
						<h1 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl whitespace-nowrap" style="transform: translate(-8%, 0%);">오픈소스가 스타트업을 구한다</h1>
						<p class="mt-6 text-lg leading-8 text-gray-600">순수 오픈소스로 만들어진 프리웨어 애플리케이션으로 쉽고 간편하고 알잘딱하게 귀사의 첫 사업을 시작하세요.</p>
						<div class="mt-10 flex items-center justify-center gap-x-6">
						
					<% if (session.getAttribute("developer_id") == null) {%>						
							<a href="../developer/logon/developerLoginForm.jsp" class="rounded-md bg-sky-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-sky-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-600">시작하기</a>					
					<%} else {}%>					
					
					<!-- 	<a href="#" class="text-sm font-semibold leading-6 text-gray-900">자세히 알아보기 <span aria-hidden="true">→</span></a> -->
				 		</div>
					</div>
			 	</div>
				<div class="absolute inset-x-0 top-[calc(100%-13rem)] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[calc(100%-30rem)]" aria-hidden="true">
					<div class="relative left-[calc(50%+3rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 bg-gradient-to-tr from-[deepskyblue] to-[dodgerblue] opacity-30 sm:left-[calc(50%+36rem)] sm:w-[72.1875rem]" style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"></div>
				</div>
			</div>
		</div>
<%@ include file="../../layout/footer.jsp" %>