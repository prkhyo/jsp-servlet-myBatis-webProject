<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<<meta name = "description" content="�Խ��� �� ���� �� ������">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/Web/css/bootstrap.css">
<link rel="stylesheet" href="/Web/css/custom.css">
<title>JSP �Խ��� �� ����Ʈ</title>
<script>

function boardWriteCheck(){
	
  var obj = document.addFrm; 
   if(!obj.BOARD_TITLE.value || obj.BOARD_TITLE.value == ''){
    alert('������ �Է��ϼ���');
    obj.BOARD_TITLE.focus();
    return false;
  }
   if(!obj.BOARD_CONTENT.value || obj.BOARD_CONTENT.value == ''){
    alert('������ �Է��ϼ���');
    obj.BOARD_CONTENT.focus();
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
   <a class="navbar-brand" href="main.jsp">JSP �Խ��� �� ����Ʈ</a>
   </div>
   <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
     <ul class="nav navbar-nav">
       <li><a href="main.jsp">����</a></li>
       <li class="active"><a href="/Web/BoardList.do?cmd=BoardList&page=1">�Խ���</a></li>
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
          <li><a href="/Web/MemberDelete.do?cmd=MemberDelete">ȸ��Ż��</a></li>
        </ul>
       </li>
     </ul>
     </c:otherwise>
    </c:choose>
     
   </div>
  </nav>
  <div class="container">
   <div class="row">
    <form action="/Web/BoardAdd.do?cmd=BoardAdd" method="post" name="addFrm">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
     <thead>
      <tr>
        <th colspan="2" style="background-color:#eeeeee; text-align: center;">�Խ��� �۾���</th>
      </tr>
     </thead>
     <tbody>
       <tr>
          <td><input type="text" class="form-control" placeholder="�� ����" name="BOARD_TITLE" maxlength="50"></td>
       </tr>
       <tr>   
          <td><textarea class="form-control" placeholder="�� ����" name="BOARD_CONTENT" maxlength="2000" style="height: 350px;"></textarea></td>
       </tr>
     </tbody>
    </table>
      <input type="button" class="btn btn-primary pull-right" value="�۾���" onclick="boardWriteCheck()">
    </form>
   </div>
  </div>
  
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="/Web/js/bootstrap.js"></script>
</body>
</html>