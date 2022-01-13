package controllers.action;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.UserDAO;
import models.UserDTO;

public class JoinAction implements Action {
	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String username = request.getParameter("userName");
		String tel = request.getParameter("tel");
		
		UserDAO dao = UserDAO.getInstance();
		String url ="join";
		
		if(dao.checkDup(id)) {
			UserDTO newUser = new UserDTO(id,pw,username,tel);
			dao.insertUser(newUser);
			url="main.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}
		
	
	
	
	
}
