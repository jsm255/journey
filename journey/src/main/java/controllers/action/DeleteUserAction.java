package controllers.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.UserDAO;
import models.UserDTO;

public class DeleteUserAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		ArrayList<UserDTO> user =dao.getUsers();
		boolean check = false;
		for(UserDTO u : user) {
			if(id.equals(u.getId()) && pw.equals(u.getPw()))
				check = true;
		}
		
		if(check) {
			
		}
		
	}

}
