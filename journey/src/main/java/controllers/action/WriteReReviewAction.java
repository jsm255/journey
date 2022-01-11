package controllers.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

public class WriteReReviewAction implements Action{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("code"));
		
		JSONObject json = new JSONObject();
		json.put("code", code);		
	}
}
