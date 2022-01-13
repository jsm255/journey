package controllers.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.UserDAO;
import models.UserDTO;

public class DeleteUserAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		
		HttpSession session = request.getSession();

		System.out.println("id"+session.getAttribute("log"));
		
		String delUser = String.valueOf(dao.deleteUser(id, pw));
		
		session.removeAttribute(delUser);
		System.out.println("ddd");
		String url="deleteUser.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
