<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="appstore.developer.ApplicationDBBean" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%
request.setCharacterEncoding("utf-8");
%>

<%
String realFolder = "";//웹 어플리케이션상의 절대 경로
String filename ="";
MultipartRequest imageUp = null;

String saveFolder = "/imageFile";//파일이 업로드되는 폴더
String encType = "utf-8"; //엔코딩타입
int maxSize = 2*1024*1024;  //최대 업로될 파일크기 5Mb

//현재 jsp페이지의 웹 어플리케이션상의 절대 경로를 구한다
ServletContext context = getServletContext();
realFolder = context.getRealPath(saveFolder);  

try{
   
   //전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
   //전송할 파일명을 가지고 있는 객체, 서버상의 절대경로,최대 업로드될 파일크기, 문자코드, 기본 보안 적용
   imageUp = new MultipartRequest(request,realFolder,
		   maxSize,encType,new DefaultFileRenamePolicy());
   
   //전송한 파일 정보를 가져와 출력한다
   Enumeration<?> files = imageUp.getFileNames();
   
   //파일 정보가 있다면
   while(files.hasMoreElements()){
    //input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
      String name = (String)files.nextElement();
   
   //서버에 저장된 파일 이름
      filename = imageUp.getFilesystemName(name);
   }
} catch (IOException ioe) {
 System.out.println(ioe);
} catch (Exception ex) {
 System.out.println(ex);
}
%>

<jsp:useBean id="app" scope="page" 
     class="appstore.developer.ApplicationDataBean">
</jsp:useBean>

<%
int app_id= Integer.parseInt(imageUp.getParameter("app_id"));
String app_category = imageUp.getParameter("app_category");
String app_name = imageUp.getParameter("app_name");
String app_dev_id = imageUp.getParameter("app_dev_id");
String app_price = imageUp.getParameter("app_price");
String app_descURL = imageUp.getParameter("app_descURL");
String app_dlURL = imageUp.getParameter("app_dlURL");
String app_rel_date = imageUp.getParameter("app_rel_date");
String app_update = imageUp.getParameter("app_update");


String app_ver = imageUp.getParameter("app_ver");
int app_dlcount = Integer.parseInt(imageUp.getParameter("app_dlcount"));

app.setApp_id(app_id);
app.setApp_category(app_category);
app.setApp_name(app_name);
app.setApp_dev_id(app_dev_id);
app.setApp_price(Integer.parseInt(app_price));
app.setApp_iconURL(filename);
app.setApp_descURL(app_descURL);
app.setApp_dlURL(app_dlURL);

app.setApp_rel_date(app_rel_date);
app.setApp_update(app_update);

app.setApp_ver(app_ver);
app.setApp_dlcount(app_dlcount);

ApplicationDBBean appProcess = ApplicationDBBean.getInstance();
appProcess.updateApp(app, app_id);

response.sendRedirect("appList.jsp?app_category=" + app_category);
%>