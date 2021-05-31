package pr.com.memberAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.memberBoard.db.MemberBean;
import net.memberBoard.db.MemberDao;

//ȸ���� ����� Ȯ���� �� ȣ��Ǵ� ȣ��Ǵ� ActionŬ����
public class MemberListAction implements Action{
	
	
	private String path;
	private boolean redirect;
	
	
	
	public MemberListAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String id = String.valueOf(request.getSession().getAttribute("MEMBER_ID"));
		if(id.equals("Admin")) {
		List<MemberBean> memberBean = MemberDao.getOracleDao().selectMemberAll(id);
		request.setAttribute("memberList", memberBean);
		}
		
		return new ActionForward(path, redirect);
	}


	
	
	
	
}
