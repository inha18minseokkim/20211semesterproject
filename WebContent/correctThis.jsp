<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="myBean.*" %>
<%
request.setCharacterEncoding("utf-8");
ElementDB edb = new ElementDB();
int idx = Integer.parseInt(request.getParameter("idx"));
DataContainer dc = edb.getElement(idx);
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="submitcss.css">
        <title>동영상 수정</title>
    </head>
    <body>
        <div id = "mainframe">
            <form method = "post" action = "correctVideo.jsp" enctype="multipart/form-data">
                <div id="linkdata">
                	<input type="hidden" name="idx" value="<%=idx%>">
                    <label for = "videolink">비디오 업로드 : </label><input type="file" id="videolink" name="videolink">
                    <br>
                    <label for = "thumbnaillink">썸네일 링크 : </label><input type="file" id="thumbnaillink" name="thumbnaillink">
                    <br>
                    <label for = "author">작성자 : </label><input type="text" id="author" name="author" value="<%=dc.getAuthor()%>">
                    <br>
                    <label for = "title">제목 : </label><input type="text" id="title" name="title" value="<%=dc.getTitle()%>">
                    <br>
                    <label for = "detail">세부내용 : </label><br><textarea cols="50" rows="10" id="detail" name= "detail"><%=(dc.getDetail()==null)?"":dc.getDetail()%></textarea>
                </div>
                <input type="submit" value="저장">
        </form>
        </div>
    </body>
</html>
<%
edb.close();
%>