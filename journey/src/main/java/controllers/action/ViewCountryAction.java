package controllers.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.CountryDAO;
import models.CountryDTO;

public class ViewCountryAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String country = request.getParameter("country");
			
		request.getRequestDispatcher(String.format("viewCountry.jsp?countryName=%s", country)).forward(request, response);
	}

}
