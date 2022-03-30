<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="submitcss.css">
        <title>동영상 등록</title>
        <script>
        	function chk(){
        		var element = document.getElementById("thumbnaillink").value;
        		if(element == ""){
        			var isok = confirm("이미지를 선택하지 않으면 썸네일이 자동으로 생성됩니다.");
        			if(isok){
        				return true;
        			}else{
        				return false;
        			}
        		}
        	}
        </script>
    </head>
    <body>
        <div id = "mainframe">
            <form method = "post" action = "submitVideo.jsp" enctype="multipart/form-data" onsubmit="return chk()">
                <div id="linkdata">
                    <label for = "videolink">비디오 업로드 : </label><input type="file" id="videolink" name="videolink">
                    <br>
                    <label for = "thumbnaillink">썸네일 링크 : </label><input type="file" id="thumbnaillink" name="thumbnaillink">
                    <br>
                    <label for = "author">작성자 : </label><input type="text" id="author" name="author">
                    <br>
                    <label for = "title">제목 : </label><input type="text" id="title" name="title">
                    <br>
                    <label for = "detail">세부내용 : </label><br><textarea cols="50" rows="10" id="detail" name= "detail"></textarea>
                </div>
                <input type="submit" value="저장">
        </form>
        </div>
    </body>
</html>