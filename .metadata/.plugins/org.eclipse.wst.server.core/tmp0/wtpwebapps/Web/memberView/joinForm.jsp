<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name = "description" content="회원가입 폼 페이지">
<meta http-equiv="Content-type" content="text/html; charset=EUC-KR">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/Web/css/bootstrap.css">
<link rel="stylesheet" href="/Web/css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<script>



	   function joinCheck(){
		   var obj = document.joinFrm; 
		      
		      if(!obj.MEMBER_ID.value || obj.MEMBER_ID.value == ''){
		         alert('아이디를 입력하세요');
		         obj.MEMBER_ID.focus();
		         return false;
		      }
		      
		      if(!obj.MEMBER_PW.value || obj.MEMBER_PW.value == ''){
		         alert('비밀번호를 입력하세요');
		         obj.MEMBER_PW.focus();
		         return false;
		      }
		      
		      if(!obj.MEMBER_NAME.value || obj.MEMBER_NAME.value == ''){
		         alert('이름을 입력하세요');
		         obj.MEMBER_NAME.focus();
		         return false;
		      }
		      
		      if(!obj.MEMBER_AGE.value || obj.MEMBER_AGE.value == ''){
		         alert('나이를 입력하세요');
		         obj.MEMBER_AGE.focus();
		         return false;
		      }else if(!(obj.MEMBER_AGE.value>0)){
		    	  alert('ERROR: AGE CHECK!');
		    	  obj.MEMBER_AGE.value='';
			      obj.MEMBER_AGE.focus();  
		      }
		      
		      if(!obj.MEMBER_EMAIL.value || obj.MEMBER_EMAIL.value == ''){
		         alert('이메일을 입력하세요');
		         obj.MEMBER_EMAIL.focus();
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
       <li><a href="main.jsp">메인</a></li>
       <li><a href="/Web/BoardList.do?cmd=BoardList">게시판</a></li>
     </ul>
     <ul class="nav navbar-nav navbar-right">
       <li class="dropdown">
       <a href="#"class="dropdown-toggle"
        data-toggle="dropdown" role="button" aria-haspopup="true"
        aria-expanded="false">접속하기<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="loginForm.jsp">로그인</a></li>
          <li  class ="active"><a href="joinForm.jsp">회원가입</a></li>
        </ul>
       </li>
     </ul>
   </div>
  </nav>
  
  <div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
      <div class="jumbotron" style="padidng-top: 20px;">
        <form method="post" name="joinFrm" action="/Web/MemberJoin.do?cmd=MemberJoin" >
         <h3 style="text-align: center;">회원가입</h3>
           <div class="form-group">
            <input type="text" class="form-control" placeholder="아이디" name="MEMBER_ID"  maxlength="20">
           </div>
           <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호" name="MEMBER_PW"  maxlength="20">
           </div>
           <div class="form-group">
            <input type="text" class="form-control" placeholder="이름" name="MEMBER_NAME" maxlength="20">
           </div>
           <div class="form-group">
            <input type="text" class="form-control" placeholder="나이" name="MEMBER_AGE" maxlength="20">
           </div>
           <div class="form-group" style="text-align: center;">
             <div class="btn-group" data-toggle="buttons">
               <label class="btn btn-primary active">
                 <input type="radio" name="MEMBER_GENDER" autocomplete="off" value="남" checked>남자
               </label>
               <label class="btn btn-primary">
                 <input type="radio" name="MEMBER_GENDER" autocomplete="off" value="여" checked>여자
               </label>
             </div>
           </div>
           <div class="form-group">
            <input type="email" class="form-control" placeholder="이메일" name="MEMBER_EMAIL" maxlength="20" >
           </div>
              <input type="button" class="btn btn-primary form-control" value="회원가입" onclick="joinCheck()">
         </form>
      </div>
    </div>
     <div class="col-lg-4"></div>
  </div>
  
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="/Web/js/bootstrap.js"></script>
</body>
</html>