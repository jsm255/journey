package controllers.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.LikeDAO;
import models.LikeDTO;

public class LikeAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		LikeDAO lDao = LikeDAO.getInstance();
		String action = request.getParameter("command");
		String countryName = request.getParameter("countryName");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("log") == null) {
			request.getRequestDispatcher("login.jsp?error=needLogin").forward(request, response);
			return;
		}
		else {
			if(action.equals("like")) {
				LikeDTO heart = new LikeDTO(String.valueOf(session.getAttribute("log")), countryName);
				lDao.addLike(heart);
				request.getRequestDispatcher(String.format("viewCountry.jsp?countryName=%s&action=like", countryName)).forward(request, response);
				return;
			}
			else {
				LikeDTO heart = new LikeDTO(String.valueOf(session.getAttribute("log")), countryName);
				lDao.deleteLike(heart);
				request.getRequestDispatcher(String.format("viewCountry.jsp?countryName=%s&action=hate", countryName)).forward(request, response);
				return;
			}
		}
	}
}
