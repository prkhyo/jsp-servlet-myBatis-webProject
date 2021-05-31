<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%-- <c:set var="list" value="${list}"></c:set> --%>
<!DOCTYPE html>
<html>
<head>
<meta name = "description" content="�Խ��� ����, �Խ����� ����� �����ִ� ������">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/Web/css/bootstrap.css">
<link rel="stylesheet" href="/Web/css/custom.css">
<title>JSP �Խ��� �� ����Ʈ</title>
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
   <a class="navbar-brand" href="/Web/memberView/main.jsp">JSP �Խ��� �� ����Ʈ</a>
   </div>
   <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
     <ul class="nav navbar-nav">
       <li><a href="/Web/memberView/main.jsp">����</a></li>
       <li class="active"><a href="/Web/BoardList.do?cmd=BoardList">�Խ���</a></li>
     </ul>
     <!-- �α����� �Ǿ����� ���� ����ڸ� �α��� �� ȸ�������� �� �� �ֵ��� -->
     <c:choose>
     <c:when test="${MEMBER_ID eq null}">
     <ul class="nav navbar-nav navbar-right">
       <li class="dropdown">
       <a href="#"class="dropdown-toggle"
        data-toggle="dropdown" role="button" aria-haspopup="true"
        aria-expanded="false">�����ϱ�<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/Web/memberView/loginForm.jsp">�α���</a></li>
          <li><a href="/Web/memberView/joinForm.jsp">ȸ������</a></li>
        </ul>
       </li>
     </ul>
     </c:when>
     
     <c:when test="${MEMBER_ID eq 'Admin'}">
     <ul class="nav navbar-nav navbar-right">
       <li class="dropdown">
       <a href="#"class="dropdown-toggle"
        data-toggle="dropdown" role="button" aria-haspopup="true"
        aria-expanded="false">ȸ�� ����<span class="caret"></span></a>
        <ul class="dropdown-menu">
           <li><a href="/Web/MemberList.do?cmd=MemberList">ȸ�����</a></li>
           <li><a href="/Web/MemberLogout.do?cmd=MemberLogout">�α׾ƿ�</a></li>
        </ul>
       </li>
     </ul>
     </c:when>
     
     <c:otherwise>
      <ul class="nav navbar-nav navbar-right">
       <li class="dropdown">
       <a href="#"class="dropdown-toggle"
        data-toggle="dropdown" role="button" aria-haspopup="true"
        aria-expanded="false">ȸ������<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/Web/MemberLogout.do?cmd=MemberLogout">�α׾ƿ�</a></li>
       <!--<li><a href="/Web/MemberLogout.do?cmd=MemberLogout">ȸ������</a></li> -->
          <li><a href="/Web/MemberDelete.do?cmd=MemberDelete">ȸ��Ż��</a></li>
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
     <legend class="hidden">�������� �˻� �ʵ�</legend>
     <label class="hidden">�˻��з�</label>
     <select name="field" style=" text-align: center; " onchange="fieldCheck()" >
      <option selected="selected" value="empty" >�����ϼ���</option>
      <option value="BOARD_TITLE">����</option>
      <option value="BOARD_USERID">�ۼ���</option>
     </select>
     <label class = "hidden">�˻���</label>
     <input type="text" name="query" value="${param.query}"/>
     <input class="btn btn-primary " type="submit" value="�˻�" onclick="searchData()"/>
     <a href="/Web/BoardList.do?cmd=BoardList" class="btn btn-primary pull-right">���ΰ�ħ </a> 
     <a href="/Web/boardView/board_write.jsp" class="btn btn-primary pull-right">�۾���</a> 
   </fieldset>  
  </form>
  
  </div><br>
  
  
  <div class="container">
   <div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
     <thead>
      <tr>
        <th style="background-color:#eeeeee; text-align: center;">��ȣ</th>
        <th style="background-color:#eeeeee; text-align: center;">����</th>
        <th style="background-color:#eeeeee; text-align: center;">�ۼ���</th>
        <th style="background-color:#eeeeee; text-align: center;">��ȸ��</th>
        <th style="background-color:#eeeeee; text-align: center;">�ۼ���</th>
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
                   <a href="/Web/BoardList.do?cmd=BoardList&page=1" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey ">���� ó��</a> 
                  </c:if>
                  <c:if test="${param.query ne null and param.field ne null}">
                   <a href="/Web/BoardList.do?cmd=BoardList&page=1&query=${param.query}&field=${param.field}" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey ">���� ó��</a> 
                  </c:if>
                  
                  <c:choose>
                     <c:when test="${pageBean.currentPage gt 1 }">
                     <c:if test="${param.query eq null and param.field eq null }">
                     <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.currentPage-1}"class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">�� ����</a> 
                     </c:if>
                     <c:if test="${param.query ne null and param.field ne null}">
                     <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.currentPage-1}&query=${param.query}&field=${param.field}"class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">�� ����</a> 
                     </c:if>
                     </c:when>
                     <c:otherwise>
                     <a href="#" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">�� ����</a> 
                     </c:otherwise>
                  </c:choose>
                                  
                  
                   <c:choose>
                     <c:when test="${pageBean.currentPage lt pageBean.endPage}">
                     <c:if test="${param.query eq null and param.field eq null}">
                     <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.currentPage+1}"class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">���� ��</a> 
                     </c:if>
                     <c:if test="${param.query ne null and param.field ne null}">
                     <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.currentPage+1}&query=${param.query}&field=${param.field}"class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey">���� ��</a> 
                     </c:if>
                     </c:when>
                     <c:otherwise>
                     <a href="#" class="btn btn-primary" style="background-color:lightgrey; color:black; border-color: lightgrey">���� ��</a> 
                     </c:otherwise>
                  </c:choose>
                  <c:if test="${param.query eq null and param.field eq null}">    
                  <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.endPage}" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey ">�� ����</a>
                  </c:if> 
                  <c:if test="${param.query ne null and param.field ne null}">    
                  <a href="/Web/BoardList.do?cmd=BoardList&page=${pageBean.endPage}&query=${param.query}&field=${param.field}" class="btn btn-primary" style="background-color: lightgrey; color:black; border-color: lightgrey ">�� ����</a>
                  </c:if> 

               </div>
          
  
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="/Web/js/bootstrap.js"></script>
</body>
</html>