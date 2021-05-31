package pr.com.boardAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.memberBoard.db.BoardBean;
import net.memberBoard.db.BoardDao;
import pr.com.memberAction.Action;
import pr.com.memberAction.ActionForward;

//글 내용을 확인할 때 호출되는 Action 클래스
public class BoardDetailAction implements Action{

	private String path;
	private boolean redirect;
	
	
	
	public BoardDetailAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		// 게시판 글 하나의 자세한 정보 가져오기 
		    int boardId = Integer.parseInt(request.getParameter("BOARD_NUM"));
		    BoardBean boardbean = BoardDao.getOracleDao().selectBoardOne(boardId);
			request.setAttribute("list", boardbean);
			System.out.println("하나가져옴: "+ boardbean);//
				
			
		return new ActionForward(path, redirect);
	}

	
	
	
	
	
	
}
