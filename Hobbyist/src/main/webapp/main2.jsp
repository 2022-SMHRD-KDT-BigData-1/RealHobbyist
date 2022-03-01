

<%@page import="com.message.model.MarkerDAO"%>
<%@page import="com.message.model.MarkerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
MemberDTO member = (MemberDTO) session.getAttribute("member");
%>
<% request.setCharacterEncoding("utf-8"); %>
<% ArrayList<MarkerDTO> locmarker = new ArrayList<MarkerDTO>();
MarkerDAO dao = new MarkerDAO();
locmarker = dao.marSelect(); %>
<!DOCTYPE html>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head> 
<title>Hobbyist</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
#main>div>section>header h2 {
	font-family: "SUIT-Medium";
}

#main>div>section>div>article h3 {
	font-family: "SUIT-Medium";
}

#main>div>section>div>article a {
	font-family: "SUIT-Medium";
	margin-right: 2em;
}

a {
	text-decoration: none;
	color: #f45c5c;
}

#map_search {
	font-size: 11px;
	float: left;
}

#main_map {
	background-color: #f56a6a;
	border-radius: 0.25em;
	border: 0px;
	outline: none;
	float: right;
}
		#sw{
            width: 1343px;
            height: 836px;
            overflow: hidden;
        }
 		#s{
            position: relative;
            width: 4029px;
            height:  836px;
        }
        #s > .sl {
        	margin : 0 auto;
        	padding : 0 auto;
            width: 1343px;
            height: 836px;
            position: relative;
            float: left;
        }
        #s > .sl > img{
            width: 100%;
            height:  836px;
        }
		#slp{
			position: absolute;
			font-size: 150px;
			left: 60%;
			top : 50%;
			 transform: translate(-50%,-50%);
			z-index: 100;
			font-family: 'Noto Sans KR', sans-serif;
			color: #fff;
		}
		.category_wraper>span {
		font-family: "SUIT-Medium";
		color: #f45c5c;
		font-weight: bold;
		font-size: 24px;
		
		/*  margin : 10px;  */
		height: 100px;
		margin-left: 30px;
		margin-right: 30px;
		align:center;
}
		#category_wrapper_wrapper {
			margin: 0 auto;
			padding: 0px auto;
			width: 1300px;
			height: 100px;
			box-sizing: border-box;
			
			border: 2px solid #f45c5c;
			border-radius: 5px 5px 5px 5px;
			padding-top: 30px;
			padding-left: 10px;
		}
		.category_wraper {
			position: relative;
			
			height: 50px;
		}
</style>

</head>

