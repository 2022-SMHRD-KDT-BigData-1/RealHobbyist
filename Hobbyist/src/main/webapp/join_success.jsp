
<%@page import="com.message.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%MemberDTO member =(MemberDTO) request.getAttribute("success_data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Hobbyist</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="assets/css/main.css" />
		<link
      href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
      rel="stylesheet"
    />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
	<style>
	 /* @import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css'); */
        @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
        @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
	
/* 		body{
		background-image: url(images/yoga.jpg);
		} */
		#Update > ul.actions {
			margin-top:10%;
		}
		#js_div{
			background-color : #f56a6a;
			box-sizing:border-box;
			width : 1000px;
			text-align : center;
			margin : 0 auto;
			margin-top : 100px;
			border-radius: 0.375em;
			height : 300px;
			padding-top : 50px;
			padding-left : 10px;
			font-family:'Noto Sans KR';
			color : #fff;
		}
		#js_div > p{
			color : black; 
			font-size : 40px;
			margin : 0;
			margin-bottom : 10px;
			padding : 0;
		}
		.js_li{
			margin : 0 auto;
			padding : 0 auto;
			display : block;
			margin-bottom : 5px;
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
				</header>

				<br>
	
					<div id = "js_div">
							<p>환영합니다!</p>
						<ul>
							<li class = "js_li">회원가입을 축하합니다.</li> 
							<li class = "js_li">Hobbyist의 새로운 이메일은 <%=member.getM_email() %>입니다.</li>
						</ul>
							<button class="button" onclick='location.href="main.jsp"' >시작하기</button>
							
					</div>
					</div>
					</div>
	</body>
</html>

