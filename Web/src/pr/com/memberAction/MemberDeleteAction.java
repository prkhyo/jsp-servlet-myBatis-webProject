package pr.com.memberAction;
//관리자가 또는 회원 본인이 회원의 정보를 삭제할 때 호출되는 Action클래스
//회원 삭제시 그 회원이 쓴 게시판 글도 자동으로 삭제(DB에서 외래키 제약조건에 ON DELETE CASCADE 설정해줘서)
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.memberBoard.db.MemberDao;

public class MemberDeleteAction implements Action{

	private String path;
	private boolean redirect;
	
	
	
	public MemberDeleteAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		

		String loggedInID = (String) request.getSession().getAttribute("MEMBER_ID");
		HashMap<String, String>map =new HashMap<String, String>();
		
		
		if(!(loggedInID.equals("Admin"))) {  //회원 탈퇴
			map.put("MEMBER_ID", loggedInID);
			MemberDao.getOracleDao().deleteMember(map);
			request.getSession().invalidate();
		 path = "memberView/main.jsp";
		 return new ActionForward(path, redirect);
		}
		
		//관리자가 회원 삭제
		String memberId = request.getParameter("MEMBER_ID").trim();
		map.put("MEMBER_ID", memberId);
		MemberDao.getOracleDao().deleteMember(map);
		System.out.println(map);
		return new ActionForward(path, redirect);
	}

	
}
