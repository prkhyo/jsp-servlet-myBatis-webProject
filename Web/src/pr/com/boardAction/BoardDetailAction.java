package pr.com.boardAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.memberBoard.db.BoardBean;
import net.memberBoard.db.BoardDao;
import pr.com.memberAction.Action;
import pr.com.memberAction.ActionForward;

//�� ������ Ȯ���� �� ȣ��Ǵ� Action Ŭ����
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
		
		// �Խ��� �� �ϳ��� �ڼ��� ���� �������� 
		    int boardId = Integer.parseInt(request.getParameter("BOARD_NUM"));
		    BoardBean boardbean = BoardDao.getOracleDao().selectBoardOne(boardId);
			request.setAttribute("list", boardbean);
			System.out.println("�ϳ�������: "+ boardbean);//
				
			
		return new ActionForward(path, redirect);
	}

	
	
	
	
	
	
}
