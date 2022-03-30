
function createInfo(url,thumbnailurl,name,title,info,idx,detail){//비디오,썸네일,작성자,타이틀,시간,인덱스
    var newtable = document.createElement("table");
    newtable.style.width = "100%";
    var r1 = document.createElement("tr");
    var d1 = document.createElement("td");
    d1.setAttribute("rowspan","2");
    d1.innerHTML = "<img src = '" + thumbnailurl + "' width='128' height='96' name='imgsrc'>";
    d1.style.width = "130px";
    var d2 = document.createElement("td");
    d2.innerHTML = title;
    r1.appendChild(d1);
    r1.appendChild(d2);
    var r2 = document.createElement("tr");
    var d3 = document.createElement("td");
    var d4 = document.createElement("td");
    //d1.style.border="1px solid black";
    //d2.style.border="1px solid black";
    //d3.style.border="1px solid yellow";
    d3.innerHTML = "<p>" + name + "</p>";
    //d4.style.border="1px solid black";
    d4.innerHTML = "<p style='text-align:right'>" + info + "</p>";
    r2.appendChild(d3);
    r2.appendChild(d4);
    newtable.appendChild(r1);
    newtable.appendChild(r2);
    newtable.setAttribute("class","elementtable");
    newtable.style.border = "1px solid #EAEAEA";
    newtable.style.font = "Verdana bold serif";
    newtable.onmouseover = function(){
    	newtable.style.color = "gray";
    }
    newtable.onmouseout = function(){
  		newtable.style.color = "black";
    }
    newtable.onclick = function(){
    	var lists = document.getElementsByClassName("elementtable");
    	for(var i = 0; i < lists.length; i++){
    		lists[i].style.backgroundColor = "white";
    	}
    	newtable.style.backgroundColor = "#EAEAEA";
    	document.getElementById("right").style.display = "inline";
    	document.getElementById("videoplayer").src = url;
    	document.getElementById("videoinfo").innerHTML = detail;
    	document.getElementById("idxcorrect").setAttribute("value",idx); //hidden 타입에 idx 넣은다음에 DataContainer에서 접근할 때 인덱스로 접근해서 수정삭제
    	document.getElementById("idxdelete").setAttribute("value",idx); //hidden 타입에 idx 넣은다음에 DataContainer에서 접근할 때 인덱스로 접근해서 수정삭제
    	document.getElementById("corregir").setAttribute("onclick","correctVideoPopup(" + idx + ")");
    }
    document.getElementById("left").appendChild(newtable);
    return newtable;
}
function chkCorregir(){
	console.log("**********************executeCorregir*******************");
	var element = document.getElementById("idxcorrect").value;
	if(element==""){
		alert("선택된 비디오가 없습니다");
		return false;
	}
	return true;
}
function chkDel(){
	console.log("*************************executeDel*****************************");
	var element = document.getElementById("idxcorrect").value;
	if(element==""){
		alert("선택된 비디오가 없습니다");
		return false;
	}
	var chk = confirm("삭제하시겠습니까?");
	return chk;
}
function newVideoPopup(){ //팝업 활용. open객체 활용, 팝업창 newVideo에서는 opener 새로고침 후 닫으면 완벽!!
	var ret = window.open("newVideo.jsp","_blank","width = 500, height = 400, top = 100, left = 200, bottom = no");
}
function correctVideoPopup(index){
	var ret = window.open("correctThis.jsp?idx=" + index,"_blank","width = 500, height = 400, top = 100, left = 200, bottom = no");
}
function Bar(){
	var bar = document.getElementById("left");
	var vwindow = document.getElementById("right");
	var btn = document.getElementById("hidebar");
	if(bar.style.visibility == "visible"){
		bar.style.visibility = "hidden";
		bw = 40;
		vw = 57;
		vh = 500;
		var id = setInterval(hideBar,16);
	} else {
		bar.style.visibility = "visible";
		bw = 0;
		vw = 97;
		vh = 660;
		var id = setInterval(revealBar,8);
	}
	function hideBar(){
		if(bw == 0){
			clearInterval(id);
			window.scrollTo(0,111111);
		} else {
			bw = bw - 5;
			vw = vw + 5;
			vh = vh + 50;
			bar.style.width = bw+"%";
			vwindow.style.width = vw+"%";
			vwindow.style.height = vh+"px";
			window.scrollTo(0,111111);
		}
	}
	function revealBar(){
		if(bw == 40){
			clearInterval(id);
			window.scrollTo(0,111111);
		} else {
			bw = bw + 5;
			vw = vw - 5;
			vh = vh - 20;
			bar.style.width = bw+"%";
			vwindow.style.width = vw+"%";
			vwindow.style.height = vh+"px";
			window.scrollTo(0,111111);
		}
	}
}
