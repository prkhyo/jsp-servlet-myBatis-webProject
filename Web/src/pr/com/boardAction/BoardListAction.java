package pr.com.boardAction;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.memberBoard.db.BoardBean;
import net.memberBoard.db.BoardDao;
import net.memberBoard.db.PageBean;
import pr.com.memberAction.Action;
import pr.com.memberAction.ActionForward;

//�� ����� Ȯ���� �� ȣ��Ǵ� Action Ŭ����
public class BoardListAction implements Action {

	private String path;
	private boolean redirect;
	
	
	
	public BoardListAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}

	public void paging(HttpServletRequest request) {
		   
		//�˻�
		String fieldTemp =request.getParameter("field");
		String queryTemp =request.getParameter("query");  
		
		System.out.println("�ʵ�:"+fieldTemp);
		System.out.println("�˻���:"+queryTemp);
		String field = "BOARD_TITLE";
		if(fieldTemp!=null)
			field=fieldTemp;
		
		String query = "";
		if(queryTemp!=null)
			query=queryTemp;
		
		
		 HashMap<String, Object> map = new HashMap<String,Object>();
			   map.put("field", field);
			   map.put("query", query);
			   
		   
		   //����¡
		   int pageScale = 5;  /* ���������� ������ �ΰ��� ������. */
		   int currentPage=1;
		   int totalRow=BoardDao.getOracleDao().getTotalRow(map);
		   int totalPage=totalRow%pageScale==0?totalRow/pageScale:(totalRow/pageScale)+1;
		   if(totalRow==0)totalPage=1;
		   String tempPage=null;
		   try{
		      tempPage=request.getParameter("page");
		      currentPage=Integer.parseInt(tempPage);
		   }catch(Exception e){      
		      
		   }
		   int start=1+(currentPage-1)*pageScale;   
		   int end=pageScale+(currentPage-1)*pageScale;
		   int currentBlock=currentPage%pageScale==0?currentPage/pageScale:(currentPage/pageScale)+1;
		   int startPage=1+(currentBlock-1)*pageScale;
		   int endPage=pageScale+(currentBlock-1)*pageScale;
		   
		   if(totalPage<=endPage){
		      endPage=totalPage;
		   }
		   
		   map.put("start", start);
		   map.put("end", end);
		   
		  // �Խ��� �� �������� 
		   List<BoardBean> boardbeans = BoardDao.getOracleDao().selectBoardAll(map);
		   request.setAttribute("list", boardbeans);
		   request.setAttribute("pageBean", new PageBean(currentPage, totalRow, startPage, endPage, currentBlock));
	   }
	   
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	    //�˻� �� ����¡
		paging(request);
		
		return new ActionForward(path, redirect);
	}
	
	

}
