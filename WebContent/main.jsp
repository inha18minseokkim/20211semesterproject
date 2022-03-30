
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.*" %>
<%@page import="myBean.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String url = "jdbc:mariadb://localhost:3306/movieboard?useSSL=false";
request.setCharacterEncoding("utf-8");
String search = request.getParameter("searchline");

Class.forName("org.mariadb.jdbc.Driver");
Connection con = DriverManager.getConnection(url,"admin","1234");
String sql = sql = "SELECT * from Element WHERE title LIKE '%" + search + "%'";
PreparedStatement pstmt = con.prepareStatement(sql);
if(search != null){ //검색 안썼으면 searchline이름으로된 리퀘스트가 안왔으니깐 정상적으로 뿌리면 되는데, 검색리퀘스트가 왔으면 sql문을 조정해서 걸러서 뿌려줄 예정
	//pstmt.setString(1, search);
} else {
	pstmt.close();
	pstmt = con.prepareStatement("SELECT * from Element");
}

ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="maincss.css">
    </head>
    <script src="mainFunction.js"></script>
    <body>
        <div id="bar">
            <a href="main.jsp"><p id="title" href="main.jsp">무야호</p></a>
            <form id="search"><input type="text" name = "searchline" id="searchline"><input type="submit" id="searchbtn" value="검색"></form>
        </div>
        <div id="left">
        </div>
        <div id="right" style="display:none">
            <video controls id ="videoplayer" src= "" >불러오기 실패</video>
            <div id="videoinfo" style="overflow:scroll"></div>
            <form id = "correctbutton" style="display:inline-block;">
            	<input type="hidden" id="idxcorrect" name="idxcorrect" style="display:inline-block" value="">
            </form>
            
        </div>
        <div id="bottom">
        	<input type="button" id="hidebar" value="바 감추기" onclick="Bar();">
           	<input type="button" id="nuevo" value = "추가" onclick="newVideoPopup();">
           	<input type="button" value="수정" id="corregir" style="display:inline-block; float:right;" onclick="alert('선택해주세요')">
           	<form method="get" action="deleteThis.jsp" id = "deletebutton" onsubmit="return chkDel()" style="display:inline-block;float:right;">
            	<input type="submit" value="삭제" id="delete" style="display:inline-block" >
            	<input type="hidden" id="idxdelete" name="idxdelete" style="display:inline-block" value="">
            </form>
        </div>

    </body>
</html>

<script>
<%

while(rs.next()){
	int idx = rs.getInt("idx");
	String videolink = rs.getString("videolink");
	String thumbnaillink = rs.getString("thumbnaillink");
	String author = rs.getString("author");
	String title = rs.getString("title");
	String time = rs.getString("time");
	String detail = (rs.getString("detail")==null ? "" : rs.getString("detail"));
%>
	
	var tmp = createInfo("<%="./video/" + videolink%>","<%="./video/" + thumbnaillink%>","<%=author%>","<%=title%>","<%=time%>","<%=idx%>","<%=detail%>");
<% 
}

rs.close();
pstmt.close();
con.close();
%>
</script>