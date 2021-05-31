package pr.com.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberLogoutAction implements Action {

	private String path;
	private boolean redirect;
	
	
	
	public MemberLogoutAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		request.getSession().invalidate(); //세션을 무효화시켜 로그아웃
		System.out.println("로그아웃test");
		return new ActionForward(path, redirect);
	}

	
	
	
	
	
}
