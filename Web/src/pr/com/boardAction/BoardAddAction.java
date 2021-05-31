package pr.com.boardAction;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.memberBoard.db.BoardBean;
import net.memberBoard.db.BoardDao;
import net.memberBoard.db.MemberBean;
import net.memberBoard.db.MemberDao;
import pr.com.memberAction.Action;
import pr.com.memberAction.ActionForward;

//글을 등록할 때 호출되는 Action 클래스
public class BoardAddAction implements Action {

	private String path;
	private boolean redirect;
	
	
	
	public BoardAddAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		 String loggedInID = String.valueOf(request.getSession().getAttribute("MEMBER_ID")).trim();
		 System.out.println("아이디: "+ loggedInID);
		 // 로그인 되지 않았으면 로그인하세요 ! 로그인 페이지로 이동
			if(loggedInID.equals("null")) {
			 path = "memberView/needtoLoginProcess.jsp";
			 return new ActionForward(path, redirect);
			}
		
		BoardBean bean = new BoardBean();
		bean.setBOARD_NUM(BoardDao.getOracleDao().getNextNum());
		bean.setBOARD_USERID(loggedInID);
		bean.setBOARD_TITLE(request.getParameter("BOARD_TITLE"));
		bean.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		
		
		  System.out.println("test");
		  System.out.println(bean); //
		  BoardDao.getOracleDao().boardInsertDB(bean);
		
		return new ActionForward(path, redirect);
	}
	
	
	
}
