<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.sql.*" %>
<%@page import="myBean.*" %>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%@page import="java.io.*" %>
<%@page import="java.time.*, java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
ServletContext context = getServletContext();
String videoFolder = context.getRealPath("video");

MultipartRequest multi = new MultipartRequest(request,videoFolder,1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
//파일 업로드 나중에 구현
String videolink = multi.getFilesystemName("videolink");
//썸네일 업로드 나중에 구현
String thumbnaillink = multi.getFilesystemName("thumbnaillink");
if(thumbnaillink == null){//업로드를안하면 null리턴한다고 했음
	thumbnaillink = ConvertThumbnail.convert(videolink, videoFolder);
}
String author = multi.getParameter("author");
String title = multi.getParameter("title");
String detail = multi.getParameter("detail");
ZonedDateTime nowDate = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
String time = nowDate.format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss z"));
System.out.println(time);
ElementDB edb = new ElementDB();
DataContainer dc = new DataContainer();
dc.setVideolink(videolink);
dc.setThumbnaillink(thumbnaillink);
dc.setAuthor(author);
dc.setTitle(title);
dc.setTime(time);
dc.setDetail(detail);
edb.createElement(dc);
edb.close();
%>
<script>
	opener.location.reload();
	window.close();
</script>