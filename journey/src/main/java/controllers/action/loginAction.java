package controllers.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.UserDAO;
import models.UserDTO;

public class loginAction implements Action{
	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		
		ArrayList<UserDTO> user = dao.getUsers();
		
		boolean check = false;
		
		for(UserDTO u : user) {
			if(id.equals(u.getJoinId()) && pw.equals(u.getJoinPw())) {
				check = true;
			}
		}
		
		String url ="";
		
		if(check) {
			url="main.jsp";
		}
		else {
			url = "join.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
