package pr.com.memberAction;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.memberBoard.db.MemberBean;
import net.memberBoard.db.MemberDao;

//ȸ������ ó���� �� ȣ��Ǵ� ActionŬ����
public class MemberJoinAction implements Action {

	private String path;
	private boolean redirect;
	
	



	public MemberJoinAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}





	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 try {
	         request.setCharacterEncoding("EUC-KR");
	      } catch (UnsupportedEncodingException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
		 
		 //�̹� �α��ε� ���¶�� ȸ�������������� ������ �� ������ ����
		 String loggedInID = (String) request.getSession().getAttribute("MEMBER_ID");
			if(loggedInID!=null) {
			 path = "/Web/memberView/loggedInProcess.jsp";
			 redirect = false; // false�� ���°� �³�?
			 return new ActionForward(path, redirect);
			}
		 
			
		  String id = request.getParameter("MEMBER_ID");
		  if(MemberDao.getOracleDao().idCheckMember(id)) {
			  path = "/Web/memberView/joinFailProcess.jsp";
		  }else{
			  
			  MemberBean bean = new MemberBean();
			  bean.setMEMBER_ID(id);
			  bean.setMEMBER_PW(request.getParameter("MEMBER_PW"));
			  bean.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
			  bean.setMEMBER_AGE(Integer.parseInt(request.getParameter("MEMBER_AGE")));
			  bean.setMEMBER_GENDER(request.getParameter("MEMBER_GENDER"));
			  bean.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL"));
			  System.out.println("test");
			  System.out.println(bean); //
			  MemberDao.getOracleDao().memberInsertDB(bean);
			  
		  }
		 
		 
		
		return new ActionForward(path, redirect);
	}
	
	
	
}
