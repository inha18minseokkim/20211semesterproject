<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.ServletRequest" %>
<%@page import="myBean.*" %>
<%@page import="java.io.*" %>
<%
request.setCharacterEncoding("utf-8");
int idx = Integer.parseInt(request.getParameter("idxdelete"));
ElementDB edb = new ElementDB();
DataContainer dc = edb.getElement(idx);
String targetVideo = dc.getVideolink();
String targetThumbnail = dc.getThumbnaillink();

ServletContext context = getServletContext();
String realFolder = context.getRealPath("video");

File videoFile = new File(realFolder + "\\" + targetVideo);
File thumbnailFile = new File(realFolder + "\\" + targetThumbnail);
videoFile.delete();
thumbnailFile.delete();
edb.deleteElement(idx);
edb.close();
response.sendRedirect("main.jsp");
%>