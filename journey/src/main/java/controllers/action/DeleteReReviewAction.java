package controllers.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.ReReviewDAO;
import models.ReReviewDTO;

public class DeleteReReviewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("code"));
		
		ReReviewDAO rrDao = ReReviewDAO.getInstance();
		ReReviewDTO rrview = rrDao.getReReview(code);
		
		rrDao.removeReReview(rrview);
		
	}

}
