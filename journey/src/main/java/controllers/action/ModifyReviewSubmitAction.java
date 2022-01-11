package controllers.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.ReviewDAO;
import models.ReviewDTO;

public class ModifyReviewSubmitAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReviewDAO rDao = ReviewDAO.getInstance();
		
		String userName = request.getParameter("userName");
		int score = Integer.parseInt(request.getParameter("score"));
		String content = request.getParameter("content");
		String countryName = request.getParameter("countryName");
		if(userName.equals("Guest")) {
			String pw = request.getParameter("pw");
			ReviewDTO review = new ReviewDTO(countryName, content, score, pw);
			// 반영 시켜야함
		}
		else {
			ReviewDTO review = new ReviewDTO(countryName, userName, content, score);
			// 반영 시켜야함
		}
		
		System.out.println("수정완료ㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛ");
		
		request.getRequestDispatcher(String.format("viewCountry.jsp?countryName=%s", countryName)).forward(request, response);
		
	}

}
