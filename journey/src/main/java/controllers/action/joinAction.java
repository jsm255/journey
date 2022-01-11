package controllers.action;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.UserDAO;
import models.UserDTO;

public class joinAction implements Action {
	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String username = request.getParameter("username");
		String tel = request.getParameter("tel");
		
		UserDAO dao = UserDAO.getInstance();
		String url ="join";
		
		if(dao.checkDup(id)) {
			UserDTO newUser = new UserDTO(id,pw,username,tel);
			dao.addUser(newUser);
			url="main";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}
		
	
	
	
	
}
