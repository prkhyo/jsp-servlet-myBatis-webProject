package pr.com.memberAction;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletMessage extends HttpServlet {
	   @Override
	   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // TODO Auto-generated method stub
	      request.setCharacterEncoding("EUC-KR");
	      String cmd=request.getParameter("cmd");
	      Action action=ActionFactory.getAction(cmd);
	      ActionForward af= action.execute(request,response);
	      System.out.println(action);
	      System.out.println(af);
	      if(af.isRedirect()) {
	         response.sendRedirect(af.getPath());
	      }else {
	          RequestDispatcher rd= request.getRequestDispatcher(af.getPath());
	          rd.forward(request, response);
	      }
	      
	   }
	   
	}
