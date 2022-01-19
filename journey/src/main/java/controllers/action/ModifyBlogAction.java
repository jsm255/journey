package controllers.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.BlogDAO;

public class ModifyBlogAction  implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code =  Integer.parseInt(request.getParameter("code"));
		String url = "blogPage.jsp";
		request.getRequestDispatcher(url).forward(request, response);
		
		BlogDAO blogDao = BlogDAO.getInstance();
		
	}
}
