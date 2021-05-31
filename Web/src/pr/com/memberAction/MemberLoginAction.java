package pr.com.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import net.memberBoard.db.MemberDao;

//사용자가 로그인할 때 호출되는 Action클래스
public class MemberLoginAction implements Action{

	private String path;
	private boolean redirect;
	
	
	
	public MemberLoginAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		 //이미 로그인된 상태라면 로그인페이지에 진입할 수 없도록 제한
		String loggedInID = (String) request.getSession().getAttribute("MEMBER_ID");
		if(loggedInID!=null) {
		 path = "/Web/memberView/loggedInProcess.jsp";
		 return new ActionForward(path, redirect);//false로 가는거 맞나?
		}
		
		
     String id = request.getParameter("MEMBER_ID");
	 String pw = request.getParameter("MEMBER_PW");
	 
	 
     if(MemberDao.getOracleDao().idPwCheckMember(id, pw)) {
        request.getSession().setAttribute("MEMBER_ID", id);
        request.getSession().setMaxInactiveInterval(600);        
     }else {
       path="memberView/loginForm.jsp";
     }      
     redirect=true; //셰션에다 저장했으니까 true?
	 
	 
		return new ActionForward(path, redirect);
	}
	

}
