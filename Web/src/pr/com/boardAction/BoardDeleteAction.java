package pr.com.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.memberBoard.db.BoardDao;
import pr.com.memberAction.Action;
import pr.com.memberAction.ActionForward;

//글을 삭제할 때 호출되는 Action 클래스
public class BoardDeleteAction implements Action{

	private String path;
	private boolean redirect;
	
	
	
	public BoardDeleteAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		int boardNum = Integer.parseInt(request.getParameter("BOARD_NUM"));
		BoardDao.getOracleDao().deleteBoard(boardNum);
		String cp = request.getParameter("page");//
		path+="&page="+cp;//
		
		return new ActionForward(path, redirect);
	}

	
	
}
