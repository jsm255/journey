package controllers.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.Country;
import models.CountryDTO;
import models.InfoDTO;
import utils.XmlParser;

public class GetInfoAction implements Action,Country{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		CountryDTO dto = new CountryDTO(request.getParameter("countryName"), request.getParameter("basic"));
		
		System.out.println(dto);
	}

	@Override
	public void getInfoData(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String countryName = request.getParameter("countryName");
		String basic = request.getParameter("basic");
		
		InfoDTO infoDto = XmlParser.getInfoData(countryName);
		request.setAttribute("infoDto", infoDto);
	}

	@Override
	public List<InfoDTO> infoData(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
