<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name = "description" content="ȸ������ �� ������">
<meta http-equiv="Content-type" content="text/html; charset=EUC-KR">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/Web/css/bootstrap.css">
<link rel="stylesheet" href="/Web/css/custom.css">
<title>JSP �Խ��� �� ����Ʈ</title>
<script>



	   function joinCheck(){
		   var obj = document.joinFrm; 
		      
		      if(!obj.MEMBER_ID.value || obj.MEMBER_ID.value == ''){
		         alert('���̵� �Է��ϼ���');
		         obj.MEMBER_ID.focus();
		         return false;
		      }
		      
		      if(!obj.MEMBER_PW.value || obj.MEMBER_PW.value == ''){
		         alert('��й�ȣ�� �Է��ϼ���');
		         obj.MEMBER_PW.focus();
		         return false;
		      }
		      
		      if(!obj.MEMBER_NAME.value || obj.MEMBER_NAME.value == ''){
		         alert('�̸��� �Է��ϼ���');
		         obj.MEMBER_NAME.focus();
		         return false;
		      }
		      
		      if(!obj.MEMBER_AGE.value || obj.MEMBER_AGE.value == ''){
		         alert('���̸� �Է��ϼ���');
		         obj.MEMBER_AGE.focus();
		         return false;
		      }else if(!(obj.MEMBER_AGE.value>0)){
		    	  alert('ERROR: AGE CHECK!');
		    	  obj.MEMBER_AGE.value='';
			      obj.MEMBER_AGE.focus();  
		      }
		      
		      if(!obj.MEMBER_EMAIL.value || obj.MEMBER_EMAIL.value == ''){
		         alert('�̸����� �Է��ϼ���');
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
   <a class="navbar-brand" href="/Web/memberView/main.jsp">JSP �Խ��� �� ����Ʈ</a>
   </div>
   <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
     <ul class="nav navbar-nav">
       <li><a href="main.jsp">����</a></li>
       <li><a href="/Web/BoardList.do?cmd=BoardList">�Խ���</a></li>
     </ul>
     <ul class="nav navbar-nav navbar-right">
       <li class="dropdown">
       <a href="#"class="dropdown-toggle"
        data-toggle="dropdown" role="button" aria-haspopup="true"
        aria-expanded="false">�����ϱ�<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="loginForm.jsp">�α���</a></li>
          <li  class ="active"><a href="joinForm.jsp">ȸ������</a></li>
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
         <h3 style="text-align: center;">ȸ������</h3>
           <div class="form-group">
            <input type="text" class="form-control" placeholder="���̵�" name="MEMBER_ID"  maxlength="20">
           </div>
           <div class="form-group">
            <input type="password" class="form-control" placeholder="��й�ȣ" name="MEMBER_PW"  maxlength="20">
           </div>
           <div class="form-group">
            <input type="text" class="form-control" placeholder="�̸�" name="MEMBER_NAME" maxlength="20">
           </div>
           <div class="form-group">
            <input type="text" class="form-control" placeholder="����" name="MEMBER_AGE" maxlength="20">
           </div>
           <div class="form-group" style="text-align: center;">
             <div class="btn-group" data-toggle="buttons">
               <label class="btn btn-primary active">
                 <input type="radio" name="MEMBER_GENDER" autocomplete="off" value="��" checked>����
               </label>
               <label class="btn btn-primary">
                 <input type="radio" name="MEMBER_GENDER" autocomplete="off" value="��" checked>����
               </label>
             </div>
           </div>
           <div class="form-group">
            <input type="email" class="form-control" placeholder="�̸���" name="MEMBER_EMAIL" maxlength="20" >
           </div>
              <input type="button" class="btn btn-primary form-control" value="ȸ������" onclick="joinCheck()">
         </form>
      </div>
    </div>
     <div class="col-lg-4"></div>
  </div>
  
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="/Web/js/bootstrap.js"></script>
</body>
</html>