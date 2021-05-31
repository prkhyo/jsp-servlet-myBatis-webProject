<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%-- <c:set var="list" value="${list}"></c:set> --%>
<!DOCTYPE html>
<html>
<head>
<meta name = "description" content="게시판 메인, 게시판의 목록을 보여주는 페이지">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/Web/css/bootstrap.css">
<link rel="stylesheet" href="/Web/css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<script>
function searchData(){
	var obj = document.searchFrm;
	if(obj.field.value=='empty'||!obj.query.value){
		alert('SearchData Check!');
		obj.field.selectedIndex = 0;
		obj.query.value = '';
		return false;
	}

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
       <!--<li><a href="/Web/MemberLogout.do?cmd=MemberLogout">회원수정</a></li> -->
          <li><a href="/Web/MemberDelete.do?cmd=MemberDelete">회원탈퇴</a></li>
        </ul>
       </li>
     </ul>
     </c:otherwise>
    </c:choose>
     
   </div>
  </nav>
  
  
  <div class="container" style="text-align: center;">
  <form class="table-form" action="/Web/BoardList.do?cmd=BoardList" method="post" name="searchFrm">
   <fieldset>
     <legend class="hidden">공지사항 검색 필드</legend>
     <label class="hidden">검색분류</label>
     <select name="field" style=" text-align: center; " onchange="fieldCheck()" >
      <option selected="selected" value="empty" >선택하세요</option>
      <option value="BOARD_TITLE">제목</option>
      <option value="BOARD_USERID">작성자</option>
     </select>
     <label class = "hidden">검색어</label>
     <input type="text" name="query" value="${param.query}"/>
     <input class="btn btn-primary " type="submit" value="검색" onclick="searchData()"/>
     <a href="/Web/BoardList.do?cmd=BoardList" class="btn btn-primary pull-right">새로고침 </a> 
     <a href="/Web/boardView/board_write.jsp" class="btn btn-primary pull-right">글쓰기</a> 
   </fieldset>  
  </form>
  
  </div><br>
  
  
  <div class="container">
   <div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
     <thead>
      <tr>
        <th style="background-color:#eeeeee; text-align: center;">번호</th>
        <th style="background-color:#eeeeee; text-align: center;">제목</th>
        <th style="background-color:#eeeeee; text-align: center;">작성자</th>
        <th style="background-color:#eeeeee; text-align: center;">조회수</th>
        <th style="background-color:#eeeeee; text-align: center;">작성일</th>
      </tr>
     </thead>
     <tbody>
      <c:forEach var="i" items="${list}" varStatus="cnt">
       <tr>
          <td>${i.BOARD_NUM}</td>
          <td><a href="/Web/BoardView.do?cmd=BoardView&BOARD_NUM=${i.BOARD_NUM}">${i.BOARD_TITLE}</a></td>
          <td>${i.BOARD_USERID}</td>
          <td>${i.BOARD_READCOUNT}</td>
          <td>${i.BOARD_DATE}</td> 
       </tr>
       </c:forEach>
     </tbody>
    </table>
   </div>
  </div>
 
   <div class="paging" style="text-align: center;">
                  <c:if test="${param.query eq null and param.field eq null }">
                   <a href="/Web/BoardList.do?cmd=BoardList&page=1" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey ">◀◀ 처음</a> 
                  </c:if>
                  <c:if test="${param.query ne null and param.field ne null}">
                   <a href="/Web/BoardList.do?cmd=BoardList&page=1&query=${param.query}&field=${param.field}" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey ">◀◀ 처음</a> 
                  </c:if>
                  
                  <c:choose>
                     <c:when test="${pageBean.currentPage gt 1 }">
                     <c:if test="${param.query eq null and param.field eq null }">
                     <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.currentPage-1}"class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">◀ 이전</a> 
                     </c:if>
                     <c:if test="${param.query ne null and param.field ne null}">
                     <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.currentPage-1}&query=${param.query}&field=${param.field}"class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">◀ 이전</a> 
                     </c:if>
                     </c:when>
                     <c:otherwise>
                     <a href="#" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">◀ 이전</a> 
                     </c:otherwise>
                  </c:choose>
                                  
                  
                   <c:choose>
                     <c:when test="${pageBean.currentPage lt pageBean.endPage}">
                     <c:if test="${param.query eq null and param.field eq null}">
                     <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.currentPage+1}"class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">다음 ▶</a> 
                     </c:if>
                     <c:if test="${param.query ne null and param.field ne null}">
                     <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.currentPage+1}&query=${param.query}&field=${param.field}"class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">다음 ▶</a> 
                     </c:if>
                     </c:when>
                     <c:otherwise>
                     <a href="#" class="btn btn-primary" style="background-color:lightgrey; color:black; border-color: lightgrey">다음 ▶</a> 
                     </c:otherwise>
                  </c:choose>
                  <c:if test="${param.query eq null and param.field eq null}">    
                  <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.endPage}" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey ">끝 ▶▶</a>
                  </c:if> 
                  <c:if test="${param.query ne null and param.field ne null}">    
                  <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.endPage}&query=${param.query}&field=${param.field}" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey ">끝 ▶▶</a>
                  </c:if> 

               </div>
          
  
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="/Web/js/bootstrap.js"></script>
</body>
</html>