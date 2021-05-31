<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta name = "description" content="메인페이지">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/Web/css/bootstrap.css">
<link rel="stylesheet" href="/Web/css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
  <nav class="navbar navbar-default">
   <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed"
    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    aria-expanded="false">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    </button>
   <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
   </div>
   <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
     <ul class="nav navbar-nav">
       <li class="active"><a href="main.jsp">메인</a></li>
       <li><a href="/Web/BoardList.do?cmd=BoardList&page=1">게시판</a></li>
     </ul>
     <!-- 로그인이 되어있지 않은 사용자만 로그인 및 회원가입을 할 수 있도록 -->
     <c:choose>
     <c:when test="${MEMBER_ID eq null}">
     <ul class="nav navbar-nav navbar-right">
       <li class="dropdown">
       <a href="#"class="dropdown-toggle"
        data-toggle="dropdown" role="button" aria-haspopup="true"
        aria-expanded="false">접속하기<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="loginForm.jsp">로그인</a></li>
          <li><a href="joinForm.jsp">회원가입</a></li>
        </ul>
       </li>
     </ul>
     </c:when>
      <c:when test="${MEMBER_ID eq 'Admin'}">
     <ul class="nav navbar-nav navbar-right">
       <li class="dropdown">
       <a href="#"class="dropdown-toggle"
        data-toggle="dropdown" role="button" aria-haspopup="true"
        aria-expanded="false">회원 관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
           <li><a href="/Web/MemberList.do?cmd=MemberList">회원목록</a></li>
           <li><a href="/Web/MemberLogout.do?cmd=MemberLogout">로그아웃</a></li>
        </ul>
       </li>
     </ul>
     </c:when>
     <c:otherwise>
      <ul class="nav navbar-nav navbar-right">
       <li class="dropdown">
       <a href="#"class="dropdown-toggle"
        data-toggle="dropdown" role="button" aria-haspopup="true"
        aria-expanded="false">회원관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/Web/MemberLogout.do?cmd=MemberLogout">로그아웃</a></li>
          <li><a href="/Web/MemberDelete.do?cmd=MemberDelete">회원탈퇴</a></li>
        </ul>
       </li>
     </ul>
     </c:otherwise>
    </c:choose>
     
   </div>
  </nav>
   <div class="container">
    <div class ="jumbotron">
      <div class="container">
      <h1>웹 사이트 소개</h1>
      <p>JSP 게시판 웹 사이트 입니다.</p>
     <!--  <p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p> -->
      </div>
    </div>
   </div>
   
   <div class="container">
    <div id="myCarousel" class="carousel" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      </ol>
      <div class="carousel-inner">
        <div calss="item">
          <img src="/Web/images/banner3.jpg">
        </div>
      </div>
    </div>
   </div>
   
  
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="/Web/js/bootstrap.js"></script>
</body>
</html>