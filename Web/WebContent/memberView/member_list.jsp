<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<!DOCTYPE html>
<html>
<head>
<meta name = "description" content="관리자가 회원 목록을 볼 수 있는 페이지">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/Web/css/bootstrap.css">
<link rel="stylesheet" href="/Web/css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<script>
    
    
    function deleteMember(){ 
        var obj=document.delFrm;  
        obj.submit(); 
     }
    

</script>

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
   <a class="navbar-brand" href="/Web/memberView/main.jsp">JSP 게시판 웹 사이트</a>
   </div>
   <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
     <ul class="nav navbar-nav">
       <li><a href="/Web/memberView/main.jsp">메인</a></li>
       <li class="active"><a href="/Web/BoardList.do?cmd=BoardList">게시판</a></li>
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
          <li><a href="/Web/memberView/loginForm.jsp">로그인</a></li>
          <li><a href="/Web/memberView/joinForm.jsp">회원가입</a></li>
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
        </ul>
       </li>
     </ul>
     </c:otherwise>
    </c:choose>
     
   </div>
  </nav>
  <div class="container">
   <div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
     <thead>
      <tr>
        
        
        <th style="background-color:#eeeeee; text-align: center;">아이디</th>
        <th style="background-color:#eeeeee; text-align: center;">비밀번호</th>
        <th style="background-color:#eeeeee; text-align: center;">이름</th>
        <th style="background-color:#eeeeee; text-align: center;">나이</th>
        <th style="background-color:#eeeeee; text-align: center;">성별</th>
        <th style="background-color:#eeeeee; text-align: center;">이메일</th>
        <th style="background-color:#eeeeee; text-align: center;">회원삭제</th>
      </tr>
     </thead>
     <tbody>
     <form method="get" name="delFrm">
      <c:forEach var="i" items="${memberList}" varStatus="cnt">
       <tr>
          <td>${i.MEMBER_ID}</td> 
          <td>${i.MEMBER_PW}</td>
          <td>${i.MEMBER_NAME}</td>
          <td>${i.MEMBER_AGE}</td>
          <td>${i.MEMBER_GENDER}</td>
          <td>${i.MEMBER_EMAIL}</td>
          <td><a href="MemberDelete.do?cmd=MemberDelete&MEMBER_ID=${i.MEMBER_ID}"class="btn btn-primary pull-right" onclick="deleteMember()" >삭제</a></td> 
       </tr>
       
       </c:forEach>
       
      </form> 
     </tbody>
    </table>
   </div>
  </div>
  
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="/Web/js/bootstrap.js"></script>
</body>
</html>