<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<header id="header">
					<a href="#" class="logo"><h1>
							<strong>Hobbyist</strong>
						</h1></a>
					<ul class="icons">
                  <%
                     if(member != null) {
                  %>
                  <li><a href="logout.jsp"><span class="label">로그아웃</span></a></li>
                  <li><a href="HistoryCon"><span class="label">수강관리</span></a></li>
                  <li><a href="Update.html"><span class="label">정보수정</span></a></li>
                  <%
                     }else{
                        %>
                  <li><a href="Login.jsp"><span class="label">로그인</span></a></li>
                  <li><a href="Join.jsp"><span class="label">회원가입</span></a></li>
                        <%
                     }
                  %>
               </ul> 
				</header>

				<br>

				<div class="section">
					<div class="slidewrap">
						<p id = "slp">Hobbyist</p>
						<div id="sw"> 
					    <div id="s">
					        <div class="sl">
					           <img src="./images/yoga.jpg">
					        </div>
					               
					        <div class="sl">
					             <img src="./images/brushes.jpg">
					        </div>
					               
					        <div class="sl">
					              <img src="./images/knit.jpg">
					        </div>
					   </div>
					   </div>
					</div>
					
				</div>
				<br><hr><br>
				<div id="category_wrapper_wrapper" >
					<div class="category_wraper" >
						<span>스마트 인재 개발원 주변 학원 찾기</span> 
					</div>
			</div><br>
				
				<% for(int i = 0 ; i < locmarker.size(); i++){ %>
	<input type="hidden" value="<%= locmarker.get(i).getAC_NAME() %>,<%= locmarker.get(i).getAC_WI() %>,<%= locmarker.get(i).getAC_KY() %>,<%= locmarker.get(i).getAC_ADDR() %>,<%= locmarker.get(i).getAC_IMG() %>,<%= locmarker.get(i).getAC_REV() %>,<%= locmarker.get(i).getAC_REL() %>" class="locmarker">
<% } %>
	<div id="map" style="width: 100%; height: 836px;"></div>
		<script src="./assets/js/jquery.min.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a&libraries=clusterer"></script>
		<script>
		var markers = [];
		var overlays = [];
		
		function makeClickListener(map, marker, overlay) {
		    return function() {
		        overlay.setMap(map)
		    };
		}
		
		<%-- // 지도를 생성한다--%> 
		var map; 
		var overlay;
		//window.onload = function(){
				var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(35.150070018186796, 126.91979751141352), // 지도의 중심좌표
			        level: 4, // 지도의 확대 레벨
			        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
			    }; 
				map = new kakao.maps.Map(mapContainer, mapOption);
				var myLocmarker = document.querySelectorAll('.locmarker');
				
				var locArray = new Array(myLocmarker.length);
				
				
				for(var i = 0; i < myLocmarker.length; i++){
					locArray[i] = new Array(7);
					var arr = myLocmarker[i].value.split(',');
					locArray[i][0] = arr[0];
					locArray[i][1] = arr[1];
					locArray[i][2] = arr[2];
					locArray[i][3] = arr[3];
					locArray[i][4] = arr[4];
					locArray[i][5] = arr[5];
					locArray[i][6] = arr[6];
					console.log(locArray[i][4]+'/'+locArray[i][5] + '/'+locArray[i][6]);
				}

				
				//클러스터러 추가
				 var clusterer = new kakao.maps.MarkerClusterer({
				        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				        minLevel: 4 // 클러스터 할 최소 지도 레벨 
				    }); 
	
				
				for(var i =0; i<locArray.length; i++){
					// 지도에 마커를 생성하고 표시한다
					var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(locArray[i][1], locArray[i][2]),
						map: map // 마커를 표시할 지도 객체
					});
					
					
					var content = '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + 
		                        locArray[i][0] + 
		            '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="img">' +
		            '                <img src="'+locArray[i][4]+'" width="73" height="70" alt = "NO IMAGE">' +
		            '           </div>' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">'+locArray[i][3]+'</div>' + 
		            '                <div><a href="'+locArray[i][6]+'" target="_blank" class="link">홈페이지</a></div>' + 
		            '                <div><a href="'+locArray[i][5]+'" target="_blank" class="link">리뷰</a></div>' +
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';

					// 마커 위에 커스텀오버레이를 표시합니다
					// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					overlay = new kakao.maps.CustomOverlay({
					    content: content,
					    map: null,
					    position: marker.getPosition()   
					});
					
					
					kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, overlay));
					// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
					/*kakao.maps.event.addListener(marker, 'click', function() {
						overlay.setMap(map);
					});*/
			
					// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
					markers.push(marker);
					overlays.push(overlay);	
					}
		//}
				
		function closeOverlay(i) {
			 overlays[i].setMap(null);   
		    //overlay.setMap(null);
		    /*$(".wrap").on("click",function(){
		    	$(this).hide();
		    })*/
		}
		</script>
			</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
                  <li><a href="towninput.jsp">우리동네에서찾기</a></li>
                  <li><a href="RecommendMove.jsp">카테고리별 검색</a></li>
                  <li><a href="geo.jsp">길찾기 </a></li>
                  <li><a href="communityList.jsp">게시판</a></li>
                  <li><a href="WishlistSelectCon">위시리스트 </a></li>
               </ul>
				</nav>

				<section>
					<header class="major">
						<h2>My Info</h2>
					</header>
					<p></p>
					<ul class="contact">
                     <%
                        if(member != null){
                     %>
                  <li><a href="#"><%= member.getM_email() %></a></li>
                  <li><%= member.getM_tel() %></li>
                  <li><%= member.getM_nick() %>님 환영합니다.
                  </li>
               <%
                        }else {
                           %>
                           <li>로그인을 해주세요</li>
                           <%   
                        }
               %>
               </ul>
				</section>

				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>
			</div>
		</div>
	</div>
	 <script>
	 var current = 0;
     setInterval(function(){
         var next = (current+1)%3;
         var slidePosition = current * (-1343) + "px";
         $("#s").animate({left : slidePosition},500);
         current = next;
     },2500);
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>


