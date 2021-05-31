package pr.com.memberAction;

import pr.com.boardAction.BoardAddAction;
import pr.com.boardAction.BoardDeleteAction;
import pr.com.boardAction.BoardDetailAction;
import pr.com.boardAction.BoardListAction;

public class ActionFactory {
/*mapper 역할을 대신 해줌*/
	
	public static Action getAction(String cmd) {
	Action action =null;
	
	if(cmd.equals("MemberLogin")) {
	 action = new MemberLoginAction("memberView/main.jsp",false);
	
	}else if(cmd.equals("MemberJoin")) {
	 action = new MemberJoinAction("memberView/loginForm.jsp", true);
	}else if(cmd.equals("MemberLogout")) {
	 action = new MemberLogoutAction("memberView/logoutProcess.jsp", true);	
	}else if(cmd.equals("BoardAdd")) {
	 action = new BoardAddAction("BoardList.do?cmd=BoardList", true);
	}else if(cmd.equals("BoardList")) {
	 action = new BoardListAction("boardView/board_list.jsp", false); 	
	}else if(cmd.equals("MemberList")){
	 action = new MemberListAction("memberView/member_list.jsp",false);	
	}else if(cmd.equals("MemberDelete")) {
	 action = new MemberDeleteAction("MemberList.do?cmd=MemberList",true);
	}else if(cmd.equals("BoardView")) {
	 action = new BoardDetailAction("boardView/board_view.jsp", false);
	}else if(cmd.equals("BoardDelete")) {
	 action = new BoardDeleteAction("BoardList.do?cmd=BoardList", true);
		
	}
	
	      
	return action;	
	
	}
	
}
