package controllers.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.UserDAO;
import models.UserDTO;

public class JoinAction implements Action {
	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession s = request.getSession();
		String url ="";
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String username = request.getParameter("userName");
		String tel = request.getParameter("tel");
		
		UserDTO user = new UserDTO(id,pw,username,tel);
		
		System.out.println(user.toString());
		
		UserDAO dao = UserDAO.getInstance();
		
		if(dao.checkDup(id)) {
			UserDTO newUser = new UserDTO(id,pw,username,tel);
			dao.insertUser(newUser);
			url="main.jsp";
			s.invalidate();
		}else {
			url = "join.jsp";
			user.setId("중복된 아이디 입니다");
			s.setAttribute("user", user);
		}
		
		
		//request.getRequestDispatcher(url).forward(request, response);
		RequestDispatcher rdp = request.getRequestDispatcher(url);
		rdp.forward(request, response);
	}
		
	
	
	
	
}
