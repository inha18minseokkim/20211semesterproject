<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%@page import="myBean.*" %>
<%
request.setCharacterEncoding("utf-8");
ServletContext context = getServletContext();
String videoFolder = context.getRealPath("video");
MultipartRequest multi = new MultipartRequest(request,videoFolder,1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
int idx = Integer.parseInt(multi.getParameter("idx"));
String videolink = multi.getFilesystemName("videolink");
String thumbnaillink = multi.getFilesystemName("thumbnaillink");
String author = multi.getParameter("author");
String title = multi.getParameter("title");
String detail = multi.getParameter("detail");
System.out.println("*******************************\n" + author + title);
ElementDB edb = new ElementDB();
DataContainer dc = edb.getElement(idx);

if(!(videolink == null || videolink.isEmpty())){
//비디오 바뀌면 파일 지워야됨
	File videoFile = new File(videoFolder + "\\" + dc.getVideolink());
	videoFile.delete();
	dc.setVideolink(videolink);
	System.out.println("비디오파일 수정 완료" + videolink);
} 
if(!(thumbnaillink == null || thumbnaillink.isEmpty())){
	//썸네일 바뀌면 파일 지워야됨
	File thumbnailFile = new File(videoFolder + "\\" + dc.getThumbnaillink());
	thumbnailFile.delete();
	dc.setThumbnaillink(thumbnaillink);
	System.out.println("썸네일파일 수정 완료" + thumbnaillink);
}
dc.setAuthor(author);
dc.setTitle(title);
dc.setDetail(detail);
System.out.println("*******************************\n" + dc.getAuthor() + dc.getTitle());
System.out.println("*******************************\n" + dc.getVideolink() + dc.getThumbnaillink());
edb.modifyElement(dc);
%>
<script>
	opener.location.reload();
	window.close();
</script>