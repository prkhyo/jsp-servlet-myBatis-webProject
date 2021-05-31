package pr.com.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import net.memberBoard.db.MemberDao;

//����ڰ� �α����� �� ȣ��Ǵ� ActionŬ����
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
	
		 //�̹� �α��ε� ���¶�� �α����������� ������ �� ������ ����
		String loggedInID = (String) request.getSession().getAttribute("MEMBER_ID");
		if(loggedInID!=null) {
		 path = "/Web/memberView/loggedInProcess.jsp";
		 return new ActionForward(path, redirect);//false�� ���°� �³�?
		}
		
		
     String id = request.getParameter("MEMBER_ID");
	 String pw = request.getParameter("MEMBER_PW");
	 
	 
     if(MemberDao.getOracleDao().idPwCheckMember(id, pw)) {
        request.getSession().setAttribute("MEMBER_ID", id);
        request.getSession().setMaxInactiveInterval(600);        
     }else {
       path="memberView/loginForm.jsp";
     }      
     redirect=true; //�μǿ��� ���������ϱ� true?
	 
	 
		return new ActionForward(path, redirect);
	}
	

}
