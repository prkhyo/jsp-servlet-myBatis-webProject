package pr.com.memberAction;
//�����ڰ� �Ǵ� ȸ�� ������ ȸ���� ������ ������ �� ȣ��Ǵ� ActionŬ����
//ȸ�� ������ �� ȸ���� �� �Խ��� �۵� �ڵ����� ����(DB���� �ܷ�Ű �������ǿ� ON DELETE CASCADE �������༭)
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
		
		
		if(!(loggedInID.equals("Admin"))) {  //ȸ�� Ż��
			map.put("MEMBER_ID", loggedInID);
			MemberDao.getOracleDao().deleteMember(map);
			request.getSession().invalidate();
		 path = "memberView/main.jsp";
		 return new ActionForward(path, redirect);
		}
		
		//�����ڰ� ȸ�� ����
		String memberId = request.getParameter("MEMBER_ID").trim();
		map.put("MEMBER_ID", memberId);
		MemberDao.getOracleDao().deleteMember(map);
		System.out.println(map);
		return new ActionForward(path, redirect);
	}

	
}
